//
//  AppDelegate.swift
//  Test
//
//  Created by Tana Chaijamorn on 17/8/2563 BE.
//  Copyright © 2563 BE Tana Chaijamorn. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate root view controllers
        let masterViewController = storyboard.instantiateViewController(ofType: ListViewController.self)
        let detailViewController = storyboard.instantiateViewController(ofType: DetailViewController.self)
        masterViewController.delegate = detailViewController
        
        // Embed in navigation controllers
        let masterNavigationViewController = UINavigationController(rootViewController: masterViewController)
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        
        // Instantiate Rootview in splitview
        let listPage = storyboard.instantiateSplitViewController(ofType: MainViewController.self)
        listPage.viewControllers = [masterNavigationViewController, detailNavigationController]
        
        window?.rootViewController = listPage
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Test")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.newBackgroundContext()
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

