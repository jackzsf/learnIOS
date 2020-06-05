//
//  BubbleSort.h
//  learnIOS
//
//  Created by saifengzhang on 2020/6/5.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BubbleSort : NSObject

/**
 冒泡排序时间复杂度
 本身有序的话，n-1次比较，时间复杂度是O(n)
 最坏的逆序情况，需要比较1+2+3+...+(n-1) = n*(n)/2, 移动次数也那么多，时间复杂度是O(n²)
 */

+ (NSMutableArray *)bubbleSort1:(NSArray *)array;
+ (NSMutableArray *)bubbleSort2:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
