//
//  ViewController.swift
//  PackageTracker
//
//  Created by Christopher Ponce Mendez on 2/10/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import UIKit
import RealmSwift

class CarrierVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CarrierClient.uspsTracker(packageID: "9400111899561757463961")
          print(Realm.Configuration.defaultConfiguration.fileURL!)
    }


}

