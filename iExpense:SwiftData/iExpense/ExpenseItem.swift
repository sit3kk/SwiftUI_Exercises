//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Konrad Sitek on 08/01/2024
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double, currency: String) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
    }
}
