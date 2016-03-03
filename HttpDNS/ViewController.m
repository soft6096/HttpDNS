//
//  ViewController.m
//  HttpDNS
//
//  Created by Weblogic on 16/3/3.
//  Copyright © 2016年 Weblogic. All rights reserved.
//

#import "ViewController.h"
#import "DNSManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self getIPByDomain:@"www.baidu.com"];
    
    //[self fetchYahooData];
    
    //[self testGetIP];
    
    DNSManager *dnsManager = [[DNSManager alloc] init];
    [dnsManager checkAddressCanBeResponse:@"http://www.yahoo.com"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
