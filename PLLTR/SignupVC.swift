//
//  SignupVC.swift
//  PLLTR
//
//  Created by Akash Desai on 2020-10-01.
//

import Foundation
import UIKit

class SignupVC: UIViewController {
    // MARK: - Properties
    lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    var signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up"
        label.font = UIFont(name: "Roboto-Regular", size: 35)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var passwordVerifyTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Verify password"
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var nameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name"
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var phoneNumberTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phone number"
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 700
        view.flashScrollIndicators()
        view.backgroundColor = .white
        return view
    }()
    
    var imageView: UIImageView = {
       let view = UIImageView(image: UIImage(named: "signupBackground"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        hideKeyboardWhenTappedAround()
        //view.backgroundColor = UIColor.charcoalColor()
        self.navigationController?.navigationBar.tintColor = UIColor.white;

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        System.clearNavigationBar(forBar: self.navigationController!.navigationBar)
    }

    func setupView() {

        self.view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.35).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        self.view.addSubview(containerView)
        containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.75).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        containerView.layer.cornerRadius = 40
        

        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        
        scrollView.addSubview(signupLabel)
        signupLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        signupLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 12).isActive = true
        
        scrollView.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(phoneNumberTextField)
        phoneNumberTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        phoneNumberTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(passwordVerifyTextField)
        passwordVerifyTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        passwordVerifyTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        passwordVerifyTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        passwordVerifyTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true


    }
    
}


extension SignupVC: UITextFieldDelegate {
    
    
    
    
}


// MARK: - check user input
extension SignupVC {
    func checkUserInput() -> Bool {
        var check: Bool = false
        
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordVerifyTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.popUp(title: "Error", message: "All fields must be filled out")
            return check
        }
        
        if emailTextField.text!.isValidEmail {
            check = true
        } else {
            self.popUp(title: "Invalid Email", message: "Please make sure email is valid")
            return false
        }
        
        if phoneNumberTextField.text!.isValidPhone {
            check = true
        } else {
            self.popUp(title: "Invalid phone number", message: "Please make sure phone number is valid")
            return false
        }
        
        if passwordTextField.text!.isValidPassword {
            check = true
        } else {
            self.popUp(title: "Invalid password", message: "The password must contain atleast one uppercase, one digit, one lowercase and atleast 8 characters long")
            return false
        }
    
        return check
        
    }
}


    

