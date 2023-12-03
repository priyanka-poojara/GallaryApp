//
//  DashboardRepo.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import UIKit
import DGNetworkingServices

class DashboardRepo {
    
    func callApi(completion: @escaping (([ImageList]?,Bool,String) -> Void)) {
        DGNetworkingServices.main.MakeApiCall(Service: NetworkURL(withURL: "https://itunes.apple.com/search?term=jack+johnson&limit=50"), HttpMethod: .get, parameters: nil, headers: nil) { response in
            
            switch response {
            case .success((_, let response)):
                do {
                    let musicData = try JSONDecoder().decode(ImagesData.self, from: response)
                    let musicList = musicData.results

                    completion(musicList, true, "")
                    print(musicData)
                    
                } catch(let error) {
                    completion(nil, false, error.localizedDescription)
                    print(error)
                }
                
            case .failure(let error):
                completion(nil, false, error.localizedDescription)
                print(error)
            }
            
        }
    }
    
}
