//
//  FilterView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Namespace var animation
    
    var body: some View {
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
}
