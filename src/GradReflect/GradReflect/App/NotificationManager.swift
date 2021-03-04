//
//  NotificationManager.swift
//  GradReflect
//
//  Created by Gemma McDonald on 25/11/2020.
//

import Foundation
import SwiftUI

/**
 Handles the notifications fired by the user
 Used in Settings View
 */
class NotificationManager: ObservableObject {
    
    // Holds notif objects created
    var notifications = [Notification]()
    
    // Ask user for permission to recieve notifs
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                print("Notifications permitted")
                
            } else {
                print("Notifications not permitted")
            }
        }
    }
    
    // Function to create instance of a notification
    func sendNotif(title: String, subtitle: String?, body: String, launchIn: Double) {
        
        // Set the content for the notif
        let content = UNMutableNotificationContent()
        content.title = title
        // If theres a subtitle been given
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
        
        // Set the trigger for the notif to get fired
        // Here it launches 10 seconds after being launched for proof of concept
        // But could use UNCalendarNotificationTrigger if it was to be at a set day
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
        let request = UNNotificationRequest(identifier: "demoNotif", content: content, trigger: trigger)
        
        // Add request to UNNotificationCenter, after 10 seconds notif gets launched
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
}
