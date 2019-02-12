//
//  ExoViewController.swift
//  ProgetExo
//
//  Created by BAPTISTE UCCHEDDU on 12/02/2019.
//  Copyright © 2019 BAPTISTE UCCHEDDU. All rights reserved.
//

import UIKit
import RealmSwift

class ExoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      
      
      
      @IBOutlet weak var ui_exoTableView: UITableView!
      
      
      let _manager = Manager()
      var _progToDisplay : String?
      
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var number:Int = 0
            if let prog = _progToDisplay {
                  number =  (_manager.getExoList(progName: prog)?.count)!
                  return number
            }
            return number
      }
      
      
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "modele2", for: indexPath)
            if let exo = _manager.getExoList(progName: _progToDisplay!) {
                  cell.textLabel?.text = exo[indexPath.row]
            }
            return cell
      }
      
      
      
    
      
      
      

    override func viewDidLoad() {
        super.viewDidLoad()
      ui_exoTableView.delegate = self
      ui_exoTableView.dataSource = self
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
