//
//  SVGImage.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//


import SwiftUI
import SVGKit

struct SVGKFastImageViewSUI:UIViewRepresentable
{
    @Binding var url:URL
    @Binding var size:CGSize
    
    func makeUIView(context: Context) -> SVGKFastImageView {
       
       // let url = url
      //  let data = try? Data(contentsOf: url)
        let svgImage = SVGKImage(contentsOf: url)
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
        
    }
    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.image = SVGKImage(contentsOf: url)
        
        uiView.image.size = size
    }
    
    
}

struct SVGImage_Previews: PreviewProvider {
    static var previews: some View {
        SVGKFastImageViewSUI(url: .constant(URL(string:"https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg")!), size: .constant(CGSize(width: 100, height: 100)))
    }
}
