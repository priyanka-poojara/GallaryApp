//
//  Dashboard+Datasource.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import UIKit
import SDWebImage

extension DashboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvImages.dequeueReusableCell(indexPath: indexPath) as ImagesViewCell
        let data = self.arrImages[indexPath.row]
        cell.imgView.sd_setImage(with: URL(string: data), placeholderImage: nil)
        return cell
    }
    
}
