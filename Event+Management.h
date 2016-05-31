//
//  Event+Management.h
//  dataSnapSample
//
//  Created by Alyssa McIntyre on 5/31/16.
//  Copyright © 2016 Datasnapio. All rights reserved.
//
#import "CoreDataHelper.h"
#import "Event.h"

@interface Event (Management)
+ (Event*)createEventEntityInContext:(NSManagedObjectContext*)context;
+ (Event*)createEventEntity;
+ (NSMutableArray*)returnAllEvents;
+ (NSMutableArray*)returnAllEventsInContext:(NSManagedObjectContext*)context;
+ (void)deleteAllEvents:(NSMutableArray*)eventsArray;
+ (void)deleteAllEvents:(NSMutableArray*)eventsArray inContext:(NSManagedObjectContext*)context;
@end
