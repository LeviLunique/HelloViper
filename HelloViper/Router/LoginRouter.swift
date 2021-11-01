//
//  LoginRouter.swift
//  HelloViper
//
//  Created by user204006 on 11/1/21.
//

import Foundation
import UIKit

class LoginRouter {
    
    let view = LoginViewController(nibName: "LoginViewController", bundle: Bundle.main)
    let presenter = LoginPresenter()
    let interactor = LoginInteractor()
    
    init() {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
    func present(on window: UIWindow) {
        window.rootViewController = view
    }
    
}
