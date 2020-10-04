//
//  LaunchScreenManager.swift
//  PLTTR
//
//  Created by Akash Desai on 2020-09-29.
//

import Foundation
import UIKit

class LaunchScreenManager {
    
    
    var view: UIView?
    var parentView: UIView?
    
    
    static let instance = LaunchScreenManager(animationDurationBase: 0.8)
    
    let animationDurationBase: Double
    
    init(animationDurationBase: Double) {
        self.animationDurationBase = animationDurationBase
    }
    
    func animateAfterLaunch(_ parentViewPassedIn: UIView) {
        parentView = parentViewPassedIn
        view = loadView()
        
        fillParentViewWithView()
        titleAnimation()

    }
    
    func loadView() -> UIView {
        return UINib(nibName: "LaunchScreen", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func fillParentViewWithView() {
        parentView!.addSubview(view!)
        
        view!.frame = parentView!.bounds
        view!.center = parentView!.center
    }
    
    func titleAnimation() {
        let x = view!.viewWithTag(1)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 100, initialSpringVelocity: 1, options: .curveEaseIn, animations: ({
            x?.frame.origin.x += 500
        }), completion: nil)
        
        let y = view!.viewWithTag(2)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 100, initialSpringVelocity: 1, options: .curveEaseIn, animations: ({
            y?.frame.origin.y -= 500
        }), completion: nil)
            
            
        let vc = HomeVC()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDurationBase + 1) {
            self.view!.removeFromSuperview()
            vc.rTitleLabel.alpha = 0
        }
    }
    
    
}
