//
//  Settings.swift
//  birdwatch
//
//  Created by Mike Choi on 7/27/18.
//  Copyright © 2018 Mike JS. Choi. All rights reserved.
//

import Foundation

enum Field {

    enum Refresh: Int {
        
        static let key = "RefreshRate"
        
        case fiveMin = 5
        case tenMin = 10
        case thrityMin = 30
        case oneHour = 60
        case twoHours = 120
        
        static func get() -> Int {
            return UserDefaults.standard.integer(forKey: key)
        }
        
        static func save(minutes: Int) {
            UserDefaults.standard.set(minutes, forKey: key)
        }
    }
    
    enum Notification: Int {
        
        static let key = "PushNotificationValue"
        
        case off
        case on
        
        static func get() -> Bool {
            return UserDefaults.standard.bool(forKey: key)
        }
        
        static func save(status: Bool) {
            UserDefaults.standard.set(status, forKey: key)
        }
    }
    
}

