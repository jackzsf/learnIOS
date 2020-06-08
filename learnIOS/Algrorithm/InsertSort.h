//
//  InsertSort.h
//  learnIOS
//
//  Created by saifengzhang on 2020/6/8.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 
 插入排序 时间复杂度是O(n²)
 */

@interface InsertSort : NSObject

+ (NSMutableArray *)insertSort1:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
