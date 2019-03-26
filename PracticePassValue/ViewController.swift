//
//  ViewController.swift
//  PracticePassValue
//
//  Created by 黃偉勛 Terry on 2019/3/25.
//  Copyright © 2019 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "push" {
            
            guard let pushVC = segue.destination as? PushViewController else { return }
            
            // 1. Property
            
//            pushVC.textFromVC = textField.text
            
            // 2. Delegate
            
//            pushVC.delegate = self
            
            // 3. Closure
            
            pushVC.closure = {
                
                pushVC.pushLabel.text = self.textField.text
                
            }
            
            pushVC.closureBack = {
                
                self.label.text = pushVC.pushTextField.text
                
            }
            
            // 4. KVO
            
            let observation = self.observe(\.textField.text, options: [.initial], changeHandler: { (text, change) in

                pushVC.textFromVC = text.textField.text

            })
            
            // 5. Notification Center
            
//            guard let text = textField.text else { return }
//
//            NotificationCenter.default.addObserver(pushVC, selector: #selector(pushVC.changeFromNotificationCenter(notification:)), name: Notification.Name("textFieldChange"), object: nil)
//
//            NotificationCenter.default.post(name: Notification.Name("textFieldChange"), object: nil, userInfo: [AnyHashable("text"): text])
//
//            NotificationCenter.default.addObserver(self, selector: #selector(changeFromPushVC(notification:)), name: Notification.Name("pushVCTextFieldChange"), object: nil)
            
        } else {
            
            guard let presentVC = segue.destination as? PresentViewController else { return }
            
            // 1. Property
            
//            presentVC.text = textField.text
            
            // 2. Delegate
            
//            presentVC.delegate = self
            
            // 3. Closure

            presentVC.closure = { [weak presentVC] in
                
                guard let presentVC = presentVC else { return }
                
                presentVC.presentLabel.text = self.textField.text

            }

            presentVC.closureBack = { [weak presentVC] in
                
                guard let presentVC = presentVC else { return }
                
                self.label.text = presentVC.presentTextField.text

            }
            
        }
        
    }

    @IBAction func push(_ sender: UIButton) {
        
        performSegue(withIdentifier: "push", sender: nil)
        
    }
    
    @IBAction func present(_ sender: UIButton) {
        
        performSegue(withIdentifier: "present", sender: nil)
        
    }
    
    // 4. KVO
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        guard let text = change?[NSKeyValueChangeKey.oldKey] as? String else { return }

        label.text = text

    }
    
    // 5. Notification Center
    
    @objc func changeFromPushVC(notification: Notification) {
        
        guard let text = notification.userInfo?["pushText"] as? String else { return }
        
        label.text = text
        
    }
    
}
