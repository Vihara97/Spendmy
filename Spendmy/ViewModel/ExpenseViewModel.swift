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
    
    init(){
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month], from: Date())
        
        currentMonthStartDate = calendar.date(from: dateComponents)!
        
    }

    //Fetch current month start date
    func currentMonthDateString()->String{
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
        
        return dateFormatter.string(from: currentMonthStartDate) + " - " + dateFormatter.string(from: Date())
    }
    
    //Fetch current expenses string
    func currentExpensesString(expenses: [ExpenseModel], type: ExpenseType = .all)-> String{

        var expenseValue: Double = 0
        expenseValue = expenses.reduce(0, {addToExpense, expense in
            return addToExpense + (type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (type == expense.type ? expense.amount : 0))
        })
        
        return ConvertExpenseNumberToPrice(value: expenseValue)
    }
    
    //Convert expense numbers to price
    func ConvertExpenseNumberToPrice(value: Double)-> String{
        let currencyFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = "Rs"
            return formatter
        }()
        
        return currencyFormatter.string(from: .init(value: value)) ?? "Rs0.00"
    }
    
    func convertDateToString(date: Date)->String{
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
        }()
        
        return dateFormatter.string(from: date)
    }
}
