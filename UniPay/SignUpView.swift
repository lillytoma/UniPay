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

                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)

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

                NavigationLink(destination: HomeView(), isActive: $canNavigate) {
                    EmptyView() // Invisible navigation link to trigger the navigation programmatically
                }

                Button(action: {
                    if isValidInput() {
                        canNavigate = true // Set this to true to navigate to HomeView
                    } else {
                        alertMessage = "Please fill out all fields correctly."
                        showAlert = true
                    }
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(isValidInput() ? Color.black : Color.gray)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                Spacer()
            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func isValidInput() -> Bool {
        return !firstName.isEmpty &&
            !lastName.isEmpty &&
            !email.isEmpty &&
            password == confirmPassword &&
            !password.isEmpty
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
