//
//  TabCollectionCell.swift
//  TabPageViewController
//
//  Created by EndouMari on 2016/02/24.
//  Copyright © 2016年 EndouMari. All rights reserved.
//

import UIKit

class TabCollectionCell: UICollectionViewCell {

    var tabItemButtonPressedBlock: (() -> Void)?
    var option: TabPageOption = TabPageOption() {
        didSet {
            currentBarViewHeightConstraint.constant = option.currentBarHeight
            labelLeftConstraint.constant = option.itemPadding
            labelRightConstraint.constant = option.itemPadding
        }
    }
    var item: String = "" {
        didSet {
            itemLabel.text = item
            itemLabel.invalidateIntrinsicContentSize()
            invalidateIntrinsicContentSize()
        }
    }
    var isCurrent: Bool = false {
        didSet {
            currentBarView.isHidden = !isCurrent
            if isCurrent {
                highlightTitle()
            } else {
                unHighlightTitle()
            }
            currentBarView.backgroundColor = option.currentBarColor
            layoutIfNeeded()
        }
    }

    @IBOutlet fileprivate weak var itemLabel: BorderedLabel!
    @IBOutlet fileprivate weak var currentBarView: UIView!
    @IBOutlet fileprivate weak var currentBarViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var labelLeftConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var labelRightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()

        currentBarView.isHidden = true
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        if item.isEmpty {
            return CGSize.zero
        }

        return intrinsicContentSize
    }

    class func cellIdentifier() -> String {
        return "TabCollectionCell"
    }
}


// MARK: - View

extension TabCollectionCell {
    override var intrinsicContentSize : CGSize {
        var width: CGFloat
        if let tabWidth = option.tabWidth , tabWidth > 0.0 {
            width = tabWidth
        } else {
            width = itemLabel.intrinsicContentSize.width + option.tabMargin * 2
        }
        if option.itemPadding > 0 {
          width += option.tabHeight
        }
        let size = CGSize(width: width, height: option.tabHeight)
        
        return size
    }

    func hideCurrentBarView() {
        currentBarView.isHidden = true
    }

    func showCurrentBarView() {
        currentBarView.isHidden = false
    }

    func highlightTitle() {
        itemLabel.textColor = option.currentColor
      
        itemLabel.borderRadius = option.tabHeight / 2 > option.itemRadius ? option.itemRadius : option.tabHeight / 2
        itemLabel.backgroundColor = option.itemSelectedColor
        itemLabel.font = UIFont.boldSystemFont(ofSize: option.fontSize)
    }

    func unHighlightTitle() {
        itemLabel.textColor = option.defaultColor
        itemLabel.backgroundColor = .clear
        itemLabel.font = UIFont.systemFont(ofSize: option.fontSize)
    }
}


// MARK: - IBAction

extension TabCollectionCell {
    @IBAction fileprivate func tabItemTouchUpInside(_ button: UIButton) {
        tabItemButtonPressedBlock?()
    }
}
