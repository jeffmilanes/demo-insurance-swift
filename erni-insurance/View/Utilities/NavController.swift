//
//  NavController.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit


class NavigationController: UINavigationController {

    override func viewDidLoad() {

        super.viewDidLoad()

        navigationBar.barTintColor = UIColor.systemBackground
        navigationBar.tintColor = AppColor.Theme
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label,
                                             NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 16.0)!]
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label,
                                                  NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 32.0)!]
        navigationBar.shadowImage = UIImage()
    }

   override var preferredStatusBarStyle: UIStatusBarStyle {

        return .default
    }
}
