//
//  searchManager.h
//  trie树
//
//  Created by 郝帅 on 2019/5/18.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface searchManager : NSObject

- (void)insert:(NSString *)word;
- (NSArray *)find:(NSString *)word;
- (void)optimization;

@end

NS_ASSUME_NONNULL_END
