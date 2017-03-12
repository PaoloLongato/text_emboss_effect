//
//  ViewController.swift
//  Emboss
//
//  Created by Paolo Longato on 12/03/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//




import UIKit

class ViewController: UIViewController {
    
    // Play around with these parameters and build for device.
    private let inputText = "Emboss me like a boss"
    private let embossTexture = UIImage(named: "texture1")!
    private let fontSize: CGFloat = 40
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let stringAttributes = [NSFontAttributeName: font,
                                NSForegroundColorAttributeName: UIColor.white]
        let size = imageView.frame.size
        imageView.image = UIImage
            .image(from: inputText, attributes: stringAttributes, size: size)?
            .applyEmboss(shadingImage: embossTexture)
    }

}

