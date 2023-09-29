//
//  SignUpView.swift
//  Spendmy
//
//  Created by Vihara Karunarathna on 9/28/23.
//

import SwiftUI

struct SignUpView: View {
        @ObservedObject var userViewModel: UserViewModel = .init()
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var confirmPassword: String = ""
        
        var body: some View {
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
                        Text("Welcome")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .offset(y: -50)
                        
                        Image("Budget-PNG-Pic")
                            .resizable()
                            .frame(maxWidth: 100, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(x: 120)
                        
                        //Email
                        Label{
                            TextField("Email", text: $userViewModel.email)
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
                            SecureField("Password", text: $userViewModel.password)
                                .padding(.leading, 10)
                                .opacity(0.5)
                        } icon: {
                            Image(systemName: "lock")
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
                        
                        //Confirm Password
                        Label{
                            SecureField("Confirm Password", text: $userViewModel.confirmPassword)
                                .padding(.leading, 10)
                                .opacity(0.5)
                        } icon: {
                            Image(systemName: "lock")
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
                            userViewModel.register()
                        }, label: {
                            Text("Sign Up")
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
                        .disabled(userViewModel.email.isEmpty || userViewModel.password.isEmpty || userViewModel.confirmPassword.isEmpty)
                        .opacity(userViewModel.email.isEmpty || userViewModel.password.isEmpty || userViewModel.confirmPassword.isEmpty ?  0.6 : 1)
                        .alert(isPresented: $userViewModel.showPasswordNotMatchingAlert){
                            Alert(title: Text("Alert"), message: Text("Passwords are not same."))
                        }
                        .alert(isPresented: $userViewModel.showSignUpSuccessAlert){
                            Alert(title: Text("Alert"), message: Text("User registration successfull."))
                        }
                        .alert(isPresented: $userViewModel.showSignUpErrorAlert){
                            Alert(title: Text("Alert"), message: Text("User registration failed."))
                        }
                        .padding(.top, 25)
                        .contentShape(Rectangle())
                             
                        NavigationLink(destination: SignInView(userViewModel: userViewModel).navigationBarHidden(true)){
                            VStack{
                                Text("Already have an account? Sign in")
                                    .font(.callout)
                                    .offset(x: 50)
                            }
                        }
                    }
                    .frame(width: 350)
                }
                .ignoresSafeArea()
        }
}

extension View {
    func Placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
