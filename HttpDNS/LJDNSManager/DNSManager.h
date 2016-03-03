//
//  DNSManager.h
//  HttpDNS
//
//  Created by Weblogic on 16/3/3.
//  Copyright © 2016年 Weblogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNSManager : NSObject


-(NSString *)getIPByDomain:(NSString *)domain;
-(void)checkAddressCanBeResponse:(NSString *)address;

@end
