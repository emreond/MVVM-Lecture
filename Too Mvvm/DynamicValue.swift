//
//  GenericDataSource.swift
//  Too Mvvm
//
//  Created by Emre on 7.12.2019.
//  Copyright © 2019 Emre. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class DynamicValue<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    var value : T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll()
    }
}
