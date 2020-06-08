//
//  ViewController.m
//  learnIOS
//
//  Created by saifengzhang on 2020/5/25.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "ViewController.h"
#import "LRUCacheMap.h"
#import "BubbleSort.h"
#import "SelectSort.h"
#import "InsertSort.h"
#import "MergeSort.h"

@interface ViewController ()

@property(nonatomic, strong) LRUCacheMap *lruCacheMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self lRUCacheMapTest];
    [self sortTest];
}

#pragma mark ****************************** LRUCacheMap
- (void)lRUCacheMapTest{
    NSLog(@"lRUCacheMapTest 1234567...");
    
    for (int i = 1; i <=5; i++){
        NSString *key = [NSString stringWithFormat:@"%d",i];
        NSString *value = [NSString stringWithFormat:@"%d",i*100];
        
        [self.lruCacheMap setValue:value forKey:key];
    }
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
    
    NSLog(@"-------------");
    
    [self.lruCacheMap setValue:@"600" forKey:@"6"];
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
    
    NSLog(@"-------------");
    
    NSLog(@"%@",[self.lruCacheMap valueForKey:@"5"]);
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
    
    NSLog(@"-------------");
    
    NSLog(@"%@",[self.lruCacheMap valueForKey:@"4"]);
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
}

- (LRUCacheMap *)lruCacheMap{
    if (_lruCacheMap == nil) {
        _lruCacheMap = [[LRUCacheMap alloc] initWithCapacity:5];
    }
    
    return _lruCacheMap;
}

- (void)sortTest{
    NSArray *array = @[@3,@5,@2,@4,@8,@7,@1];
    NSArray *array1 = @[@1,@3,@4,@5,@7,@9];
    NSArray *array2 = @[@2,@6,@8,@10,@12,@14];
//    NSLog(@"origin array is %@",[array jsonStringEncoded]);
    
//    array = [self bubbleSortTest:array];
//    array = [self selectSortTest:array];
//    array = [self insertSortTest:array];
    array = [self mergeSortTest:array1 array2:array2];
    NSLog(@"result array is %@",[array jsonStringEncoded]);
}

#pragma mark ****************************** BubbleSort

- (NSArray *)bubbleSortTest:(NSArray *)array
{
    array = [BubbleSort bubbleSort2:array];
    return array;
}

- (NSArray *)selectSortTest:(NSArray *)array
{
    array = [SelectSort selectSort1:array];
    
    return array;
}

- (NSArray *)insertSortTest:(NSArray *)array
{
    array = [InsertSort insertSort1:array];
    
    return array;
}

- (NSArray *)mergeSortTest:(NSArray *)array1 array2:(NSArray *)array2
{
    NSMutableArray *array = [MergeSort mergeTwoArr:array1 arr2:array2];
    
    return [NSArray arrayWithArray:array];
}



@end
