//
//  CommonExtension.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import UIKit

// MARK: - UIScrollView Extension
///
/// - `addRefreshControl`: It will add refreshcontrol to scrollview, tableview.
extension UIScrollView {
    func addRefreshControl(target: Any, action: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        refreshControl.tintColor = .black
        if #available(iOS 10.0, *) {
            self.refreshControl = refreshControl
        } else {
            addSubview(refreshControl)
        }
    }
    
    func endRefreshing() {
        if #available(iOS 10.0, *) {
            refreshControl?.endRefreshing()
        }
    }
}

// MARK: Global function to set any screen as root
///
/// - `viewController`: Enter viewcontroller object
public func setRootViewController(viewController: UIViewController) {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
        return
    }
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.setNavigationBarHidden(true, animated: false)
    
    // Access the SceneDelegate and update the window and root view controller
    if let sceneDelegate = windowScene.delegate as? SceneDelegate {
        let newWindow = UIWindow(windowScene: windowScene)
        newWindow.rootViewController = navigationController
        newWindow.makeKeyAndVisible()
        sceneDelegate.window = newWindow
    }
    
}
