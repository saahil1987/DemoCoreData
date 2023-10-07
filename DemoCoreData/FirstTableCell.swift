//
//  FirstTableCell.swift
//  DemoCoreData
//
//  Created by yapapp on 07/10/23.
//

import UIKit

class FirstTableCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    // code is used when we write single line in cellForRowAt 
//    var student:Student! {
//        didSet{
//            nameLbl.text = student.name
//            addressLbl.text = student.address
//            cityLbl.text = student.city
//            mobileLbl.text = student.mobile
            
        
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    

}
