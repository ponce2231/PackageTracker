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
    static let apiKeyUsps = "094NONE07049"
    
    enum EndPoints {
        //MARK: USPS EndPoint
        static let baseUsps = "http://production.shippingapis.com/ShippingAPI.dll?API=TrackV2"
        static let uspsApiKeyParam = "&XML=<TrackRequest USERID=\"\(CarrierClient.apiKeyUsps)\">"
        
        case usps(String)
        
        
        var urlValue:String {
            switch self {
            case .usps(let trackID): return EndPoints.baseUsps + EndPoints.uspsApiKeyParam + "<TrackID ID=\"\(trackID)\"></TrackID></TrackRequest>"
            }
        }
        var url: URL{
            print(urlValue)
            return URL(string: urlValue)!
        }
    }
    
    class func uspsTracker(packageID: String, completionHandler: @escaping (Bool,Error?) -> Void){
        //        9400111899561757463961
        var request = URLRequest(url: EndPoints.usps(packageID).url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                
                print(error?.localizedDescription)
                completionHandler(false, error)
                return
            }
//            guard let data = request.data(using: .utf8)else{
//                print(error?.localizedDescription)
//                return
//            }
            
            do{
                let decoder = XMLDecoder()
                let trackResponse = try decoder.decode(TrackResponse.self, from: data)
                
                let encoder = XMLEncoder()
                let returnData = try encoder.encode(trackResponse, withRootKey: "TrackResponse")
                print(returnData)
                completionHandler(true, nil)
            }catch{
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
        
        
        
        //        let decoder = XMLDecoder()
        //
        //        let trackObject = try? decoder.decode(TrackResponse.self, from: data)
        //
        //        let returnData = try? XMLEncoder().encode(trackObject, withRootKey: "TrackResponse")
        //        if returnData != nil {
        //            print(returnData)
        //        }else{
        //            print(returnData, "bananas")
        //        }
        //        AF.request(try! uspsURL.asURL()).response{ response in
        //
        //            print(response)
        //
        //
        //        }
        
    }
    
}

