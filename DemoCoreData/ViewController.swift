//
//  ViewController.swift
//  DemoCoreData
//
//  Created by yapapp on 07/10/23.
//

import UIKit

class ViewController: UIViewController,DataPass {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var mobileText: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController")as! ListViewController
           vc.delegate = self  // code is used for Editing CoreData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let dict = ["name":nameText.text,"address":addressText.text,"city":cityText.text,"mobile":mobileText.text]
        if isUpdate {
            DatabaseHelper.shareInstance.editData(object: dict as! [String:String],i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict as! [String:String])
        }
        
    }
    // Func is used for Editing the coreData
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        nameText.text = object["name"]
        addressText.text = object["address"]
        cityText.text = object["city"]
        mobileText.text = object["mobile"]
        i = index
        isUpdate = isEdit
    }
}


extension UIView{
    @IBInspectable var cornerRadius:Double{
        get{
            return Double(self.layer.cornerRadius)
        }set{
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
}
