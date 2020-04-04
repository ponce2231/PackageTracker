//
//  Package.swift
//  PackageTracker
//
//  Created by Christopher Ponce Mendez on 3/30/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import Foundation
import RealmSwift

class Package: Object {
    
    @objc dynamic var packageName = ""
    @objc dynamic var packageNumber = ""
    
//    @objc dynamic var trackResponse: TrackResponse!
}

