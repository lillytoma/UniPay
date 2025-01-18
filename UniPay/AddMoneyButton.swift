//
//  AddMoneyButton.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct AddMoneyButton: View {
    var walletName: String
    @Binding var balance: Double
    @Binding var availableFunds: Double
    @State private var amountToAdd: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Amount to add", text: $amountToAdd)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Button(action: {
                    if let amount = Double(amountToAdd), amount > 0, amount <= availableFunds {
                        balance += amount
                        availableFunds -= amount
                        amountToAdd = "" // Clear the input
                    }
                }) {
                    Text("Add Money")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct AddMoneyButton_Previews: PreviewProvider {
    static var previews: some View {
        AddMoneyButton(walletName: "Pounds", balance: .constant(3.75), availableFunds: .constant(20.0))
    }
}
