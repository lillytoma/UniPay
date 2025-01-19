import SwiftUI

struct HomeView: View {
    @State private var availableFunds: Double = 20.0 // User's available funds
    @State private var selectedCurrency: String = "USD" // Currency selection
    @State private var convertedAmount: Double = 0.0 // Store the converted amount
    @State private var amountToConvert: String = "" // Amount entered by the user to convert
    var userName: String // Add the userName property

    let conversionRates: [String: Double] = [
        "USD": 1.0,       // 1 USD = 1.0 USD
        "Pounds": 0.75,   // 1 USD = 0.75 Pounds
        "Lera": 0.85,     // 1 USD = 0.85 Lera
        "Yuan": 6.45,     // 1 USD = 6.45 Yuan
        "Euro": 0.9,      // 1 USD = 0.9 Euro
        "Rupees": 83.5,   // 1 USD = 83.5 Indian Rupees
        "Won": 1330.0,    // 1 USD = 1330 South Korean Won
        "Pesos": 18.5,    // 1 USD = 18.5 Mexican Pesos
        "Yen": 130.0,     // 1 USD = 130 Japanese Yen
        "Franc": 0.92,    // 1 USD = 0.92 Swiss Franc
        "CAD": 1.25       // 1 USD = 1.25 Canadian Dollars
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // Navigation bar buttons
                HStack {
                    // Scan button on the top-left
                    NavigationLink(destination: ScanView()) {
                        Image(systemName: "cube")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }

                    Spacer()

                    // Settings button on the top-right
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                }
                .padding([.leading, .trailing], 20)

                // Available funds with "Add Money" link
                HStack {
                    Text("$\(availableFunds, specifier: "%.2f")")
                        .font(.system(size: 40, weight: .bold))
                }

                // Add Money NavigationLink
                NavigationLink(destination: AddMoneyView(availableFunds: $availableFunds)) {
                    Text("Add Money")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                }

                // Horizontal Scrolling Currency Selection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(conversionRates.keys.sorted(), id: \ .self) { currency in
                            Button(action: {
                                selectedCurrency = currency
                            }) {
                                Text(currency)
                                    .font(.headline)
                                    .foregroundColor(selectedCurrency == currency ? .white : .blue)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(selectedCurrency == currency ? Color.blue : Color.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.blue, lineWidth: 1)
                                            )
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // TextField to input amount to convert
                TextField("Enter amount to convert", text: $amountToConvert)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding([.leading, .trailing], 20)

                // Convert Button
                Button(action: {
                    if let rate = conversionRates[selectedCurrency], let amount = Double(amountToConvert), amount <= availableFunds {
                        let converted = amount * rate
                        convertedAmount = converted
                        availableFunds -= amount
                    }
                }) {
                    Text("Convert \(amountToConvert.isEmpty ? "" : "to \(selectedCurrency)")")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                .disabled(amountToConvert.isEmpty) // Disable the button if no amount is entered

                // Debit Card Display
                VStack {
                    Text("Debit Card")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)

                    ZStack {
                        // Background of the debit card
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(height: 200)

                        VStack(spacing: 15) {
                            HStack {
                                Text("**** **** **** 1234") // Card number (placeholder)
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding([.leading, .trailing], 20)

                            HStack {
                                Text("Exp: 12/24") // Expiration date (placeholder)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("\(userName)") // Display the user's name from the login page
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                            .padding([.leading, .trailing], 20)

                            // Show the converted amount
                            if convertedAmount > 0 {
                                HStack {
                                    Text("Converted: \(selectedCurrency) \(convertedAmount, specifier: "%.2f")")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Spacer()
                                }
                                .padding([.leading, .trailing], 20)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "John Doe")
    }
}
