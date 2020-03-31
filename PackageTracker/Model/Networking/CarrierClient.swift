//
//  CarrierClient.swift
//  PackageTracker
//
//  Created by Christopher Ponce Mendez on 3/25/20.
//  Copyright © 2020 Christopher Ponce Mendez. All rights reserved.
//

import Foundation
import XMLParsing
import Alamofire

class CarrierClient {
    //MARK: USPS apikey
    static let apiKeyUsps = "806NONE06853"
    
    enum EndPoints {
        //MARK: USPS EndPoint
        static let baseUsps = "http://production.shippingapis.com/ShippingAPI.dll?API=TrackV2"
        static let uspsApiKeyParam = "&XML=<TrackRequest USERID=\(CarrierClient.apiKeyUsps)>"
      
        case usps(String)
        
        
        var urlValue:String {
            switch self {
            case .usps(let trackID): return EndPoints.baseUsps + EndPoints.uspsApiKeyParam + "<TrackID ID=\(trackID)></TrackID></TrackRequest>"
            }
        }
        var url: URL{
            return URL(string: urlValue)!
        }
    }
    
    class func uspsTracker(packageID: String){
//        9400111899561757463961
        let uspsURL = "http://production.shippingapis.com/ShippingAPI.dll?API=TrackV2&XML=<TrackRequest USERID=\(apiKeyUsps)><TrackID ID=\(packageID)></TrackID></TrackRequest>"
        
        guard let data = uspsURL.data(using: .utf8)else{
            print("there was an error")
            return
        }
        
        let decoder = XMLDecoder()
        
        let trackObject = try? decoder.decode(TrackResponse.self, from: data)
        
        let returnData = try? XMLEncoder().encode(trackObject, withRootKey: "TrackResponse")
        if returnData != nil {
            print(returnData)
        }else{
            print(returnData, "bananas")
        }
        
    
        
    }
    
}
