//
//  ViewController.m
//  BYFileManager
//
//  Created by admin on 2017/11/5.
//  Copyright © 2017年 BY. All rights reserved.
//

/* 前往-》
 Documents: 程序创建或应用浏览产生的文件数据
 Library: 程序的默认设置或状态信息保存该目录 （Caches 和 Preferences）
 tmp: 提供一个即时创建临时文件的地方，但不需要持久化
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

// 获取沙盒的路径
- (NSString *)getHomePath {
    NSString *homePath = NSHomeDirectory(); // 获取沙盒的路径
    NSLog(@"homePath = %@", homePath);
    
    return homePath;
}

// 获取 Documents 路径
- (NSString *)getDocumentsPath {
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [docPaths lastObject];
    NSLog(@"documentsPath = %@", documentsPath);
    
    return documentsPath;
}

// 获取 Library 路径
- (NSString *)getLibraryPath {
    NSArray *libPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libPaths lastObject];
    NSLog(@"libraryPath = %@", libraryPath);
    
    return libraryPath;
}

// 获取 Library 路径
- (NSString *)getTmpPath {
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"tmpPath = %@", tmpPath);
    
    return tmpPath;
}

//
- (void)parsePath {
    NSString *path = @"/data/Containers/Data/Application";
    
    // 获取路径的各个组成部分
    NSArray *array = [path pathComponents];
    NSLog(@"array = %@", array);
    
    // 提取路径的最后一个组成部分
    NSString *name = [path lastPathComponent];
    NSLog(@"name = %@", name);
    
    // 删除最后一个组成部分
    NSString *string = [path stringByDeletingLastPathComponent];
    NSLog(@"string = %@", string);
    
    // 添加最后一个组成部分
    NSString *addString = [path stringByAppendingString:@"name.txt"];
    NSLog(@"addString = %@", addString);
}

// 创建文件夹
- (void)createFolder {
    NSString *docPath = [self getDocumentsPath];
    NSString *testPath = [docPath stringByAppendingString:@"慕课"];
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSError *error;
    // YES 可以覆盖 NO:不可以覆盖
    BOOL ret = [manager createDirectoryAtPath:testPath withIntermediateDirectories:NO attributes:nil error:&error];
    if (ret) {
        NSLog(@"成功");
    } else {
        NSLog(@"失败");
    }
}

- (void)dataChange:(NSData *)data {
    // NSData -> NSString
    NSString *aString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // NSString -> NSData
    NSData *aData = [aString dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
