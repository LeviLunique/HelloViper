//
//  LoginInteractor.swift
//  HelloViper
//
//  Created by user204006 on 11/1/21.
//

import Foundation
import RxSwift

protocol LoginInteractorOutput: AnyObject {
    func userDidLogin(user: User)
    func errorOccured(error: Error?)
}

protocol LoginInteractorInput: AnyObject {
    func loginWith(username: String, and password: String)
}

class LoginInteractor {
    
    weak var output: LoginInteractorOutput?
    let dispose = DisposeBag()
    
}

extension LoginInteractor: LoginInteractorInput {
    func loginWith(username: String, and password: String) {
        
        if (username == "admin" && password == "123456"){
            LoginClient.getUser(by: 3)
                .subscribe{ [weak self = self] event in
                    
                    if let user = event.element {
                        self?.output?.userDidLogin(user: user )
                    }
                    if let error = event.error {
                        self?.output?.errorOccured(error: error)
                    }
                    
                }
                .disposed(by: dispose)
        }
        
    }}
