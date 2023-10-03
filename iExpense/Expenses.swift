//
//  Expenses.swift
//  iExpense
//
//  Created by Zach Mommaerts on 10/3/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
