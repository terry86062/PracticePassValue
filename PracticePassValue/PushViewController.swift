//
//  PushViewController.swift
//  PracticePassValue
//
//  Created by 黃偉勛 Terry on 2019/3/25.
//  Copyright © 2019 Terry. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    
    @IBOutlet weak var pushTextField: UITextField!
    
    @IBOutlet weak var pushLabel: UILabel!
    
    var textFromVC: String?
    
    var delegate: ViewController?
    
    var closure: (() -> ())?
    
    var closureBack: (() -> ())?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 1. Property
        
//        pushLabel.text = textFromVC
        
        // 2. Delegate
        
//        pushLabel.text = delegate?.textField.text
        
        // 3. Closure
        
        guard let closure = closure else { return }

        closure()
        
        // 5. Notification Center
        
//        pushLabel.text = textFromVC
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        // 1. Property
        
        guard let vc = self.navigationController?.viewControllers[0] as? ViewController else { return }

        vc.label.text = pushTextField.text
        
        // 2. Delegate
        
//        delegate?.label.text = pushTextField.text
        
        // 3. Closure
        
        guard let closureBack = closureBack else { return }

        closureBack()
        
        // 4. KVO
        
        // 5. Notification Center
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // 4. KVO
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        guard let vc = self.navigationController?.viewControllers[0] as? ViewController else { return }

        vc.textField.addObserver(self, forKeyPath: "text", options: [.old], context: nil)

    }

    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)

        guard let vc = self.navigationController?.viewControllers[0] as? ViewController else { return }

        vc.textField.removeObserver(self, forKeyPath: "text")

        pushTextField.addObserver(vc, forKeyPath: "text", options: [.old], context: nil)

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let text = change?[NSKeyValueChangeKey.oldKey] as? String else { return }

        pushLabel.text = text
        
    }
    
    // 5. Notification Center
    
    @objc func changeFromNotificationCenter(notification: Notification) {

        guard let text = notification.userInfo?["text"] as? String else { return }

        textFromVC = text

    }
    
    @IBAction func changeTextField(_ sender: UITextField) {
        
//        guard let text = pushTextField.text else { return }
//
//        NotificationCenter.default.post(name: Notification.Name("pushVCTextFieldChange"), object: nil, userInfo: [AnyHashable("pushText"): text])
        
    }
    
    deinit {
        
        print("Push View Controller is deinit")
        
    }
    
}
