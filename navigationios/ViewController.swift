//
//  ViewController.swift
//  navigationios
//
//  Created by My Mac on 08/11/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SendDataDelegate {
  
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textFieldView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldView.layer.cornerRadius = 20
        
        // hide keyboard when tap outsided
        let tapGesture = UITapGestureRecognizer(
            target: view,
            action: #selector(UIView.endEditing)
        )
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        nameTextField.delegate = self
    }
    
    // hide keyboard when return button clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    // custom delegate function
    // bring data from second view controller
    func passData(_ text: String) {
        nameTextField.text = text
    }

    @IBAction func continueBtn(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        guard let x = nameTextField.text else {
            return
        }
        vc.x = x
        vc.delegate = self
        self.navigationController?.pushViewController(
            vc, animated: true
        )
    }
}

