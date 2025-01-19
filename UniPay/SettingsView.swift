import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Credit card style user card at the top
                VStack {
                    HStack {
                        // Credit Card Icon
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .frame(width: 40, height: 80)
                            .foregroundColor(.white)
                            .padding(10)
                        
                        // Card information
                        VStack(alignment: .leading) {
                            Text("UniPay Wallet")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                            Text("Balance: $1000.00") // Replace with dynamic balance if needed
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                            HStack {
                                Text("•••• 1234")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("12/25") // Expiry Date
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                    .padding([.leading, .trailing], 20)
                    .padding([.top, .bottom], 10)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(12) // Rounded corners for a card-like appearance
                    .frame(height: 160) // Adjusted to look more like a credit card
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    
                    Divider()
                }
                
                // Settings List
                List {
                    NavigationLink(destination: AddBankAccountView()) {
                        SettingsBubble(text: "Add Bank Account")
                    }
                    NavigationLink(destination: ViewBankInformationView()) {
                        SettingsBubble(text: "View Bank Information")
                    }
                    NavigationLink(destination: ChangeEmailView()) {
                        SettingsBubble(text: "Change email")
                    }
                    NavigationLink(destination: ChangePasswordView()) {
                        SettingsBubble(text: "Change Password")
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .onAppear {
                    UITableView.appearance().allowsSelection = false
                }
                .onDisappear {
                    UITableView.appearance().allowsSelection = true
                }

                Spacer()
            }
            .navigationTitle("Settings")
            .navigationBarBackButtonHidden(true) // Hides the back button
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsBubble: View {
    let text: String

    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(16)
            .padding(.vertical, 8)
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
                    .foregroundColor(.white)
                    .background(Color(UIColor.systemGray2))
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
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(16)
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
                    .foregroundColor(.white)
                    .background(Color(UIColor.systemGray2))
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
                    .foregroundColor(.white)
                    .background(Color(UIColor.systemGray2))
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
