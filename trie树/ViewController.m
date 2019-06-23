//
//  ViewController.m
//  trie树
//
//  Created by 郝帅 on 2019/5/18.
//  Copyright © 2019年 蒲公英. All rights reserved.
//

#import "ViewController.h"
#import "searchManager.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *result1;
@property (nonatomic, strong) NSArray *result2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = 12;
    CGFloat h = 22;
    
    UILabel *lbl0 = [[UILabel alloc] init];
    lbl0.frame = CGRectMake(400 - 60, 50, 132, h);
    lbl0.backgroundColor = [UIColor whiteColor];
    lbl0.text = @"根节点";
    lbl0.textAlignment = NSTextAlignmentCenter;

    UILabel *lbl1 = [[UILabel alloc] init];
    lbl1.frame = CGRectMake(300, 100, w, h);
    lbl1.backgroundColor = [UIColor whiteColor];
    lbl1.text = @"a";
    lbl1.textAlignment = NSTextAlignmentCenter;

    UILabel *lbl2 = [[UILabel alloc] init];
    lbl2.frame = CGRectMake(250, 150, w, h);
    lbl2.backgroundColor = [UIColor whiteColor];
    lbl2.text = @"a";
    lbl2.textAlignment = NSTextAlignmentCenter;

    UILabel *lbl3 = [[UILabel alloc] init];
    lbl3.frame = CGRectMake(300-w*1.5, 150, w*4, h);
    lbl3.backgroundColor = [UIColor whiteColor];
    lbl3.text = @"bcd";
    lbl3.textAlignment = NSTextAlignmentCenter;

    UILabel *lbl4 = [[UILabel alloc] init];
    lbl4.frame = CGRectMake(350, 150, w, h);
    lbl4.backgroundColor = [UIColor whiteColor];
    lbl4.text = @"c";
    lbl4.textAlignment = NSTextAlignmentCenter;

    UILabel *lbl5 = [[UILabel alloc] init];
    lbl5.frame = CGRectMake(300, 200, w, h);
    lbl5.backgroundColor = [UIColor whiteColor];
    lbl5.text = @"c";
    lbl5.textAlignment = NSTextAlignmentCenter;

    UILabel *lbl6 = [[UILabel alloc] init];
    lbl6.frame = CGRectMake(300, 250, w, h);
    lbl6.backgroundColor = [UIColor whiteColor];
    lbl6.text = @"d";
    lbl6.textAlignment = NSTextAlignmentCenter;
    
    UILabel *lbl7 = [[UILabel alloc] init];
    lbl7.frame = CGRectMake(450, 100, w, h);
    lbl7.backgroundColor = [UIColor whiteColor];
    lbl7.text = @"i";
    lbl7.textAlignment = NSTextAlignmentCenter;
    
    UILabel *lbl8 = [[UILabel alloc] init];
    lbl8.frame = CGRectMake(450, 150, w, h);
    lbl8.backgroundColor = [UIColor whiteColor];
    lbl8.text = @"O";
    lbl8.textAlignment = NSTextAlignmentCenter;
    
    UILabel *lbl9 = [[UILabel alloc] init];
    lbl9.frame = CGRectMake(450, 200, w, h);
    lbl9.backgroundColor = [UIColor whiteColor];
    lbl9.text = @"S";
    lbl9.textAlignment = NSTextAlignmentCenter;

    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(lbl1.center.x-0.5, lbl1.center.y, 1, 50);
    view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(lbl7.center.x-0.5, lbl7.center.y, 1, 100);
    view2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view2];


    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:lbl1.center];
    [path1 addLineToPoint:lbl2.center];
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.path = path1.CGPath;
    layer1.strokeColor = [UIColor blackColor].CGColor;
    layer1.fillColor = [UIColor clearColor].CGColor;
    layer1.lineWidth = 1.0f;
    layer1.lineJoin = kCALineJoinRound;

    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:lbl1.center];
    [path2 addLineToPoint:lbl4.center];
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = path2.CGPath;
    layer2.strokeColor = [UIColor blackColor].CGColor;
    layer2.fillColor = [UIColor clearColor].CGColor;
    layer2.lineWidth = 1.0f;
    
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:lbl0.center];
    [path3 addLineToPoint:lbl1.center];
    CAShapeLayer *layer3 = [CAShapeLayer layer];
    layer3.path = path3.CGPath;
    layer3.strokeColor = [UIColor blackColor].CGColor;
    layer3.fillColor = [UIColor clearColor].CGColor;
    layer3.lineWidth = 1.0f;
    
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint:lbl0.center];
    [path4 addLineToPoint:lbl7.center];
    CAShapeLayer *layer4 = [CAShapeLayer layer];
    layer4.path = path4.CGPath;
    layer4.strokeColor = [UIColor blackColor].CGColor;
    layer4.fillColor = [UIColor clearColor].CGColor;
    layer4.lineWidth = 1.0f;

    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer4];

    [self.view addSubview:lbl0];
    [self.view addSubview:lbl1];
    [self.view addSubview:lbl2];
    [self.view addSubview:lbl3];
    [self.view addSubview:lbl4];
//    [self.view addSubview:lbl5];
//    [self.view addSubview:lbl6];
    [self.view addSubview:lbl7];
    [self.view addSubview:lbl8];
    [self.view addSubview:lbl9];
    
    
    
    
    
    
    
    NSString *filePatch = [[NSBundle mainBundle] pathForResource:@"lessonName" ofType:@"plist"];
    NSMutableDictionary *sandBoxDataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:filePatch];
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:sandBoxDataDic[@"name"]];
//    NSMutableArray *arr2 = [NSMutableArray array];
    
//    NSLog(@"开始...1...");
//    for (int i = 0; i < 1000; i++) {
//        [arr2 addObjectsFromArray:arr1];
//    }
//    self.array = arr2;
    
    NSUInteger j = 0;
    NSUInteger min = 1000;
    NSUInteger max = 0;
    for (int i = 0; i < arr1.count; i++) {
        NSString *str = arr1[i];
        j += str.length;
        min = MIN(min, str.length);
        max = MAX(max, str.length);
    }

    
//    16.148049
//    2019-05-19 21:04:46.893443+0800 trie树[10522:406446] 开始....
//    2019-05-19 21:05:03.041492+0800 trie树[10522:406446] 结束....
//    41.086426
//    2019-05-19 21:05:03.084477+0800 trie树[10522:406446] 开始3----------
//    2019-05-19 21:05:44.170903+0800 trie树[10522:406446] 结束3----------
//    3.814531
//    2019-05-19 21:08:43.831729+0800 trie树[10582:409365] 开始3----------
//    2019-05-19 21:08:47.646260+0800 trie树[10582:409365] 结束3----------
//    [self systemFind:arr1];
//    [self trieFind:arr1];
    NSLog(@"");
    
}

- (void)systemFind:(NSArray *)array
{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *str = @"";
    
    NSLog(@"开始....");
    for (int j = 0; j < 100000; j++) {
        for (int i = 0; i < array.count; i++) {
            str = array[i];
            
            if ([str hasPrefix:@"java"] || [str hasPrefix:@"JAVA"] || [str hasPrefix:@"Java"]) {
                [arr addObject:str];
            }
        }
    }
    NSLog(@"结束....");
    
    self.result1 = arr;
}

- (void)trieFind:(NSArray *)array
{
    NSLog(@"开始4----------");
    searchManager *model = [[searchManager alloc] init];
    for (int i = 0; i < array.count; i++) {
        [model insert:array[i]];
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    NSLog(@"开始3----------");
    for (int i = 0; i < 100000; i++) {
        [arr addObjectsFromArray:[model find:@"java"]];
    }
    NSLog(@"结束3----------");
    
    self.result2 = arr;
}



//- (void)trieFind:(NSArray *)array
//{
//    NSLog(@"开始4----------");
//    searchManager *model = [[searchManager alloc] init];
//    for (int i = 0; i < array.count; i++) {
//        [model insert:array[i]];
//    }
//
//    NSLog(@"开始5----------");
//    [model optimization];
//
//    NSMutableArray *arr = [NSMutableArray array];
//    NSLog(@"开始3----------");
//    for (int i = 0; i < 100000; i++) {
//        [arr addObjectsFromArray:[model find:@"java"]];
//    }
//    NSLog(@"结束3----------");
//
//    self.result2 = arr;
//}


@end
