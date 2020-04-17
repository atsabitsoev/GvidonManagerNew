//
//  AuthEnterPhoneController.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class AuthEnterPhoneController: UIViewController, EnterPhoneViewController {
    
    
    private var enterPhoneView: (EnterPhoneView & UIView)!
    
    
    //MARK: Life Cycle
    override func loadView() {
        enterPhoneView = AuthEnterPhoneView()
        enterPhoneView.configureView(controller: self)
        view = enterPhoneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        enterPhoneView.activateEnteringPhone()
        super.viewWillAppear(true)
    }
    
    
    //MARK: Veiw Actions
    func phoneEntered(phone: String) {
        print(phone)
    }
    
}
