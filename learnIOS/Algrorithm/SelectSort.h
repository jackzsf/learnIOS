//
//  SelectSort.h
//  learnIOS
//
//  Created by saifengzhang on 2020/6/5.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
冒泡排序时间复杂度
需要比较1+2+3+...+(n-1) = n*(n)/2,
移动次数,最好为0，最差为n-1，
时间复杂度是比较与交换的总和，所以是O(n²)
*/

@interface SelectSort : NSObject

+ (NSMutableArray *)selectSort1:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
