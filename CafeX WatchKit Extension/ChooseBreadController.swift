//
//  ListCafeInterfaceController.swift
//  CafeX
//
//  Created by Alex on 3/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import WatchKit

class LabelCell: NSObject {
    
    @IBOutlet var name: WKInterfaceLabel!
}


class ChooseBreadController: WKInterfaceController {
    
    let items = ["Bean 1","Bean 2","Bean 3","Bean 4",]
    
    @IBOutlet var table: WKInterfaceTable!
    
    func tableRefresh(){
        print(items.count)
        table.setNumberOfRows(items.count, withRowType: "row")
        for (index,item) in items.enumerated()     {
            let row = table.rowController(at: index) as! LabelCell
            row.name.setText(item)
        }
        
    }
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        setTitle(items[rowIndex])
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        tableRefresh()
        // Configure interface objects here.
    }
    
    
    
}
