//
//  JoFirstViewController.swift
//  PracticePassValue
//
//  Created by 徐若芸 on 2019/3/26.
//  Copyright © 2019 Terry. All rights reserved.
//

import UIKit

//class FirstInput: NSObject {
//    @objc dynamic var firstInput: String
//
//    init(firstInput: String) {
//        self.firstInput = firstInput
//    }
//}
//
//class SecondInput: NSObject {
//    @objc dynamic var secondInput: String
//
//    init(secondInput: String) {
//        self.secondInput = secondInput
//    }
//}

class JoFirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let fromSecond = Notification.Name(rawValue: secondVCNotificationKey)
    
    var inputObservationToken: NSKeyValueObservation?
    var toSecondLabel = ""
    @objc dynamic var inputText: String?
    
    
    @IBAction func toSecondPage(_ sender: UIButton) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "JoStoryboard", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "JoSecondViewController") as! JoSecondViewController
        
        // Property
        desVC.loadViewIfNeeded()
        //        desVC.label.text = textField.text
        
        // Notification
        //        desVC.createObserver()
        //        var dict: Dictionary<String, AnyObject> = Dictionary()
        guard let firstInput = textField.text else { return }
        //        dict.updateValue("\(firstInput)" as AnyObject, forKey: "FIRST")
        //        let name = Notification.Name(rawValue: firstVCNotificationKey)
        //        NotificationCenter.default.post(name: name, object: nil, userInfo: dict)
        
        
        // KVO
        inputText = textField.text
        desVC.label.text = toSecondLabel
        //        let firstInputKVO = FirstInput(firstInput: firstInput)
        //        desVC.firstInputObservationToken = firstInputKVO.observe(\.firstInput, options: .new, changeHandler: { (input, change) in
        //            guard let updatedInput = change.newValue else { return }
        //            desVC.label.text = updatedInput
        //        })
        
        //        guard let secondInput = desVC.textField.text else { return }
        
        
        
        // Delegate
        //        desVC.delegate = self
        
        // Closure
        //        desVC.onSave = onSave
        
        
        self.navigationController?.pushViewController(desVC, animated: true)
        
    }
    
    
    // Closure
    //    func onSave(_ data: String) -> () {
    //        label.text = data
    //    }
    
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(true)
    //
    //        inputObservationToken = input.observe(\.first, options: .new, changeHandler: { (input, change) in
    //            guard let updatedInput = change.newValue as? String else { return }
    //            print(updatedInput)
    //        })
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification
        //        createObserver()
        
        //        // KVO
        
        inputObservationToken = observe(\.inputText , options: .new) { (vc, change) in
            guard let updatedInputText = change.newValue as? String else { return }
            //            vc.label.text = updatedInputText
            self.toSecondLabel = updatedInputText
        }
        
    }
    
    // Notification
    //    func createObserver() {
    //        NotificationCenter.default.addObserver(self, selector: #selector(notifPassValue(notification:)), name: fromSecond, object: nil)
    //    }
    //
    //    @objc func notifPassValue(notification: NSNotification) {
    //        print("notification fired")
    //        let userInfo = notification.userInfo as! Dictionary<String, AnyObject>
    //
    //        if let input = userInfo["SECOND"] as? String {
    //            self.label.text = input
    //        }
    //
    //    }
    

}

//extension ViewController: LabelValueDelegate {
//
//    // Delegate
//    func passValue(didGet input: String) {
//        label.text = input
//    }
//
//}




