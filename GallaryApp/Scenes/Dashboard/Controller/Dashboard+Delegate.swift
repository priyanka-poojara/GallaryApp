//
//  Dashboard+Delegate.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import UIKit

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = clvImages.bounds.width
        return CGSize(width: collectionwidth/2 - 15, height: collectionwidth/2 - 15)
    }
    
}
