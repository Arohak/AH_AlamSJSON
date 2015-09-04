//
//  DBHelper.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/20/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

import CoreData

@objc(DBHelper)
class DBHelper: NSObject {
    class var sharedHelper: DBHelper {
        struct Static {
            static var instance: DBHelper?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = DBHelper()
        }
        
        return Static.instance!
    }

    //MARK: - Core Data stack
    
    //Managed Model
    lazy var managedModel: NSManagedObjectModel? = {
        var model: NSManagedObjectModel? = NSManagedObjectModel.mergedModelFromBundles(nil)
        return model
    }()
    
    //Store coordinator
    var _storeCoordinator: NSPersistentStoreCoordinator?
    var storeCoordinator: NSPersistentStoreCoordinator {
        if !(_storeCoordinator != nil){
            let _storeURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent("CSDataStorage.sqlite")
            _storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedModel!)
            
            func addStore() -> NSError?{
                var result: NSError? = nil
                if _storeCoordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: _storeURL, options: nil, error: &result) == nil{
                    println("Create persistent store error occurred: \(result?.userInfo)")
                }
                return result
            }
            
            var error = addStore()
            if  error != nil{
                println("Store scheme error. Will remove store and try again. TODO: add scheme migration.")
                NSFileManager.defaultManager().removeItemAtURL(_storeURL, error: nil)
                error = addStore()
                
                if (error != nil){
                    println("Unresolved critical error with persistent store: \(error?.userInfo)")
                    abort()
                }
            }
        }
        return _storeCoordinator!
    }
    
    //Managed Context
    lazy var managedContext: NSManagedObjectContext? = {
        var context: NSManagedObjectContext? = NSManagedObjectContext()
        context?.persistentStoreCoordinator = self.storeCoordinator

        return context
    }()

    //Save context
    func saveContext() {
        println("Will save")
        var error: NSError? = nil
        var result: Bool = false
        let context = self.managedContext
        if context != nil {
            if context!.hasChanges && !context!.save(&error){
                println("Save context error occurred: \(error?.userInfo)")
            }else{
                result = true
            }
        }
    }
    
    // Returns the URL to the application's Documents directory.
    var applicationDocumentsDirectory: NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.endIndex-1] as! NSURL
    }
    
    //MARK: - Suggestion methods
//    func addSuggestionWithName(name: String, andDate date: NSDate) {
//        if !self.isSuggestionExistInCoreData(name) {
//            let suggestion = NSEntityDescription.insertNewObjectForEntityForName("Suggestion", inManagedObjectContext: self.managedContext!) as! Suggestion
//            suggestion.name = name
//            suggestion.date = date
//            self.saveContext()
//        }
//    }
//    
//    func isSuggestionExistInCoreData(suggestion: String) -> Bool {
//        let fetchRequest = NSFetchRequest(entityName: "Suggestion")
//        let predicate = NSPredicate(format: "name = %@", suggestion)
//        fetchRequest.predicate = predicate
//        // Execute the fetch request, and cast the results to an array of LogItem objects
//        if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [Suggestion] {
//            return fetchResults.count > 0
//        }
//        return false
//    }
//    
//    func getSuggestions() -> [Suggestion] {
//        let fetchRequest = NSFetchRequest(entityName: "Suggestion")
//        
//        // Execute the fetch request, and cast the results to an array of LogItem objects
//        if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [Suggestion] {
//            return fetchResults
//        }
//        return [Suggestion]()
//    }
//    
//    //MARK: - DealPreview methods
//    func addDealPreviewWithParams(dealParams: Dictionary<String, String>) {
//        let deal = NSEntityDescription.insertNewObjectForEntityForName("DealPreview", inManagedObjectContext: self.managedContext!) as! DealPreview
//        if let id = dealParams["id"] {
//            var idInt = id.toInt()
//            deal.id = idInt!
//        }
//        deal.name = dealParams["name"] ?? ""
//        deal.type = dealParams["type"] ?? ""
//    }
//    
//    func getDeals() -> [DealPreview]{
//        let fetchRequest = NSFetchRequest(entityName: "DealPreview")
//        // Execute the fetch request, and cast the results to an array of Deal objects
//        if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [DealPreview] {
//            return fetchResults
//        }
//        return [DealPreview]()
//    }
//    
//    func getDealsWithPrefix(prefix: String) -> [DealPreview] {
//        let fetchRequest = NSFetchRequest(entityName: "DealPreview")
//        let predicate = NSPredicate(format: "name  BEGINSWITH[c] %@", prefix)
//        fetchRequest.predicate = predicate
//        
//        // Execute the fetch request, and cast the results to an array of Suggestion objects
//        if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [DealPreview] {
//            return fetchResults
//        }
//        return [DealPreview]()
//    }
//    
//    //MARK: - Deal methods
//    func  addDealWithParams(dealParams: NSDictionary/*Dictionary<String, Any>*/) {
//        let deal = NSEntityDescription.insertNewObjectForEntityForName("Deal", inManagedObjectContext: self.managedContext!) as! Deal
//        if let id = dealParams["id"] as? String {
//            var idInt = id.toInt()
//            deal.id = idInt!
//        }
//        if let name = dealParams["name"] as? String {
//            deal.name = name
//        }
//        if let type = dealParams["section"] as? String {
//            deal.type = type
//        }
//        if let dateString = dealParams["date"] as? String {
//            var date = Utils.stringToDate(dateString)
//            deal.date = date!
//        }
//        var index = 0
//        if let dates = dealParams["dates"] as? [String] {
//            var dateSet: NSMutableSet = deal.mutableSetValueForKey("dates")
//            for dateString in dates {
//                var date = Utils.stringToDate(dateString)
//                var dateModel: Date = NSEntityDescription.insertNewObjectForEntityForName("Date", inManagedObjectContext: self.managedContext!) as! Date
//                dateModel.date = date!
//                dateModel.index = index++
//                dateSet.addObject(dateModel)
//            }
//        }
//        self.parceOverviews(deal, dealParams: dealParams)
//        //Parse industry
//        self.parceCategoriesWithType("industry", deal: deal, dealParams: dealParams)
//        //Parse ratings
//        self.parceCategoriesWithType("rating", deal: deal, dealParams: dealParams)
//        
//        self.saveContext()
//    }
//    
//    func getDealWithId(dealId: Int, andDate date: NSDate) -> Deal? {
//        let fetchRequest = NSFetchRequest(entityName: "Deal")
//        let predicate = NSPredicate(format: "(id = %@) AND (date = %@)", dealId != -1 ? NSNumber(integer: dealId) :  NSNumber(integer: 10), date)
//        fetchRequest.predicate = predicate
//        
//        // Execute the fetch request, and cast the results to an array of Suggestion objects
//        if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [Deal] {
//            if fetchResults.count > 0 {
//                return fetchResults[0]
//            } else {
//                return nil
//            }
//        }
//        return nil
//    }
//    
//    //Private meyhods
//    private func parceCategoriesWithType(type: String, deal: Deal, dealParams: NSDictionary/*Dictionary<String, Any>*/) {
//        var keyForCategory = type == "industry" ? "industries" : "ratings"
//        if let categories = dealParams[keyForCategory] as? [NSDictionary] {
//            var categorySet: NSMutableSet = deal.mutableSetValueForKey("categories")
//            var categoryOrderIndex = 0
//            for categoryDictionary in categories {
//                var name = categoryDictionary["name"] as? String ?? ""
//                //Get industry category set and set params
//                var categoryModel: Category = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: self.managedContext!) as! Category
//                categoryModel.name = name
//                categoryModel.type = type
//                if let categoryValues = categoryDictionary["values"] as? [NSDictionary] {
//                    //Get industry value set and set params
//                    var categoryValueSet: NSMutableSet = categoryModel.mutableSetValueForKey("values")
//                    var valueOrderIndex = 0
//                    for valueDictionary in categoryValues {
//                        let valueName = valueDictionary["name"] as? String ?? ""
//                        let value = valueDictionary["value"] as? String ?? ""
//                        var valueModel: CategoryValue = NSEntityDescription.insertNewObjectForEntityForName("CategoryValue", inManagedObjectContext: self.managedContext!) as! CategoryValue
//                        valueModel.name = valueName
//                        valueModel.value = value
//                        valueModel.index = valueOrderIndex++
//                        
//                        categoryValueSet.addObject(valueModel)
//                    }
//                }
//                categoryModel.index = categoryOrderIndex++
//                categorySet.addObject(categoryModel)
//            }
//        }
//    }
//    
//    private func parceOverviews(deal: Deal, dealParams: NSDictionary) {
//        if let overview = dealParams["overview"] as? [Dictionary<String, String>] {
//            var overviewSet: NSMutableSet = deal.mutableSetValueForKey("overviews")
//            var index = 0
//            for overviewItem in overview {
//                let name = overviewItem["name"]
//                let value = overviewItem["value"]
//                var overviewModel: Overview = NSEntityDescription.insertNewObjectForEntityForName("Overview", inManagedObjectContext: self.managedContext!) as! Overview
//                if  let name = name {
//                    overviewModel.name = name
//                }
//                if  let value = value {
//                    overviewModel.value = value
//                }
//                overviewModel.index = index++
//                overviewSet.addObject(overviewModel)
//            }
//        }
//    }
//    
//    //MARK: Functions for testing
//    func fillDealPreviewCoreData() {
//        var dealsDictionary: NSDictionary?
//        var dealId = 0
//        if self.getDeals().count == 0 {
//            if let path = NSBundle.mainBundle().pathForResource("Deals", ofType: "plist") {
//                dealsDictionary = NSDictionary(contentsOfFile: path)
//                if let dict = dealsDictionary {
//                    for item in dict.allValues[0] as! [String] {
//                        var dealPreview = [ "id" : String(dealId), "name" : item, "type" : "collateral" ]
//                        DBHelper.sharedHelper.addDealPreviewWithParams(dealPreview)
//                        dealId++
//                    }
//                }
//            }
//        }
//    }
//    
//    func fillDealInfoCoreData() {
//        let dealId = "10"
//        if !self.isDealExistInCoreData(dealId, entityName: "Deal") {
//            var deals: NSArray?
//            if let path = NSBundle.mainBundle().pathForResource("TestDeals", ofType: "plist") {
//                deals = NSArray(contentsOfFile: path)
//                if let dealArray = deals {
//                    for deal in dealArray {
//                        var dealData = deal as! NSDictionary
//                        self.addDealWithParams(dealData)
//                    }
//                }
//            }
//        }
//    }
//    
//    private func isDealExistInCoreData(dealId: String, entityName name: String) -> Bool {
//        let fetchRequest = NSFetchRequest(entityName: name)
//        var idInt = dealId.toInt()
//        let predicate = NSPredicate(format: "id = %d", idInt ?? -1)
//        fetchRequest.predicate = predicate
//        
//        //Execute the fetch request, and cast the results to an array of LogItem objects
//        if  name == "DealPreview" {
//            if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [DealPreview] {
//                return fetchResults.count > 0
//            }
//        } else {
//            if let fetchResults = self.managedContext!.executeFetchRequest(fetchRequest, error: nil) as? [Deal] {
//                return fetchResults.count > 0
//            }
//        }
//        return false
//    }
}