//
//  AuthService.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 19.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import FirebaseAuth


final class AuthService {
    
    
    private init() {}
    static let standard = AuthService()
    
    
    func verifyPhone(phone: String,
                     _ handler: @escaping (_ verificationId: String?, _ errorString: String?) -> Void) {
        
        Auth.auth().languageCode = "ru"
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { (verificationId, error) in
            if let error = error {
                handler(nil, error.localizedDescription)
                print(error)
                return
            }
            
            if let verificationId = verificationId {
                handler(verificationId, nil)
                return
            }
            
            handler(nil, "Неизвестная ошибка")
        }
    }
    
    
}
