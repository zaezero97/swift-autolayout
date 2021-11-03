//
//  DiagonalCustomImageView.swift
//  CustomView
//
//  Created by 재영신 on 2021/11/03.
//

import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {

    //대각선으로 잘린 사격형을 그린다.
    //bezierPath
    
    //path -> layer
    //layer -> mask
    
    //내가 만든 커스컴 코드 -> storyboard 편집화면에서 바로 확인 할 수 있도록
    
    @IBInspectable var innerHeight : CGFloat = 0
    
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
        //path.move(to: CGPoint.init(x: 0, y: 0))
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        return path
    }
    func pathToLayer() -> CAShapeLayer{
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    func makeMask(){
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        //super.layoutSubviews()
        makeMask()
    }
}
