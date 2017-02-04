//
//  AdditionalContent.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 04/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class AdditionalContent {
    
    struct Objects {
        var sectionName: String!
        var sectionDescriptions: [String]!
        var sectionURLS: [String]!
    }
    
    var _objectsArray = [Objects]()
    
    var objectsArray: [Objects] {
        if SharedVars.sharedInstance.weekNum == "Week 1" {
            _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 2" {
                  _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        }else if SharedVars.sharedInstance.weekNum == "Week 3" {
                  _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 4" {
                 _objectsArray = [Objects(sectionName: "Video week 4", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        }else if SharedVars.sharedInstance.weekNum == "Week 5" {
                  _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 6" {
                  _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 7" {
                   _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 8" {
                  _objectsArray = [Objects(sectionName: "Video", sectionDescriptions: ["Dit is filmpje 1", "Dit is filmpje 2", "en nog filmpje 3"], sectionURLS: ["https://www.youtube.com/embed/GLjelIPg3ys", "https://www.youtube.com/embed/9YRjX3A_8cM", "https://www.youtube.com/embed/BSmToj9VZ4s"])]
        }
        return _objectsArray
    }
    
    static let sharedInstance = AdditionalContent()
    
}
