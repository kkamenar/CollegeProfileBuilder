//
//  CollegeDataViewController.swift
//  CollegeProfileBuilder
//
//  Created by Kristin Kamenar on 6/20/16.
//  Copyright © 2016 Kristin Kamenar. All rights reserved.
//

import UIKit

class CollegeDataViewController: UIViewController, UITextFieldDelegate {

    //@IBOutlet weak var collegeNameLabel: UILabel!
    @IBOutlet weak var collegeLogoImage: UIImageView!
    //@IBOutlet weak var collegeLocationLabel: UILabel!
    //@IBOutlet weak var collegeEnrollmentLabel: UILabel!
    
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var schoolLocationTextField: UITextField!
    @IBOutlet weak var schoolEnrollmentTextField: UITextField!
    
    
    var schoolName = ""
    var schoolLogo = ""
    var schoolPlace = ""
    var schoolNum = ""
    var currentIndex = 0
    //var collegeArray : [College]?
    var collegeArray : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        schoolNameTextField.text = schoolName
        schoolLocationTextField.text = schoolPlace
        schoolEnrollmentTextField.text = schoolNum
        collegeLogoImage.image = UIImage(named: schoolLogo )
        

        
        schoolNameTextField.delegate = self
        schoolLocationTextField.delegate = self
        schoolEnrollmentTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateButton(sender: UIButton) {
        
        
        schoolName = schoolNameTextField.text!
        schoolNum = schoolEnrollmentTextField.text!
        schoolPlace = schoolLocationTextField.text!
        
        //update information in object
        let updatedInfo = College(name: schoolName, location: schoolPlace, number: schoolNum, pic: schoolLogo)
        
        collegeArray.removeAtIndex(currentIndex)
        collegeArray.insert(updatedInfo, atIndex: currentIndex)
//        
//        collegeArray.name = schoolName
//        collegeArray.location = schoolPlace
//        collegeArray.number = schoolNum
        
        
        //references original view controller
        let mainVC = self.parentViewController?.childViewControllers[0] as! ViewController
        mainVC.ListOfColleges = collegeArray
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
