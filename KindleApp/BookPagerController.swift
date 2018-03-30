//
//  BookPagerController.swift
//  KindleApp
//
//  Created by Irma Blanco on 29/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

final class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationItem.title = self.book?.title
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        //setup horizontal scroll and block vertical scroll
        let layout = collectionView?.collectionViewLayout  as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        //snapp the page on to the edges of the screen
        layout?.minimumLineSpacing = 0
        collectionView?.isPagingEnabled = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
    }
    
    @objc func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44  - 20)
    
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
        //We use .item for a collectionview and .row for a table cell
        let page = book?.pages[indexPath.item]
        
        pageCell.textLabel.text = page?.text
        /*
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
        */
        return pageCell
    }
}

