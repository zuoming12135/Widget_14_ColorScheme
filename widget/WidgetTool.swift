//
//  WidgetTool.swift
//  widget
//
//  Created by Michael_Zuo on 2021/3/24.
//

import Foundation
import WidgetKit

open class WidgetTool: NSObject {
    //
    @available(iOS 14, *)
    @objc open func refreshWidget () {
        WidgetCenter.shared.reloadTimelines(ofKind: "你的组件kind")
    }
}
