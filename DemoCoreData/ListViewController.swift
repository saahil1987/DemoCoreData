//
//  ListViewController.swift
//  DemoCoreData
//
//  Created by yapapp on 07/10/23.
//

import UIKit
protocol DataPass{
    func data(object:[String:String],index:Int,isEdit:Bool)
}

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var student = [Student]()
    
    var delegate:DataPass!
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        student = DatabaseHelper.shareInstance.getStudentData()

       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "FirstTableCell", for: indexPath)as! FirstTableCell
        cell.nameLbl.text = student[indexPath.row].name
        cell.addressLbl.text = student[indexPath.row].address
        cell.cityLbl.text = student[indexPath.row].city
        cell.mobileLbl.text = student[indexPath.row].mobile
        //cell.student = student[indexPath.row] // code is used when didSet method is applied in tableCell class
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.myTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    // code is used for Editing CoreData
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        
        delegate.data(object: dict as! [String:String],index: indexPath.row, isEdit: true)// code is used for Editing CoreData
        
        self.navigationController?.popViewController(animated: true)
    }

}
