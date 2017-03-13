//
//  InterfaceController.swift
//  CafeX WatchKit Extension
//
//  Created by Alex on 3/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController,WCSessionDelegate {
 var cafe : [Cafe] = []
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let vcID = self.value(forKey: "_viewControllerID") {
            print("Controller: \(vcID)")
        }
        
        let session = WCSession.default()
        session.delegate = self
        session.activate()
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let array = applicationContext["beers"] as? [[String : AnyObject]] {
            cafe.removeAll()
            
            for item in array {
                let orderItem = Cafe(dictionary: item)
                cafe.append(orderItem)
            }
            
        }
    }
    
}
