//
//  ViewController.swift
//  Task
//
//  Created by Balnur Sakhybekova on 7/8/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    var redButton: UIButton!
    var yellowButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setup()
    }
    
    private func setup(){
        redView.backgroundColor = .red
        
        mainView.addSubview(redView)
        mainView.addSubview(yellowView)
        mainView.addSubview(blueView)
        
        redView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(100)
            make.bottom.equalToSuperview().offset(100)
        }
        redView.backgroundColor = .red
        
        
    }

}

