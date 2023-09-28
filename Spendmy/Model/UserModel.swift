//
//  UserModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import Foundation

struct User : Identifiable {
    let id = UUID()
    let email: String
    let password: String
    let confirmPassword: String
    
}
