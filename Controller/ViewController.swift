//
//  ViewController.swift
//  youtobe
//
//  Created by Azamat on 08.11.2021.
//

import UIKit

class HomeController: UIViewController {
    
    var videos: [Video] = {
        var kanyeChannel = Channel()
        kanyeChannel.name = "KanyeIsTheBestChannel"
        kanyeChannel.profileImageName = "kanye_profile"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swft - Blank Space"
        blankSpaceVideo.thumbnailImageName = "maxresdefault"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 1815344444
        
        var badBlodVideo = Video()
        badBlodVideo.title = "Taylor Swift - Bad Blod featuring Kendrick Lamar"
        badBlodVideo.thumbnailImageName = "taylor-swift-bad-blod"
        badBlodVideo.channel = kanyeChannel
        badBlodVideo.numberOfViews = 25123212443
        
        return [blankSpaceVideo, badBlodVideo]
    }()
    
    

    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    func fetchVideos(){
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtobeassets/home.json")
        NSURLSessionTransferSizeUnknown.shared().dataTask(with: url!) {
            (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(str)
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.barTintColor = .red
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width  - 32, height: view.frame.height))

        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel

        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupUI()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "option")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func handleMore() {
        
    }
    
    @objc func handleSearch() {
        print(123)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupUI(){
        [menuBar, collectionView].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        })
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: view.topAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 50),
            menuBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            menuBar.rightAnchor.constraint(equalTo: view.rightAnchor),

            collectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as!VideoCell
        
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, minimumLineSpacingForSectionAt: Int) -> CGFloat{
        
        return 0
    }
}
