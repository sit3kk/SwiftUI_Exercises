//
//  ExpensesView.swift
//  iExpense
//
//  Created by Konrad Sitek on 08/01/2024
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)

                        Text(item.type)
                    }

                    Spacer()

                    Text(item.amount, format: .currency(code: item.currency))
                        .foregroundColor(expenseColor(for: item.amount))
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(_ sortOrder: [SortDescriptor<ExpenseItem>], _ typeSelection: String) {
        _expenses = typeSelection == ""
        ? Query(sort: sortOrder)
        : Query(filter: #Predicate<ExpenseItem> { expenseItem in
            expenseItem.type == typeSelection
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(expenses[index])
        }
    }
    
    func expenseColor(for amount: Double) -> Color {
        switch amount {
        case ..<10:
            return .green
        case ..<100:
            return .blue
        default:
            return .red
        }
    }
}

#Preview {
    ExpensesView([], "")
}
