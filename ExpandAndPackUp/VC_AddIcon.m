//
//  VC_AddIcon.m
//  ExpandAndPackUp
//
//  Created by zhujiamin on 2016/11/23.
//  Copyright © 2016年 zhujiamin. All rights reserved.
//

#import "VC_AddIcon.h"
#import <MLLabel/MLLinkLabel.h>
#import <MLLabel/NSString+MLExpression.h>
#import <MLLabel/NSAttributedString+MLExpression.h>

@interface VC_AddIcon ()

@property (nonatomic, strong) MLLinkLabel *label;

@end

@implementation VC_AddIcon

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    //初始短文字
    NSMutableString *shortStr = [[NSMutableString alloc] initWithString:@"中国共产党在社会主义初级阶段的基本路线是：领导和团结全国各族人民，以经济建设为中心，坚持四项基本..."];
    //这里可以根据实际需求选择是否需要添加展开按钮(全部文字的长度)
    [shortStr appendString:@"展开[展开]"];
    NSMutableAttributedString *shortAttrStr = [[NSMutableAttributedString alloc]initWithString:shortStr];
    [shortAttrStr addAttribute:NSLinkAttributeName value:@"展开" range:NSMakeRange(shortAttrStr.length - 6, 6)];
    
    //展开后的全部文字
    NSMutableString *wholeStr = [[NSMutableString alloc] initWithString:@"中国共产党在社会主义初级阶段的基本路线是：领导和团结全国各族人民，以经济建设为中心，坚持四项基本原则，坚持改革开放，自力更生，艰苦创业，为把我国建设成为富强民主文明和谐的社会主义现代化国家而奋斗。下面是YJBYS小编分享的2016最新党章全文"];
    [wholeStr appendString:@"收起[收起]"];
    NSMutableAttributedString *wholeAttrStr = [[NSMutableAttributedString alloc]initWithString:wholeStr];
    [wholeAttrStr addAttribute:NSLinkAttributeName value:@"收起" range:NSMakeRange(wholeAttrStr.length - 6, 6)];
    
    MLExpression *exp = [MLExpression expressionWithRegex:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" plistName:@"ImageMap" bundleName:@"Custom"];
    
    self.label.attributedText = [shortAttrStr expressionAttributedStringWithExpression:exp];
    
    //点击事件(label需要根据内容计算宽高，有待完善)
    [self.label setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
        NSLog(@"%@",linkText);
        if ([link.linkValue isEqualToString:@"展开"]) {
            label.attributedText = [wholeAttrStr expressionAttributedStringWithExpression:exp];
        } else {
            label.attributedText = [shortAttrStr expressionAttributedStringWithExpression:exp];
        }
    }];
}

#pragma mark - getter
- (MLLinkLabel *)label {
    if (!_label) {
        _label = [[MLLinkLabel alloc] initWithFrame:CGRectMake(50, 100, 300, 200)];
        _label.textColor = [UIColor redColor];
        _label.font = [UIFont systemFontOfSize:14.0f];
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        _label.allowLineBreakInsideLinks = NO;
        _label.linkTextAttributes = nil;
        _label.activeLinkTextAttributes = nil;
    }
    return _label;
}


@end
