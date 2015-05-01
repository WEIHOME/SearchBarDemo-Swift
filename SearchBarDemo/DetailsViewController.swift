//
//  DetailsViewController.swift
//  SearchBarDemo
//
//  Created by Weihong Chen on 01/05/2015.
//  Copyright (c) 2015 Weihong. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    var pushedData: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textAlignment = NSTextAlignment.Center
        label.text = pushedData

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
