 //
//  Status.swift
//  PackageTracker
//
//  Created by Christopher Ponce Mendez on 3/29/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import Foundation
import RealmSwift
 
 class TrackResponse: Object, Codable {
    
    @objc dynamic var TrackInfo = ""
    @objc dynamic  var TrackSummary = ""
    @objc dynamic  var TrackDetail = ""

 }
