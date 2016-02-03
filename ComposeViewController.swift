//
//  ComposeViewController.swift
//  ToDoList
//
//  Created by Davis Gossage on 2/1/16.
//  Copyright © 2016 Davis Gossage. All rights reserved.
//

import UIKit

protocol ComposeDelegate {
    func userSavedItem(item: ToDoItem)
}

class ComposeViewController: UIViewController {
    
    var delegate: ComposeDelegate?
    
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonTapped() {
        let newItem = ToDoItem()
        newItem.itemDescription = textField.text
        delegate?.userSavedItem(newItem)
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
