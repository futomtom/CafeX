//
//  PickerController.swift
//  CafeX
//
//  Created by Alex on 3/13/17.
//  Copyright © 2017 alex. All rights reserved.
//

import WatchKit
import Foundation


class PickerController: WKInterfaceController {

    @IBOutlet var flavor: WKInterfaceLabel!
    @IBOutlet var picker: WKInterfacePicker!
    let itemList: [(String, String)] = [
        ("Item 1", "Red"),
        ("Item 2", "Green"),
        ("Item 3", "Blue")
    ]
  

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        picker.setItems(pickerItems)
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

}
