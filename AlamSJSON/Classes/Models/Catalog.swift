//
//  Category.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/20/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

class Catalog {

    var id: String?
    var title: String?
    var desc: String?
    var price: String?
    var img_url: String?
    
    init(catalogJSON : NSDictionary) {
        
        id = catalogJSON["id"] as? String
        title = catalogJSON["title"] as? String
        desc = catalogJSON["description"] as? String
        price = catalogJSON["price"] as? String
        img_url = catalogJSON["image_url"] as? String
    }
}
