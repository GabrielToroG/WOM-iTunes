//
//  NotificationCenterWrapperImpl.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

public final class NotificationCenterWrapperImpl: NotificationCenterWrapper {
    private let notificationCenter: NotificationCenter

    public init(notificationCenter: NotificationCenter) {
        self.notificationCenter = notificationCenter
    }

    public func post(
        name aName: NSNotification.Name,
        object anObject: Any?) {
        notificationCenter.post(
            name: aName,
            object: anObject
        )
    }

    public func post(
        name aName: NSNotification.Name,
        object anObject: Any?,
        userInfo aUserInfo: [AnyHashable: Any]?
    ) {
        notificationCenter.post(
            name: aName,
            object: anObject,
            userInfo: aUserInfo
        )
    }

    public func addObserver(
        _ observer: Any,
        selector: Selector,
        name: NSNotification.Name?,
        object: Any?
    ) {
        notificationCenter.addObserver(
            observer,
            selector: selector,
            name: name,
            object: object
        )
    }

    public func removeObserver(
        _ observer: Any,
        name: NSNotification.Name?,
        object: Any?
    ) {
        notificationCenter.removeObserver(
            observer,
            name: name,
            object: nil
        )
    }
}
