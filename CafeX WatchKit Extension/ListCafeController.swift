//
//  ListCafeInterfaceController.swift
//  CafeX
//
//  Created by Alex on 3/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import WatchKit

public struct Cafe {
    var name:String
    var price:Float
    
    
    init(name : String, price : Float) {
        self.name = name
        self.price = price
    }
    
    init(dictionary: [String : AnyObject]) {
        name = "Failed To Init"
        price = 0.0
/*
        if let name = dictionary["name"] as? String {
            self.name = name
            if let price = dictionary["price"] as? Float {
                self.price = price
            }
        } else {
           name = "Failed To Init"
           price = 0.0
        }
         */
    }
    
    func toDictionary() -> [String : Any] {
        return ["name" : name, "price" : price]
    }
}

class RowCell: NSObject {
    
    @IBOutlet var name: WKInterfaceLabel!
    @IBOutlet var price: WKInterfaceLabel!
}


class ListCafeController: WKInterfaceController {
    
    let cafe = [Cafe(name:"Americano", price:2.75),Cafe(name:"Americano with Milk", price:2.75),Cafe(name:"Caffe Latte", price:2.75),
                 Cafe(name:"Cappuccino", price:2.75),Cafe(name:"Cortado", price:2.75),Cafe(name:"Espresso", price:2.75),
                 Cafe(name:"Flat White", price:2.75)]
    
    @IBOutlet var table: WKInterfaceTable!
    
    func tableRefresh(){
  
        table.setNumberOfRows(cafe.count, withRowType: "row")
        for (index,item) in cafe.enumerated()     {
            let row = table.rowController(at: index) as! RowCell
            row.name.setText(item.name)
            row.price.setText("$\(item.price)")
  
        }
        
    }
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let context = ["cafe":cafe[rowIndex]]
        self.pushController(withName: "pickercontroller", context: context)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        tableRefresh()
        // Configure interface objects here.
    }
    
    
    
}
