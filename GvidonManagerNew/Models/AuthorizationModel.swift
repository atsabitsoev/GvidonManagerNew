//
//  AuthorizationModel.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 19.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


final class AuthorizationModel {
    
    
    private let authService = AuthService.standard
    private let userStateService = UserStateService.standard
    
    
    func signIn(verificationId: String,
                code: String,
                _ handler: @escaping (_ restaurantId: String?, _ errorString: String?) -> Void) {
        
        authService.signIn(verificationId: verificationId, code: code) { (restaurantId, errorString) in
            guard let restaurantId = restaurantId else {
                handler(nil, errorString)
                return
            }
            
            handler(restaurantId, nil)
        }
    }
    
    func localSignIn(verificationId: String, code: String, restaurantId: String) {
        self.userStateService.localLogIn(verificationId: verificationId, code: code, restaurantId: restaurantId)
    }
}
