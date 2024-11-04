//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Mike Collier on 10/22/24.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    var emoji: Emoji?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var symbolTextField: UITextField!
    init?(coder: NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji {
            nameTextField.text =  emoji.name
            usageTextField.text = emoji.usage
            descriptionTextField.text = emoji.description
            symbolTextField.text = emoji.symbol
            title = "Edit Emoji"
        } else {
            title = "Add Emoji"
        }
        
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !usageText.isEmpty && !descriptionText.isEmpty
    }
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "save" else { return }
        
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        emoji = Emoji(symbol: symbolText, name: nameText, description: descriptionText, usage: usageText)
    }
}
