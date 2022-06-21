//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["a", "b", "c"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Tabeview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        if #available(iOS 14.0, *) {
            // iOS14以降の推奨
            var content = cell.defaultContentConfiguration()
            content.text = itemArray[indexPath.row]
            cell.contentConfiguration = content
        } else {
            // iOS13以前
            cell.textLabel?.text = itemArray[indexPath.row]
        }
        return cell
    }
    
    //MARK: - Tabeleview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "新しい要素を追加します", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "追加", style: .default) { action in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "要素を記入してください"
            textField = alertTextField
        }
        
        present(alert, animated: true)
    }
}
