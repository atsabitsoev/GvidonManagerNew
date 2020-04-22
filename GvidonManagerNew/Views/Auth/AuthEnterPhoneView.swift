//
//  AuthEnterPhoneView.swift
//  GvidonManagerNew
//
//  Created by Ацамаз Бицоев on 16.04.2020.
//  Copyright © 2020 Ацамаз Бицоев. All rights reserved.
//

import UIKit


final class AuthEnterPhoneView: UIView, EnterPhoneView {
    
    
    private var controller: EnterPhoneViewController?
    private let phoneCode  = "+7"
    
    
    //MARK: UIElements
    private let labTitle = TitleLabel()
    private let tfPhone = EnterPhoneTextField(frame: .zero)
    private let butSendCode = ConfirmButton()
    
    
    //MARK: LIFE CYCLE
    func configureView(controller: EnterPhoneViewController) {
        self.controller = controller
        backgroundColor = .backgroundBlueLight
        setNeedsUpdateConstraints()
        setupTitle()
        setupTfPhone()
        setupButSendCode()
    }
    
    override func updateConstraints() {
        setLabTitleConstraints()
        setTfPhoneConstraints()
        setButSendCodeConstraints()
        super.updateConstraints()
    }
    
    
    //MARK: Opened Funcs
    func activateEnteringPhone() {
        tfPhone.becomeFirstResponder()
    }
    
    func enableButSendCode(_ enable: Bool) {
        if enable {
            butSendCode.alpha = 1
            butSendCode.isEnabled = true
        } else {
            butSendCode.alpha = 0.5
            butSendCode.isEnabled = false
        }
    }
    
    
    //MARK: SETUP
    private func setupTitle() {
        addSubview(labTitle)
        labTitle.text = "Введите номер\nтелефона"
    }
    
    private func setupTfPhone() {
        addSubview(tfPhone)
        tfPhone.addTarget(self, action: #selector(tfPhoneChanged), for: .editingChanged)
        let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        accessoryView.addSubview(butSendCode)
        tfPhone.inputAccessoryView = accessoryView
    }
    
    private func setupButSendCode() {
        butSendCode.setTitle("Подтвердить", for: .normal)
        butSendCode.addTarget(self, action: #selector(butSendCodeTapped), for: .touchUpInside)
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
    
    private func setTfPhoneConstraints() {
        tfPhone.snp.makeConstraints { (make) in
            make.top.equalTo(labTitle.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(42)
            make.width.equalTo(230)
        }
    }
    
    private func setButSendCodeConstraints() {
        butSendCode.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalTo(236)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
    //MARK: User Actions
    @objc private func tfPhoneChanged() {
        controller?.phoneChanged(isValid: tfPhone.isValidNumber)
    }
    
    @objc private func butSendCodeTapped() {
        guard let phone = tfPhone.text else { return }
        controller?.butConfirmTapped(phone: phoneCode + " " + phone)
    }
    

}
