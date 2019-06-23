//
//  Node.h
//  trie树
//
//  Created by 郝帅 on 2019/5/18.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property (nonatomic, copy) NSString *string;
@property (nonatomic, copy) NSString *character;
@property (nonatomic, assign) BOOL isFinish;
@property (nonatomic, strong, nullable) NSMutableDictionary *children;

- (void)add:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
