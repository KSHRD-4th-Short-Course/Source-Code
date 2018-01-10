//
//  AppDelegate.swift
//  OneSignalDemo
//
//  Created by KSHRD on 1/9/18.
//  Copyright © 2018 KSHRD. All rights reserved.
//

import UIKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // OneSignal
        let notificationReceivedBlock: OSHandleNotificationReceivedBlock = { notification in
            // Called when the app receives a notification while in focus only. Note: If you need this to be called when your app is in the background, set content_available to true when you create your notification. The "force-quit" state (i.e app was swiped away) is not currently supported.
            print("Received Notification - \(notification!.payload.notificationID) - \(notification!.payload.title)")
        }
        
        let notificationOpenedBlock: OSHandleNotificationActionBlock = { result in
            // This block gets called when the user reacts to a notification received
            let payload: OSNotificationPayload = result!.notification.payload
            var fullMessage = payload.body
            
            print(payload.body)
            
            
            //Try to fetch the action selected
            if let additionalData = payload.additionalData, let messageTitle = payload.title,
                let actionSelected = additionalData["actionSelected"] as? String {
                print("Message Title = \(messageTitle)")
                
                fullMessage =  fullMessage! + "\nPressed ButtonId:\(actionSelected)"
                
                print("fullMessage = \(fullMessage ?? "nil")")
            }
            
            let status: OSPermissionSubscriptionState = OneSignal.getPermissionSubscriptionState()
            
            let hasPrompted = status.permissionStatus.hasPrompted
            print("hasPrompted = \(hasPrompted)")
            let userStatus = status.permissionStatus.status
            print("userStatus = \(userStatus)")
            
            let isSubscribed = status.subscriptionStatus.subscribed
            print("isSubscribed = \(isSubscribed)")
            let userSubscriptionSetting = status.subscriptionStatus.userSubscriptionSetting
            print("userSubscriptionSetting = \(userSubscriptionSetting)")
            let userID = status.subscriptionStatus.userId
            print("userID = \(userID ?? "nil")")
            let pushToken = status.subscriptionStatus.pushToken
            print("pushToken = \(pushToken ?? "nil")")
        }
        
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false,
                                     kOSSettingsKeyInAppLaunchURL: true
        ]
        
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "84e362f2-36e1-4137-8b76-ab6d56634419",
                                        handleNotificationReceived: notificationReceivedBlock,
                                        handleNotificationAction: notificationOpenedBlock,
                                        settings: onesignalInitSettings)
        
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification
        // Recommend moving the below line to prompt for push after informing the user about
        //   how your app will use them.
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            UserDefaults.standard.set(accepted, forKey: "isEnablePushNotification")
            print("User accepted notifications: \(accepted)")
        })
        
        // Sync hashed email if you have a login system or collect it.
        //   Will be used to reach the user at the most optimal time of day.
        // OneSignal.syncHashedEmail(userEmail)
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

