//
//  Question.h
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSString* text;
@property BOOL hasNotes;
@property int numberOfAttachments;

+ (Question*) questionWithText:(NSString*) questionText;

@end
