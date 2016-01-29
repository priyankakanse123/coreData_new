//
//  ViewController.swift
//  coredata_new
//
//  Created by BridgeLabz on 11/01/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData
import Foundation



class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var results:NSArray?
    
    @IBAction func loadButtonPressed(sender: AnyObject) {
        
        
        //var people = [NSManagedObject]()
        
        
        let appDel :AppDelegate =  (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context : NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        //request.predicate = NSPredicate (format: "username = %@", "" + nameTextField.text!)
        
        do {try results = context.executeFetchRequest(request)
        }
        catch _ as NSError
        {
            print("couldnt connected loadbutton")
        }
        
        if results?.count>0
        {
            
//            let res = results![0] as! NSManagedObject
//            nameTextField.text = res.valueForKey("username") as? String
//            passwordTextField.text = res.valueForKey("password") as? String
            
            
            for res in results!{
                nameTextField.text = res.valueForKey("username") as? String
                passwordTextField.text = res.valueForKey("password") as? String
                
                print (res)
            }
           
            
            
        }
        else
        {
            print("0 results returned...potential error")
        }
        
    }
    @IBAction func saveButtonPressed(sender: AnyObject) {
        let appDel :AppDelegate =  (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context : NSManagedObjectContext = appDel.managedObjectContext
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue("" + nameTextField.text!, forKey: "username")
        newUser.setValue("" + passwordTextField.text!, forKey: "password")
        do
        {
            try context.save()
            //people.append(newUser)
            print(newUser)
            print("objectSaved")
        }
        
            catch _ as NSError
            {
                print("couldnt connected")
        }
    
    
       // context.save()
        //context.save(nil)
        
        
        
        
        
        
 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    @IBAction func updateButtonPressed(sender: AnyObject) {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

