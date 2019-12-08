//
//  MainViewControllerViewModel.swift
//  Too Mvvm
//
//  Created by Emre on 7.12.2019.
//  Copyright © 2019 Emre. All rights reserved.
//

import Foundation

class MainViewControllerViewModel {
    
    var list = GenericDataSource<Task>()
    
    init() {
       //Do init in here
    }
    
    func getModel(at index: Int) -> Task? {
        guard index < list.data.value.count else {
            return nil
        }
        return list.data.value[index]
    }
    
    func addModel(title: String) {
        let task = Task(title: title)
        list.data.value.append(task)
    }
    
    func removeTask(at index: Int) {
        list.data.value.remove(at: index)
    }
    
    func updateModel(with id: String) {
    }
    
    func fetchList(customListName: String?) {
        //Get list from Userdefaults
    }
}
