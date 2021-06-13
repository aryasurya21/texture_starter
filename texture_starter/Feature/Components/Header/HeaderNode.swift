//
//  HeaderNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class HeaderNode: ASDisplayNode {
    
    private let titleNode: ASTextNode2 = {
        let titleNode = ASTextNode2()
        titleNode.attributedText = .init(string: "TextureIG")
        return titleNode
    }()
    
    private let heartNode: ASImageNode = {
        let heartNode = ASImageNode()
        heartNode.image = UIImage(named: "heart")
        heartNode.style.preferredSize = .init(width: 20, height: 20)
        return heartNode
    }()
    
    private let messengerNode: ASImageNode = {
        let messengerNode = ASImageNode()
        messengerNode.image = UIImage(named: "messenger")
        messengerNode.style.preferredSize = .init(width: 20, height: 20)
        return messengerNode
    }()
    
    public override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let buttonStack = ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [
            self.heartNode,
            self.messengerNode
        ])
        
        let finalStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [
            titleNode,
            buttonStack
        ])
        
        return finalStack
    }
}
