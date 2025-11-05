//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by Bruno Amazonas Espinace on 18/09/25.
//

import UIKit

class ColorsDetailVC: UIViewController {

    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue

    }
}
