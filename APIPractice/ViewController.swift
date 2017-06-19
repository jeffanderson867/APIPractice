//
//  ViewController.swift
//  APIPractice
//
//  Created by Big J on 6/16/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myNetworkController = NetworkController()

    override func viewDidLoad() {
        super.viewDidLoad()
        var apodObject:APOD = APOD(json: [:])
        myNetworkController.fetchAPOD { (myAPOD) in
            apodObject = myAPOD
        }
        //end goal to make sure it works



        print(apodObject.description)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

