//
//  DisplayTableVC.swift
//  RealmSwiftSample
//
//  Created by 村松龍之介 on 2019/01/26.
//  Copyright © 2019 nerco studio. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayTableVC: UITableViewController {

    // MARK: - Properties
    var sampleDataResults: Results<SampleDataModel>?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        sampleDataResults = realm.objects(SampleDataModel.self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleDataResults?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ID of Cell set by the Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleDataCell", for: indexPath)

        guard let sampleDate = sampleDataResults?[indexPath.row] else { return cell }

        cell.textLabel?.text = sampleDate.name
        cell.detailTextLabel?.text = sampleDate.memo
        
        // Change the background-color by Category
        switch SampleDataCategory(rawValue: sampleDate.category)! {
        case .life:
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        case .work:
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
