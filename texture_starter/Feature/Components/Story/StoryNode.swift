//
//  StoryNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class StoryNode: ASCellNode {
    
    private let story: StoryModel
    
    private lazy var userAvatarNode: ASImageNode = {
        let userAvatarNode = ASImageNode()
        userAvatarNode.image = UIImage(named: story.userAvatar)
        userAvatarNode.style.preferredSize = .init(width: 60, height: 60)
        userAvatarNode.onDidLoad {
            $0.layer.cornerRadius = 30
        }
        return userAvatarNode
    }()
    
    private let userNameNode: ASTextNode2 = {
        let userNameNode = ASTextNode2()
        userNameNode.maximumNumberOfLines = 1
        userNameNode.truncationMode = .byTruncatingTail
        userNameNode.style.maxWidth = ASDimensionMake(56)
        return userNameNode
    }()
    
    public init(story: StoryModel) {
        self.story = story
        self.userNameNode.attributedText = .init(string: story.userName)
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .center, children: [
            userAvatarNode,
            userNameNode
        ])
        
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 16, bottom: 0, right: 0), child: finalStack)
    }
}
