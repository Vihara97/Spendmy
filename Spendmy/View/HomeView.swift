//
//  HomeView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/17/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    
    //Add new expense button
    @ViewBuilder
    func AddExpenseButtonView()-> some View{
        Button(action: {
            expenseViewModel.addNewExpense.toggle()
        }, label: {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                )
        })
        .shadow(color: Color(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).opacity(0.1), radius: 5, x: 5, y: 5)
        .padding()
    }
    
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
                        
                        NavigationLink(
                            destination: FilteredDetailView()
                                .environmentObject(expenseViewModel),
                            label: {
                                Image(systemName: "arrow.right.doc.on.clipboard")
                                    .foregroundColor(Color("Gray"))
                                    .frame(width: 40, height: 40)
                            })

                    }
                    ExpenseCardView()
                        .environmentObject(expenseViewModel)
                    TransactionsView()
                }
                .padding()
            }
            .background(Color("BGColor"))
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $expenseViewModel.addNewExpense){
                expenseViewModel.clearData()
            } content: {
                AddExpenseView()
                    .environmentObject(expenseViewModel)
            }
            .overlay(AddExpenseButtonView(), alignment: .bottomTrailing)

    }
    
    
    //TransactionsView
    @ViewBuilder
    func TransactionsView()-> some View{
        VStack(spacing: 5){
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
