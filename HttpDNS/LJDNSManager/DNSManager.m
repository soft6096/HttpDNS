//
//  DNSManager.m
//  HttpDNS
//
//  Created by Weblogic on 16/3/3.
//  Copyright © 2016年 Weblogic. All rights reserved.
//

#import "DNSManager.h"

@implementation DNSManager


-(void)fetchYahooData{
    NSLog(@"We are here...");
    NSString *urlString = @"http://www.yahoo.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSLog(@"Firing synchronous url connection...");
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    if ([data length] > 0 && error == nil) {
        
        NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",raw);
        
    }else if([data length] == 0 && error == nil){
        NSLog(@"No data was return.");
    }else if (error != nil){
        NSLog(@"Error happened = %@",error);
    }
    NSLog(@"We are done.");
    
}

-(void)testGetIP{
    NSLog(@"We are here...");
    NSString *urlString = @"http://119.29.29.29/d?ttl=1&dn=www.baidu.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSLog(@"Firing synchronous url connection...");
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    if ([data length] > 0 && error == nil) {
        
        NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",raw);
        
    }else if([data length] == 0 && error == nil){
        NSLog(@"No data was return.");
    }else if (error != nil){
        NSLog(@"Error happened = %@",error);
    }
    NSLog(@"We are done.");
    
}

/**
 *  通过访问腾讯的接口，将域名解析为IP地址
 *
 *  @param domain 去掉http:// 或者 https://的域名
 *
 *  @return
 */
-(NSString *)getIPByDomain:(NSString *)domain {
    NSString *url = [NSString stringWithFormat:@"http://119.29.29.29/d?ttl=1&dn=%@",domain];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSHTTPURLResponse *response = nil;
    NSError *httpError = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:&response
                                                     error:&httpError];
    if (httpError != nil) {
        return nil;
    }
    if (response.statusCode != 200) {
        return nil;
    }
    NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *ip1 = [raw componentsSeparatedByString:@","];
    if (ip1.count != 2) {
        return nil;
    }
    NSString *ttlStr = [ip1 objectAtIndex:1];
    int ttl = [ttlStr intValue];
    if (ttl <= 0) {
        return nil;
    }
    NSString *ips = [ip1 objectAtIndex:0];
    NSArray *ipArray = [ips componentsSeparatedByString:@";"];
    NSString *host = ipArray.firstObject;
    
    if (host.length) {
        
    }
    
    return nil;
}


/**
 *  判断地址能否被访问。
 *
 *  这里只需要请求某个jsp页面，看看返回值是否为200，就知道该IP地址能否被访问到
 *
 *  @param address
 */
-(void)checkAddressCanBeResponse:(NSString *)address{
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:address]];
    urlRequest.timeoutInterval = 5;
    
    NSHTTPURLResponse *response = nil;
    NSError *httpError = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:&response
                                                     error:&httpError];
    
    if (!data ||
        response.statusCode != 200 ||
        httpError != nil) {
        
        //!failed ?: failed();
        return;
    }
    
    if ([data length] > 0 && httpError == nil) {
        
        NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",raw);
        
    }else if([data length] == 0 && httpError == nil){
        NSLog(@"No data was return.");
    }else if (httpError != nil){
        NSLog(@"Error happened = %@",httpError);
    }
    
}

@end
