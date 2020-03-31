 //
//  TrackResponse.swift
//  PackageTracker
//
//  Created by Christopher Ponce Mendez on 3/29/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import Foundation
import RealmSwift
import XMLParsing
 
 class TrackResponse: Object, Codable {
    
    @objc dynamic var TrackInfo: String?
    @objc dynamic  var TrackSummary: String?
    @objc dynamic  var TrackDetail: String?

 }
