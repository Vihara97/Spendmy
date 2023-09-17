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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
