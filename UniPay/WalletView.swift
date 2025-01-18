//
//  WalletView.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct WalletView: View {
    let name: String
    let amount: String

    var body: some View {
        HStack {
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
            Text(amount)
                .font(.headline)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}

// Preview
struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(name: "Example", amount: "$0.00")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
