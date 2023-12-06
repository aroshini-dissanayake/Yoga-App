//
//  DBManager.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//

import CoreData
import UIKit

class DBManager {
    static let share = DBManager()
    
    //save
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YogaApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var  context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    //fetch
    func fetchTasks() -> [YogaEntity] {
        var pending = [YogaEntity]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: YogaEntity.description())

        do {
            pending = try context.fetch(fetchRequest) as! [YogaEntity]
            print(pending)
        }
        catch {
            print("Error")
        }
        return pending
    }
    
    //delete
    
}
