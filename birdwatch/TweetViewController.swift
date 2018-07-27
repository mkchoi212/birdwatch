//
//  TweetViewController.swift
//  birdwatch
//
//  Created by Mike Choi on 7/27/18.
//  Copyright © 2018 Mike JS. Choi. All rights reserved.
//

import Cocoa

class TweetViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TweetViewController {
    
    static func freshController() -> TweetViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "TweetViewController")
        
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TweetViewController else {
            fatalError("Can't find TweetViewController from Main.storyboard")
        }
        
        return viewcontroller
    }
}
