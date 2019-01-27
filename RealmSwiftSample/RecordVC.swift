//
//  RecordVC.swift
//  RealmSwiftSample
//
//  Created by 村松龍之介 on 2019/01/26.
//  Copyright © 2019 nerco studio. All rights reserved.
//

import UIKit
import RealmSwift

class RecordVC: UIViewController, RealmPrimaryKeyIncrementerProtocol {

    // MARK: - Properties
    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var memoField: UITextField!
    @IBOutlet weak var recordButton: UIButton!
    
    // MARK: - Actions
    @IBAction func recordSampleData(_ sender: UIButton) {
        let realm = try! Realm()
        let sampleData = createSampleData()
        
        try! realm.write {
            realm.add(sampleData)
        }
        print("Recorded:", sampleData)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAndReturn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        recordButton.isEnabled = false
    }
    
    // MARK: - Private methods
    private func validateSampleInput() -> Bool {
    
        guard let nameText = nameField.text else { return false }
        let isValid = nameText.count > 2
        
        return isValid
    }
    
    private func createSampleData() -> SampleDataModel {
        let sampleData = SampleDataModel()
        
        sampleData.id = newId(model: sampleData)
        sampleData.name = nameField.text!
        sampleData.memo = memoField.text
        sampleData.category = categorySegment.selectedSegmentIndex
        
        return sampleData
    }
}

// MARK: - UITextFieldDelegate
// Note: Connect delegates with a storyboard.
extension RecordVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        recordButton.isEnabled = validateSampleInput()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        recordButton.isEnabled = validateSampleInput()
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == nameField {
            recordButton.isEnabled = false
        }
        return true
    }
}
