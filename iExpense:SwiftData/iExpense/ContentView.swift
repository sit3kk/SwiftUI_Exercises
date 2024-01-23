//
//  ContentView.swift
//  iExpense
//
//  Created by Konrad Sitek on 08/01/2024
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortOrder =
        [
            SortDescriptor(\ExpenseItem.name),
            SortDescriptor(\ExpenseItem.amount),
        ]
    @State private var typeSelection = ""    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder, typeSelection)
            .navigationTitle("iExpense")
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
                
                Menu("Type", systemImage: "doc.plaintext") {
                    Picker("Type", selection: $typeSelection) {
                        Text("All")
                            .tag("")

                        Text("Personal")
                            .tag("Personal")
                        
                        Text("Business")
                            .tag("Business")
                    }
                }
                
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }
}

#Preview {
    ContentView()
}
