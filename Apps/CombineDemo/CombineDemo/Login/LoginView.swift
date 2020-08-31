//
//  LoginView.swift
//  CombineDemo
//
//  Created by berdil karaçam on 12.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $viewModel.showIndicator ) {
                VStack(alignment: .center) {
                    self.titleText
                    self.loginStack
                    self.hintStack
                    Spacer()
                }
            }
        }
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}

extension LoginView {
    
    var titleText: some View {
        Text("Login")
            .foregroundColor(.red)
            .font(.headline)
    }
    
    var userNameTextField: some View {
        TextField("Email", text: $viewModel.email)
    }
    
    var passwordTextField: some View {
        TextField("Password", text: $viewModel.password)
    }
    
    var loginButton: some View {
        Button(action: viewModel.loginButtonTapped, label: {
            Text("SAMPLE BUTTON")
                .foregroundColor(.red)
                .bold()
        })
    }
    
    var loginStack: some View {
        VStack(alignment: .center, spacing: 16) {
            userNameTextField
            passwordTextField
            NavigationLink(destination: viewModel.getSeriesListView(), isActive: $viewModel.isLoggedIn) {
                loginButton
            }
        }.padding()
    }
    
    var hintStack: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("email: eve.holt@reqres.in")
            Text("passw: cityslicka")
        }.padding(.top, 30)
    }
}






//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
