//
//  AuthCheckCodeView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 18.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class AuthCheckCodeView: UIView, CheckCodeView {
    
    
    private var controller: CheckCodeViewController!
    
    
    private var labTitle = TitleLabel()
    private var tfCode = RoundedShadowTextField()
    
    
    private var codeLength: Int = 4
    
    
    func configureView(controller: CheckCodeViewController) {
        self.controller = controller
        backgroundColor = .backgroundBlueLight
        codeLength = 6
        setupTitle()
        setupTfCode()
    }
    
    override func updateConstraints() {
        setLabTitleConstraints()
        setTfCodeConstraints()
        super.updateConstraints()
    }
    
    
    private func setupTitle() {
        addSubview(labTitle)
        labTitle.text = "Введите код из\nСМС"
    }
    
    private func setupTfCode() {
        addSubview(tfCode)
        tfCode.textAlignment = .center
        tfCode.keyboardType = .numberPad
        if #available(iOS 12.0, *) {
            tfCode.textContentType = .oneTimeCode
        } else {
            tfCode.textContentType = .none
        }
        tfCode.placeholder = Set(1...codeLength).map({ (_) -> String in
            return "Х"
            }).joined()
        tfCode.addTarget(self, action: #selector(tfCodeChanged), for: .editingChanged)
    }
    
    
    //MARK: CONSTRAINTS
    private func setLabTitleConstraints() {
        labTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40 + safeAreaInsets.top)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(90)
        }
    }
    
    private func setTfCodeConstraints() {
        tfCode.snp.makeConstraints { (make) in
            make.top.equalTo(labTitle.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.width.equalTo(230)
        }
    }
    
    
    //MARK: Opened Funcs
    func activateEnteringCode() {
        tfCode.becomeFirstResponder()
    }
    
    
    //MARK: User Actions
    @objc private func tfCodeChanged() {
        if let code = tfCode.text, code.count == codeLength {
            controller.codeEntered(code: code)
        } else {
            print("Код введен не до конца: \(tfCode.text ?? "")")
        }
    }

}
