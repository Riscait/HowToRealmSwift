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

        guard let sampleData = sampleDataResults?[indexPath.row] else { return cell }

        cell.textLabel?.text = sampleData.name
        cell.detailTextLabel?.text = sampleData.memo
        
        // Change the background-color by Category
        switch SampleDataCategory(rawValue: sampleData.category)! {
        case .life:
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        case .work:
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
        
        return cell
    }
}
