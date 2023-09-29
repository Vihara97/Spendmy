//
//  ExpenseViewModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/17/23.
//

import Foundation
import SwiftUI
import Firebase

class ExpenseViewModel: ObservableObject{
    //properties
    @Published var expenses: [ExpenseModel] = []
    
    @Published var currentMonthStartDate: Date = Date()
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    
    @Published var tabName: ExpenseType = .income
    @Published var showFilterView: Bool = false
    @Published var showSuccessAlert : Bool = false
    @Published var showErrorAlert : Bool = false
    
    //new expense properties
    @Published var addNewExpense: Bool = false
    @Published var amount: String = ""
    @Published var type: ExpenseType = .all
    @Published var date: Date = Date()
    @Published var remark: String = ""
    @Published var budgetcategory: BudgetCategory = .other
    
    
    init(){
        
        fetchData()
        
        //setup calendar date
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
    
    //Fetch data
    func fetchData(){
        //get a reference to the db
        let db = Firestore.firestore()
        
        //for fetching date string
        var fetchedDate: Date = Date()
        
        //read documents
        db.collection("Expenses").getDocuments { snapshot, error in
            if error == nil {
                        
                if let snapshot = snapshot{
                            
                    DispatchQueue.main.async {
                        self.expenses = snapshot.documents.map { doc in
                            
                            if let dateString = doc["date"] as? String {
                                        // Convert the dateString to a Date object
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "dd/MM/yyyy" //Firestore date format
                                fetchedDate = dateFormatter.date(from: dateString) ?? Date()
                            }
                            
                            return ExpenseModel(remark: doc["remark"] as? String ?? "",
                                                amount: doc["amount"] as? Double ?? 0.00,
                                                    date: fetchedDate,
                                                    type: ExpenseType(rawValue: doc["type"] as? String ?? "") ?? .all,
                                                    budgetcategory: BudgetCategory(rawValue: doc["budgetcategory"] as? String ?? "") ?? .other,
                                                    color: doc["color"] as? String ?? ""
                                                )
                        }
                    }
                            
                }
            }
            else{
                print("error occured while fetching data")
            }
        }
    }
    
    //Save data
    func saveData(newExpense: ExpenseViewModel){
        //get a reference to the db
        let db = Firestore.firestore()
        
        //set date string
        var saveDate: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" //Firestore date format
        saveDate = dateFormatter.string(from: newExpense.date)
        
        //set color string for budgetCategory
        var saveColor: String = ""
            
        switch newExpense.budgetcategory {
        case .food:
            saveColor = "Green"
        case .transportation:
            saveColor = "Blue"
        case .healthcare:
            saveColor = "Red"
        case .utilities:
            saveColor = "Yellow"
        case .entertainment:
            saveColor = "Purple"
        case .other:
            saveColor = "Black"
        }
        
        //add documents to db collection
        db.collection("Expenses").addDocument(
            data: ["remark": newExpense.remark,
                   "amount": Double(newExpense.amount) ?? 0.0,
                   "date": saveDate,
                   "type": newExpense.type.rawValue,
                   "budgetcategory": newExpense.budgetcategory.rawValue,
                   "color": saveColor])
        { error in
            if error == nil {
                self.showSuccessAlert.toggle()
                print("data saved successfully")
            }
            else{
                self.showErrorAlert.toggle()
                print("error occured while saving data")
            }
        }
    }
    
    //Clear all data
    func clearData(){
        date = Date()
        type = .all
        remark = ""
        amount = ""
        budgetcategory = .other
    }

}
