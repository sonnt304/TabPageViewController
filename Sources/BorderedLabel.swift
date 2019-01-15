//
//  BorderedLabel.swift
//  TabPageViewController
//
//  Created by Nguyen Thanh Son on 1/15/19.
//

import UIKit

class BorderedLabel: UILabel {
  @IBInspectable var borderRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable var borderPixelWidth: CGFloat {
    get {
      return self.layer.borderWidth * UIScreen.main.scale
    }
    set {
      self.layer.borderWidth = newValue / UIScreen.main.scale
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      return UIColor(cgColor: layer.borderColor!)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
}
