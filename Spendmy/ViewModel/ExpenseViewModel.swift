//
//  ExpenseViewModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/17/23.
//

import Foundation
import SwiftUI

class ExpenseViewModel: ObservableObject{
    //properties
    @Published var expenses: [ExpenseModel] = sample_expenses
    @Published var currentMonthStartDate: Date = Date()
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    
    @Published var tabName: ExpenseType = .income
    @Published var showFilterView: Bool = false
    
    //new expense properties
    @Published var addNewExpense: Bool = false
    @Published var amount: String = ""
    @Published var type: ExpenseType = .all
    @Published var date: Date = Date()
    @Published var remark: String = ""
    @Published var budgetcategory: BudgetCategory = .other
    
    init(){
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month], from: Date())
        
        startDate = calendar.date(from: dateComponents)!
        currentMonthStartDate = calendar.date(from: dateComponents)!
        
    }

    //Fetch current month start date
    func currentMonthDateString()->String{
        
        return convertDateToString(date: currentMonthStartDate) + " - " + convertDateToString(date: Date())
    }
    
    //Convert selected date duration to formatted string
    func convertSelectedDurationToString()->String{
        
        return convertDateToString(date: startDate) + " - " + convertDateToString(date: endDate)
    }
    
    //Convert a date to formatted string
    func convertDateToString(date: Date)->String{
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
        
        return dateFormatter.string(from: date)
    }
    
    
    
    //Fetch current expenses string
    func currentExpensesString(expenses: [ExpenseModel], type: ExpenseType = .all)-> String{

        var expenseValue: Double = 0
        expenseValue = expenses.reduce(0, {addToExpense, expense in
            return addToExpense + (type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (type == expense.type ? expense.amount : 0))
        })
        
        return convertExpenseNumberToPrice(value: expenseValue)
    }
    
    //Convert expense numbers to price
    func convertExpenseNumberToPrice(value: Double)-> String{
        let currencyFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = "Rs"
            return formatter
        }()
        
        return currencyFormatter.string(from: .init(value: value)) ?? "Rs0.00"
    }
    
    //Clear all data
    func clearData(){
        date = Date()
        type = .all
        remark = ""
        amount = ""
        budgetcategory = .other
    }
    
    //Save data
    func saveData(){
        print("save")
    }

}
