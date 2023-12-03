//
//  LoginViewController.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.appName
        navigateToDashboard()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { googleUser, error in
            guard let googleUser = googleUser else {
                return
            }
            
            let token = googleUser.user.userID
            UserDefault.shared.saveToken(token: token)
    
            let vc = DashboardViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func navigateToDashboard() {
        if UserDefault.shared.isUserLoggedIn() {
            // Navigation code
            let vc = DashboardViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
