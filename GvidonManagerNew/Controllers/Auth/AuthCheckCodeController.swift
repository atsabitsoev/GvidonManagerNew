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
    
    
    //MARK: LifeCycle
    override func loadView() {
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
        print(code)
    }
    
}
