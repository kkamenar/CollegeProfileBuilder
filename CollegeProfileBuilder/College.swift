//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by Kristin Kamenar on 6/20/16.
//  Copyright © 2016 Kristin Kamenar. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var collegeName = ""
    var collegeLogo = ""
    var collegeLocation = ""
    var numberOfStudents = ""
    
    init(name: String, location: String, number: String, pic: String)
    {
        collegeName = name
        collegeLogo = pic
        collegeLocation = location
        numberOfStudents = number
    }

}
