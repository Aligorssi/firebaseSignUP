//
//  SignUpVC.swift
//  firebase
//
//  Created by Muhammad Ali on 22/07/2019.
//

import UIKit
import FirebaseAuth

class SignUpVC: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtInputText: UITextField!
    
    var userDefault: UserDefaults?
    let signupCheckKey = "signupCheckKey"
    let verificatioIDKey = "verificationID"
    
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorView.Style.gray)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        if btnSignUp.titleLabel?.text == "Verify"{
            if txtInputText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                self.showAlert(title: "Error", msg: "Please enter the 4 digit code you received.")
            }else{
                guard let optCode = txtInputText.text else { return }
                guard let verificationID = userDefault?.string(forKey: self.verificatioIDKey) else { return }
                
                let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: optCode)
                
                Auth.auth().signInAndRetrieveData(with: credentials) { (success, error) in
                    if error == nil{
                        print("signed in")
                        
                        self.userDefault?.set(true, forKey: self.signupCheckKey)
                        self.myActivityIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }else{
                        self.myActivityIndicator.stopAnimating()
                        self.showAlert(title: "Error", msg: "Something went wrong.\nPlease try again.")
                    }
                }
            }
        }else{
            if txtInputText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                self.showAlert(title: "Error", msg: "Please enter full phone number.")
            }else{
                activityIndicator()
                PhoneAuthProvider.provider().verifyPhoneNumber(txtInputText.text!, uiDelegate: nil) { (verificationID, error) in
                    if error == nil{
                        
                        print("registered")
                        
                        self.txtInputText.text = ""
                        self.txtInputText.placeholder = "Enter Code"
                        self.btnSignUp.titleLabel?.text = "Verify"
                        self.myActivityIndicator.stopAnimating()
                        self.userDefault?.set(verificationID, forKey: self.verificatioIDKey)
                    }else{
                        print("Failed")
                        self.myActivityIndicator.stopAnimating()
                        self.showAlert(title: "Error", msg: "Something went wrong.\nPlease try again.")
                    }
                }
            }
        }
    }
    
    func showAlert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func activityIndicator() {
        myActivityIndicator.center = view.center
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
