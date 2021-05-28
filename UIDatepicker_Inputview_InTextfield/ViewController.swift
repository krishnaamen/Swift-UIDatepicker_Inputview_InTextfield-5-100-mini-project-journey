//
//  ViewController.swift
//  UIDatepicker_Inputview_InTextfield
//
//  Created by Macbook on 28/05/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTxt.delegate = self
        
    }


}
extension ViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
}

extension ViewController {
    
    func openDatePicker(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        
        myTxt.inputView = datePicker
        
        
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelBtn,flexibleBtn,doneBtn], animated: false)
        myTxt.inputAccessoryView = toolbar
    }

    @objc
    func cancelBtnClick(){
        myTxt.resignFirstResponder()
        
    }
    @objc
    func doneBtnClick(){
        if let datePicker = myTxt.inputView as? UIDatePicker{
            print(datePicker.date)
        }
        myTxt.resignFirstResponder()
    }}
