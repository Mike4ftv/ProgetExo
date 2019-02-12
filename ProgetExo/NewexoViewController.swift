//
//  NewexoViewController.swift
//  ProgetExo
//
//  Created by BAPTISTE UCCHEDDU on 12/02/2019.
//  Copyright © 2019 BAPTISTE UCCHEDDU. All rights reserved.
//

import UIKit

class NewexoViewController: UIViewController {

      
      
      
      @IBOutlet weak var ui_newExoTextField: UITextField!
      
      
      let _manager = Manager()
      var progToUpload:String?
      
      
      @IBAction func saveNewExoButton(_ sender: UIButton) {
            
            if let name = ui_newExoTextField.text, name.count > 0 {
                  _manager.createNewExo(progName: progToUpload!, exoName: name)
            }
            
            
            
      }
      
      
      
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
