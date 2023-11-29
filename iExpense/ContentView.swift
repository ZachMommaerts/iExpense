//
//  ContentView.swift
//  iExpense
//
//  Created by Zach Mommaerts on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal")){
                    ForEach(expenses.personalItems) { item in
                        HStack {
                            Text(item.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        .listRowBackground(priceColors(amount: item.amount))
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section(header: Text("Business")){
                    ForEach(expenses.businessItems) { item in
                        HStack {
                            Text(item.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        .listRowBackground(priceColors(amount: item.amount))
                        .accessibilityElement()
                        .accessibilityLabel("Item: \(item.name), Price: \(item.amount)")
                        .accessibilityHint("Type: \(item.type)")
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
    
    func priceColors(amount: Double) -> Color {
        if amount >= 100 {
            return .red
        } else if amount > 10 {
            return .yellow
        } else {
            return .green
        }
    }
}

#Preview {
    ContentView()
}
