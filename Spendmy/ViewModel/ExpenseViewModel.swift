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
}
