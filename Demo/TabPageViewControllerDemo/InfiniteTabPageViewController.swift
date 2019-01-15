//
//  InfiniteTabPageViewController.swift
//  TabPageViewController
//
//  Created by Tomoya Hayakawa on 2017/08/05.
//
//

import UIKit
import TabPageViewController

class InfiniteTabPageViewController: TabPageViewController {
    
    override init() {
        super.init()
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor(red: 251/255, green: 252/255, blue: 149/255, alpha: 1.0)
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor(red: 252/255, green: 150/255, blue: 149/255, alpha: 1.0)
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor(red: 149/255, green: 218/255, blue: 252/255, alpha: 1.0)
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor(red: 149/255, green: 252/255, blue: 197/255, alpha: 1.0)
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor(red: 252/255, green: 182/255, blue: 106/255, alpha: 1.0)
        tabItems = [(vc1, "Mon."), (vc2, "ランキング"), (vc3, "ライフスタイル"), (vc4, "1"), (vc5, "22")]
        isInfinity = true
        option.currentColor = .white
        option.tabMargin = 20.0
      option.tabHeight = 50
        option.itemRadius = 15.0
        option.itemPadding = 15.0
        option.itemSelectedColor = UIColor(red: 246/255, green: 175/255, blue: 32/255, alpha: 1.0)
        option.currentBarColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
