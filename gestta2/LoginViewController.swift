//
//  LoginViewController.swift
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import UIKit
import RSWidgets
import RSStarterKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var labelPass: UILabel!
    @IBOutlet weak var textFieldUser: RSTextField!
    @IBOutlet weak var textFieldPassword: RSTextField!
    @IBOutlet weak var buttonEnter: RSButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCloseKeyboardWhenTapView(on: contentView)
        setupScrollViewConstraints()
        applyLanguage()
        applyStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardNotifications()
        forceKeyboardClose()
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    fileprivate func applyLanguage () {
        // Apply all localized strings
        labelUser.text = StringIdentifier.loginLabelUser.getString()
        labelPass.text = StringIdentifier.loginLabelPassword.getString()
        
        textFieldUser.placeholder = StringIdentifier.loginHintUser.getString()
        textFieldPassword.placeholder = StringIdentifier.loginHintPassword.getString()
        
        buttonEnter.setTitle(StringIdentifier.loginbButtonEnter.getString(), for: .normal)
    }
    
    fileprivate func applyStyle () {
        // Apply color scheme and visual effects
        Style.apply(onFormLabels: [labelUser, labelPass])
        
        Style.apply(onPrimaryButton: buttonEnter)
    }
    
    fileprivate func setupInputValidators() {
        textFieldUser.setEmailValidator()
    }
    
    // MARK: - Keyboard Stuffs
    func setupKeyboardNotifications() {
        let defaultCenter = NotificationCenter.default
        defaultCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        defaultCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeKeyboardNotifications() {
        let defaultCenter = NotificationCenter.default
        defaultCenter.removeObserver(self)
    }
    
    func keyboardWillShow(notification: Notification) {
        // Change scrollview to tableview / collectionview if needed
        keyboardWillShow(notification, scrollView: scrollView, scrollToView: nil)
    }
    
    func keyboardWillHide(notification: Notification) {
        // Change scrollview to tableview / collectionview if needed
        keyboardWillHide(notification, scrollView: scrollView)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    // MARK: - Actions
    @IBAction func performLogin(_ sender: Any) {
        if RSTextField.isValid([textFieldUser, textFieldPassword]) {
                SVProgressHUD.show()
        } else {
            let alertController = UIAlertController(title: "Error", message: "Preencha os campos", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
}

//MARK:  - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    // Implement textfield delegate to jump to another view with next tag value
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextView = textField.focusNextViewByTag(insideView: view) {
             scrollView.scrollToView(nextView)
        }
        
        return false
    }
}


/*
//MARK:  - SegueHandlerType
extension LoginViewController: SegueHandlerType {
    
    // Control all segues
    enum SegueIdentifier: String {
        case <# Segue Identifier #>
    }
    
}
*/
    
//MARK:  - KeyboardProtocol
extension LoginViewController : RSKeyboardHandlerProtocol { }

//MARK: - RSScrollViewConstraintsProtocol
extension LoginViewController : RSScrollViewConstraintsProtocol { }
