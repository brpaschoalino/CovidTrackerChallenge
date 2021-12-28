//
//  main.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 30/11/21.
//

import UIKit

// Check if it's an unit test
let isUnitTest = NSClassFromString("XCTest") != nil

// Mock the app delegate if it's an unit test
let appDelegateClass = isUnitTest ? nil : NSStringFromClass(AppDelegate.self)

let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)
