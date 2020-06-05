//
//  ViewController.m
//  learnIOS
//
//  Created by saifengzhang on 2020/5/25.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "ViewController.h"
#import "LRUCacheMap.h"

@interface ViewController ()

@property(nonatomic, strong) LRUCacheMap *lruCacheMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self lRUCacheMapTest];
    [self bubbleSortTest];
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

#pragma mark ****************************** BubbleSort1

- (void)bubbleSortTest
{
    NSArray *array = @[@3,@5,@2,@4,@8,@7,@1];
    NSLog(@"origin array is %@",[array jsonStringEncoded]);
    array = [self bubbleSort1:array];
    
    NSLog(@"result array is %@",[array jsonStringEncoded]);
}

- (NSMutableArray *)bubbleSort1:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    if (!array || [array count] == 0) {
        return result;
    }
    
    for (int i = 0; i < [array count]; i++) {
        for (int j = i+1; j < [array count]; j++) {
            if ([result[i] intValue] > [result[j] intValue]) {
                result = [self swap:result i:i j:j];
//                NSLog(@"temp array is %@,i is %d,j is %d",[result jsonStringEncoded],i,j);
            }
        }
    }
    return result;
}

- (NSMutableArray *)swap:(NSMutableArray *)array i:(NSInteger)i j:(NSInteger)j
{
    if (!array || [array count] == 0 || i >= [array count] || j >= [array count]) {
        return array;
    }
    
    id tempValue = array[i];
    array[i] = array[j];
    array[j] = tempValue;
    
    return array;
}


@end
