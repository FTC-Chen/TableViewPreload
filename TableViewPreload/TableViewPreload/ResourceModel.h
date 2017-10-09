//
//  ResourceModel.h
//  YDYXT
//
//  Created by Micheal on 16/2/20.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import "BaseMode.h"

@interface ResourceModel : BaseMode

/*
 description = "flash\U64ad\U653e\U63d2\U4ef6";
 download = "http://118.26.135.179:8077/file/resource/flash\U64ad\U653e\U63d2\U4ef6.rar";
 id = 176;
 image = "http://lms.e-cell.com.cn/SmartWeb/images/resource.jpg";
 name = "flash\U64ad\U653e\U63d2\U4ef6";
 pagecount = 4;
 pageindex = 1;
 pagesize = 10;
 regdate = "10-12-10 10:25";
 */

/**
*  资源描述
*/
@property (nonatomic , copy) NSString *des;

/**
 *  资源下载地址
 */
@property (nonatomic , copy) NSString *download;

@property (nonatomic , copy) NSString *ID;

@property (nonatomic , copy) NSString *image;

/**
 *  发布日期
 */
@property (nonatomic , copy) NSString *regdate;

/**
 *  资源名称
 */
@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *pagecount;

@property (nonatomic , copy) NSString *pageindex;

@property (nonatomic , copy) NSString *pagesize;



@end
