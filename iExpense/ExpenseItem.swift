//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Zach Mommaerts on 10/3/23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
