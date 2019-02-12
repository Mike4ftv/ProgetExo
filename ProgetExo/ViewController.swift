//
//  ViewController.swift
//  ProgetExo
//
//  Created by BAPTISTE UCCHEDDU on 12/02/2019.
//  Copyright © 2019 BAPTISTE UCCHEDDU. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

      
      
      //Outlets

      @IBOutlet weak var ui_progTableView: UITableView!

      
      //Variables
      
      let _manager = Manager()
      var _selectedProg:String?
      
      
      
      //Functions
      
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return _manager.getProgNumber()
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "modele1", for: indexPath)
            if let prog = _manager.getProgList() {
                  cell.textLabel?.text = prog[indexPath.row]
            }
            return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            _selectedProg = _manager.obtainProgWithIndex(index: indexPath.row)
            performSegue(withIdentifier: "seguetoDetail", sender: Any?.self)
      }
      

      
      @IBAction func returnHome(segue:UIStoryboardSegue) {
            
      }
      
      
      override func viewWillAppear(_ animated: Bool) {
            ui_progTableView.reloadData()
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "seguetoDetail" {
                  if let progEnCOurs = _selectedProg, let prochainEcran = segue.destination as? ExoViewController {
                        prochainEcran._progToDisplay = progEnCOurs
                  }
            }
      }
      
      
      override func viewDidLoad() {
            super.viewDidLoad()
          ui_progTableView.delegate = self
            ui_progTableView.dataSource = self
      }


}

