//
//  ViewController.swift
//  hw_pagecontrol
//
//  Created by Abdullah Coban on 8.07.2021.
//

//MARK: PageControl ekleyerek bir onboarding ekranı yapınız..

import UIKit

class PageViewController: UIViewController {

    var controllers = [UIViewController]()
    
    var pageControl = UIPageControl()
    var currentlyShowingIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        controllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        controllers.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .yellow
        controllers.append(vc3)
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .green
        controllers.append(vc4)
        
        configurePageControl()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.pageVC()
    }
    
    func pageVC() {
        guard let first = controllers.first else { return }
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        present(vc, animated: true, completion: nil)
    }
    
    func configurePageControl() {
           
            pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
            self.pageControl.numberOfPages = controllers.count
            self.pageControl.currentPage = 0
            self.pageControl.tintColor = UIColor.black
            self.pageControl.currentPageIndicatorTintColor = UIColor.green
              //        self.pageControl.defersCurrentPageDisplay = false     // This has no effect
            self.view.addSubview(pageControl)
        }

}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil }
        
        let prev = index - 1
        
        return controllers[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil }
        
        let next = index + 1
        
        return controllers[next]
    }
    
    func viewController(at index: Int) -> UIViewController {
        return controllers[index]
    }
       
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentlyShowingIndex
        
    }
       
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    
}

