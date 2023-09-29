//
//  UserModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import Foundation
import SwiftUI

struct UserModel : Identifiable,Hashable {
    var id = UUID()
    var email: String
    var password: String
    var confirmPassword: String
    
}
var sample_user: UserModel = UserModel(email: "test@gmail.com", password: "123", confirmPassword: "123")

