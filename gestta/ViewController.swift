//
//  ViewController.swift
//  gestta
//
//  Created by Weslley Neri on 06/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldUser: MyTextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.backItem?.title = "Login"
        labelName.text = String(identifier: StringIdentifier.loginLabelName)
        labelName.backgroundColor = UIColor.gtBlue
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notification: Notification) {
        print("Vai Abrir")
    }
    
    func keyboardWillHide(notification: Notification) {
        print("Vai Fechar")
    }
    
    func closeKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func performLogin(_ sender: UIButton) {
        print("button pressed");
    }

    @IBAction func goToforgot(_ sender: Any) {
        performSegue(withIdentifier: "forgotViewController", sender: self)
    }
}
//MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFieldUser:
            textFieldPass.becomeFirstResponder()
            
        case textFieldPass:
            textFieldPass.resignFirstResponder()
            
        default:
            break
        }
        
        return false
    }
}

