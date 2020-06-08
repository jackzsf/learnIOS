//
//  MergeSort.m
//  learnIOS
//
//  Created by saifengzhang on 2020/6/8.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

+ (NSMutableArray *)mergeTwoArr:(NSArray *)arr1 arr2:(NSArray *)arr2
{
    NSMutableArray *result = [NSMutableArray array];
    if ([arr1 count] == 0) {
        return [NSMutableArray arrayWithArray:arr2];
    }
    if ([arr2 count] == 0) {
        return [NSMutableArray arrayWithArray:arr1];
    }
    
    NSInteger leftCount = [arr1 count];
    NSInteger rightCount = [arr2 count];
//    NSInteger totalCount = leftCount + rightCount;
    
    NSInteger i = 0;
    NSInteger j = 0;
    
    NSInteger k = 0;
    
    for (; i < leftCount && j < rightCount; k++) {
        if ([arr1[i] intValue] < [arr2[j] intValue]) {
            result[k] = arr1[i++];
        }else{
            result[k] = arr2[j++];
        }
    }
    
//    NSLog(@"i is %ld,j is %ld,result is %@",i,j,result.jsonStringEncoded);
    
    if (i < leftCount) {
        for (; i < leftCount; i++) {
            result[k] = arr1[i];
        }
    }
    
    if (j < rightCount) {
        for (; j < rightCount; j++) {
            result[k++] = arr2[j];
        }
    }
    
    NSLog(@"\narr1 is %@\narr2 is %@\nresult is %@",arr1.jsonStringEncoded,arr2.jsonStringEncoded,result.jsonStringEncoded);
    
    return result;
}

+ (NSMutableArray *)mergeSortArr:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    if (!array || [array count] == 0) {
        return result;
    }
    
    if (([array count] == 1)) {
        return result;
    }
    NSInteger middle = [array count]/2;
    
    NSMutableArray *leftArr = [NSMutableArray arrayWithArray:[array subarrayWithRange:NSMakeRange(0,middle)]] ;
    NSMutableArray *rightArr = [NSMutableArray arrayWithArray:[array subarrayWithRange:NSMakeRange(middle, [array count]-middle)]];
    
    NSMutableArray *arr1 =  [[self class] mergeSortArr:leftArr];
    NSMutableArray *arr2 = [[self class] mergeSortArr:rightArr];
    
    result = [[self class] mergeTwoArr:arr1 arr2:arr2];
    
    return result;
}

@end
