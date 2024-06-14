//
//  ViewController.swift
//  Todo App Demo
//
//  Created by itad on 12/6/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton (_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        navigationController?.pushViewController(vc, animated: true);
    }
    
    let vm = TodoViewModel.sharedInstance;

//    // An array of task
//    var data : [Task] = [
//        Task(name: "Task 1", time: Date()),
//        Task(name: "Task 2", time: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    override func viewDidAppear(_ animated: Bool) {
            vm.loadTask {
            tableView.reloadData();
        }
    }

    // numberOfRowsInSection function is require for UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tasks.count;
    }
    
    // cell required
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        
        let data = vm.tasks[indexPath.row];
        
        cell.textLabel?.text = data.name;
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss";
        let timeString = dateFormatter.string(from: data.time);
        cell.detailTextLabel?.text = timeString;
        return cell;
    }
}

