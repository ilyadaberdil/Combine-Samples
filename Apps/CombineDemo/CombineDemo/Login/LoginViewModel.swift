//
//  LoginViewModel.swift
//  CombineDemo
//
//  Created by berdil karaçam on 12.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var showIndicator: Bool = false
    
    private var seriesResource: SeriesResource = SeriesResourceImpl()

    func loginButtonTapped() {
        //do something..
        print("email: \(email), password: \(password)")
        samplePost()
    }
    
    func samplePost() {
     //   let parameter: SampleParameter = SampleParameter.init(email: "eve.holt@reqres.in", password: "cityslicka")
        let parameter: SampleParameter = .init(email: email, password: password)
        showIndicator = true
        _ = seriesResource.samplePost(param: parameter)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] response in
                guard let self = self else { return }
                self.showIndicator = false
                switch response {
                case .failure(let error):
                    print(error.localizedDescription)
                   // fallthrough //if u want to check finish case.
                case .finished: // only succes case
                    //ommitt..
                    break
                }
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                print("SUCCESS -> TOKEN : \(value.token ?? "")")
                self.isLoggedIn = true
            })
    }
}

extension LoginViewModel {
    func getSeriesListView() -> some View {
        return SeriesBuilder.createSeriesListView()
    }
}
