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
                NavigationLink(destination: HomeView()) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}

// Preview
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
