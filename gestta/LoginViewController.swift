//
//  LoginViewController.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import UIKit
import RSWidgets
import RSStarterKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var labelPass: UILabel!
    
    @IBOutlet weak var textFieldUser: RSTextField!
    @IBOutlet weak var textFieldPass: RSTextField!
    
    @IBOutlet weak var buttonEnter: RSButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    fileprivate lazy var loginManager = LoginManager()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCloseKeyboardWhenTapView(on: contentView)
        setupScrollViewConstraints()
        applyLanguage()
        applyStyle()
        
        setupInputValidators()
        
        textFieldUser.text = "markuscosta@gestta.com.br"
        textFieldPass.text = "123456aS"
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
        labelUser.text = StringIdentifier.loginLabelUser.getString()
        labelPass.text = StringIdentifier.loginLabelPass.getString()
        
        textFieldUser.placeholder = StringIdentifier.loginHintUser.getString()
        textFieldPass.placeholder = StringIdentifier.loginHintPass.getString()
        
        buttonEnter.setTitle(StringIdentifier.loginButtonEnter.getString(), for: .normal)
    }
    
    fileprivate func applyStyle () {
        Style.apply(onFormLabels: [labelUser,
                                   labelPass])
        
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
    @IBAction func performLogin() {
        if RSTextField.isValid([textFieldUser,
                                textFieldPass]) {
            SVProgressHUD.show()
            loginManager.performLogin(email: textFieldUser.text!, password: textFieldPass.text!, success: onLoginSuccess, failure: onLoginFailure)
        }
        else {
            let alertController = UIAlertController(title: "Error", message: "Preencha os campos corretamente", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
}

// MARK: - Login Callbacks
extension LoginViewController {
    
    fileprivate func onLoginSuccess(user: User) {
        print("\(user)")
        SVProgressHUD.dismiss()
        
        performSegueWithIdentifier(.mainViewController, sender: self)
    }
    
    fileprivate func onLoginFailure(error: RSError) {
        print("\(error)")
        SVProgressHUD.dismiss()
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

//MARK:  - SegueHandlerType
extension LoginViewController: SegueHandlerType {
    
    // Control all segues
    enum SegueIdentifier: String {
        case mainViewController
    }
    
}

//MARK:  - KeyboardProtocol
extension LoginViewController : RSKeyboardHandlerProtocol { }

//MARK: - RSScrollViewConstraintsProtocol
extension LoginViewController : RSScrollViewConstraintsProtocol { }

