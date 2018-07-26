//
//  NSWindowExtensions.swift
//  birdwatch
//
//  Created by Mike Choi on 7/26/18.
//  Copyright © 2018 Mike JS. Choi. All rights reserved.
//

import Cocoa

extension NSWindow {
    public func setFrameOriginToPositionWindowInCenterOfScreen() {
        if let screenSize = screen?.frame.size {
            setFrameOrigin(NSPoint(x: (screenSize.width-frame.size.width)/2, y: (screenSize.height-frame.size.height)/2))
        }
    }
}
