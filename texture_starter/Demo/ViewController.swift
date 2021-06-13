//
//  ViewController.swift
//  texture_starter
//
//  Created by arya.surya on 12/06/21.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASDKViewController<ASDisplayNode> {

    private let rootNode: ASDisplayNode = {
        let rootNode = ASDisplayNode()
        rootNode.backgroundColor = .purple
        rootNode.automaticallyManagesSubnodes = true
        return rootNode
    }()
    
    private let redNode: ASDisplayNode = {
        let redNode = ASDisplayNode()
        redNode.backgroundColor = .red
        redNode.style.preferredSize = .init(width: 100, height: 100)
        return redNode
    }()
    
    private let blueNode: ASDisplayNode = {
        let blueNode = ASDisplayNode()
        blueNode.backgroundColor = .blue
        blueNode.style.preferredSize = .init(width: 100, height: 100)
        return blueNode
    }()
    
    private let greenNode: ASDisplayNode = {
        let greenNode = ASDisplayNode()
        greenNode.backgroundColor = .green
        greenNode.style.preferredSize = .init(width: 100, height: 100)
        return greenNode
    }()
    
    override init() {
        super.init(node: rootNode)
        rootNode.layoutSpecBlock = { [weak self] _, _ -> ASLayoutSpec in
            guard let self = self else { return .init() }
//            return ASWrapperLayoutSpec(layoutElement: self.redNode)
//            let redNodeWithInset = ASInsetLayoutSpec(insets: .init(top: 8, left: 8, bottom: 8, right: 24), child: self.redNode)
//            let overlayedNodewithGreenNode = ASOverlayLayoutSpec(child: self.redNode, overlay: self.greenNode)
//            let insetedRedNode = ASInsetLayoutSpec(insets: .init(top: 8, left: 8, bottom: 8, right: 8), child: self.redNode)
//
//            let backgroundInsetedNode = ASBackgroundLayoutSpec(child: insetedRedNode, background: self.greenNode)
            
//            return ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .center, alignItems: .center, children: [
//                backgroundInsetedNode,
//                self.blueNode
//            ])
            
//            let centeredNode = ASCenterLayoutSpec(centeringOptions: .Y, sizingOptions: .minimumXY, child: self.blueNode)
//
//            return centeredNode
            
//            let relativePositionedNode = ASRelativeLayoutSpec(horizontalPosition: .center, verticalPosition: .end, sizingOption: .minimumSize, child: self.blueNode)
//
            let absolutedPositionedNode = ASAbsoluteLayoutSpec(sizing: .sizeToFit, children: [
                self.blueNode
            ])
            absolutedPositionedNode.style.layoutPosition.y = 10
            return absolutedPositionedNode
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

