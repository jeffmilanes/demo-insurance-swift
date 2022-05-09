//
//  Spinner.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/9/22.
//

import UIKit

fileprivate var aView : UIView?

extension UIViewController {
    
    func showSpinner() {
        
        aView = UIView(frame: UIScreen.main.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green:  0.5, blue: 0.5 , alpha: 0.5)
        
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        
        aView?.removeFromSuperview()
        aView = nil
    }
    
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actionStyle:[UIAlertAction.Style], actions:[((UIAlertAction) -> Void)?], vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           for (index, title) in actionTitles.enumerated() {
                let action = UIAlertAction(title: title, style: actionStyle[index], handler: actions[index])
                alert.addAction(action)
           }
           vc.present(alert, animated: true, completion: nil)
      }
}
