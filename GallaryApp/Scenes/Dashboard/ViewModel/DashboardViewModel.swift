//
//  DashboardViewModel.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import Foundation

class ViewModel {
    
    private var failblock: BindFail?
    private lazy var repo: DashboardRepo? = DashboardRepo()
    var data: Observable<[ImagesData]> = .init([])
    
    init(failblock: BindFail? = nil) {
        self.failblock = failblock
    }
    
    func apiGetData(completion: @escaping (([ImageList]?,Bool,String) -> Void)) {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        repo?.callApi(completion: { data, status, message in
            if status {
                completion(data, true, "")
            } else {
                completion(nil, false, "")                
            }
        })
        
    }
    
}
