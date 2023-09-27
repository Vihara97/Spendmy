//
//  TransactionCardView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/25/23.
//

import SwiftUI

struct TransactionCardView: View {
    var expense: ExpenseModel
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    var body: some View {
        HStack(spacing: 12){
                if let first = expense.remark.first{
                    Text(String(first))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .foregroundColor(Color.colorFromName(expense.color))
                                .opacity(0.7)
                        )
                }
            
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 7){
                let price = expenseViewModel.convertExpenseNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(expense.type == .expense ? Color("Peach") : Color("LightGreen"))
                
                Text(expenseViewModel.convertDateToString(date: expense.date))
                    .font(.caption)
                    .opacity(0.7)
                
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color(.white)
)
        )
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
