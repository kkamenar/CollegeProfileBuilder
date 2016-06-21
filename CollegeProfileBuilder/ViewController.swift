//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Kristin Kamenar on 6/20/16.
//  Copyright © 2016 Kristin Kamenar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var collegeTableView: UITableView!
    var ListOfColleges = [College]()
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //allow editing of list of colleges
        editButton.tag = 0
        
        
        
        let college1 = College(name: "University of Iowa", location: "Iowa City, IA", number: "31,000", pic: "iowa")
        ListOfColleges.append(college1)
        
        let college2 = College(name: "UW-Madison", location: "Madison, WI", number: "43,000", pic: "uwmadison")
        ListOfColleges.append(college2)
        
        let college3 = College(name: "UW-Milwaukee", location: "Milwaukee, WI", number: "28,000", pic: "uwmilwaukee")
        ListOfColleges.append(college3)
        
        let college4 = College(name: "Carroll University", location: "Waukesha, WI", number: "3,500", pic: "carroll")
        ListOfColleges.append(college4)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        collegeTableView.reloadData()
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOfColleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("collegeDataCell")
        
        let name = ListOfColleges[indexPath.row].collegeName
        let location = ListOfColleges[indexPath.row].collegeLocation
        cell!.textLabel!.text = name
        cell!.detailTextLabel!.text = location
        
        return cell!
    }
    
     // MARK: - Navigation
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        

        
        let indexPath = collegeTableView.indexPathForSelectedRow!
        
        let name = ListOfColleges[indexPath.row].collegeName
        let location = ListOfColleges[indexPath.row].collegeLocation
        let numbers = ListOfColleges[indexPath.row].numberOfStudents
        let picture = ListOfColleges[indexPath.row].collegeLogo
        let index = indexPath.row
        
        let cDVC = segue.destinationViewController as! CollegeDataViewController
        
        //set title of view controller
        cDVC.title = "College Profile Builder"
        
        //set school name
        cDVC.schoolName = name
        
        //set number of students
        cDVC.schoolNum = numbers
        
        //set location of school
        cDVC.schoolPlace = location
        
        cDVC.schoolLogo = picture
        
        cDVC.currentIndex = index
        
        //pass the array of colleges
        cDVC.collegeArray = ListOfColleges
        

        
     }
    
    //allow for entries to be deleted
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            ListOfColleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    //Add a school to the list
    @IBAction func addItemButton(sender: UIBarButtonItem) {
        
        var schoolName = ""
        var schoolPlace = ""
        var schoolNum = ""
        var schoolIcon = ""
        
        let myAlert = UIAlertController(title: "Add School", message: nil, preferredStyle: .Alert)
        
        myAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add School Information"
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Location Information"
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Enrollment Information"
        }
        
        
        myAlert.addAction(UIAlertAction(title: "Add", style: .Default, handler: {(action) -> Void in
            let nameTextField = myAlert.textFields![0] as UITextField
            schoolName = nameTextField.text!
            
            let locationTextField = myAlert.textFields![1] as UITextField
            schoolPlace = locationTextField.text!
         
            let enrollmentTextField = myAlert.textFields![2] as UITextField
            schoolNum = enrollmentTextField.text!
            
            let addCollege = College(name: schoolName, location: schoolPlace, number: schoolNum, pic: schoolIcon)
            
            self.ListOfColleges.append(addCollege)
            
            self.collegeTableView.reloadData()
            
            

        }))
        
        myAlert.addAction(UIAlertAction(title:"Cancel", style: .Default, handler: nil))
        

        self.presentViewController(myAlert, animated: true, completion: nil)
            
        }
    
    
    //Allow for entries to be moved
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let school = ListOfColleges[sourceIndexPath.row]
        
        ListOfColleges.removeAtIndex(sourceIndexPath.row)
        
        ListOfColleges.insert(school, atIndex: destinationIndexPath.row)
    }
    
    
    @IBAction func editButtonAction(sender: UIBarButtonItem) {
        
        if sender.tag == 0
        {
            collegeTableView.editing = true
            sender.tag = 1
        }
        
        else
        {
            collegeTableView.editing = false
            sender.tag = 0
        }
    }
    
        
            
        
        
    

    


}

