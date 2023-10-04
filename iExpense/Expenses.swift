//
//  Expenses.swift
//  iExpense
//
//  Created by Zach Mommaerts on 10/3/23.
//

import Foundation

class Expenses: ObservableObject{
    @Published var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "personalItems")
            }
        }
    }
    
    @Published var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "businessItems")
            }
        }
    }
    
    init() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "personalItems") {
            if let decodedPersonalItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
                personalItems = decodedPersonalItems
            }
        } else {
            personalItems = []
        }
        
        if let savedBusinessItems = UserDefaults.standard.data(forKey: "businessItems") {
            if let decodedBusinessItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
                businessItems = decodedBusinessItems
            }
        } else {
            businessItems = []
        }
    }
}
