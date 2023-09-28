//
//  FilteredDetailView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/27/23.
//

import SwiftUI

struct FilteredDetailView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                HStack(spacing: 15){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(Color("Gray"))
                            .frame(width: 40, height: 40)
                    })
                    Text("Transactions")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: {
                        expenseViewModel.showFilterView = true
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color("Gray"))
                            .frame(width: 40, height: 40)
                    })
                }
                ExpenseCardView(isFilter: true)
                    .environmentObject(expenseViewModel)
                CustomFilterSectionControllerView()
                    .environmentObject(expenseViewModel)
                    .padding(.top)
                
                //display filtered date with amount
                VStack(spacing: 5){
                    Text(expenseViewModel.convertSelectedDurationToString())
                        .opacity(0.7)
                    Text(expenseViewModel.currentExpensesString(expenses: expenseViewModel.expenses, type: expenseViewModel.tabName))
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .opacity(0.9)
                        .animation(.none, value: expenseViewModel.tabName)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color(.white))
                )
                
                ForEach(expenseViewModel.expenses.filter{
                    return $0.type == expenseViewModel.tabName && $0.date >= expenseViewModel.startDate && $0.date <= expenseViewModel.endDate
                }){expense in
                    TransactionCardView(expense: expense)
                        .environmentObject(expenseViewModel)
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background(Color("BGColor"))
        .ignoresSafeArea()
        .overlay(FilterView().environmentObject(expenseViewModel), alignment: .center)
    }

}

struct FilteredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDetailView()
            .environmentObject(ExpenseViewModel())
    }
}
