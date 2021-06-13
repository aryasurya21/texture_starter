//
//  PostNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class PostNode: ASCellNode {
    
    private let post: PostModel
    
    private let postHeaderNode: PostHeaderNode
    private let postImageNode: ASImageNode = {
        let postImageNode = ASImageNode()
        postImageNode.style.width = .init(unit: .fraction, value: 1)
        postImageNode.style.height = .init(unit: .points, value: 260)
        postImageNode.contentMode = .scaleAspectFill
        return postImageNode
    }()
    
    private let postInteractionNode: PostInteractionNode
    private let postInformationNode: PostInformationNode
    
    init(post: PostModel) {
        self.post = post
        self.postHeaderNode = PostHeaderNode(post: post)
        self.postImageNode.image = UIImage(named: post.image)
        self.postInteractionNode = PostInteractionNode()
        self.postInformationNode = PostInformationNode(post: post)
        
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 2, justifyContent: .start, alignItems: .stretch, children: [
            self.postHeaderNode,
            self.postImageNode,
            self.postInteractionNode,
            self.postInformationNode
        ])
        
        return ASInsetLayoutSpec(insets: .init(top: 16, left: 8, bottom: 0, right: 8), child: finalStack)
    }
}
