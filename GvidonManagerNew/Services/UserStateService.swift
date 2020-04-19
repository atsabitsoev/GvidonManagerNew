//
//  UserStateService.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 19.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import Foundation


final class UserStateService {
    
    
    private init() {}
    static let standard = UserStateService()
    
    
    private var verificationId: String? {
        get { UserDefaults.standard.string(forKey: "verificationId") }
        set { UserDefaults.standard.set(newValue, forKey: "verificationId") }
    }
    
    private var verificationCode: String? {
        get { UserDefaults.standard.string(forKey: "verificationCode") }
        set { UserDefaults.standard.set(newValue, forKey: "verificationCode") }
    }
    
    private var restaurantId: String? {
        get { UserDefaults.standard.string(forKey: "restaurantId") }
        set { UserDefaults.standard.set(newValue, forKey: "restaurantId") }
    }
    
    private(set) var isLoggedIn: Bool? {
        get { UserDefaults.standard.bool(forKey: "isLoggedIn") }
        set { UserDefaults.standard.set(newValue, forKey: "isLoggedIn") }
    }
    
    
    var hasVerificationId: Bool {
        get { verificationId != nil }
    }
    
    func getRestaurantId() -> String? {
        return restaurantId
    }
    
    func localLogIn(verificationId: String, code: String, restaurantId: String) {
        self.verificationId = verificationId
        self.verificationCode = code
        self.restaurantId = restaurantId
        self.isLoggedIn = true
    }
    
    func logOut() {
        verificationId = nil
        verificationCode = nil
        restaurantId = nil
        isLoggedIn = false
    }
}
