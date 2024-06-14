//
//  AddTaskViewController.swift
//  Todo App Demo
//
//  Created by itad on 13/6/2024.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var txtTaskName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func saveButton(_ sender: Any) {
        print("Saving task ...")
        let task = Task(name: txtTaskName.text ?? "", time: datePicker.date);
        
        let vm = TodoViewModel.sharedInstance;
        vm.addTask(task: task) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
