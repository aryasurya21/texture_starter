//
//  PostInformationNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class PostInformationNode: ASDisplayNode {
    
    private let postNameCaptionNode = ASTextNode2()
    private let postLikesCountNode = ASTextNode2()
    
    public init(post: PostModel) {
        self.postNameCaptionNode.attributedText = .init(string: "\(post.userName) \(post.caption)")
        self.postNameCaptionNode.maximumNumberOfLines = 0
        self.postNameCaptionNode.truncationMode = .byWordWrapping
        self.postLikesCountNode.attributedText = .init(string: "\(post.likesCount) likes")
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [
            postLikesCountNode,
            postNameCaptionNode
        ])
    }
}
