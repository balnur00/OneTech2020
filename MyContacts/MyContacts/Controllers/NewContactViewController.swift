//
//  NewContactViewController.swift
//  MyContacts
//
//  Created by Balnur Sakhybekova on 7/13/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    
    lazy var newContactView: NewContactView = {
        let view = NewContactView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        view.backgroundColor = .white
        view = newContactView
        newContactView.setup()
        
    }
    
}
