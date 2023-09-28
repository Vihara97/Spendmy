//
//  ExpenseModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/17/23.
//

import Foundation
import SwiftUI

struct ExpenseModel: Identifiable,Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var budgetcategory: BudgetCategory
    var color: String
}
enum ExpenseType: String{
    case income = "Income"
    case expense = "Expense"
    case all = "All"
}
enum BudgetCategory: String{
    case food = "Food" //green
    case transportation = "Transportation" //blue
    case healthcare = "Healthcare" //red
    case utilities = "Utilities" //purple
    case entertainment = "Entertainment" //pink
    case other = "Other"
}
var sample_expenses: [ExpenseModel] = [
    ExpenseModel(remark: "Food", amount: 5700.00, date: Date(timeIntervalSince1970: 1652987245), type: .expense, budgetcategory: .food, color: "Green"),
    ExpenseModel(remark: "Taxi", amount: 2350.00, date: Date(timeIntervalSince1970: 1652916245), type: .income, budgetcategory: .transportation, color: "Red")
]
