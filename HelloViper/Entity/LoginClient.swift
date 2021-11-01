//
//  LoginClient.swift
//  HelloViper
//
//  Created by user204006 on 11/1/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct LoginClient {
    static let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    static func getUser(by id: Int) -> Observable<User> {
        return RxAlamofire.requestDecodable(.get, "\(kBaseURL)/users/\(id)")
            .map{ (response, user: User) in
                return user
            }
         
        
    }
    
    
}
