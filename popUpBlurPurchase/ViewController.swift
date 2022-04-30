//
//  ViewController.swift
//  popUpBlurPurchase
//
//  Created by Tuğberk Can Özen on 30.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var reviewOrderOutlet: UIButton!
    @IBOutlet weak var okButtonOutlet: UIButton!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bulanıklık görünümünün boyutunu genel görünüm boyutuna eşitledik
        blurView.bounds = self.view.bounds
        // PopUp'ı genişliği ekranın %90'ına, yüksekliği de %40'ı olacak şekilde ayarladık.
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.4)
        popUpView.layer.cornerRadius = 5
        reviewOrderOutlet.layer.cornerRadius = 20
        okButtonOutlet.layer.cornerRadius = 20
        imageViewOutlet.layer.cornerRadius = 8
        
    }

    @IBAction func reviewOrderButtonClicked(_ sender: Any) {
        animatedIn(desiredView: blurView)
        animatedIn(desiredView: popUpView)
    }
    @IBAction func okButtonClicked(_ sender: Any) {
        animatedOut(desiredView: popUpView)
        animatedOut(desiredView: blurView)
    }
    
    
    func animatedIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
    }
    
}
    func animatedOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }

}
