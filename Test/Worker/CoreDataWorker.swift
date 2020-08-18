//
//  CoreDataWorker.swift
//  Test
//
//  Created by Tana Chaijamorn on 18/8/2563 BE.
//  Copyright © 2563 BE Tana Chaijamorn. All rights reserved.
//

import UIKit
import CoreData

class CoreDataWorker: NSObject, NSFetchedResultsControllerDelegate {
    
    class func initDatabase() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        
        do {
            let result = try context.fetch(request)
            if result.count != 209557 {
                return self.setDataToDatabase()
            }
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    class func searchCity(textSearch: String) -> CitiesModel {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.newBackgroundContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        
        if !textSearch.isEmpty {
            request.predicate = NSPredicate(format: "name BEGINSWITH[c] %@", textSearch)
        }
        
        let sortDescriptor = NSSortDescriptor(key:"name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        do {
            let result = try context.fetch(request)
            
            var lists = CitiesModel()
            for data in result as! [City] {
                let address = Coord(lon: data.address?.lon ?? 0.00, lat: data.address?.lat ?? 0.00)
                let content = CityModel(country: data.country ?? "", name: data.name ?? "", _id: Int(data.id) , coord: address)
                lists.append(content)
            }
            return lists
        } catch {
            print("Failed")
            return []
        }
    }
    
    private class func setDataToDatabase() {
        guard let objects = JSONExtension.shared.loadJson(CitiesModel.self, filename: "cities") else { return }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.performAndWait {
            for city in objects {
                let object = City(context: context)
                object.country = city.country
                object.id = Int64(city._id)
                object.name = city.name
                object.address = Address(context: context)
                object.address?.lon = city.coord.lon
                object.address?.lat = city.coord.lat
                
            }
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    print("Failed saving")
                }
                context.reset()
            }
        }
    }
}
