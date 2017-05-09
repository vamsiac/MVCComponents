//
//  FRCCollectionViewDataSource.swift
//  MVCComponents
//
//  Created by Vamsi Anguluru on 09/05/2017.
//  Copyright © 2017 Vamsi Anguluru. All rights reserved.
//

import UIKit
import CoreData

class FRCCollectionViewDataSource<CellType, R>: FRCDataSource<CellType, R>, UICollectionViewDataSource where CellType: UICollectionViewCell, R: NSFetchRequestResult {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath)
        self.configureCell(cell as! CellType, indexPath)
        
        return cell
    }
}

