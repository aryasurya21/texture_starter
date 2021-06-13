//
//  PostTableNode.swift
//  texture_starter
//
//  Created by arya.surya on 13/06/21.
//

import Foundation
import AsyncDisplayKit

public final class PostTableNode: ASTableNode {
    
    private let posts: [PostModel]
    init(posts: [PostModel]) {
        self.posts = posts
        super.init(style: .plain)
        self.delegate = self
        self.dataSource = self
        self.style.width = .init(unit: .fraction, value: 1)
        self.style.flexGrow = 1
    }
    
    public override func didLoad() {
        super.didLoad()
        self.view.separatorStyle = .none
    }
}

extension PostTableNode: ASTableDelegate, ASTableDataSource {
    public func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    public func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let postData = self.posts[indexPath.row]
        return {
            PostNode(post: postData)
        }
    }
}
