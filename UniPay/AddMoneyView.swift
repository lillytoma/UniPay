//
//  AddMoneyView.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct AddMoneyView: View {
    @Binding var availableFunds: Double // Binding to update the available funds
    @State private var amountToAdd: String = "" // Amount to be added
    
    // Define the keypad digits
    let keypadButtons: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "C"] // "." for decimal, "C" for clearing
    ]
    
    var body: some View {
        VStack {

            // Display current available funds
            Text("Current Funds: $\(availableFunds, specifier: "%.2f")")
                .font(.title)
                .padding()
                .bold()

            // Display the amount entered by the user
            Text("Amount: $\(amountToAdd.isEmpty ? "0" : amountToAdd)")
                .font(.largeTitle)
                .padding(20)

            // Keypad for entering the amount
            VStack(spacing: 30) {
                ForEach(keypadButtons, id: \.self) { row in
                    HStack(spacing: 30) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                self.keypadTapped(button)
                            }) {
                                Text(button)
                                    .font(.title)
                                    .frame(width: 70, height: 70)
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.black)
                                    .cornerRadius(35)
                            }
                        }
                    }
                }
            }
            .padding(40)

            // Add Money Button
            Button(action: {
                if let amount = Double(amountToAdd), amount > 0 {
                    availableFunds += amount // Add the amount to available funds
                    amountToAdd = "" // Reset the input field
                }
            }) {
                Text("Add Money")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(10)

            Spacer()
        }
        .padding(35)
        .navigationTitle("Add Money")
        .navigationBarTitleDisplayMode(.inline) // Default back button
    }
    
    // Function to handle button taps
    private func keypadTapped(_ button: String) {
        if button == "C" {
            amountToAdd = "" // Clear the input
        } else {
            amountToAdd += button // Add the tapped button's value
        }
    }
}

struct AddMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        AddMoneyView(availableFunds: .constant(20.0))
    }
}
