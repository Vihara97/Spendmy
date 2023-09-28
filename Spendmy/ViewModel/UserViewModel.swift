//
//  UserViewModel.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import Foundation
import FirebaseAuth

class UserViewModel: ObservableObject{
    //properties
    @Published var user: UserModel = sample_user
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showPasswordNotMatchingAlert : Bool = false
    @Published var showSignUpSuccessAlert : Bool = false
    @Published var showSignUpErrorAlert : Bool = false
    @Published var showLoginErrorAlert : Bool = false    
    @Published var isUserSignedIn : Bool = false
    
    init(){
    }
    
    //Create user
    func register(){
        if(password == confirmPassword){
            Auth.auth().createUser(withEmail: email, password: password){result, error in
                    if error != nil{
                        print(error!.localizedDescription)
                        self.showSignUpErrorAlert.toggle()
                        self.clearData()
                    }
                    else{
                        self.showSignUpSuccessAlert.toggle()
                    }
                }
            }
            else{
                self.showPasswordNotMatchingAlert.toggle()
                self.clearData()
            }
    }
    
    //Login
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
                self.showLoginErrorAlert = true
            }
            else{
                self.isUserSignedIn.toggle()
            }
        }
    }
    
    //Clear all data
    func clearData(){
        email = ""
        password = ""
        confirmPassword = ""
    }
}
