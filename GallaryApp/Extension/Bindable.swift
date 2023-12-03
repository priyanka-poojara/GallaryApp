//
//  Bindable.swift
//  GallaryApp
//
//  Created by Priyanka on 03/12/23.
//

import Foundation

// MARK: Observable
class Observable<T> {
    
    typealias Listener = (T) -> Void
    var listener:Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value:T) {
        self.value = value
    }
    
    func observe( listener:@escaping Listener) {
        self.listener = listener
    }
    
}

typealias BindFail = ((_ status: Bool, _ message: String) -> Void)
