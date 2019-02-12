//
//  progrETexo.swift
//  ProgetExo
//
//  Created by BAPTISTE UCCHEDDU on 12/02/2019.
//  Copyright © 2019 BAPTISTE UCCHEDDU. All rights reserved.
//

import Foundation
import RealmSwift

class Progetexo:Object {
      @objc dynamic var _programmeName:String = ""
      @objc dynamic var _exoName:String = ""
      @objc dynamic var _onlyProgrammeNameWithoutExo:String = "yes"
      
}

class Manager {
      
      let _realm:Realm
      let _progetexoList:Results<Progetexo>
      
      init() {
            _realm = try! Realm()
            _progetexoList = _realm.objects(Progetexo.self)
      }
      
      func getProgNumber() -> Int {
            let onlyProg = _progetexoList.filter("_onlyProgrammeNameWithoutExo = 'yes'")
            return onlyProg.count
      }
      
      func getProgList() -> [String]? {
            var progList:[String] = []
            let progOnlyList = _progetexoList.filter("_onlyProgrammeNameWithoutExo = 'yes'")
            for Progetexo in progOnlyList {
                  progList.append(Progetexo._programmeName)
            }
            
            return progList
            
      }
      
      func getExoList(progName:String) -> [String]? {
            var exoList:[String] = []
            let list = _progetexoList.filter("_onlyProgrammeNameWithoutExo = 'no' AND _programmeName = '\(progName)'")
            for Progetexo in list {
                  exoList.append(Progetexo._exoName)
            }
            
            return exoList
            
      }
      
      
      
      func createNewProgramme(progName:String) {
            let p1 = Progetexo()
            p1._programmeName = progName
            p1._onlyProgrammeNameWithoutExo = "yes"
            try? _realm.write {
                  _realm.add(p1)
            }
      }
      
      func createNewExo(progName:String, exoName:String) {
            let p1 = Progetexo()
            p1._onlyProgrammeNameWithoutExo = "no"
            p1._programmeName = progName
            p1._exoName = exoName
            try? _realm.write {
                  _realm.add(p1)
            }
      }
     
      func obtainProgWithIndex(index:Int) -> String? {
            
            var progList = getProgList()
            if let prog = progList?[index] {
            return prog
            }
            return nil
      }
      
      
      
}


