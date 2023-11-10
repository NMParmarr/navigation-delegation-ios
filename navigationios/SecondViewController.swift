//
//  SecondViewController.swift
//  navigationios
//
//  Created by My Mac on 08/11/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var secondTextView: UIView!
    var x : String?
    var delegate: SendDataDelegate? = nil
 
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTextView.layer.cornerRadius = 20
        secondTextField.text = x
        
        // custom back button on navigation bar
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(
            title: "Back",
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(SecondViewController.back(sender:)))
            self.navigationItem.leftBarButtonItem = newBackButton
    }
    @objc func back(sender: UIBarButtonItem) {
        self.delegate?.passData(secondTextField.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.delegate?.passData(secondTextField.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
}

