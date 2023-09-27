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
    @Namespace var animation
    
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
                CustomFilterSectionController()
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
        .overlay(FilterView(), alignment: .center)
    }
    
    //filter view
    @ViewBuilder
    func FilterView()->some View{
        ZStack{
            Color.black
                .opacity(expenseViewModel.showFilterView ? 0.25 : 0)
                .ignoresSafeArea()
            
            if expenseViewModel.showFilterView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        Spacer()
                        Button(action: {
                            expenseViewModel.showFilterView = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding(5)
                        }
                    }
                    .offset(y: 15)
                    
                    Text("Start Date")
                        .font(.caption)
                        .opacity(0.7)

                    DatePicker("", selection: $expenseViewModel.startDate, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                    
                    Text("End Date")
                        .font(.caption)
                        .opacity(0.7)
                    
                    DatePicker("", selection: $expenseViewModel.endDate, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                }
                .frame(maxWidth: 140, maxHeight: 140, alignment: .leading)
                .padding(20)
                .padding(.bottom, 20)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.white)
                )
            }
        }
        .animation(.easeInOut, value: expenseViewModel.showFilterView)
    }
    
    
    //custom filter controller
    @ViewBuilder
    func CustomFilterSectionController()->some View{
        HStack(spacing: 0){
            ForEach([ExpenseType.income, ExpenseType.expense], id:
                        \.rawValue){tab in
                Text(tab.rawValue.capitalized)
                    .fontWeight(.semibold)
                    .foregroundColor(expenseViewModel.tabName == tab ? .white : .black)
                    .opacity(expenseViewModel.tabName == tab ? 1 : 0.7)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(
                        Group {
                            if expenseViewModel.tabName == tab {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            } else {
                                Color.clear
                            }
                        }
                    )
                    .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation {
                                        expenseViewModel.tabName = tab
                                    }
                                }
            }
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color(.white))
        )
    }
}


struct FilteredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDetailView()
            .environmentObject(ExpenseViewModel())
    }
}
