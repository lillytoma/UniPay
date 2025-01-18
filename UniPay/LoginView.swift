//
//  LoginPage.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                // Profile Icon
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)

                // Username Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("UserName")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Enter your username", text: $username)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 5)
                    Divider()
                }
                .padding(.horizontal)

                // Password Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 5)
                    Divider()
                }
                .padding(.horizontal)

                // Login Button
                NavigationLink(destination: HomeView()) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                // Sign Up Button
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }

                Spacer()
            }
            .padding()
        }
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
