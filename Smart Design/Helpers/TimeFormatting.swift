//
//  TimeFormatting.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import Foundation

func calcTimeSince (date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/60
    
    if minutes < 60 {
        return "\(minutes) minutes ago"
    }
    
    else if minutes > 60  && hours < 24 {
        return "\(hours) hours ago"
    }
    
    else {
        return "\(days) days ago"
    }
}
