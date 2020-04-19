//
//  AuthSendCodeController.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 18.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class AuthSendCodeController: UIViewController, CheckCodeViewController {
    
    
    private var checkCodeView: CheckCodeView!
    private var authModel: AuthorizationModel!
    
    
    var verificationId: String!
    
    
    //MARK: LifeCycle
    override func loadView() {
        authModel = AuthorizationModel()
        checkCodeView = AuthCheckCodeView()
        checkCodeView.configureView(controller: self)
        view = checkCodeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkCodeView.activateEnteringCode()
        super.viewWillAppear(animated)
    }

    
    //MARK: View Actions
    func codeEntered(code: String) {
        authModel.signIn(verificationId: verificationId, code: code) { (restaurantId, errorString) in
            guard let restaurantId = restaurantId else {
                print(errorString)
                return
            }
            
            self.authModel.localSignIn(verificationId: self.verificationId, code: code, restaurantId: restaurantId)
            print("Вход произведен: \nVerificationId: \(self.verificationId)\ncode: \(code)\nRestaurantId: \(restaurantId)")
        }
    }
    
}
