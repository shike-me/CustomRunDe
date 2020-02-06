//
//  CCRewardTeacherView.m
//  CCLiveCloud
//
//  Created by zwl on 2019/10/18.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

#import "CCRewardTeacherView.h"

@implementation CCRewardTeacherView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setTitle:@"打赏老师"];

        CGFloat midBgViewHeight = 200;
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
            make.left.and.right.equalTo(@0);
            make.height.equalTo(@(self.topHeight + midBgViewHeight + 50 + TabbarSafeBottomMargin));
        }];

        UIView * midBgView = [CCControl initViewWithFrame:CGRectZero BackgroundColor:self.backgroundColor Tag:0 AndAlpha:1];
        [self.bgView addSubview:midBgView];
        [midBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(@0);
            make.top.equalTo(@(self.topHeight));
            make.height.equalTo(@(midBgViewHeight));
        }];
        
        UILabel * moneyLabel = [CCControl initLabelWithFrame:CGRectZero Title:@"￥ 0.88" TextColor:[UIColor purpleColor] TextAlignment:NSTextAlignmentCenter AndFont:[UIFont systemFontOfSize:16]];
        [midBgView addSubview:moneyLabel];
        [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@16);
            make.top.equalTo(@20);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        
        UILabel * inputLabel = [CCControl initLabelWithFrame:CGRectZero Title:@"99" TextColor:[UIColor purpleColor] TextAlignment:NSTextAlignmentLeft AndFont:[UIFont systemFontOfSize:16]];
        [midBgView addSubview:inputLabel];
        [inputLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@16);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
            make.bottom.equalTo(@(-10));
        }];
        
        UIView * lineView = [CCControl initViewWithFrame:CGRectZero BackgroundColor:[UIColor colorWithLight:[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0] Dark:[UIColor colorWithRed:71/255.0 green:71/255.0 blue:71/255.0 alpha:1.0]] Tag:0 AndAlpha:1];
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(@0);
            make.top.equalTo(midBgView.mas_bottom);
            make.height.equalTo(@1);
        }];
        
        //塞红包按钮
        UIButton * sendButton = [CCControl initButtonWithFrame:CGRectZero ButtonType:UIButtonTypeCustom Title:@"塞进红包" Image:nil Target:self Action:@selector(sendButtonAction) AndTag:0];
        sendButton.titleLabel.font = [UIFont systemFontOfSize:16];
        sendButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sendButton setBackgroundColor:[UIColor colorWithRed:255/255.0 green:69/255.0 blue:75/255.0 alpha:1.0]];
        sendButton.layer.cornerRadius = 15;
        [self.bgView addSubview:sendButton];
        [sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineView.mas_bottom).offset(9);
            make.right.equalTo(@(-15));
            make.width.equalTo(@90);
            make.height.equalTo(@30);
        }];
        
    }
    return self;
}

-(void)sendButtonAction
{
    //打赏钱数
    NSNumber * moneyNum = [NSNumber numberWithInt:arc4random()%100 + 1];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SENDREWARD object:moneyNum];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
