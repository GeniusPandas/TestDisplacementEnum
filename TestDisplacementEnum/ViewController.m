//
//  ViewController.m
//  TestDisplacementEnum
//
//  Created by 云龙 on 2022/5/7.
//

#import "ViewController.h"

// 因为"位运算"的计算方式是将二进制转换成十进制,也就是说,枚举值里面存取的是计算后的十进制值.
typedef NS_OPTIONS(NSUInteger, DirectionType) {
    DirectionTypeUp = 1 << 0,   // 十进制1
    DirectionTypeLeft = 1 << 1, // 十进制2
    DirectionTypeDown = 1 << 2, // 十进制4
    DirectionTypeRight = 1 << 3,// 十进制8
};
 
@interface ViewController ()
 
@end
 
@implementation ViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demoTest:DirectionTypeUp | DirectionTypeLeft | DirectionTypeRight];
    [self demoTest:DirectionTypeUp];
    [self demoTest:DirectionTypeLeft];
    [self demoTest:DirectionTypeRight];
    [self demoTest:DirectionTypeDown];
    /*
     DirectionTypeUp    表示 0001
     DirectionTypeLeft  表示 0010
     DirectionTypeRight 表示 1000
     
     按位或之后变成 1011 （十进制表示 11）
     */
}
 
- (void)demoTest:(DirectionType)options{
    
    NSLog(@"options : %lu", options);
    
    /*
     因为这里options 表示 1011 ，然后进行按位与
     */
    if (options & DirectionTypeUp) { // 1011 & 0001 按位与为 0001
        NSLog(@"向上");
    }
    if (options & DirectionTypeLeft) { // 1011 & 0010 按位与为 0010
        NSLog(@"向左");
    }
    if (options & DirectionTypeDown) { // 1011 & 0100 按位与为 0000
        NSLog(@"向下");
    }
    if (options & DirectionTypeRight) { // 1011 & 1000 按位与为 1000
        NSLog(@"向右");
    }
    
    /*
     所以最后打印： 向上 向左 向右
     */
}
 
@end
