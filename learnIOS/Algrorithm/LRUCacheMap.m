//
//  LRUCacheMap.m
//  learnIOS
//
//  Created by saifengzhang on 2020/5/25.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "LRUCacheMap.h"


@interface LRUCacheMap ()

@property(nonatomic, assign) NSInteger capacity;
@property(nonatomic, strong) NSMutableDictionary *cacheDict;
@property(nonatomic, strong) NSMutableArray *keys;//通过字典key的数组的位置来表示使用的时序
@end

@implementation LRUCacheMap

- (instancetype)initWithCapacity:(NSInteger)capacity{
    if (self == [super init]) {
        _capacity = capacity;
    }
    
    return self;
}

//将对象存入缓存，如果 anyValue 为 nil，会删除对象
- (void)setValue:(id)value forKey:(NSString *)key{
    if (value == nil) {
//         删除对象
        return;
    }
    
    if ([self.cacheDict.allKeys containsObject:key]) {
        // 当前值已经存在
        [self.keys removeObject:key];
    }else{
        if (self.keys.count == _capacity) {
            // 超出最大值了 删除栈里第一个
            NSString *firstKey = [self.keys firstObject];
            [self.keys removeObject:firstKey];
            [self.cacheDict removeObjectForKey:firstKey];
        }
    }
    [self.cacheDict setValue:value forKey:key];
    [self.keys addObject:key];
}

/// 取对象
- (id)valueForKey:(NSString *)key{
    // 判断是否存在
    if ([self.cacheDict.allKeys containsObject:key]) {
        [self.keys removeObject:key];
        [self.keys addObject:key];
        return [self.cacheDict objectForKey:key];
    }else{
        return nil;
    }
}

/// 删除对象
- (void)removeObjectForKey:(NSString *)key{
    if ([self.cacheDict.allKeys containsObject:key]) {
        [self.keys removeObject:key];
        [self.cacheDict removeObjectForKey:key];
    }else{
        //不存在
    }
}

/// 获取所有的数据
/// @param block 键值对回调
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id _Nonnull, id _Nonnull, BOOL * _Nonnull))block{
    [self.keys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) {
            block(key, [self.cacheDict objectForKey:key],stop);
        }
    }];
}

/// 更新容量大小
- (void)resetCapacity:(NSInteger)capacity{
    _capacity = capacity;
}

- (NSMutableArray *)keys{
    if(_keys == nil){
        _keys = [[NSMutableArray alloc] init];
    }
    return _keys;
}

- (NSMutableDictionary *)cacheDict{
    if(_cacheDict == nil){
        _cacheDict = [[NSMutableDictionary alloc] init];
    }
    return _cacheDict;
}

@end
