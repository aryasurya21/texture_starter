//
//  PostHeaderNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class PostHeaderNode: ASDisplayNode {
    
    private let post: PostModel
    
    private lazy var userNameNode: ASTextNode2 = {
        let userNameNode = ASTextNode2()
        userNameNode.attributedText = .init(string: post.userName)
        return userNameNode
    }()
    
    private lazy var userAvatarNode: ASImageNode = {
        let userAvatarNode = ASImageNode()
        userAvatarNode.image = UIImage(named: post.userAvatar)
        userAvatarNode.style.preferredSize = .init(width: 20, height: 20)
        userAvatarNode.onDidLoad {
            $0.layer.cornerRadius = 10
        }
        return userAvatarNode
    }()
    
    private let threeDotsImageNode: ASImageNode = {
        let threeDotsImageNode = ASImageNode()
        threeDotsImageNode.image = UIImage(named: "threedot")
        threeDotsImageNode.style.preferredSize = .init(width: 20, height: 20)
        return threeDotsImageNode
    }()
    
    private var userLocationNode: ASTextNode2?
    
    init(post: PostModel) {
        self.post = post
        super.init()
        
        if let location = post.location {
            self.userLocationNode = ASTextNode2()
            self.userLocationNode?.attributedText = .init(string: location)
        }
        self.automaticallyManagesSubnodes = true
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var userNameLocationStack = ASLayoutSpec()
        if let locationNode = userLocationNode {
            userNameLocationStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [
                self.userNameNode,
                locationNode
            ])
        } else {
            userNameLocationStack = ASWrapperLayoutSpec(layoutElement: self.userNameNode)
        }
        
        let leftStack = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            userAvatarNode,
            userNameLocationStack
        ])
        
        return ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .spaceBetween, alignItems: .center, children: [
            leftStack,
            threeDotsImageNode
        ])
    }
}
