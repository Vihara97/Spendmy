//
//  CustomFilterSectionControllerView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import SwiftUI

struct CustomFilterSectionControllerView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Namespace var animation
    
    var body: some View {
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

