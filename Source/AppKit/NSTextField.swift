//
//  NSTextField.swift
//  Rex
//
//  Created by Yury Lapitsky on 7/8/15.
//  Copyright (c) 2015 Neil Pankey. All rights reserved.
//

import ReactiveCocoa
import AppKit
import enum Result.NoError

extension NSTextField {
    /// Sends the field's string value whenever it changes.
    public var rex_textSignal: SignalProducer<String, NoError> {
        return NSNotificationCenter.defaultCenter()
            .rac_notifications(NSControlTextDidChangeNotification, object: self)
            .map { notification in
                (notification.object as! NSTextField).stringValue
            }
    }
}
