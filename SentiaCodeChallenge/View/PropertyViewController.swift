//
//  PropertyViewController.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//

import UIKit

class PropertyViewController: UIViewController {

    @IBOutlet var propertyIdLabel: UILabel!
    
    var propertyId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        propertyIdLabel.text = propertyId
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
