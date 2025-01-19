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
    @State private var showAlert: Bool = false
    @State private var canNavigate: Bool = false

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
                    Text("Email")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Enter your email", text: $username)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
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
                Button(action: {
                    if isValidInput() {
                        canNavigate = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(isValidInput() ? Color.black : Color.gray)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text("Please enter a valid email and password."), dismissButton: .default(Text("OK")))
                }

                // NavigationLink to HomeView
                NavigationLink(
                    destination: HomeView(),
                    isActive: $canNavigate,
                    label: { EmptyView() }
                )
                .hidden() // Keep it hidden

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

    // Input Validation
    private func isValidInput() -> Bool {
        return !username.isEmpty && !password.isEmpty && isValidEmail(username)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
