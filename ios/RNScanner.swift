//
//  RNScanner.swift
//  reactnativenativeiosscanner
//
//  Created by Pushpender Singh on 26/09/23.
//

import Foundation
import VisionKit
import React
import UIKit

@objcMembers class RNScanner: NSObject, DataScannerViewControllerDelegate {
  
  let viewController  = DataScannerViewController(
    recognizedDataTypes:[
      .barcode()
    ],
    qualityLevel: .fast,
    recognizesMultipleItems: false,
    isHighFrameRateTrackingEnabled: false,
    isHighlightingEnabled: true
    )
  
  var scannerAvailable: Bool  {
    DataScannerViewController.isSupported &&
    DataScannerViewController.isAvailable
  }
  
  func scan(){
    viewController.delegate = self
    let controller = RCTPresentedViewController()
    controller?.present(viewController, animated: true) {
      try? self.viewController.startScanning()
    }
  }
  
  func dataScanner(_  dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
    for item in allItems {
      switch item {
      case .barcode(let barcode):
        dataScanner.stopScanning()
        dataScanner.dismiss(animated: true)
        EventEmitter.shared().sendEvent(withName: "reactnativenativeiosscanner", body: "\(barcode.payloadStringValue ?? "Unknown")")
      default:
        print("unexpected item")
      }
    }
  }
}
