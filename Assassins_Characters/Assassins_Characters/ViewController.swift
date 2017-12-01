//
//  ViewController.swift
//  Assassins_Characters
//
//  Created by Muhammad Hilmy Fauzi on 26/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelTahun: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelJenis: UILabel!

    
    var passNama:String?
    var passTahun:String?
    var passInfo:String?
    var passJenis:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNama.text = passNama
        labelTahun.text = passTahun
        labelInfo.text = passInfo
        labelJenis.text = passJenis

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

