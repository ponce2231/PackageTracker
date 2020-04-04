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
        CarrierClient.uspsTracker(packageID: "9400111899561757463961", completionHandler:uspsHandler(succes:error:))
//          print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func uspsHandler(succes: Bool, error: Error?) {
        if succes{
            print("bananas")
        } else{
            print(error?.localizedDescription)
        }
    }
}

