//
//  PresentViewController.swift
//  PracticePassValue
//
//  Created by 黃偉勛 Terry on 2019/3/25.
//  Copyright © 2019 Terry. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
    
    @IBOutlet weak var presentTextField: UITextField!
    
    @IBOutlet weak var presentLabel: UILabel!
    
    var text: String?
    
    var delegate: ViewController?
    
    var closure: (() -> ())?
    
    var closureBack: (() -> ())?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 1. Property
        
//        presentLabel.text = text
        
        // 2. Delegate
        
//        presentLabel.text = delegate?.textField.text
        
        // 3. Closure
        
        guard let closure = closure else { return }

        closure()

    }
    
    @IBAction func back(_ sender: UIButton) {
        
        // 1. Property
        
//        guard let nc = self.presentingViewController as? UINavigationController else { return }
//
//        guard let vc = nc.viewControllers[0] as? ViewController else { return }
//
//        vc.label.text = presentTextField.text
        
        // 2. Delegate
        
//        delegate?.label.text = presentTextField.text
        
        // 3. Closure
        
        guard let closureBack = closureBack else { return }

        closureBack()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    deinit {
        
        print("Present View Controller is deinit")
        
    }
    
}
