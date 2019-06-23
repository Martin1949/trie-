//
//  Node.m
//  trie树
//
//  Created by 郝帅 on 2019/5/18.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (Node *)initWithValue:(NSString *)str parent:(Node *)node
{
    Node *n = [[Node alloc] init];
    n.character = str;
    n.string = [NSString stringWithFormat:@"%@%@", node.string, node.character];
    return n;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.children = [NSMutableDictionary dictionary];
        self.character = @"";
        self.string = @"";
    }
    
    return self;
}

- (void)add:(NSString *)str
{
    if (!self.children[str]) {
        self.children[str] = [Node initWithValue:str parent:self];
    }
}

@end
