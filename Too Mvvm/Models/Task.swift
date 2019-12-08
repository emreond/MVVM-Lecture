//
//  Task.swift
//  Too Mvvm
//
//  Created by Emre on 8.12.2019.
//  Copyright © 2019 Emre. All rights reserved.
//

import Foundation

struct Task: Codable {
    let id: String
    var title: String
    var isFav: Bool
    let createdDate: Date
    var isTodaysDo: Bool
    var isDone: Bool
    var detailNote: String?
    var dueDate: Date?

    //Required initializer for a task
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
        self.isFav = false
        self.createdDate = Date()
        self.isTodaysDo = false
        self.isDone = false
        self.detailNote = nil
        self.dueDate = nil
    }
}
