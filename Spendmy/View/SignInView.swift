//
//  SignInView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showLoginErrorAlert : Bool = false
    @State private var isUserSignedIn : Bool = false
    
    var body: some View {
        
        if isUserSignedIn{
            HomeView()
        }
        else{
            content
        }
 
    }
    
    var content : some View {
        ZStack{
            Color("BGColor")
            
            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(alignment: .leading, spacing: 5){
                Text("Sign In")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .offset(y: -100)
                
                Image("Budget-PNG-Pic")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 120)
                
                //Email
                Label{
                    TextField("Email", text:$email)
                        .padding(.leading, 10)
                        .opacity(0.5)
                } icon: {
                    Image(systemName: "envelope")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                }
                .frame(maxWidth: 320, alignment: .leading)
                .padding(.vertical, 18)
                .padding(.horizontal, 15)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color(.white))
                )
                .padding(.top, 25)

                //Password
                Label{
                    SecureField("Password", text:$password)
                        .padding(.leading, 10)
                        .opacity(0.5)
                } icon: {
                    Image(systemName: "person.fill.questionmark")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                }
                .frame(maxWidth: 320, alignment: .leading)
                .padding(.vertical, 18)
                .padding(.horizontal, 15)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color(.white))
                )
                .padding(.top, 25)
                
                Button(action: {
                    login()
                }, label: {
                    Text("Sign In")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .frame(maxWidth: 350)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color("NavyBlue"), Color("DarkPurple"), Color("LightPink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                        )
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                })
                .disabled(email == "" || password == "")
                .opacity(email == "" || password == "" ?  0.6 : 1)
                .alert(isPresented: $showLoginErrorAlert){
                    Alert(title: Text("Alert"), message: Text("User Login failed."))
                }
                .padding(.top, 25)
                .contentShape(Rectangle())
            }
            .frame(width: 350)
            .onAppear{

            }
            
        }
    }
    
    func login(){

    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
