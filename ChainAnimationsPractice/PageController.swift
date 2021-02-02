//
//  PageController.swift
//  ChainAnimationsPractice
//
//  Created by Viktor Varsano on 2.02.21.
//

import UIKit

class PageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let pages = [
        Page(title: "Welcome", body: "🚀 Hello and thank you so much for downloading our brand new app! We hope you enjoy it and give us a nice review on the AppStore! 🚀"),
        Page(title: "Mission Statement", body: "🐝 In our company, no stone is left unturned when looking for the best solutions ⭐️ \n\n"),
        Page(title: "Leave us a message", body: "Don't forget to give us feedback on what you would like to see in the future! 🍯🍯🍯 \n\n\n\n Contact:\n viktor_varsano@hotmail.com"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        collectionView?.isPagingEnabled = true
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        setupPageControl()
    }
    
    let pageControl = UIPageControl()
    fileprivate func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .lightGray
        view.addSubview(pageControl)
        pageControl.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 50))
    }
    
    func scrollToNext() {
        guard let currentCell = collectionView?.visibleCells.first else { return }
        guard let index = collectionView?.indexPath(for: currentCell)?.item else { return }
        
        if index < pages.count - 1 {
            let nextIndexPath = IndexPath(item: index + 1, section: 0)
            collectionView?.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index + 1
        }
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let index = x / view.frame.width
        pageControl.currentPage = Int(index)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        cell.parentController = self
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
    
    
    
}
