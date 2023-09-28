//
//  BudgetCategoryModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import Foundation

struct BudgetCategoryModel: Identifiable {
    var id = UUID()
    var name: String
}

var budget_categories = [
    BudgetCategoryModel(name: "Food"),
    BudgetCategoryModel(name: "Transportation"),
    BudgetCategoryModel(name: "Healthcare"),
    BudgetCategoryModel(name: "Utilities"),
    BudgetCategoryModel(name: "Insurance"),
    BudgetCategoryModel(name: "Entertainment")
]
