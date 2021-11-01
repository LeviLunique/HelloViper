//
//  LoginViewController.swift
//  HelloViper
//
//  Created by user204006 on 11/1/21.
//

import UIKit
import RxSwift
import RxSwiftExt
import RxCocoa

protocol LoginViewToPresenter: AnyObject {
    var credentials: Observable<(username: String, password: String)> { get }
    func setLoading(_ loading: Bool)
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterToView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onLogin(_ sender: Any) {
        
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        credential.accept((username, password))
    }
    
    let dispose = DisposeBag()
    
    private var user: User?{
        didSet{
            print(user?.name)
        }
        
    }
    
    var credential = BehaviorRelay<(username: String, password: String)?>(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        bind()
        // Do any additional setup after loading the view.
    }
    
    private func bind() {
        presenter.authenticatedUser.bind { [weak self] user in
            self?.user = user
            
        }
        .disposed(by: dispose)
    }


}

extension LoginViewController: LoginViewToPresenter {
    
    var credentials: Observable<(username: String, password: String)>{
        return credential.unwrap().asObservable()
    }
    
    func setLoading(_ loading: Bool) {
        if loading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
    }
}
