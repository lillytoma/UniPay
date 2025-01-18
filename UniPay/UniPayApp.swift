//
//  UniPayApp.swift
//  UniPay
//
//  Created by Lilly Toma on 1/18/25.
//

import SwiftUI

@main
struct UniPayApp: App {
    @State private var showSplashScreen = true
       
       var body: some Scene {
           WindowGroup {
                   LoginView()
               }
           }
       }
