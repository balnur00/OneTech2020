//
//  ViewController.swift
//  MyContacts
//
//  Created by Balnur Sakhybekova on 7/13/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var tableView = UITableView(frame: .zero, style: .plain)
    
    var contactList = [Contact]()
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    let headerLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableHeaderView = headerView
        
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { m in
            m.top.equalToSuperview().offset(12)
            m.left.equalToSuperview().offset(12)
        }
        headerLabel.text = "My Contacts"
        headerLabel.textColor = .white
        headerLabel.font = UIFont(name: "Helvetica-Bold", size: 35)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    @objc func addTapped(){
        let vc = NewContactViewController()
//        let navigationController = UINavigationController(rootViewController: vc)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

