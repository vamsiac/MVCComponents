//
//  FRCTableViewDataSource.swift
//  MVCComponents
//
//  Created by Vamsi Anguluru on 09/05/2017.
//  Copyright © 2017 Vamsi Anguluru. All rights reserved.
//

import UIKit
import CoreData

class FRCTableViewDataSource<CellType, R>: FRCDataSource<CellType, R>, UITableViewDataSource where CellType: UITableViewCell, R: NSFetchRequestResult {
    
    var editingCell: ((UITableView, UITableViewCellEditingStyle, IndexPath)-> ())?
    var canEditRow: Bool = true

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier)!
        self.configureCell(cell as! CellType, indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.editingCell?(tableView, editingStyle, indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRow
    }

}
