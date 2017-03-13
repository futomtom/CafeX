//
//  ViewController.swift
//  CafeX
//
//  Created by Alex on 3/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit
import WatchConnectivity

public struct Cafe {
    var name:String
    var price:Float
}

class ViewController: UIViewController ,WCSessionDelegate{

   

    var cafe : [Cafe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateWatchCafe()
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }

    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func updateWatchCafe() {
        // Start Session
        let session = WCSession.default()
        session.delegate = self
        
        // Remember to activate session
        session.activate()
        
        // Update Context
        var context = session.applicationContext
        
        var array : [[String : AnyObject]] = []
        
        for item in cafe {
         //   array.append(item.toDictionary())
        }
        
        context["cafe"] = array
        
        // Send Message
        do {
            try session.updateApplicationContext(context)
        } catch let error {
            print(error)
        }
        
        // Update Saved Cache
        let defaults = UserDefaults.standard
        defaults.set(array, forKey: "cafe")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }



}

