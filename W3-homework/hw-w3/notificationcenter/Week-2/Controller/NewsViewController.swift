//
//  NewsViewController.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class NewsViewController: UIViewController {

    var news = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let news1 = NewsModel(image: #imageLiteral(resourceName: "photo-3"), title: "Patika iOS Bootcamp", detail: "iOS Bootcamp Detail")
        let news2 = NewsModel(image: #imageLiteral(resourceName: "photo-1"), title: "Yemek sepeti iOS Bootcamp", detail: "Yemek sepeti sponsorluğunda devam eden iOS eğitimleri...")
        
        let news3 = NewsModel(image: #imageLiteral(resourceName: "photo-2"), title: "Yemek sepeti & Patika", detail: "Yemek sepeti ve Patika.dev işbirliğinde eğitim imkanı...")
        
        let news4 = NewsModel(image: #imageLiteral(resourceName: "photo-4"), title: "İşe Alım İlanı", detail: "Yemek sepeti işe alımlar yapıyor...")
        
        news = [news1, news2, news3, news4]
        
    }
    
}

extension NewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.configure(news: news[indexPath.row])
        
        return cell
        
    }
    
    
}
