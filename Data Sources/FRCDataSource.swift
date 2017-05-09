//
//  FRCDataSource.swift
//  MVCComponents
//
//  Created by Vamsi Anguluru on 09/05/2017.
//  Copyright © 2017 Vamsi Anguluru. All rights reserved.
//

import UIKit
import CoreData

class FRCDataSource<CellType, R: NSFetchRequestResult>: NSObject {
    
    unowned let fetchedResultsController: NSFetchedResultsController<R>
    var configureCell: (CellType, IndexPath)-> ()
    var reuseIdentifier: String
    
    // Return all the Activity(Task) objects in the Provided managed Object Context
    // - parameter fetchController: view controller's NSFetchedResultsController instance
    // - parameter reuseIdentifier: cell reuseidentifier
    // - parameter configureBlock: completion block with cellType and indexpath.
    init(fetchController: NSFetchedResultsController<R>, reuseIdentifier: String, configureBlock: @escaping (CellType, IndexPath)-> ()) {
        self.fetchedResultsController = fetchController 
        self.reuseIdentifier = reuseIdentifier
        self.configureCell = configureBlock
        
        super.init()
    }
}
