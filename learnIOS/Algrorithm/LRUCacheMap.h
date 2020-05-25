//
//  LRUCacheMap.h
//  learnIOS
//
//  Created by saifengzhang on 2020/5/25.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRUCacheMap : NSDictionary

- (instancetype)initWithCapacity:(NSInteger)capacity;

@end

NS_ASSUME_NONNULL_END
