//
//  DashboardViewController.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import UIKit
import GoogleSignIn

class DashboardViewController: UIViewController, Reusable {

    @IBOutlet weak var clvImages: UICollectionView!
    
    var data: [ImageList] = []
    var arrImages: [String] = []
    
    var viewmodel: ViewModel = ViewModel { status, message in
        print(message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// collectionview register
        collectionViewRegister()
        
        getImageData()
        
    }
    
    /// Collection Register
    func collectionViewRegister() {
        clvImages.dataSource = self
        clvImages.delegate = self
        clvImages.register(ImagesViewCell.nib, forCellWithReuseIdentifier: ImagesViewCell.reuseIdentifier)
        clvImages.addRefreshControl(target: self, action: #selector(getImageData))
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        UserDefault.shared.logout()
    
        let loginVC = LoginViewController()
        setRootViewController(viewController: loginVC)
    }
    
    @objc func getImageData() {
        viewmodel.apiGetData { data, status, message in
            if status {
                self.data = data ?? []
                let images = self.data.map{$0.artworkUrl100 ?? ""}
                self.saveImageUrls(images)
                self.arrImages = images
            } else {
                self.arrImages = self.getImageUrls()
            }
            DispatchQueue.main.async {
                self.clvImages.reloadData()
            }
        }
    }

}


// MARK: Userdefaults value store and get functions
extension DashboardViewController {
    
    // MARK: Storing an array of strings
    func saveImageUrls(_ urls: [String]) {
        UserDefaults.standard.set(urls, forKey: Constants.imagesStringArray)
    }
    
    func getImageUrls() -> [String] {
        let data = (UserDefaults.standard.array(forKey: Constants.imagesStringArray) as? [String]) ?? []
        return data
    }
}
