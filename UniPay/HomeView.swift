//
//  HomeView.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct HomeView: View {
    @State private var availableFunds: Double = 20.0 // User's available funds
    @State private var poundsBalance: Double = 3.75
    @State private var leraBalance: Double = 3.75
    @State private var yuanBalance: Double = 3.75
    @State private var amountToAdd: String = "" // String to hold the input amount
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("$\(availableFunds, specifier: "%.2f")")
                    .font(.system(size: 40, weight: .bold))
                    .padding(60)
                
                // Add Money Button
                NavigationLink(destination: AddMoneyView(availableFunds: $availableFunds)) {
                    Text("Add Money")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                        .frame(maxWidth: .infinity)
                        .padding(-20)
                }
                .padding(-40)

                Text("Wallets:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top)

                // Wallet List with Add Money Option
                VStack(spacing: 15) {
                    WalletView(name: "Pounds", amount: "$\(String(format: "%.2f", poundsBalance))")
                    AddMoneyButton(walletName: "Pounds", balance: $poundsBalance, availableFunds: $availableFunds)
                    
                    WalletView(name: "Lera", amount: "$\(String(format: "%.2f", leraBalance))")
                    AddMoneyButton(walletName: "Lera", balance: $leraBalance, availableFunds: $availableFunds)
                    
                    WalletView(name: "Yuan", amount: "$\(String(format: "%.2f", yuanBalance))")
                    AddMoneyButton(walletName: "Yuan", balance: $yuanBalance, availableFunds: $availableFunds)
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

