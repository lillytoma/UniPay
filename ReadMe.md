UniPay - iOS Application

UniPay is an iOS application designed to provide users with a simple and intuitive way to manage their funds, perform currency conversions, and manage their debit card information. Users can navigate through various screens to add money, convert between different currencies, and view their available balance.

Features

Welcome Screen: A clean, engaging landing page where users can begin their journey.
Login: A simple login view (not implemented here, but referenced for navigation).
Dashboard: The main screen for managing funds, with the ability to add money and track available funds.
Currency Conversion: Users can convert between various currencies based on current conversion rates.
Debit Card Display: A mock-up debit card screen showing basic card details and the user's name.
Navigation: The app uses a NavigationStack to handle transitions between views, such as navigating from the welcome screen to the login screen and from the dashboard to other features.
Folder Structure

ContentView.swift: The starting point of the application, showing the welcome screen with navigation to the login screen.
DashboardView.swift: Contains the dashboard view where users can manage their funds and perform currency conversion.
HomeView.swift: Displays available funds, currency selection, and the option to add money or convert funds to different currencies.
AddMoneyView.swift: A view to add money to the user's account (not fully implemented in this snippet).
ScanView.swift: Placeholder for a scan feature (perhaps for QR codes or NFC payments).
SettingsView.swift: Placeholder for user settings and preferences.
Setup & Requirements

Xcode: Version 14 or higher.
Swift: The application is built using SwiftUI.
iOS Version: Targeted for iOS 15.0 and above.
Device: Simulated on a device or an iOS simulator.
Key Components

NavigationStack: Used for managing navigation across different views, ensuring smooth transitions between screens.
State Management: Utilizes @State to manage dynamic UI elements, such as the funds available, currency selection, and user-entered data.
Button Actions: Handles user interactions, such as starting the conversion or adding funds.
Usage Instructions

Start the app: The initial screen will display the UniPay logo and a "Get Started" button.
Navigate to login: Clicking the "Get Started" button will navigate to the login screen (not yet implemented here).
Access Dashboard: After logging in, users can access their dashboard to view and manage their funds.
Currency Conversion: Users can input an amount to convert to different currencies using the available rates.
Debit Card Info: A mock debit card is displayed with placeholder information and the user's name (pulled from the login view).
Future Features

Login Screen: Implement the actual login view to allow users to enter their credentials.
Scan Feature: Allow users to scan QR codes or use NFC for payments or transfers.
Security Enhancements: Implement secure authentication and encryption for sensitive data, such as debit card information.

For our UniPay project, we used MongoDB as the primary database to store and manage user data, transaction details, and currency conversion rates. By leveraging MongoDB's flexible schema, we were able to easily adjust the database structure as our application evolved, enabling us to store user profiles, balances, and transaction histories in a way that could scale with increasing amounts of data. Each user's information, such as their available funds, selected currency, and transaction history, is stored in separate collections within the database, making it easy to query and update specific user data efficiently. Additionally, MongoDB's support for horizontal scaling allows us to handle increasing traffic and user interactions, ensuring the app remains responsive and reliable as the user base grows. This flexibility and scalability made MongoDB an ideal choice for the dynamic and growing nature of the UniPay app.
