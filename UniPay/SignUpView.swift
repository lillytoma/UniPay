//
//  SignUpView.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
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

                // First Name Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("First Name")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Enter your first name", text: $firstName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 5)
                    Divider()
                }
                .padding(.horizontal)

                // Last Name Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Last Name")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Enter your last name", text: $lastName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 5)
                    Divider()
                }
                .padding(.horizontal)

                // Email Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Enter your email", text: $email)
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

                // Confirm Password Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Confirm Password")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    SecureField("Confirm your password", text: $confirmPassword)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 5)
                    Divider()
                }
                .padding(.horizontal)

                // Sign Up Button
                Button(action: {
                    if isValidInput() {
                        canNavigate = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(isValidInput() ? Color.black : Color.gray)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                // NavigationLink to HomeView
                NavigationLink(
                    destination: HomeView(),
                    isActive: $canNavigate,
                    label: { EmptyView() }
                )
                .hidden()

                Spacer()
            }
            .padding()
        }
    }

    // Input Validation
    private func isValidInput() -> Bool {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            alertMessage = "All fields are required."
            return false
        }

        if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            return false
        }

        if password != confirmPassword {
            alertMessage = "Passwords do not match."
            return false
        }

        if password.count < 6 {
            alertMessage = "Password must be at least 6 characters long."
            return false
        }

        return true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

// Preview
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
