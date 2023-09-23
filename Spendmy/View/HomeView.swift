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
            }
            .padding()
        }
        .background(Color("BGColor"))
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func ExpenseCardView()-> some View{
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            VStack(spacing: 220){
                Text(expenseViewModel.currentMonthDateString())
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
