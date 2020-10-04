//
//  ViewController.swift
//  PLLTR
//
//  Created by Akash Desai on 2020-09-30.
//

import UIKit
import GoogleSignIn
import Lottie

class HomeVC: UIViewController {
    // MARK: - Properties
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PLTT"
        label.font = UIFont(name: "Roboto-Medium", size: 55)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var rTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\u{042F}"
        label.font = UIFont(name: "Roboto-Medium", size: 55)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var foodCarousel: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let googleSigninButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    let appleSigninButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        button.layer.shadowOffset = .zero
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.setImage(UIImage(named: "apple_logo"), for: .normal)
        return button
    }()
    
    let facebookSigninButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(red: 71, green: 101, blue: 168, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        button.layer.shadowOffset = .zero
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.setImage(UIImage(named: "facebook_logo"), for: .normal)
        return button
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    var foodAnimationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var signinLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont(name: "Roboto-Regular", size: 35)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? | ", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedTitle.append(NSAttributedString(string: "Sign up", attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont(name: "Roboto", size: 14)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto", size: 14)
        //button.addTarget(self, action: #selector(handleSignupTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 125, green: 200, blue: 230, alpha: 1)

        setupView()

        titleAnimation()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            //signed in
        } else {
            GIDSignIn.sharedInstance()?.signIn()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //hides nav bar
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func googleSigin() {
        
    }
    
    func setupView() {
        
        self.view.addSubview(containerView)
        containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.75).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        containerView.layer.cornerRadius = 40
        
        self.view.addSubview(signinLabel)
        signinLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 55).isActive = true
        signinLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        self.signinLabel.alpha = 0
        
        self.view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: signinLabel.bottomAnchor, constant: 20).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.alpha = 0
        emailTextField.frame.origin.x -= 500
        
        self.view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.alpha = 0
        passwordTextField.frame.origin.x -= 500

        
        self.view.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.alpha = 0

        
        self.view.addSubview(googleSigninButton)
        googleSigninButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        googleSigninButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -55).isActive = true
        googleSigninButton.style = .iconOnly
        googleSigninButton.colorScheme = .dark
        googleSigninButton.alpha = 0
        
        self.view.addSubview(appleSigninButton)
        appleSigninButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -63).isActive = true
        appleSigninButton.rightAnchor.constraint(equalTo: googleSigninButton.leftAnchor, constant: -12).isActive = true
        appleSigninButton.widthAnchor.constraint(equalToConstant: 41).isActive = true
        appleSigninButton.heightAnchor.constraint(equalToConstant: 41).isActive = true
        appleSigninButton.alpha = 0

        self.view.addSubview(facebookSigninButton)
        facebookSigninButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -63).isActive = true
        facebookSigninButton.rightAnchor.constraint(equalTo: appleSigninButton.leftAnchor, constant: -17).isActive = true
        facebookSigninButton.widthAnchor.constraint(equalToConstant: 41).isActive = true
        facebookSigninButton.heightAnchor.constraint(equalToConstant: 41).isActive = true
        facebookSigninButton.alpha = 0

        
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -15).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.titleLabel.alpha = 1
        //titleLabel.frame.origin.y -= 500
        
        self.view.addSubview(rTitleLabel)
        rTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        rTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        rTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 63).isActive = true
        rTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //rTitleLabel.frame.origin.x = 500
        rTitleLabel.alpha = 0
        
    }
    
    //initial animation for title
    func titleAnimation() {
        
        UIView.animate(withDuration: 0.7, delay: 2 , usingSpringWithDamping: 1000, initialSpringVelocity: 1, options: .curveLinear, animations: ({
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y += 500
        }), completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 2 , usingSpringWithDamping: 1000, initialSpringVelocity: 1, options: .curveLinear, animations: ({
            self.rTitleLabel.alpha = 1
            self.rTitleLabel.frame.origin.x -= 500
        }), completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 3 , usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: ({
            self.foodAnimation()
        }), completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 3.5, usingSpringWithDamping: 10, initialSpringVelocity: 1, options: .curveEaseIn, animations: ({
            self.emailTextField.alpha = 1
            self.signinLabel.alpha = 1
            //self.emailTextField.frame.origin.x += 500
        }), completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 3.5, usingSpringWithDamping: 10, initialSpringVelocity: 1, options: .curveEaseIn, animations: ({
            self.passwordTextField.alpha = 1
            self.signUpButton.alpha = 1
            //self.passwordTextField.frame.origin.x += 500
        }), completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 4, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: ({
            self.facebookSigninButton.alpha = 1
        }), completion: nil)

        UIView.animate(withDuration: 0.4, delay: 4.6, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: ({
            self.appleSigninButton.alpha = 1
        }), completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 5.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: ({
            self.googleSigninButton.alpha = 1
        }), completion: nil)
        
        
        
    }
    
    func foodAnimation() {
        foodCarousel = .init(name: "food-carousel")
        foodCarousel.contentMode = .scaleAspectFit
        foodCarousel.loopMode = .loop
        foodCarousel.animationSpeed = 0.55
        foodCarousel.play()
        self.view.addSubview(foodCarousel)
        foodCarousel.frame = CGRect(x: screen.width/2 - 60, y: 135, width: 120, height: 120)

    }
    
}


extension HomeVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            
        } else {
            
        }
        
        
        
    }
    
}
