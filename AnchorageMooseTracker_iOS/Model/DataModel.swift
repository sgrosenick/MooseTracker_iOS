//
//  DataModel.swift
//  AnchorageMooseTracker_iOS
//
//  Created by Samuel Grosenick on 8/26/18.
//  Copyright © 2018 Samuel Grosenick. All rights reserved.
//

import Foundation

class DataModel {
    var id: String!
    var mooseNumber: Int!
    
    init(mooseNumber: Int!) {
        id = UUID().uuidString
        self.mooseNumber = mooseNumber
    }
}
