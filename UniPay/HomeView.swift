import SwiftUI

struct HomeView: View {
    @State private var availableFunds: Double = 20.0 // User's available funds
    @State private var poundsBalance: Double = 0.0
    @State private var leraBalance: Double = 0.0
    @State private var yuanBalance: Double = 0.0
    @State private var selectedCurrency: String = "Pounds" // Currency selection
    @State private var convertedAmount: Double = 0.0 // Store the converted amount
    @State private var amountToConvert: String = "" // Amount entered by the user to convert
    
    let conversionRates: [String: Double] = [
        "Pounds": 0.75, // 1 USD = 0.75 Pounds (example rate)
        "Lera": 0.85,   // 1 USD = 0.85 Lera (example rate)
        "Yuan": 6.45    // 1 USD = 6.45 Yuan (example rate)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("$\(availableFunds, specifier: "%.2f")")
                    .font(.system(size: 40, weight: .bold))
                    .padding(60)
                
                // Currency Conversion Selector
                Picker("Select Currency", selection: $selectedCurrency) {
                    Text("Pounds").tag("Pounds")
                    Text("Lera").tag("Lera")
                    Text("Yuan").tag("Yuan")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // TextField to input amount to convert
                TextField("Enter amount to convert", text: $amountToConvert)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding([.leading, .trailing], 20)
                
                // Convert Button
                Button(action: {
                    // Perform the conversion based on the selected currency and entered amount
                    if let rate = conversionRates[selectedCurrency], let amount = Double(amountToConvert), amount <= availableFunds {
                        let converted = amount * rate
                        convertedAmount = converted
                        
                        // Subtract the converted amount from available funds
                        availableFunds -= amount
                        
                        // Update the balances for the selected currency
                        if selectedCurrency == "Pounds" {
                            poundsBalance = converted
                        } else if selectedCurrency == "Lera" {
                            leraBalance = converted
                        } else if selectedCurrency == "Yuan" {
                            yuanBalance = converted
                        }
                    }
                }) {
                    Text("Convert \(amountToConvert.isEmpty ? "" : "to \(selectedCurrency)")")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .disabled(amountToConvert.isEmpty) // Disable the button if no amount is entered
                }
                .padding()

                // Credit Card Look-alike at the bottom
                VStack {
                    Text("Debit Card")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                    
                    ZStack {
                        // Background of the credit card
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
                                Text("Cardholder Name") // Cardholder name (placeholder)
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

                // Bottom Navigation Bar
                HStack {
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                    NavigationLink(destination: ScanView()) {
                        Image(systemName: "cube")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.black.opacity(0.1))
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
