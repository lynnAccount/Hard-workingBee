//
//  WebViewController.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/21.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()<UIWebViewDelegate>

@property (nonatomic,strong) Activity *activity;
@property (nonatomic,strong) UIWebView *webView;

@end
@implementation WebViewController




- (instancetype)initWithActivity:(Activity *)activity {
    self = [super init];
    self.activity = activity;
    return self;
}

- (void)viewDidLoad {
    self.title = self.activity.name;
    self.webView = [[UIWebView alloc]init];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://m.beequick.cn/show/active?id=%@&locationHash=dd89f1dQaciSSWjOXvfrV0V7EqgKmdGLU0/YJceSpQ5LLiEVS8oMovWAQ&zchtid=5624&location_time=1458523110&cityid=2&hide_cart=0&show_reload=1&activitygroup=%@&bigids=%@&__v=ios4.13",self.activity.aid,self.activity.ext_params.activitygroup,self.activity.ext_params.bigids];
    NSLog(@"%@",urlStr);
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@",error);
}
@end
