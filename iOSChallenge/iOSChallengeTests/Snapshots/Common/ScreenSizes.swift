//
//  ScreenSizes.swift
//  XcodeGenSampleTests
//
//  Created by Bruno Rodrigues Paschoalino on 07/12/21.
//

import Foundation
import UIKit

enum ScreenSize: String, CaseIterable {
  case iphoneSE
  case iphone6
  case iphoneX
  case iphoneXsMax

  var value: CGRect {
    switch self {
    case .iphoneSE:
      return CGRect(x: 0, y: 0, width: 320, height: 568)
    case .iphone6:
      return CGRect(x: 0, y: 0, width: 414, height: 667)
    case .iphoneX:
      return CGRect(x: 0, y: 0, width: 375, height: 812)
    case .iphoneXsMax:
      return CGRect(x: 0, y: 0, width: 414, height: 896)
    }
  }
}
