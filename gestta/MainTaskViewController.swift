//
//  MainTaskViewController.swift
//  gestta
//
//  Created by Marcus Costa on 26/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import UIKit
import RSWidgets
import RSStarterKit

class MainTaskViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    fileprivate var tasks: [String] = {
        var task = [String]()
        
        for index in 0..<5000 {
            task.append("Task \(index)")
        }
        
        return task
    }()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCloseKeyboardWhenTapView()
        applyLanguage()
        applyStyle()
        
        setupTableView()
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    fileprivate func applyLanguage () {
        // Apply all localized strings
    }
    
    fileprivate func applyStyle () {
        // Apply color scheme and visual effects
    }
    
    fileprivate func setupTableView() {
        tableView.registerNib(NibIdentifier.taskCell.getNib(), forCellReuseIdentifier: TableViewCellIdentifier.taskCell)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        
        tableView.addSubview(refreshControl)
    }
    
    @objc fileprivate func loadData() {
        print("Chamar servico")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    /*
    // MARK: - Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
     */
    
}

/*
//MARK:  - SegueHandlerType
extension MainTaskViewController: SegueHandlerType {
    
    enum SegueIdentifier: String {
        case <# Segue Identifier #>
    }
    
}
*/

// MARK: - UITableViewDataSource
extension MainTaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifier.taskCell, forIndexPath: indexPath) as! TaskCell
        
        cell.setupTask(taskName: tasks[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
}

// MARK: - TaskCellDelegate
extension MainTaskViewController: TaskCellDelegate {
    
    func taskCell(cell: TaskCell, didSelectIconForItem item: String) {
        print("Tap Icon on item: \(item)")
    }
    
}

// MARK: - UITableViewDelegate
extension MainTaskViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected task: \(tasks[indexPath.row])")
    }
    
}
















