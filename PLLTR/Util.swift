//
//  Util.swift
//  PLTTR
//
//  Created by Akash Desai on 2020-09-28.
//

import Foundation
import UIKit

// MARK: - set colours and rgb color converter function
extension UIColor {
    
    static func rgb(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    
    static func budGreenColor() -> UIColor {
        return rgb(red: 121, green: 180, blue: 115, alpha: 1)
    }
    
    static func pistachioColor() -> UIColor {
        return rgb(red: 161, green: 207, blue: 107, alpha: 1)
    }
    
    static func silverSandColor() -> UIColor {
        return rgb(red: 193, green: 193, blue: 193, alpha: 1)
    }
    
    static func charcoalColor() -> UIColor {
        return rgb(red: 44, green: 66, blue: 81, alpha: 1)
    }
    
    static func fuzzyWuzzyColor() -> UIColor {
        return rgb(red: 209, green: 102, blue: 102, alpha: 1)
    }
    
    
}

// MARK: - Gradient UIView

extension UIView {
    func setGradientBackground(firstColor: UIColor, secondColor: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

class ButtonWithImageApple: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        }
    }
}

class ButtonWithImageFacebook: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        }
    }
}

// MARK: - Custom textfield to add additional padding and icons
public class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 2, left: 20, bottom: 5, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //sets an an img at the left side of the textfield
    func setIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 2.5, width: 24, height: 24))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
}

// MARK: - dismiss keyboard when clicked screen
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func bounceTextField(textfield: UITextField, delay: Double) {
        textfield.center.x = self.view.frame.origin.x + 600
        UIView.animate(withDuration: 0.55, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 30, options: .curveEaseIn, animations: ({
            textfield.center.x = self.view.frame.width/2
        }), completion: nil)
    }
    
    func labelAnimation(label: UILabel, duration: Double) {
        UIView.animate(withDuration: 2.3) {
            label.alpha = 1
        }
    }
    
    func errorLabelAnimation(label: UILabel, errorText: String) {
        label.isHidden = false
        label.text = errorText
        UIView.animate(withDuration: 1, animations: {
            label.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) }, completion: { _ in
                UIView.animate(withDuration: 0.6) {
                    label.transform = CGAffineTransform.identity
                }
        })
    }
    
    func buttonZoomAnimation(button: UIButton) {
        button.alpha = 1
        UIView.animate(withDuration: 0.6, animations: {
            button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)  }, completion: { _ in
                UIView.animate(withDuration: 0.6) {
                    button.transform = CGAffineTransform.identity
                }
        })
    }
    
    
}

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}


// MARK: - underline textfields
enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}
extension UIView {
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
            case .LINE_POSITION_TOP:
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
            case .LINE_POSITION_BOTTOM:
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
                break
        }
    }
}

// MARK: - String extension for authentication

extension String {
    var isValidPhone: Bool {
        let regularExpressionForPhone = "^\\d{3}\\d{3}\\d{4}$"
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: self)
    }
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let testEmail = NSPredicate(format: "SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    var isValidPassword: Bool {
        let regularExpressionForPassword = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let testPassword = NSPredicate(format: "SELF MATCHES %@", regularExpressionForPassword)
        return testPassword.evaluate(with: self)
    }
    var isPostalCodeValid: Bool {
        let regularExpressionForPostalCode = "^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}[- ]{0,1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}"
        let testPostalcode = NSPredicate(format: "SELF MATCHES %@", regularExpressionForPostalCode)
        return testPostalcode.evaluate(with: self)
    }
    var isValidMemberNumber: Bool {
        let regularExpressionForMemberNumber = "^\\d{12}$"
        let testMemberNumber = NSPredicate(format: "SELF MATCHES %@", regularExpressionForMemberNumber)
        return testMemberNumber.evaluate(with: self)
    }
}

class CustomTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 88
        return size
    }
}

struct screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}
