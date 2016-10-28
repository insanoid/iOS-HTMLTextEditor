//
//  ViewController.m
//  iOS-HTMLTextEditor
//
//  Created by Karthik on 28/10/2016.
//  Copyright © 2016 Karthik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, weak) IBOutlet UILabel *htmlLabel;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    self.title = @"iOS-HTMLTextEditor";
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    [super viewDidLoad];
    [self loadContent];
}


#pragma mark - Load content locally.

- (void)loadContent {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"/CKEditor/demo.html" ofType:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}


#pragma mark - WebView Methods

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView stringByEvaluatingJavaScriptFromString:
     @"document.body.style.margin='0';document.body.style.padding = '0'"];
    [self.webView stringByEvaluatingJavaScriptFromString:
     @"document.getElementById('editor').innerHTML='<b>'Hello</b> <i>World</i>!';"];
    [self.webView stringByEvaluatingJavaScriptFromString:
     @"document.getElementById('editor').focus();"];
}

- (IBAction)evaluateWebView:(id)sender {
    NSString *html = [self.webView stringByEvaluatingJavaScriptFromString:
                      @"CKEDITOR.instances.editor.getData()"];
    self.htmlLabel.text = html;
}



@end
