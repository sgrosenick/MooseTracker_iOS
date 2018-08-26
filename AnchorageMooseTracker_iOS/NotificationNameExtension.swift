//
//  NotificationNameExtension.swift
//  AnchorageMooseTracker_iOS
//
//  Created by Samuel Grosenick on 8/19/18.
//  Copyright © 2018 Samuel Grosenick. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let mooseLocation = Notification.Name(rawValue: "mooseLocation")
    static let mooseNumber = Notification.Name(rawValue: "mooseNumber")
    static let mooseDescription = Notification.Name(rawValue: "mooseDescription")
}
