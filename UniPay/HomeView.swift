//
//  HomeView.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello (UserName),")
                .font(.title2)
                .fontWeight(.bold)

            Text("Current Funds:")
                .font(.headline)
                .foregroundColor(.gray)

            Text("$20")
                .font(.system(size: 40, weight: .bold))

            Text("Wallets:")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top)

            // Wallet List
            VStack(spacing: 15) {
                WalletView(name: "Pounds", amount: "$3.75")
                WalletView(name: "Lera", amount: "$3.75")
                WalletView(name: "Yuan", amount: "$3.75")
            }

            Spacer()

            // Bottom Navigation Bar
            HStack {
                Spacer()
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
                Image(systemName: "cube")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
            }
            .padding()
            .background(Color.black.opacity(0.1))
        }
        .padding()
    }
}

// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
