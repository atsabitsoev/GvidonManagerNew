//
//  AuthModel.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 19.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


final class VerifyPhoneModel {
    
    
    private let authService = AuthService.standard
    
    
    func sendCode(to phone: String,
                  _ handler: @escaping (_ verificationId: String?, _ errorString: String?) -> Void) {
        
        authService.verifyPhone(phone: phone) { (verificationId, errorString) in
            guard let verificationId = verificationId else {
                handler(nil, errorString)
                return
            }
            
            handler(verificationId, nil)
        }
    }
    
}
