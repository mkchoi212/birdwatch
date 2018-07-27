//
//  StatusMenuController.swift
//  birdwatch
//
//  Created by Mike Choi on 7/26/18.
//  Copyright © 2018 Mike JS. Choi. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    let popover = NSPopover()
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let button = statusItem.button {
            button.target = self
            button.image = NSImage(named: NSImage.Name("bird"))
            button.action = #selector(self.statusBarButtonClicked(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        popover.contentViewController = TweetViewController.freshController()
    }
    
    @objc func statusBarButtonClicked(sender: NSStatusBarButton) {
        guard let event = NSApp.currentEvent else { fatalError("No click event detected") }
        
        if event.type == NSEvent.EventType.rightMouseUp {
            closePopover(sender: nil)
            
            statusItem.menu = statusMenu
            statusItem.popUpMenu(statusMenu)
            statusItem.menu = nil
        } else {
            togglePopover(sender: nil)
        }
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
    }
}

extension StatusMenuController {
    
    @IBAction func aboutPressed(_ sender: Any) {
        let aboutWindow = AboutWindow()
        aboutWindow.showWindow(nil)
    }
    
    @IBAction func preferencesPressed(_ sender: Any) {
        let preferenceWindow = PreferenceWindow()
        preferenceWindow.showWindow(nil)
    }
    
    @IBAction func donatePressed(_ sender: Any) {
        guard let url = URL(string: "https://buymeacoff.ee/deadbeef") else { fatalError("Invalid BMC link") }
        NSWorkspace.shared.open(url)
    }
    
    @IBAction func quitPressed(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
}
