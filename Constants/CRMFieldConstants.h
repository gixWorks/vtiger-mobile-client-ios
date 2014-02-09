//
//  CRMFieldConstants.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 08/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

//Shared
#define kFieldCreatedTime   @"createdtime"
#define kFieldModifiedTime  @"modifiedtime"

//Accounts
#define kAccountFieldaccountname    @"accountname"
#define kAccountFieldaccount_no     @"account_no"
#define kAccountFieldphone          @"phone"
#define kAccountFieldwebsite        @"website"
#define kAccountFieldfax            @"fax"
#define kAccountFieldticketsymbol   @"tickersymbol"
#define kAccountFieldotherphone     @"otherphone"
#define kAccountFieldaccount_id     @"account_id" //Member Of [another account]
#define kAccountFieldindustry       @"industry"
#define kAccountFieldemail1         @"email1"
#define kAccountFieldemployees      @"employees"
#define kAccountFieldemail2         @"email2"
#define kAccountFieldownership      @"ownership"
#define kAccountFieldratingrating   @"rating"
#define kAccountFieldsiccode        @"siccode"
#define kAccountFieldaccounttype    @"accounttype"
#define kAccountFieldannual_revenue @"annual_revenue"
#define kAccountFieldemailoptout    @"emailoptout"
#define kAccountFieldnotify_owner   @"notify_owner"
#define kAccountFieldassigned_user_id   @"assigned_user_id"
//address fields in address
#define kAccountFielddescription   @"description"
#define kAccountFieldid   @"id"

//Account Address
#define kAccountFieldbill_street   @"bill_street"
#define kAccountFieldship_street   @"ship_street"
#define kAccountFieldbill_city   @"bill_city"
#define kAccountFieldship_city   @"ship_city"
#define kAccountFieldbill_state   @"bill_state"
#define kAccountFieldship_state   @"ship_state"
#define kAccountFieldbill_code   @"bill_code"
#define kAccountFieldship_code   @"ship_code"
#define kAccountFieldbill_country   @"bill_country"
#define kAccountFieldship_country   @"ship_country"
#define kAccountFieldbill_pobox   @"bill_pobox"
#define kAccountFieldship_pobox   @"ship_pobox"

//Activities
#define kCalendarFieldsubject  @"subject"
#define kCalendarFieldid  @"id"
#define kCalendarFielddate_start  @"date_start"
#define kCalendarFieldactivitytype  @"activitytype"
#define kCalendarFieldtime_start  @"time_start"
#define kCalendarFieldnotime  @"notime"
#define kCalendarFieldsendnotification  @"sendnotification"
#define kCalendarFieldvisibility  @"visibility"
#define kCalendarFieldeventstatus  @"eventstatus"
#define kCalendarFieldtaskstatus  @"taskstatus"
#define kCalendarFieldreminder_time  @"reminder_time"
#define kCalendarFieldassigned_user_id  @"assigned_user_id"
#define kCalendarFieldtime_end  @"time_end"
#define kCalendarFielddue_date  @"due_date"
#define kCalendarFieldrecurringtype  @"recurringtype"
#define kCalendarFieldparent_id  @"parent_id"  //Related to
#define kCalendarFieldcontact_id  @"contact_id" //Contact name
#define kCalendarFieldtaskpriority  @"taskpriority"
#define kCalendarFieldduration_hours  @"duration_hours"
#define kCalendarFieldduration_minutes  @"duration_minutes"
#define kCalendarFieldlocation  @"location"
#define kCalendarFielddescription  @"description"

//Contacts
#define kContactFieldId  @"id"
#define kContactFieldFirstName  @"firstname"
#define kContactFieldLastName  @"lastname"
#define kContactFieldSalutation  @"salutationtype"
#define kContactFieldContactNo  @"contact_no"
#define kContactFieldPhone  @"phone"
#define kContactFieldAccount  @"account_id"
#define kContactFieldMobile  @"mobile"
#define kContactFieldLeadSource  @"leadsource"
#define kContactFieldHomePhone  @"homephone"
#define kContactFieldTitle  @"title"
#define kContactFieldOtherPhone  @"otherphone"
#define kContactFieldDepartment  @"department"
#define kContactFieldFax  @"fax"
#define kContactFieldEmail  @"email"
#define kContactFieldBirthday  @"birthday"
#define kContactFieldAssistant  @"assistant"
#define kContactFieldAssistantPhone  @"assistantPhone"
#define kContactFieldReportsTo  @"contact_id"
#define kContactFieldYahooId  @"yahooid"
#define kContactFieldAssignedTo  @"assigned_user_id"
#define kContactFieldDescription  @"description"

//Contact Addresses
#define kContactAddressFieldMailingCity  @"mailingcity"
#define kContactAddressFieldMailingCountry  @"mailingcountry"
#define kContactAddressFieldMailingPobox  @"mailingpobox"
#define kContactAddressFieldMailingState  @"mailingstate"
#define kContactAddressFieldMailingStreet  @"mailingstreet"
#define kContactAddressFieldMailingZip  @"mailingzip"
#define kContactAddressFieldOtherCity  @"othercity"
#define kContactAddressFieldOtherCountry  @"othercountry"
#define kContactAddressFieldOtherPobox  @"otherpobox"
#define kContactAddressFieldOtherState  @"otherstate"
#define kContactAddressFieldOtherStreet  @"otherstreet"
#define kContactAddressFieldOtherZip  @"otherzip"

//Leads
#define kLeadFieldid  @"id"
#define kLeadFieldLastName  @"lastname"
#define kLeadFieldFirstName  @"firstname"
#define kLeadFieldCompany  @"company"
#define kLeadFieldassigned_user_id  @"assigned_user_id"
#define kLeadFieldcompany_annualrevenue  @"company_annualrevenue"
#define kLeadFieldcompany_industry  @"company_industry"
#define kLeadFieldcompany_noofempoloyees  @"company_noofemployees"
#define kLeadFieldcompany_website  @"company_website"
#define kLeadFielddesignation  @"designation"
#define kLeadFieldemail  @"email"
#define kLeadFieldfax  @"fax"
#define kLeadFieldleadno  @"lead_no"
#define kLeadFieldleadsource  @"leadsource"
#define kLeadFieldleadstatus  @"leadstatus"
#define kLeadFieldmobile  @"mobile"
#define kLeadFieldphone  @"phone"
#define kLeadFieldrating  @"rating"
#define kLeadFieldsalutationType  @"salutationtype"
#define kLeadFieldyahooid  @"yahooid"

//Modules
#define kModule_id  @"id"
#define kModule_name  @"name"
#define kModule_isEntity  @"isEntity"
#define kModule_label  @"label"
#define kModule_singular  @"singular"

//Potentials
#define kPotentialsFieldId  @"id"
#define kPotentialsFieldAmount  @"amount"
#define kPotentialsFieldAssignedUserId  @"assigned_user_id"
#define kPotentialsFieldAssignedUserName  @"assigned_user_name"
#define kPotentialsFieldCampaignId  @"campaignid"
//#define kPotentialsFieldCampaignName  @"campaign_name"
#define kPotentialsFieldClosingDate  @"closing_date"
#define kPotentialsFieldLeadSource  @"lead_source"
#define kPotentialsFieldNextStep  @"next_step"
#define kPotentialsFieldOpportunityType  @"opportunity_type"
#define kPotentialsFieldPotentialNo  @"potential_no"
#define kPotentialsFieldPotentialName  @"potentialname"
#define kPotentialsFieldProbability  @"probability"
#define kPotentialsFieldRelatedTo  @"related_to"
#define kPotentialsFieldSalesStage  @"sales_stage"

//Products
#define kProductFieldId  @"id"
#define kProductFieldProductName  @"productname"
#define kProductFieldProductNo  @"product_no"
#define kProductFieldDescription  @"description"
#define kProductFieldDiscontinued  @"discontinued"
#define kProductFieldProductCode  @"productcode"
#define kProductFieldSalesStartDate  @"sales_start_date"
#define kProductFieldSalesEndDate  @"sales_end_date"
#define kProductFieldSupportStartDate  @"start_date"
#define kProductFieldSupportEndDate  @"expiry_date"
#define kProductFieldManufacturer  @"manufacturer"
#define kProductFieldProductCategory  @"productcategory"
#define kProductFieldVendor  @"vendor_id"
#define kProductFieldWebsite  @"website"
#define kProductFieldVendorPartNo  @"vendor_part_no"
#define kProductFieldMfrPartNo  @"mfr_part_no"
#define kProductFieldProductSheet  @"productsheet"
#define kProductFieldSerialNo  @"serial_no"
#define kProductFieldGlacct  @"glacct" //GL  General Ledger

//Ticket
#define kTicketFieldId  @"id"
#define kTicketFieldAssignedTo  @"assigned_user_id"
#define kTicketFieldProductId  @"product_id"
#define kTicketFieldPriority  @"ticketpriorities"
#define kTicketFieldStatus  @"ticketstatus"
#define kTicketFieldSeverity  @"ticketseverities"
#define kTicketFieldHours  @"hours"
#define kTicketFieldDays  @"days"
#define kTicketFieldCategory  @"ticketcategories"
#define kTicketFieldTicketNo  @"ticket_no"
#define kTicketFieldParentId  @"parent_id"
#define kTicketFieldProduct  @"product_id"
#define kTicketFieldTitle  @"title"

@interface CRMFieldConstants : NSObject

@end
