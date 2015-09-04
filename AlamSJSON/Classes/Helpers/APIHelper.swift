//
//  APIHelper.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/20/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

import Alamofire
import SwiftyJSON

class APIHelper {
    
    class var sharedInstance: APIHelper {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: APIHelper? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = APIHelper()
        }
        return Static.instance!
    }
    
    func getCatalogs(completionHandler: (AnyObject?, NSError?) -> Void) {
        
        var url: String = API.SERVER_URL + API.GET_CATALOGS
        self.GET(url, params: nil) { (data, error) in
            completionHandler(data, error)
        }
    }
    
    private func GET(url: String, params: [String: AnyObject]? = nil, completionHandler: (AnyObject?, NSError?) -> Void) {
        
        UIHelper.showLoader()
        request(.GET, url, parameters: params).responseJSON { (req, res, jsonObject, error) in
            println(jsonObject)
            if (error != nil) {
                UIHelper.showError(error!.localizedDescription)
            } else {
                let array = JSON(jsonObject!).arrayObject!
                completionHandler(array, error)
            }
            
            UIHelper.hideLoader()
        }
    }
    
    private func POST(url: String, parameters: [String: AnyObject]? = nil, completionHandler: (AnyObject?, NSError?) -> Void) {
        
        let request: Request = Alamofire.request(.POST, url, parameters: parameters, encoding: .JSON);
        request.responseJSON { request, response, JSON, error in
            completionHandler(JSON, error)
        }
    }
}