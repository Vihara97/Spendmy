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
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthStartDate: Date = Date()
    
    init(){
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month], from: Date())
        
        startDate = calendar.date(from: dateComponents)!
        currentMonthStartDate = calendar.date(from: dateComponents)!
    }
    @Published var expenses: [ExpenseModel] = sample_expenses
    
    //Fetch current month start date
    func currentMonthDateString()->String{
        return "11/11/2023"
    }
}
