//
//  Extensions.swift
//  Emboss
//
//  Created by Paolo Longato on 12/03/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import UIKit


/// Emboss effect to any UIImage.
/// NOTE: the output image will only be backed by a CIImage and NOT a CGImage.
extension UIImage {
    func applyEmboss(shadingImage: UIImage) -> UIImage {
        // Create filters
        guard let heightMapFilter = CIFilter(name: "CIHeightFieldFromMask") else { return self }
        guard let shadedMaterialFilter = CIFilter(name: "CIShadedMaterial") else { return self }
        // Filters chain
        heightMapFilter.setValue(CIImage(image: self),
                                 forKey: kCIInputImageKey)
        guard let heightMapFilterOutput = heightMapFilter.outputImage else { return self }
        shadedMaterialFilter.setValue(heightMapFilterOutput,
                                      forKey: kCIInputImageKey)
        shadedMaterialFilter.setValue(CIImage(image: shadingImage),
                                      forKey: "inputShadingImage")
        // Catch output
        guard let filteredImage = shadedMaterialFilter.outputImage else { return self }
        return UIImage(ciImage: filteredImage)
    }
}


/// This function makes an image out of a string with attributes. Pass attributes and the rectangle where you want the string to be rendered.
extension UIImage {
    class func image(from string: String, attributes: [String: Any]?, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        string.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
