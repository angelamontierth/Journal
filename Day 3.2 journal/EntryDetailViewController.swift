//
//  EntryDetailViewController.swift
//  Day 3.2 journal
//
//  Created by Angela Montierth on 2/8/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        self.titleTextField.text = ""
        self.bodyTextView.text = ""
    }
    
    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        
        guard let titleText = titleTextField.text else {
            return
        }
        
        if let unwrappedEntry = entry {
            unwrappedEntry.title = titleText
            unwrappedEntry.bodyText = bodyTextView.text
            unwrappedEntry.timestamp = Date()
            
        } else {
            let newEntry = Entry(title: titleText, bodyText: self.bodyTextView.text)
            EntryController.sharedController.add(entry: newEntry)
            entry = newEntry
        }
        let _ = self.navigationController?.popViewController(animated: true)
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        updateViews()

            
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                
                textField.resignFirstResponder()
                
                return true
            }
            
        }
    private func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    

    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

