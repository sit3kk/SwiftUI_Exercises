//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Konrad Sitek on 08/01/2024
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
