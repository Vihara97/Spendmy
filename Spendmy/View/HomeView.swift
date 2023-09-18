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
                        
                    } label : {
                        
                    }
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
