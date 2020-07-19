//
//  HistoryViewController.swift
//  MyCalculator
//
//  Created by Balnur Sakhybekova on 7/9/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import SnapKit

class HistoryViewController: UIViewController {
    
    var historyArray: [String] = []
    
    lazy var tableView = UITableView(frame: .zero, style: .plain)
//    lazy var loadButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
//        self.view.addSubview(loadButton)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { m in
//            m.top.equalTo(loadButton.snp.bottom).offset(12)
            m.edges.equalToSuperview()
        }
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
//        loadButton.snp.makeConstraints { m in
//            m.top.equalToSuperview().offset(22)
//            m.left.equalToSuperview().offset(view.frame.size.width/2 - 32)
//        }
//        loadButton.setTitle("Load history", for: .normal)
//        loadButton.addTarget(self, action: #selector(didTapLoad(_ :)), for: .touchUpInside)

    }
    
    @objc
    func didTapLoad(_ sender: UIButton){
//        let vc = ViewController()
//        vc.completionHandler = { text in
//            self.myArray.append(text ?? "")
//        }
        self.tableView.reloadData()
    }
    
}
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(historyArray[indexPath.row])"
        return cell
    }
    
    
}
