//
//  AuthEnterPhoneController.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class AuthEnterPhoneController: UIViewController, EnterPhoneViewController {
    
    
    private var enterPhoneView: EnterPhoneView!
    private var verifPhoneModel: VerifyPhoneModel!
    
    
    //MARK: Life Cycle
    override func loadView() {
        verifPhoneModel = VerifyPhoneModel()
        enterPhoneView = AuthEnterPhoneView()
        enterPhoneView.configureView(controller: self)
        view = enterPhoneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterPhoneView.enableButSendCode(false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        enterPhoneView.activateEnteringPhone()
        super.viewWillAppear(true)
    }
    
    
    //MARK: Navigation
    private func showCheckCodeView(verificationId: String) {
        let vc = AuthSendCodeController()
        vc.verificationId = verificationId
        self.navigationController?.show(vc, sender: nil)
    }
    
    
    //MARK: Veiw Actions
    func phoneChanged(isValid: Bool) {
        enterPhoneView.enableButSendCode(isValid)
    }
    
    func butConfirmTapped(phone: String) {
        verifPhoneModel.sendCode(to: phone) { (verificationId, errorString) in
            guard let verificationId = verificationId else {
                print(errorString ?? "Неизвестная ошибка")
                self.alertError(message: errorString ?? "Что-то пошло не так...")
                return
            }
            self.showCheckCodeView(verificationId: verificationId)
        }
    }
    
}
