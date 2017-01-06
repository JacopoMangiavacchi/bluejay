//
//  BluejayEventsObservable.swift
//  Bluejay
//
//  Created by Jeremy Chiang on 2017-01-03.
//  Copyright © 2017 Steamclock Software. All rights reserved.
//

import Foundation

/**
    A protocol allowing conforming objects registered to Bluejay to optionally respond to Bluetooth connection events.
 
    - Attention
    On initial subscription to Bluetooth events, `bluetoothAvailable(_ available: Bool)` will always be called immediately with whatever the current state is, and `connected(_ peripheral: BluejayPeripheral)` will also be called immediately if a device is already connected.

    - Note
    Available callbacks:
    * `func bluetoothAvailable(_ available: Bool)`
    * `func connected(_ peripheral: BluejayPeripheral)`
    * `func disconected()`
*/
public protocol BluejayEventsObservable: class {
    
    /**
        Called whenever Bluetooth availability changes, as well as when an object first subscribes to observing Bluetooth events.
    */
    func bluetoothAvailable(_ available: Bool)
    func connected(_ peripheral: BluejayPeripheral)
    func disconected()
}

/// Slightly less gross way to make the BluejayEventsObservable protocol's functions optional.
extension BluejayEventsObservable {
    func bluetoothAvailable(_ available: Bool) {}
    func connected(_ peripheral: BluejayPeripheral) {}
    func disconected() {}
}

/// Allows creating weak references to BluejayEventsObservable objects, so that the Bluejay singleton does not prevent the deallocation of those objects.
struct WeakBluejayEventsObservable {
    weak var weakReference: BluejayEventsObservable?
}
