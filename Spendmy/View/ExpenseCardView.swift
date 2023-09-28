//
//  ExpenseCardView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/27/23.
//

import SwiftUI

struct ExpenseCardView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var isFilter: Bool = false
    
    var body: some View {
            GeometryReader{proxy in
                RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                VStack(spacing: 15){
                    VStack(spacing: 15){
                        //Duration
                        Text(isFilter ? expenseViewModel.convertSelectedDurationToString() : expenseViewModel.currentMonthDateString())
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        //TotalExpense
                        Text(expenseViewModel.currentExpensesString(expenses: expenseViewModel.expenses, type: .all))
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .lineLimit(1)
                            .padding(.bottom, 5)
                    }
                    .offset(y: -10)
                    
                    HStack(spacing: 15){
                        ZStack{
                            Circle()
                                .fill(Color.white.opacity(0.9))
                                .frame(width: 25, height: 25)
                                        
                            Image(systemName: "arrow.up")
                                .font(.callout)
                                .foregroundColor(Color("LightGreen"))
                        }
                        VStack(alignment: .leading, spacing: 4){
                            Text("Income")
                                .font(.caption)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            
                            Text(expenseViewModel.currentExpensesString(expenses: expenseViewModel.expenses, type: .income))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .fixedSize()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        ZStack{
                            Circle()
                                .fill(Color.white.opacity(0.9))
                                .frame(width: 25, height: 25)
                                        
                            Image(systemName: "arrow.down")
                                .font(.callout)
                                .foregroundColor(.red)
                        }
                        VStack(alignment: .leading, spacing: 4){
                            Text("Expenses")
                                .font(.caption)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            
                            Text(expenseViewModel.currentExpensesString(expenses: expenseViewModel.expenses, type: .expense))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .fixedSize()
                        }
                            
                    }
                    .padding(.horizontal)
                    .padding(.trailing)
                    .offset(y: 15)
                }
                .foregroundColor(.white)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    }
            .frame(height: 220)
            .padding(.top)
        }
}
