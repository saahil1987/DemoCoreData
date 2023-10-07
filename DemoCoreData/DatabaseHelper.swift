//
//  DatabaseHelper.swift
//  DemoCoreData
//
//  Created by yapapp on 07/10/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    // Func is used for Data Save
    func save(object:[String:String]){
        // For save Student(Entity) Data
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        
        do{
            try context?.save()
        }catch{
            print("userData is not saved")
        }
        
    }
    
    // Func is used for Fetch the data
    func getStudentData() -> [Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try context?.fetch(fetchRequest)as! [Student]
        }catch{
            print("can not get data")
        }
        return student
        
    }
    //Func is used for Delete data from Table cell
    
    func deleteData(index:Int)->[Student]{
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("cannot delete data")
        }
        return student
    }
    // Func is used for Updating/Editing CoreData
    
    func editData(object:[String:String],i:Int){
        var student = getStudentData()
        student[i].name = object["name"]
        student[i].address = object["address"]
        student[i].city = object["city"]
        student[i].mobile = object["mobile"]
        do{
            try context?.save()
        }catch{
            print("cannot delet data")
        }
        
    }
}
