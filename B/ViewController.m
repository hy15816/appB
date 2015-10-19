//
//  ViewController.m
//  B
//
//  Created by AEF-RD-1 on 15/10/19.
//  Copyright (c) 2015年 hyIm. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backApp;
- (IBAction)backAppAction:(UIBarButtonItem *)sender;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(acceptFromAnotherAppName:) name:@"acceptName" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSDate *d = [Utils dateString:@"2015-10-19 10:30:30:100" formate:@"yyyy-MM-dd HH:mm:ss:ms"];
    //NSLog(@"d:%@",d);
    //NSString *s = [Utils dateWithFormate:@"yyyy-MM-dd HH:mm:ss:ms"];
    //NSLog(@"s:%@",s);
    
}

-(void)acceptFromAnotherAppName:(NSNotification *)notity
{
    self.navigationController.navigationBar.hidden = NO;

    NSLog(@"notity:%@",[notity userInfo]);
    NSString *appName = [[notity userInfo] objectForKey:@"appName"];
    [self.backApp setTitle:[NSString stringWithFormat:@"返回%@",appName]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAppAction:(UIBarButtonItem *)sender {
    
    NSURL *url = [NSURL URLWithString:@"thisIsAppA://abcd"];//
    if ([[UIApplication sharedApplication] canOpenURL:url]) {//if可以打开(本地有)
        [[UIApplication sharedApplication] openURL:url];
    }else{//本地没有，跳转到appstore 下载页面
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://appsto.re/cn/Mg5gx.i"]];
    }
}
@end
