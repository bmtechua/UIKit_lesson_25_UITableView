//
//  ViewController.swift
//  UIKit_lesson_25_UITableView
//
//  Created by bmtech on 06.03.2022.
//

import UIKit
//3. add UITableViewDelegate
//8. add UITableDataSource
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    //1.create var tableview
    var myTableView = UITableView()
    //5. add identifier
    let identefier = "myCell"
    //20. add array littyerals
    var arr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        createTable()
    }
    
    //6. create method for table
    func createTable() {
        //2.init var mytableview
         self.myTableView = UITableView(frame: view.bounds, style: .plain)
        //7. init cell (add registr)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identefier)
        
         //4. init mytableview delegate
         self.myTableView.delegate = self
        // 8. init mytableview data source
        self.myTableView.dataSource = self
        
        //9. add autoresizing with masks
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
         //4.1 add method output
         view.addSubview(myTableView)
    }
    
    //MARK: - UITableDataSource
//    //11. add quantity sectionsections
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    //12. add quantity cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //13. about switch case correct number Sections
//        switch section {
//        case 0:
//            return 3
//        case 1:
//            return 5
//        case 2:
//            return 8
//        default:
//            break
//        }
        return arr.count  //0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //14 create cell
        let cell = tableView.dequeueReusableCell(withIdentifier: identefier, for: indexPath)
        
        let number = arr[indexPath.row]
        cell.textLabel?.text = number
//        //15 add output text
//        cell.textLabel?.text = "section - \(indexPath.section), cell - \(indexPath.row)"
//        //18. add accessory (detailButton)
//        cell.accessoryType = .detailButton
        
        //17. add background color cell of sections
//
        
        //16. return cell
        return cell
    }
    
    //MARK: - UITableDelegate
    //10. add height row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    //19. add action from detailButton
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory path=", indexPath)
        
        let ownerCe4ll = tableView.cellForRow(at: indexPath)
        print("Cell title =", ownerCe4ll?.textLabel?.text ?? "nil")
    }


}

