//
//  AboutWindow.swift
//  birdwatch
//
//  Created by Mike Choi on 7/26/18.
//  Copyright © 2018 Mike JS. Choi. All rights reserved.
//

import Cocoa

class AboutWindow: NSWindowController {

    override var windowNibName: NSNib.Name? {
        return NSNib.Name(rawValue: "AboutWindow")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        window?.makeKeyAndOrderFront(nil)
        window?.center()
        NSApp.activate(ignoringOtherApps: true)
    }
}
