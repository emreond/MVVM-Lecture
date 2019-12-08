//
//  ViewController.swift
//  Too Mvvm
//
//  Created by Emre on 7.12.2019.
//  Copyright © 2019 Emre. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    private let tableView = UITableView()
    private let cellID = "taskListTableViewCell"
    private let headerView = UIView()
    
    private let viewModel = MainViewControllerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "My Tasks"
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.blue
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        //TableView AutoLayout Constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc private func rightButtonAction(_ sender: UIBarButtonItem) {
        print("emre")
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: {
            viewModel.addModel(title: textField.text)
        }))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter text:"
        })
        self.present(alert, animated: true, completion: nil)
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListTableViewCell
        cell.data = viewModel.getModel(at: indexPath.row)
        return cell
    }
}
