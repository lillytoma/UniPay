import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: AddBankAccountView()) {
                        Text("Add Bank Account")
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}

struct AddBankAccountView: View {
    var body: some View {
        Text("Add Bank Account Page")
            .navigationTitle("Add Bank Account")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChangeEmailView: View {
    var body: some View {
        Text("Change Email Page")
            .navigationTitle("Change email")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChangePasswordView: View {
    var body: some View {
        Text("Change Password Page")
            .navigationTitle("Change Password")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
