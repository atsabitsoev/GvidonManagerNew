//
//  AuthService.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 19.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


final class AuthService {
    
    
    private init() {
        Auth.auth().languageCode = "ru"
    }
    
    
    static let standard = AuthService()
    
    
    func verifyPhone(phone: String,
                     _ handler: @escaping (_ verificationId: String?, _ errorString: String?) -> Void) {
        
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
    
    
    func signIn(verificationId: String,
                code: String,
                _ handler: @escaping (_ restaurantId: String?, _ errorString: String?) -> Void) {
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            guard let authResult = authResult,
                let phone = authResult.user.phoneNumber else {
                    
                handler(nil, error?.localizedDescription)
                print(error)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("managers").whereField("phone", isEqualTo: phone).getDocuments { (querySnap, error) in
                guard let restaurantId = querySnap?.documents.first?.data()["restaurantId"] as? String else {
                    handler(nil, error?.localizedDescription)
                    return
                }
                
                handler(restaurantId, nil)
            }
        }
    }
    
    
}
