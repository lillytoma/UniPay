//
//  ContentView.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToLogin = false // State to track navigation

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("UniPay")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                // Logo
                ZStack {
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("$")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
                
                Text("Where money is one language")
                    .font(.title3)
                    .foregroundColor(.blue)
                
                // Get Started Button
                Button(action: {
                    navigateToLogin = true // Trigger navigation
                }) {
                    Text("Get Started")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(width: 200) // Centered button with fixed width
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Center the entire VStack
            .background(Color.white) // Background color
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView() // Navigate to LoginView
            }
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
