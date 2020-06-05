//
//  LRUCacheMap.h
//  learnIOS
//
//  Created by saifengzhang on 2020/5/25.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
LRU是Least Recently Used
的缩写，意思是最近最少使用的数据，也就是最近使用的数据在未来的一段时间内任然被使用，已经使用很久的数据在未来的一段时间内任然不会变使用。基于这个理念我们可以在内存中保留常用的数据！

就是我们定义一个指定容量的list，每次新加的数据我们都会放在list的最上面，每次访问的数据也会被放在list的最上面，要是加入的数据超出最大容量，删除list的最后一个！
*/

NS_ASSUME_NONNULL_BEGIN

@interface LRUCacheMap : NSDictionary

- (instancetype)initWithCapacity:(NSInteger)capacity;

@end

NS_ASSUME_NONNULL_END
