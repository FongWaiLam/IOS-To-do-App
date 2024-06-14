//
//  Task.swift
//  Todo App Demo
//
//  Created by itad on 13/6/2024.
//

import Foundation
import RealmSwift

// NS Object
class Task : Object {
    @objc dynamic var name: String = ""
    @objc dynamic var time: Date = Date();
    
    override init() {
        super.init();
    }
    
    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }
}
