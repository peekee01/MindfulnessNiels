//
//  ExerciseContent.swift
//  Mindfulness Niels
//
//  Created by Pieter Kuijsten on 04/02/2017.
//  Copyright © 2017 Pieter Kuijsten. All rights reserved.
//

import UIKit

class ExerciseContent {
    
    struct Objects {
        var sectionName: String!
        var sectionObjects: [String]!
    }
    
    var _objectsArray = [Objects]()
    
    var objectsArray: [Objects] {
        if SharedVars.sharedInstance.weekNum == "Week 1" {
            _objectsArray = [Objects(sectionName: "Formal practice", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 2" {
            _objectsArray = [Objects(sectionName: "Formal practice", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        }else if SharedVars.sharedInstance.weekNum == "Week 3" {
            _objectsArray = [Objects(sectionName: "Formal practice", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 4" {
            _objectsArray = [Objects(sectionName: "Formal practice week 2", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice week 2", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        }else if SharedVars.sharedInstance.weekNum == "Week 5" {
            _objectsArray = [Objects(sectionName: "Formal practice week 2", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice week 2", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 6" {
            _objectsArray = [Objects(sectionName: "Formal practice week 2", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice week 2", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 7" {
            _objectsArray = [Objects(sectionName: "Formal practice week 2", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice week 2", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        } else if SharedVars.sharedInstance.weekNum == "Week 8" {
            _objectsArray = [Objects(sectionName: "Formal practice week 2", sectionObjects: ["Go through the week 1 pages of the Home Practice Handbook", "Do the guided audio practice (Body Scan, 15 to 15 min) six days a week"]), Objects(sectionName: "Informal practice week 2", sectionObjects: ["Eat one meal (or one bite) mindfully", "Attempt to solve the 9 dots exercise, while noticing how you go about solving it"]), Objects(sectionName: "Insight practice", sectionObjects: ["Keeping a daily log of your practice (use the form in your Home Practice Handbook) to record your experience", "Identify your intentions for this course"]), Objects(sectionName: "Audio", sectionObjects: ["22 De soldaat", "Body Scan", "11.  Mindfulness of breathing and body mediation"])]
        }
        return _objectsArray
    }
    
    static let sharedInstance = ExerciseContent()
    
}
