//
//  AppDelegate.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-05.
//

import UIKit
import FirebaseCore
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        registerForPushNotifications()
        
        
//        let window = UIWindow(frame: UIScreen.main.bounds)
//
//        window.rootViewController?.present(alert, animated: true, completion: nil)
//        window.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        //  Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate = scene?.delegate as? SceneDelegate {
                if let vc = sceneDelegate.window?.rootViewController  {
                    let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
                    vc.present(alert, animated: true, completion: nil)
                }

            }
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func registerForPushNotifications() {
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                (granted, error) in
                print("Permission granted: \(granted)")
                // 1. Check if permission granted
                guard granted else { return }
                // 2. Attempt registration for remote notifications on the main thread
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
//        let scene = UIApplication.shared.connectedScenes.first
//            if let sceneDelegate = scene?.delegate as? SceneDelegate {
//                if let vc = sceneDelegate.window?.rootViewController  {
//                    let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
//                    vc.present(alert, animated: true, completion: nil)
//                }
//
//            }
//        print(userInfo)
//        return UIBackgroundFetchResult.newData
//    }
    
    // This function will be called when the app receive notification
     func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
         print(notification.request.content.title)
         print(notification.request.content.body)
         print(notification.request.content.userInfo["newsId"])
       // show the notification alert (banner), and with sound
       completionHandler([.alert, .sound])
     }
       
     // This function will be called right after user tap on the notification
     func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
         let scene = UIApplication.shared.connectedScenes.first
             if let sceneDelegate = scene?.delegate as? SceneDelegate {
                 if let vc = sceneDelegate.window?.rootViewController  {
                     print(response.notification.request.content.title)
                     print(response.notification.request.content.body)
                     print(response.notification.request.content.userInfo["newsId"])
                     let alert = UIAlertController(title: "Title", message: response.notification.request.content.userInfo["newsId"] as! String, preferredStyle: .actionSheet)
                     vc.present(alert, animated: true, completion: nil)
                 }

             }       // tell the app that we have finished processing the user’s action / response
       completionHandler()
     }
}

extension AppDelegate: MessagingDelegate {
    
}

