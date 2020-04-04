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
 
 struct TrackResponse: Codable {
    
//    @objc dynamic var TrackInfo: String?
    var Id: String
    var TrackSummary: String
    var TrackDetail: String

    enum CodingKeys: String, CodingKey {
        case Id = "ID"
        case TrackSummary, TrackDetail
    }
 }
