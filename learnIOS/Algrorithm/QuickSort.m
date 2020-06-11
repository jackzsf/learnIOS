//
//  QuickSort.m
//  learnIOS
//
//  Created by saifengzhang on 2020/6/10.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "QuickSort.h"
#import "AlgrorithmTools.h"

@implementation QuickSort
+ (NSMutableArray *)quickSort1:(NSArray *)array
{
    NSLog(@"快速排序...array is %@",array.jsonStringEncoded);
    NSMutableArray *result = [NSMutableArray array];
    if (!array || [array count] == 0) {
        return result;
    }
    
    result = [[self class] quickSort1:[NSMutableArray arrayWithArray:array] low:0 high:([array count]-1)];
    return result;
}

+ (NSMutableArray *)quickSort1:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{
    
    if (low < high) {
        NSInteger privot = [[self class] partition:array low:low high:high];
        [[self class] quickSort1:array low:low high:privot-1];
        [[self class] quickSort1:array low:privot+1 high:high];
    }
    
    return array;
}

//选取数组中的一个关键字，将它放到一个位置，是的它左边的值都比它小，右边的值都比它大，这样的关键字叫做枢轴
+ (NSInteger)partition:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{

//    NSLog(@"before array is %@,low is %ld",array.jsonStringEncoded,low);
    if ([array count] == 0 || low == high) {
        return low;
    }
    
    NSInteger pivotkey = [array[low] intValue];
    
    while (low < high) {
        while (low < high && [array[high] intValue] >= pivotkey) {
            high--;
        }
        [AlgrorithmTools swap:array i:low j:high];
        while (low < high && [array[low] intValue] <= pivotkey) {
            low++;
        }
        [AlgrorithmTools swap:array i:low j:high];
    }
    NSLog(@"array is %@,low is %ld,pivotkey is %ld",array.jsonStringEncoded,low,pivotkey);
    return low;
}

@end
