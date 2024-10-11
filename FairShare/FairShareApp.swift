//
//  FairShareApp.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI
import FirebaseCore
import UIKit
import FirebaseAuth
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Firebase'i başlat
        FirebaseApp.configure()
        
        // Remote notification için gerekli izinleri al
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            // İzin verildiğinde gerekli işlemleri yap
        }
        
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ app: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Firebase'e token'i gönder
        Messaging.messaging().apnsToken = deviceToken
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Firebase'e bildirimleri ilet
        if Auth.auth().canHandleNotification(userInfo) {
            // Firebase bildirimi işliyor
            completionHandler(.newData)
            return
        }
        
        // Diğer bildirim işlemleri
        completionHandler(.noData)
    }
}
   

@main
struct FairShareApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
          RegistrationView()
      }
    }
  }
}
