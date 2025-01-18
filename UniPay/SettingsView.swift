import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: AddBankAccountView()) {
                        Text("Add Bank Account")
                    }
                    NavigationLink(destination: ViewBankInformationView()) {
                        Text("View Bank Information")
                    }
                    NavigationLink(destination: ChangeEmailView()) {
                        Text("Change email")
                    }
                    NavigationLink(destination: ChangePasswordView()) {
                        Text("Change Password")
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
           
        }
    }
}

struct AddBankAccountView: View {
    @State private var routingNumber = ""
    @State private var accountNumber = ""
    @State private var cardHolderName = ""

    var body: some View {
        Form {
            Section(header: Text("Add Bank Account")) {
                TextField("Routing Number", text: $routingNumber)
                    .keyboardType(.numberPad)
                TextField("Account Number", text: $accountNumber)
                    .keyboardType(.numberPad)
                TextField("Card Name Holder", text: $cardHolderName)
            }

            Button(action: {
                // Add Bank Account action
            }) {
                Text("Enter")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Add Bank Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ViewBankInformationView: View {
    var body: some View {
        Form {
            Section(header: Text("Bank Information")) {
                HStack {
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .frame(width: 50, height: 30)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("Card Holder: John Doe")
                            .font(.headline)
                        Text("Account Number: **** **** **** 1234")
                            .font(.subheadline)
                        Text("Routing Number: 123456789")
                            .font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("View Bank Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChangeEmailView: View {
    @State private var oldEmail = ""
    @State private var newEmail = ""
    @State private var confirmNewEmail = ""

    var body: some View {
        Form {
            Section(header: Text("Change email")) {
                TextField("Old Email", text: $oldEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("New Email", text: $newEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("Confirm New Email", text: $confirmNewEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }

            Button(action: {
                // Change Email action
            }) {
                Text("Enter")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Change email")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""

    var body: some View {
        Form {
            Section(header: Text("Change Password")) {
                SecureField("Password", text: $currentPassword)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmNewPassword)
            }

            Button(action: {
                // Change Password action
            }) {
                Text("Enter")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: {
                // Forgot Password action
            }) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Change Password")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
