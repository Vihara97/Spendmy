//
//  HomeView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/17/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
            VStack(spacing: 12){
                HStack(spacing: 15){
                    VStack(alignment: .leading, spacing: 4){
                        Text("Welcome")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Text("Spendmy")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button{
                        
                    } label:{
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(Color("Gray"))
                            .frame(width: 40, height: 40)
                    }
                }
                ExpenseCardView()
                TransactionsView()
            }
            .padding()
        }
        .background(Color("BGColor"))
        .ignoresSafeArea()
    }
    
    //TransactionsView
    @ViewBuilder
    func TransactionsView()-> some View{
        VStack(spacing: 10){
            Text("Transactions")
                .font(.title2)
                .bold()
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expenses){expense in
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
            .padding(.top)
        }
    }
    
        
    //ExpenseCardView
    @ViewBuilder
    func ExpenseCardView()-> some View{
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            VStack(spacing: 15){
                VStack(spacing: 15){
                    //Duration
                    Text(expenseViewModel.currentMonthDateString())
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
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 25, height: 25)
                                    
                        Image(systemName: "arrow.up")
                            .font(.callout)
                            .foregroundColor(.green)
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
                            .fill(Color.white.opacity(0.8))
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
