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
    var color: String
}
enum ExpenseType: String{
    case income = "Income"
    case expense = "Expense"
}
var sample_expenses: [ExpenseModel] = [
    ExpenseModel(remark: "Food", amount: 5700.00, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Green"),
    ExpenseModel(remark: "Uber cab", amount: 2350.00, date: Date(timeIntervalSince1970: 1652916245), type: .expense, color: "Yellow")
]
