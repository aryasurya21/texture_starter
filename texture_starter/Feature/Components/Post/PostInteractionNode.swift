//
//  PostInteractionNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class PostInteractionNode: ASDisplayNode {
    
    private let heartImageNode: ASImageNode = {
        let heartImageNode = ASImageNode()
        heartImageNode.image = UIImage(named: "heart")
        heartImageNode.style.preferredSize = .init(width: 20, height: 20)
        return heartImageNode
    }()
    
    private let messengerImageNode: ASImageNode = {
        let messengerImageNode = ASImageNode()
        messengerImageNode.image = UIImage(named: "messenger")
        messengerImageNode.style.preferredSize = .init(width: 20, height: 20)
        return messengerImageNode
    }()
    
    private let dmImageNode: ASImageNode = {
        let dmImageNode = ASImageNode()
        dmImageNode.image = UIImage(named: "dm")
        dmImageNode.style.preferredSize = .init(width: 20, height: 20)
        return dmImageNode
    }()
    
    private let saveImageNode: ASImageNode = {
        let saveImageNode = ASImageNode()
        saveImageNode.image = UIImage(named: "saved")
        saveImageNode.style.preferredSize = .init(width: 20, height: 20)
        return saveImageNode
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let leftStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            heartImageNode,
            messengerImageNode,
            dmImageNode
        ])
        
        let finalStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [
            leftStack,
            saveImageNode
        ])
        
        return ASInsetLayoutSpec(insets: .init(top: 2, left: 8, bottom: 4, right: 8), child: finalStack)
    }
}
