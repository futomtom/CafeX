//
//  ViewController.swift
//  CafeX
//
//  Created by Alex on 3/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit
import WatchConnectivity


let offset_HeaderStop:CGFloat = 200 - 64  // At this offset the Header stops its transformations
let distance_W_LabelHeader:CGFloat = 30.0 // The distance between the top of the screen and the top of the White Label



public struct Cafe {
    var name:String
    var price:Float
}

class ViewController: UIViewController ,WCSessionDelegate,UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{

    @IBOutlet weak var tableView: UITableView!
      @IBOutlet var avatarImage:UIButton!
    @IBOutlet weak var headerView: UIView!

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet var handleLabel : UILabel!
    let cafe = [Cafe(name:"Americano", price:2.75),Cafe(name:"Americano with Milk", price:2.75),Cafe(name:"Caffe Latte", price:2.75),
                Cafe(name:"Cappuccino", price:2.75),Cafe(name:"Cortado", price:2.75),Cafe(name:"Espresso", price:2.75),
                Cafe(name:"Flat White", price:2.75)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateWatchCafe()
  //      tableView.contentInset = UIEdgeInsetsMake(headerView.frame.height, 0, 0, 0)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cafe.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
            
            return cell
   
        
        
        
    }
    
  
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(item: 0, section: 0)
        let cell = tableView?.cellForRow(at: indexPath)
        
        if cell != nil {
            
            if ((scrollView.contentOffset.y) > 74) {
                print("1")
                headerView.layer.zPosition = 2
                //         navigationController?.navigationBar.isHidden = false
                navigationItem.title = "Alex Fu"
                
            } else {
                  print("2")
                headerView.layer.zPosition = 0
                navigationItem.title = "Profile"
                //           navigationController?.navigationBar.isHidden = true
            }
        }
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

