//
//  AuthNavigationController.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class AuthNavigationController: UINavigationController {
    
    
    private var enterPhoneController: AuthEnterPhoneController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarHidden(true, animated: false)
        enterPhoneController = AuthEnterPhoneController()
        viewControllers = [enterPhoneController]
    }
}
