//
//  searchManager.m
//  trie树
//
//  Created by 郝帅 on 2019/5/18.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "searchManager.h"

@interface searchManager ()

@property (nonatomic, strong) Node *root;

@end

@implementation searchManager

- (instancetype)init
{
    if (self = [super init]) {
        self.root = [[Node alloc] init];
    }
    
    return self;
}

- (void)insert:(NSString *)word
{
    if (word.length == 0) {
        return;
    }
    word = [word lowercaseString];
    
    Node *node = self.root;
    
    int index = 0;
    NSString *str = @"";
    while (index < word.length) {
        str = [word substringWithRange:NSMakeRange(index, 1)];
        
        if (!node.children[str]) {
            [node add:str];
        }
        
        node = node.children[str];
        index++;
    }
    node.isFinish = YES;
}

- (void)optimization
{
    Node *node = self.root;
    
    NSArray *arrKey = node.children.allKeys;
    for (int i = 0; i < arrKey.count; i++) {
        [self optimization:node.children[arrKey[i]]];
    }
}

- (BOOL)optimization:(Node *)node
{
    NSArray *arrKey = node.children.allKeys;
    if (arrKey.count == 0) {
        return YES;
    }
    for (int i = 0; i < arrKey.count; i++) {
        Node *n = node.children[arrKey[i]];
        if ([self optimization:n]) {
            if (n.children.count == 0 && arrKey.count == 1 && !node.isFinish) {
                Node *n2 = [node.children.allValues lastObject];
                node.character = [NSString stringWithFormat:@"%@%@", node.character, n2.character];
                node.children = nil;
                return YES;
            }
        }
    }
    
    return NO;
}

- (NSArray *)find:(NSString *)word
{
    if (word.length == 0) {
        return @[];
    }
    word = [word lowercaseString];
    
    Node *node = self.root;
    
    int index = 0;
    NSString *str = @"";
    while (index < word.length) {
        str = [word substringWithRange:NSMakeRange(index, 1)];
        
        if (node.children[str]) {
            node = node.children[str];
            index++;
        } else {
            break;
        }
    }
    
    if (index == word.length) {
        NSMutableArray *arr = [NSMutableArray array];
        [self addAllData:node arr:arr];
        return arr;
    }
    return @[];
}

- (void)addAllData:(Node *)node arr:(NSMutableArray *)arr
{
    if (node.isFinish) {
        [arr addObject:[NSString stringWithFormat:@"%@%@", node.string, node.character]];
    }
    
    NSArray *arrKey = node.children.allKeys;
    
    for (int i = 0; i < arrKey.count; i++) {
        Node *n = node.children[arrKey[i]];
        
        if (n.children.count > 0) {
            [self addAllData:n arr:arr];
        } else {
            [arr addObject:[NSString stringWithFormat:@"%@%@", n.string, n.character]];
        }
    }
}

@end
