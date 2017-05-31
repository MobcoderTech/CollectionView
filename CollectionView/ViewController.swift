//
//  ViewController.swift
//  CollectionView
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    let collectionArray = ["1","2","3","4","5","6","7","8","9","10"]
    let reuseIdentifier = "cellIdentifier"
    let sectionInsets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 40.0, right: 20.0)
    let itemsPerRow: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    //1
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //2
     func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }

    //3
     func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
        // Configure the cell
        let imageV = cell.contentView.viewWithTag(10) as! UIImageView
        imageV.image = UIImage(named :collectionArray[indexPath.row])
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let image = UIImage(named :collectionArray[indexPath.row])

        var availableWidth = image?.size.width

        if(availableWidth! > collectionView.frame.size.width){
            availableWidth = collectionView.frame.size.width
        }

        return CGSize(width: availableWidth!, height: (image?.size.height)!)
    }

    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

