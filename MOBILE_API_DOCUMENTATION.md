# vTiger Mobile API 

Please note: this documents refers to the Mobile API of vTiger CRM, not the webservice, which is available at `http://crm-base-url/webservice.php` and whose operations are described at the [official vTiger Wiki page](https://wiki.vtiger.com/index.php/Webservice_reference_manual), as well as on [published books](http://www.lulu.com/shop/joe-bordes-jpl-tsolucio/vtiger-crm-webservices-rest-reference-and-examples-for-vtiger-crm-540/ebook/product-20637757.html). 

# Endpoint

[http://localhost:8888/vtigercrm520/modules/Mobile/api.php](http://localhost:8888/vtigercrm520/modules/Mobile/api.php)

All operations are POST requests.

# File Structure

* /modules/mobile/

    * api.php  endpoint for mobile web services. Send all POST requests there. Do not use arguments, but form arguments 

    * index.php  HTML page for mobile web service

* /modules/mobile/api/

    * Request.php is the file containing the Request "model"

* /modules/mobile/api/ws/

    * contains one file for each operation

    * Utils.php utilities file, not a proper request

# How modules work
Modules follow the following rules:
* if I disable a field in the module settings (I set its “Visibility” checkbox to False), that field is not listed anymore in `Describe` call
* fields for a record are organized in “Blocks” of fields. Each block is represented by an array and has a 
* Calendar is listed a module, but it’s actually made of 3 modules: Task, Meeting and Call. 
 * Task record IDs have the structure 1xID
 * Meeting record IDs have the structure 18xID


# Operations

## Dump of operations from php files

 - 'login'                   => array('file' => '/api/ws/Login.php', 'class' => 'Mobile_WS_Login'),
 - 'loginAndFetchModules'    => array('file' => '/api/ws/LoginAndFetchModules.php', 'class' => 'Mobile_WS_LoginAndFetchModules'),
 - 'fetchModuleFilters'      => array('file' => '/api/ws/FetchModuleFilters.php'  , 'class' => 'Mobile_WS_FetchModuleFilters'),
 - 'filterDetailsWithCount'  => array('file' => '/api/ws/FilterDetailsWithCount.php', 'class' => 'Mobile_WS_FilterDetailsWithCount'),
 - 'fetchAllAlerts'          => array('file' => '/api/ws/FetchAllAlerts.php', 'class' => 'Mobile_WS_FetchAllAlerts'),
 - 'alertDetailsWithMessage' => array('file' => '/api/ws/AlertDetailsWithMessage.php', 'class' => 'Mobile_WS_AlertDetailsWithMessage'),
 - 'listModuleRecords'       => array('file' => '/api/ws/ListModuleRecords.php', 'class' => 'Mobile_WS_ListModuleRecords'),
 - 'fetchRecord'             => array('file' => '/api/ws/FetchRecord.php', 'class' => 'Mobile_WS_FetchRecord'),
 - 'fetchRecordWithGrouping' => array('file' => '/api/ws/FetchRecordWithGrouping.php', 'class' => 'Mobile_WS_FetchRecordWithGrouping'),
 - 'fetchRecordsWithGrouping' => array('file' => '/api/ws/FetchRecordsWithGrouping.php', 'class' => 'Mobile_WS_FetchRecordsWithGrouping'),
 - 'describe'                => array('file' => '/api/ws/Describe.php', 'class' => 'Mobile_WS_Describe'),
 - 'saveRecord'              => array('file' => '/api/ws/SaveRecord.php', 'class' => 'Mobile_WS_SaveRecord'),
 - 'syncModuleRecords'       => array('file' => '/api/ws/SyncModuleRecords.php', 'class' => 'Mobile_WS_SyncModuleRecords'),
 - 'query'                   => array('file' => '/api/ws/Query.php', 'class' => 'Mobile_WS_Query'),
 - 'queryWithGrouping'       => array('file' => '/api/ws/QueryWithGrouping.php', 'class' => 'Mobile_WS_QueryWithGrouping'),
 - 'relatedRecordsWithGrouping' => array('file' => '/api/ws/RelatedRecordsWithGrouping.php', 'class' => 'Mobile_WS_RelatedRecordsWithGrouping'),
 - 'deleteRecords'              => array('file' => '/api/ws/DeleteRecords.php', 'class' => 'Mobile_WS_DeleteRecords'),
 - 'addRecordComment'           => array('file' => '/api/ws/AddRecordComment.php', 'class' => 'Mobile_WS_AddRecordComment'),

## Details of Operations

*NOTE*: Looks like all operations support more parameters than the ones that are needed. Parameters such as `action`, `file` and `search` can be left out and what happens is that `php.log` will display *Notice*-level errors. Depending on the `php.ini` configuration, this can clutter the log file. 

Operations described in this document:

 - [login](#login)
 - [loginAndFetchModules](#loginAndFetchModules)
 - [describe](#describe)
 - [syncModuleRecords](#syncModuleRecords)
 - [fetchRecord](#fetchRecord)
 - [fetchRecordWithGrouping](#fetchRecordWithGrouping)
 - [fetchRecordsWithGrouping](#fetchRecordsWithGrouping) 
 - [saveRecord](#saveRecord)

### <a name=#login"></a>login

Params:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>login</td>
  </tr>
  <tr>
    <td>username</td>
    <td>username</td>
  </tr>
  <tr>
    <td>password</td>
    <td>password</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Response:

    {
    "success": true,
    "result": {
        "login": {
            "userid": "1",
            "session": "fa000f0a6c5a414e62dcc4cbf99175d6",
            "vtiger_version": "5.2.0",
            "mobile_module_version": "1.2.1"
        }
    }
    }


### <a name=#loginAndFetchModules"></a>loginAndFetchModules

It’s used by the mobile web client to display a list of modules to the user after the login is successful. It’s also useful to check if a module is enabled or not. 

Params:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>login</td>
  </tr>
  <tr>
    <td>username</td>
    <td>username</td>
  </tr>
  <tr>
    <td>password</td>
    <td>password</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Response:

    {
    "success": true,
    "result": {
        "login": {
            "userid": "1",
            "session": "fa000f0a6c5a414e62dcc4cbf99175d6",
            "vtiger_version": "5.2.0",
            "mobile_module_version": "1.2.1"
        },
        "modules": [
            {
                "id": "1",
                "name": "Calendar",
                "isEntity": true,
                "label": "Calendar",
                "singular": "To Do"
            },
            {
                "id": "2",
                "name": "Leads",
                "isEntity": true,
                "label": "Leads",
                "singular": "Lead"
            },
            {
                "id": "3",
                "name": "Accounts",
                "isEntity": true,
                "label": "Accounts",
                "singular": "Account"
            },
            {
                "id": "4",
                "name": "Contacts",
                "isEntity": true,
                "label": "Contacts",
                "singular": "Contact"
            },
            {
                "id": "5",
                "name": "Potentials",
                "isEntity": true,
                "label": "Potentials",
                "singular": "Potential"
            },
            {
                "id": "6",
                "name": "Products",
                "isEntity": true,
                "label": "Products",
                "singular": "Product"
            },
            {
                "id": "7",
                "name": "Documents",
                "isEntity": true,
                "label": "Documents",
                "singular": "Document"
            },
            {
                "id": "8",
                "name": "Emails",
                "isEntity": true,
                "label": "Email",
                "singular": "Email"
            },
            {
                "id": "9",
                "name": "HelpDesk",
                "isEntity": true,
                "label": "Trouble Tickets",
                "singular": "Ticket"
            },
            {
                "id": "10",
                "name": "Faq",
                "isEntity": true,
                "label": "FAQ",
                "singular": "Faq"
            },
            {
                "id": "11",
                "name": "Vendors",
                "isEntity": true,
                "label": "Vendors",
                "singular": "Vendor"
            },
            {
                "id": "12",
                "name": "PriceBooks",
                "isEntity": true,
                "label": "Price Books",
                "singular": "PriceBook"
            },
            {
                "id": "13",
                "name": "Quotes",
                "isEntity": true,
                "label": "Quotes",
                "singular": "Quote"
            },
            {
                "id": "14",
                "name": "PurchaseOrder",
                "isEntity": true,
                "label": "Purchase Order",
                "singular": "PurchaseOrder"
            },
            {
                "id": "15",
                "name": "SalesOrder",
                "isEntity": true,
                "label": "Sales Order",
                "singular": "SalesOrder"
            },
            {
                "id": "16",
                "name": "Invoice",
                "isEntity": true,
                "label": "Invoice",
                "singular": "Invoice"
            },
            {
                "id": "17",
                "name": "Campaigns",
                "isEntity": true,
                "label": "Campaigns",
                "singular": "Campaign"
            },
            {
                "id": "23",
                "name": "PBXManager",
                "isEntity": true,
                "label": "PBX Manager",
                "singular": "SINGLE_PBXManager"
            },
            {
                "id": "24",
                "name": "ServiceContracts",
                "isEntity": true,
                "label": "Service Contracts",
                "singular": "Service Contract"
            },
            {
                "id": "25",
                "name": "Services",
                "isEntity": true,
                "label": "Services",
                "singular": "Service"
            },
            {
                "id": "26",
                "name": "Assets",
                "isEntity": true,
                "label": "Assets",
                "singular": "Asset"
            },
            {
                "id": "27",
                "name": "ModComments",
                "isEntity": true,
                "label": "Comments",
                "singular": "Comment"
            },
            {
                "id": "28",
                "name": "ProjectMilestone",
                "isEntity": true,
                "label": "Project Milestones",
                "singular": "Project Milestone"
            },
            {
                "id": "29",
                "name": "ProjectTask",
                "isEntity": true,
                "label": "Project Tasks",
                "singular": "Project Task"
            },
            {
                "id": "30",
                "name": "Project",
                "isEntity": true,
                "label": "Projects",
                "singular": "Project"
            },
            {
                "id": "31",
                "name": "SMSNotifier",
                "isEntity": true,
                "label": "SMSNotifier",
                "singular": "SMS Info"
            }
        ]
    }
    }


### <a name=#describe"></a>describe

Describe queries the API for a specified module and returns its configuration.

Custom fields are returned.

Parameters:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>describe</td>
  </tr>
  <tr>
    <td>_session</td>
    <td>session (from Login)</td>
  </tr>
  <tr>
    <td>module</td>
    <td>Module</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Allowed values for `module`:

 * Calendar 
 * Leads
 * Accounts
 * Contacts
 * HelpDesk
 * Potentials
 * Campaigns

Example of return result:

    {
    "success": true,
    "result": {
        "describe": {
            "label": "Calendar",
            "name": "Calendar",
            "createable": true,
            "updateable": true,
            "deleteable": true,
            "retrieveable": true,
            "fields": [
                {
                    "name": "subject",
                    "label": "Subject",
                    "mandatory": true,
                    "type": {
                        "name": "string"
                    },
                    "nullable": false,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "assigned_user_id",
                    "label": "Assigned To",
                    "mandatory": true,
                    "type": {
                        "name": "owner"
                    },
                    "nullable": false,
                    "editable": true,
                    "default": "0",
                    "uitype": null
                },
                {
                    "name": "date_start",
                    "label": "Start Date & Time",
                    "mandatory": true,
                    "type": {
                        "format": "yyyy-mm-dd",
                        "name": "date"
                    },
                    "nullable": false,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "time_start",
                    "label": "Time Start",
                    "mandatory": false,
                    "type": {
                        "name": "time"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": 252
                },
                {
                    "name": "time_end",
                    "label": "End Time",
                    "mandatory": false,
                    "type": {
                        "name": "time"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": 252
                },
                {
                    "name": "due_date",
                    "label": "Due Date",
                    "mandatory": true,
                    "type": {
                        "format": "yyyy-mm-dd",
                        "name": "date"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "parent_id",
                    "label": "Related to",
                    "mandatory": false,
                    "type": {
                        "refersTo": [
                            "Accounts",
                            "HelpDesk",
                            "Leads",
                            "Potentials",
                            "Invoice",
                            "Quotes",
                            "PurchaseOrder",
                            "SalesOrder",
                            "Campaigns"
                        ],
                        "name": "reference"
                    },
                    "nullable": false,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "contact_id",
                    "label": "Contact Name",
                    "mandatory": false,
                    "type": {
                        "refersTo": [
                            "Contacts"
                        ],
                        "name": "reference"
                    },
                    "nullable": false,
                    "editable": true,
                    "default": "0",
                    "uitype": null
                },
                {
                    "name": "taskstatus",
                    "label": "Status",
                    "mandatory": true,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "Not Started",
                                "value": "Not Started"
                            },
                            {
                                "label": "In Progress",
                                "value": "In Progress"
                            },
                            {
                                "label": "Completed",
                                "value": "Completed"
                            },
                            {
                                "label": "Pending Input",
                                "value": "Pending Input"
                            },
                            {
                                "label": "Deferred",
                                "value": "Deferred"
                            },
                            {
                                "label": "Planned",
                                "value": "Planned"
                            }
                        ],
                        "defaultValue": "Not Started",
                        "name": "picklist"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "eventstatus",
                    "label": "Status",
                    "mandatory": false,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "Planned",
                                "value": "Planned"
                            },
                            {
                                "label": "Held",
                                "value": "Held"
                            },
                            {
                                "label": "Not Held",
                                "value": "Not Held"
                            }
                        ],
                        "defaultValue": "Planned",
                        "name": "picklist"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "taskpriority",
                    "label": "Priority",
                    "mandatory": false,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "High",
                                "value": "High"
                            },
                            {
                                "label": "Medium",
                                "value": "Medium"
                            },
                            {
                                "label": "Low",
                                "value": "Low"
                            }
                        ],
                        "defaultValue": "High",
                        "name": "picklist"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "sendnotification",
                    "label": "Send Notification",
                    "mandatory": false,
                    "type": {
                        "name": "boolean"
                    },
                    "nullable": false,
                    "editable": true,
                    "default": "0",
                    "uitype": null
                },
                {
                    "name": "createdtime",
                    "label": "Created Time",
                    "mandatory": false,
                    "type": {
                        "name": "datetime"
                    },
                    "nullable": false,
                    "editable": false,
                    "uitype": null
                },
                {
                    "name": "modifiedtime",
                    "label": "Modified Time",
                    "mandatory": false,
                    "type": {
                        "name": "datetime"
                    },
                    "nullable": false,
                    "editable": false,
                    "uitype": null
                },
                {
                    "name": "activitytype",
                    "label": "Activity Type",
                    "mandatory": false,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "Call",
                                "value": "Call"
                            },
                            {
                                "label": "Meeting",
                                "value": "Meeting"
                            }
                        ],
                        "defaultValue": "Call",
                        "name": "picklist"
                    },
                    "nullable": false,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "visibility",
                    "label": "Visibility",
                    "mandatory": false,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "Private",
                                "value": "Private"
                            },
                            {
                                "label": "Public",
                                "value": "Public"
                            }
                        ],
                        "defaultValue": "Private",
                        "name": "picklist"
                    },
                    "nullable": false,
                    "editable": true,
                    "default": "all",
                    "uitype": null
                },
                {
                    "name": "description",
                    "label": "Description",
                    "mandatory": false,
                    "type": {
                        "name": "text"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "duration_hours",
                    "label": "Duration",
                    "mandatory": false,
                    "type": {
                        "name": "time"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "duration_minutes",
                    "label": "Duration Minutes",
                    "mandatory": false,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "00",
                                "value": "00"
                            },
                            {
                                "label": "15",
                                "value": "15"
                            },
                            {
                                "label": "30",
                                "value": "30"
                            },
                            {
                                "label": "45",
                                "value": "45"
                            }
                        ],
                        "defaultValue": "00",
                        "name": "picklist"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "location",
                    "label": "Location",
                    "mandatory": false,
                    "type": {
                        "name": "string"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "reminder_time",
                    "label": "Send Reminder",
                    "mandatory": false,
                    "type": {
                        "name": "integer"
                    },
                    "nullable": false,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "recurringtype",
                    "label": "Recurrence",
                    "mandatory": false,
                    "type": {
                        "picklistValues": [
                            {
                                "label": "--None--",
                                "value": "--None--"
                            },
                            {
                                "label": "Day(s)",
                                "value": "Daily"
                            },
                            {
                                "label": "Week(s)",
                                "value": "Weekly"
                            },
                            {
                                "label": "Month(s)",
                                "value": "Monthly"
                            },
                            {
                                "label": "Year",
                                "value": "Yearly"
                            }
                        ],
                        "defaultValue": "--None--",
                        "name": "picklist"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "notime",
                    "label": "No Time",
                    "mandatory": false,
                    "type": {
                        "name": "boolean"
                    },
                    "nullable": false,
                    "editable": true,
                    "default": "0",
                    "uitype": null
                },
                {
                    "name": "cf_617",
                    "label": "Telefono da chiamare per chiarimenti",
                    "mandatory": false,
                    "type": {
                        "name": "phone"
                    },
                    "nullable": true,
                    "editable": true,
                    "uitype": null
                },
                {
                    "name": "id",
                    "label": "activityid",
                    "mandatory": false,
                    "type": {
                        "name": "autogenerated"
                    },
                    "editable": false,
                    "nullable": false,
                    "default": "",
                    "uitype": null
                }
            ],
            "idPrefix": "1",
            "isEntity": true,
            "labelFields": "subject"
        }
    }
    }

### <a name=#syncModuleRecords"></a>syncModuleRecords

Performs a sync of records for specified modules, returning the updated and deleted records since last sync. (Identified by syncToken parameter)

*IMPORTANT*: syncModuleRecords does not display custom fields (apparently)

Parameters:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>syncModuleRecords</td>
  </tr>
  <tr>
    <td>_session</td>
    <td>session (from Login)</td>
  </tr>
  <tr>
    <td>module</td>
    <td>Module</td>
  </tr>
  <tr>
    <td>syncToken</td>
    <td>[empty, or the token from previous sync]</td>
  </tr>
  <tr>
    <td>mode</td>
    <td>PRIVATE</td>
  </tr>
  <tr>
    <td>page</td>
    <td>integer</td>
  </tr>
</table>


Allowed values for `module`:

 * Calendar
 * Leads
 * Accounts
 * Contacts
 * HelpDesk
 * Potentials
 * Campaigns

Allowed values for `mode`:

 * PRIVATE
 * PUBLIC

`Page` can be empty.

    {
    "success": true,
    "result": {
        "sync": {
            "nextSyncToken": 1385311551,
            "deleted": [],
            "updated": [
                {
                    "blocks": [
                        {
                            "label": "Task Information",
                            "fields": [
                                {
                                    "name": "subject",
                                    "value": "Meeting with Lead",
                                    "label": "Subject",
                                    "uitype": "2"
                                },
                                {
                                    "name": "reminder_time",
                                    "value": "0",
                                    "label": "Send Reminder",
                                    "uitype": "30"
                                },
                                {
                                    "name": "assigned_user_id",
                                    "value": {
                                        "value": "19x1",
                                        "label": "Administrator"
                                    },
                                    "label": "Assigned To",
                                    "uitype": "53",
                                    "type": {
                                        "defaultValue": {
                                            "value": "19x1",
                                            "label": "Administrator"
                                        }
                                    }
                                },
                                {
                                    "name": "date_start",
                                    "value": "2014-01-13",
                                    "label": "Start Date &amp; Time",
                                    "uitype": "6"
                                },
                                {
                                    "name": "time_end",
                                    "value": "10:45",
                                    "label": "End Time",
                                    "uitype": 252
                                },
                                {
                                    "name": "time_start",
                                    "value": "09:45",
                                    "label": "Time Start",
                                    "uitype": 252
                                },
                                {
                                    "name": "due_date",
                                    "value": "2014-01-13",
                                    "label": "Due Date",
                                    "uitype": "23"
                                },
                                {
                                    "name": "recurringtype",
                                    "value": "",
                                    "label": "Recurrence",
                                    "uitype": "16"
                                },
                                {
                                    "name": "parent_id",
                                    "value": {
                                        "value": "2x37",
                                        "label": "Davis Jennifer"
                                    },
                                    "label": "Related to",
                                    "uitype": "66"
                                },
                                {
                                    "name": "contact_id",
                                    "value": {
                                        "value": "",
                                        "label": ""
                                    },
                                    "label": "Contact Name",
                                    "uitype": "57"
                                },
                                {
                                    "name": "eventstatus",
                                    "value": "Planned",
                                    "label": "Status",
                                    "uitype": "15"
                                },
                                {
                                    "name": "taskpriority",
                                    "value": "High",
                                    "label": "Priority",
                                    "uitype": "15"
                                },
                                {
                                    "name": "sendnotification",
                                    "value": "",
                                    "label": "Send Notification",
                                    "uitype": "56"
                                },
                                {
                                    "name": "createdtime",
                                    "value": "2013-11-18 09:44:20",
                                    "label": "Created Time",
                                    "uitype": "70"
                                },
                                {
                                    "name": "modifiedtime",
                                    "value": "2013-11-18 09:44:20",
                                    "label": "Modified Time",
                                    "uitype": "70"
                                },
                                {
                                    "name": "activitytype",
                                    "value": "Meeting",
                                    "label": "Activity Type",
                                    "uitype": "15"
                                },
                                {
                                    "name": "duration_hours",
                                    "value": "1",
                                    "label": "Duration",
                                    "uitype": "63"
                                },
                                {
                                    "name": "visibility",
                                    "value": "Private",
                                    "label": "Visibility",
                                    "uitype": "16"
                                },
                                {
                                    "name": "duration_minutes",
                                    "value": "0",
                                    "label": "Duration Minutes",
                                    "uitype": "16"
                                },
                                {
                                    "name": "location",
                                    "value": "via dei mille 45, Brescia, Italia",
                                    "label": "Location",
                                    "uitype": "1"
                                },
                                {
                                    "name": "notime",
                                    "value": "0",
                                    "label": "No Time",
                                    "uitype": "56"
                                }
                            ]
                        },
                        {
                            "label": "",
                            "fields": [
                                {
                                    "name": "description",
                                    "value": "description of meeting with Lead",
                                    "label": "Description",
                                    "uitype": "19"
                                }
                            ]
                        },
                        {
                            "label": "Custom Information",
                            "fields": []
                        }
                    ],
                    "id": "18x1207",
                    "labelFields": [
                        "subject"
                    ]
                },
                {
                    "blocks": [
                        {
                            "label": "Task Information",
                            "fields": [
                                {
                                    "name": "subject",
                                    "value": "Meeting with Lead",
                                    "label": "Subject",
                                    "uitype": "2"
                                },
                                {
                                    "name": "reminder_time",
                                    "value": "0",
                                    "label": "Send Reminder",
                                    "uitype": "30"
                                },
                                {
                                    "name": "assigned_user_id",
                                    "value": {
                                        "value": "19x1",
                                        "label": "Administrator"
                                    },
                                    "label": "Assigned To",
                                    "uitype": "53",
                                    "type": {
                                        "defaultValue": {
                                            "value": "19x1",
                                            "label": "Administrator"
                                        }
                                    }
                                },
                                {
                                    "name": "date_start",
                                    "value": "2014-01-12",
                                    "label": "Start Date &amp; Time",
                                    "uitype": "6"
                                },
                                {
                                    "name": "time_end",
                                    "value": "10:45",
                                    "label": "End Time",
                                    "uitype": 252
                                },
                                {
                                    "name": "time_start",
                                    "value": "09:45",
                                    "label": "Time Start",
                                    "uitype": 252
                                },
                                {
                                    "name": "due_date",
                                    "value": "2014-01-12",
                                    "label": "Due Date",
                                    "uitype": "23"
                                },
                                {
                                    "name": "recurringtype",
                                    "value": "",
                                    "label": "Recurrence",
                                    "uitype": "16"
                                },
                                {
                                    "name": "parent_id",
                                    "value": {
                                        "value": "2x37",
                                        "label": "Davis Jennifer"
                                    },
                                    "label": "Related to",
                                    "uitype": "66"
                                },
                                {
                                    "name": "contact_id",
                                    "value": {
                                        "value": "",
                                        "label": ""
                                    },
                                    "label": "Contact Name",
                                    "uitype": "57"
                                },
                                {
                                    "name": "eventstatus",
                                    "value": "Planned",
                                    "label": "Status",
                                    "uitype": "15"
                                },
                                {
                                    "name": "taskpriority",
                                    "value": "High",
                                    "label": "Priority",
                                    "uitype": "15"
                                },
                                {
                                    "name": "sendnotification",
                                    "value": "",
                                    "label": "Send Notification",
                                    "uitype": "56"
                                },
                                {
                                    "name": "createdtime",
                                    "value": "2013-11-18 09:44:19",
                                    "label": "Created Time",
                                    "uitype": "70"
                                },
                                {
                                    "name": "modifiedtime",
                                    "value": "2013-11-18 09:44:19",
                                    "label": "Modified Time",
                                    "uitype": "70"
                                },
                                {
                                    "name": "activitytype",
                                    "value": "Meeting",
                                    "label": "Activity Type",
                                    "uitype": "15"
                                },
                                {
                                    "name": "duration_hours",
                                    "value": "1",
                                    "label": "Duration",
                                    "uitype": "63"
                                },
                                {
                                    "name": "visibility",
                                    "value": "Private",
                                    "label": "Visibility",
                                    "uitype": "16"
                                },
                                {
                                    "name": "duration_minutes",
                                    "value": "0",
                                    "label": "Duration Minutes",
                                    "uitype": "16"
                                },
                                {
                                    "name": "location",
                                    "value": "via dei mille 45, Brescia, Italia",
                                    "label": "Location",
                                    "uitype": "1"
                                },
                                {
                                    "name": "notime",
                                    "value": "0",
                                    "label": "No Time",
                                    "uitype": "56"
                                }
                            ]
                        },
                        {
                            "label": "",
                            "fields": [
                                {
                                    "name": "description",
                                    "value": "description of meeting with Lead",
                                    "label": "Description",
                                    "uitype": "19"
                                }
                            ]
                        },
                        {
                            "label": "Custom Information",
                            "fields": []
                        }
                    ],
                    "id": "18x1206",
                    "labelFields": [
                        "subject"
                    ]
                }
            ],
            "nextPage": 0
        }
    }
    }

### <a name=#fetchRecord"></a>fetchRecord

Fetches a single record. Fields are laid out in a simple key:value association, and all additional keys (such as uitype, label) are skipped. 

**IMPORTANT**: fetchRecord fetches Custom Fields correctly, but does not display a label for them.

Parameters:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>fetchRecord</td>
  </tr>
  <tr>
    <td>_session</td>
    <td>session (from Login)</td>
  </tr>
  <tr>
    <td>record</td>
    <td>module_idXrecord_id</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Allowed values for `module`:

* Calendar
* Leads
* Accounts
* Contacts
* HelpDesk
* Potentials

Record must be in the form module_idXrecord_id such as 1x1151

    {
    "success": true,
    "result": {
        "record": {
            "subject": "new todo with very long title  that in iOS will be cut somewhere!",
            "assigned_user_id": {
                "value": "19x1",
                "label": "Administrator"
            },
            "date_start": "2013-05-27",
            "time_start": "15:40",
            "time_end": "",
            "due_date": "2013-05-27",
            "parent_id": {
                "value": "",
                "label": ""
            },
            "contact_id": {
                "value": "",
                "label": ""
            },
            "taskstatus": "Not Started",
            "eventstatus": "",
            "taskpriority": "High",
            "sendnotification": "0",
            "createdtime": "2013-05-26 15:39:57",
            "modifiedtime": "2013-05-26 15:39:57",
            "activitytype": "Task",
            "visibility": "",
            "description": "desc",
            "duration_hours": "",
            "duration_minutes": "",
            "location": "",
            "reminder_time": "",
            "recurringtype": "",
            "notime": "0",
            "cf_617": "",
            "id": "1x1151"
        }
    }
    }


### <a name=#fetchRecordWithGrouping"></a>fetchRecordWithGrouping

Fetches a single record and returns fields with the complete representation containing uitype, label (translated), value and name. 

IMPORTANT: fetchRecord fetches Custom Fields and it’s sent in the 3rd "block" of fields.

Parameters:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>fetchRecordWithGrouping</td>
  </tr>
  <tr>
    <td>_session</td>
    <td>session (from Login)</td>
  </tr>
  <tr>
    <td>record</td>
    <td>module_idXrecord_id</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Record must be in the form module_idXrecord_id such as 1x1151

    {
    "success": true,
    "result": {
        "record": {
            "blocks": [
                {
                    "label": "Task Information",
                    "fields": [
                        {
                            "name": "subject",
                            "value": "new todo with very long title  that in iOS will be cut somewhere!",
                            "label": "Subject",
                            "uitype": "2"
                        },
                        {
                            "name": "reminder_time",
                            "value": "",
                            "label": "Send Reminder",
                            "uitype": "30"
                        },
                        {
                            "name": "assigned_user_id",
                            "value": {
                                "value": "19x1",
                                "label": "Administrator"
                            },
                            "label": "Assigned To",
                            "uitype": "53",
                            "type": {
                                "defaultValue": {
                                    "value": "19x1",
                                    "label": "Administrator"
                                }
                            }
                        },
                        {
                            "name": "date_start",
                            "value": "2013-05-27",
                            "label": "Start Date &amp; Time",
                            "uitype": "6"
                        },
                        {
                            "name": "time_end",
                            "value": "",
                            "label": "End Time",
                            "uitype": 252
                        },
                        {
                            "name": "time_start",
                            "value": "15:40",
                            "label": "Time Start",
                            "uitype": 252
                        },
                        {
                            "name": "due_date",
                            "value": "2013-05-27",
                            "label": "Due Date",
                            "uitype": "23"
                        },
                        {
                            "name": "recurringtype",
                            "value": "",
                            "label": "Recurrence",
                            "uitype": "16"
                        },
                        {
                            "name": "parent_id",
                            "value": {
                                "value": "",
                                "label": ""
                            },
                            "label": "Related to",
                            "uitype": "66"
                        },
                        {
                            "name": "taskstatus",
                            "value": "Not Started",
                            "label": "Status",
                            "uitype": "15"
                        },
                        {
                            "name": "contact_id",
                            "value": {
                                "value": "",
                                "label": ""
                            },
                            "label": "Contact Name",
                            "uitype": "57"
                        },
                        {
                            "name": "eventstatus",
                            "value": "",
                            "label": "Status",
                            "uitype": "15"
                        },
                        {
                            "name": "taskpriority",
                            "value": "High",
                            "label": "Priority",
                            "uitype": "15"
                        },
                        {
                            "name": "sendnotification",
                            "value": "0",
                            "label": "Send Notification",
                            "uitype": "56"
                        },
                        {
                            "name": "createdtime",
                            "value": "2013-05-26 15:39:57",
                            "label": "Created Time",
                            "uitype": "70"
                        },
                        {
                            "name": "modifiedtime",
                            "value": "2013-05-26 15:39:57",
                            "label": "Modified Time",
                            "uitype": "70"
                        },
                        {
                            "name": "activitytype",
                            "value": "Task",
                            "label": "Activity Type",
                            "uitype": "15"
                        },
                        {
                            "name": "duration_hours",
                            "value": "",
                            "label": "Duration",
                            "uitype": "63"
                        },
                        {
                            "name": "visibility",
                            "value": "",
                            "label": "Visibility",
                            "uitype": "16"
                        },
                        {
                            "name": "duration_minutes",
                            "value": "",
                            "label": "Duration Minutes",
                            "uitype": "16"
                        },
                        {
                            "name": "location",
                            "value": "",
                            "label": "Location",
                            "uitype": "1"
                        },
                        {
                            "name": "notime",
                            "value": "0",
                            "label": "No Time",
                            "uitype": "56"
                        }
                    ]
                },
                {
                    "label": "",
                    "fields": [
                        {
                            "name": "description",
                            "value": "desc",
                            "label": "Description",
                            "uitype": "19"
                        }
                    ]
                },
                {
                    "label": "Custom Information",
                    "fields": [
                        {
                            "name": "cf_617",
                            "value": "",
                            "label": "Telefono da chiamare per chiarimenti",
                            "uitype": "11"
                        }
                    ]
                }
            ],
            "id": "1x1151"
        }
    }
    }

### <a name=#fetchRecordsWithGrouping"></a>fetchRecordsWithGrouping

Fetches an array of records and returns fields with the complete representation containing uitype, label (translated), value and name. Custom fields are fetched.

IMPORTANT: fetchRecord fetches Custom Fields and it’s sent in the 3rd "block" of fields.

Parameters:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>fetchRecordsWithGrouping</td>
  </tr>
  <tr>
    <td>_session</td>
    <td>session (from Login)</td>
  </tr>
  <tr>
    <td>ids</td>
    <td>["module_idXrecord_id","module_idXrecord_id"]</td>
  </tr>
  <tr>
    <td>alertid</td>
    <td>(optional)</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Allowed values for `module`:

* Calendar
* Leads
* Accounts
* Contacts
* HelpDesk
* Potentials

Records must be in the form module_idXrecord_id, such as 1x1151, and the `ids` parameter should be formatted as a JSON string (`["18x1164", "1x1151"]`).

    {
    "success": true,
    "result": {
        "records": [
            {
                "blocks": [
                    {
                        "label": "Task Information",
                        "fields": [
                            {
                                "name": "subject",
                                "value": "new todo with very long title  that in iOS will be cut somewhere!",
                                "label": "Subject",
                                "uitype": "2"
                            },
                            {
                                "name": "reminder_time",
                                "value": "",
                                "label": "Send Reminder",
                                "uitype": "30"
                            },
                            {
                                "name": "assigned_user_id",
                                "value": {
                                    "value": "19x1",
                                    "label": "Administrator"
                                },
                                "label": "Assigned To",
                                "uitype": "53",
                                "type": {
                                    "defaultValue": {
                                        "value": "19x1",
                                        "label": "Administrator"
                                    }
                                }
                            },
                            {
                                "name": "date_start",
                                "value": "2013-05-27",
                                "label": "Start Date &amp; Time",
                                "uitype": "6"
                            },
                            {
                                "name": "time_end",
                                "value": "",
                                "label": "End Time",
                                "uitype": 252
                            },
                            {
                                "name": "time_start",
                                "value": "15:40",
                                "label": "Time Start",
                                "uitype": 252
                            },
                            {
                                "name": "due_date",
                                "value": "2013-05-27",
                                "label": "Due Date",
                                "uitype": "23"
                            },
                            {
                                "name": "recurringtype",
                                "value": "",
                                "label": "Recurrence",
                                "uitype": "16"
                            },
                            {
                                "name": "parent_id",
                                "value": {
                                    "value": "",
                                    "label": ""
                                },
                                "label": "Related to",
                                "uitype": "66"
                            },
                            {
                                "name": "taskstatus",
                                "value": "Not Started",
                                "label": "Status",
                                "uitype": "15"
                            },
                            {
                                "name": "contact_id",
                                "value": {
                                    "value": "",
                                    "label": ""
                                },
                                "label": "Contact Name",
                                "uitype": "57"
                            },
                            {
                                "name": "eventstatus",
                                "value": "",
                                "label": "Status",
                                "uitype": "15"
                            },
                            {
                                "name": "taskpriority",
                                "value": "High",
                                "label": "Priority",
                                "uitype": "15"
                            },
                            {
                                "name": "sendnotification",
                                "value": "0",
                                "label": "Send Notification",
                                "uitype": "56"
                            },
                            {
                                "name": "createdtime",
                                "value": "2013-05-26 15:39:57",
                                "label": "Created Time",
                                "uitype": "70"
                            },
                            {
                                "name": "modifiedtime",
                                "value": "2013-05-26 15:39:57",
                                "label": "Modified Time",
                                "uitype": "70"
                            },
                            {
                                "name": "activitytype",
                                "value": "Task",
                                "label": "Activity Type",
                                "uitype": "15"
                            },
                            {
                                "name": "duration_hours",
                                "value": "",
                                "label": "Duration",
                                "uitype": "63"
                            },
                            {
                                "name": "visibility",
                                "value": "",
                                "label": "Visibility",
                                "uitype": "16"
                            },
                            {
                                "name": "duration_minutes",
                                "value": "",
                                "label": "Duration Minutes",
                                "uitype": "16"
                            },
                            {
                                "name": "location",
                                "value": "",
                                "label": "Location",
                                "uitype": "1"
                            },
                            {
                                "name": "notime",
                                "value": "0",
                                "label": "No Time",
                                "uitype": "56"
                            }
                        ]
                    },
                    {
                        "label": "",
                        "fields": [
                            {
                                "name": "description",
                                "value": "desc",
                                "label": "Description",
                                "uitype": "19"
                            }
                        ]
                    },
                    {
                        "label": "Custom Information",
                        "fields": [
                            {
                                "name": "cf_617",
                                "value": "",
                                "label": "Telefono da chiamare per chiarimenti",
                                "uitype": "11"
                            }
                        ]
                    }
                ],
                "id": "1x1151"
            }
        ]
    }
    }


### <a name=#saveRecord"></a>saveRecord

Updates or creates a record, depending whether the record id is set or not. 

Parameters:

<table>
  <tr>
    <td>Name</td>
    <td>Value</td>
  </tr>
  <tr>
    <td>_operation</td>
    <td>saveRecord</td>
  </tr>
  <tr>
    <td>_session</td>
    <td>session (from Login)</td>
  </tr>
  <tr>
    <td>module</td>
    <td>Module</td>
  </tr>
  <tr>
    <td>record</td>
    <td>module_idXrecord_id</td>
  </tr>
  <tr>
    <td>values</td>
    <td>json string</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>


Allowed values for `module`:

* Calendar

Example of JSON String to set in the `values` parameter: 

    {
      "date_start": "2014-01-18",
      "due_date": "2014-01-18",
      "start_time": "14:44",
      "activitytype": "Call",
      "location": "Overhoeksplein 2, Amsterdam",
      "subject": "Call Smith",
      "assigned_user_id": "19x1",
      "taskstatus": "Planned",
      "visibility": "Private"
    }

Note the absence of "id" because we want to create a new record.

For setting the assigned user, The id must be in the form of `moduleid x entityid`.

Record must be in the form `module_idXrecord_id` such as `1x1151`.

Example of successful response:  (basically returns the entire record created)

    {
    "success": true,
    "result": {
        "record": {
            "blocks": [
                {
                    "label": "Task Information",
                    "fields": [
                        {
                            "name": "subject",
                            "value": "Call Smith",
                            "label": "Subject",
                            "uitype": "2"
                        },
                        {
                            "name": "reminder_time",
                            "value": "",
                            "label": "Send Reminder",
                            "uitype": "30"
                        },
                        {
                            "name": "assigned_user_id",
                            "value": {
                                "value": "19x1",
                                "label": "Administrator"
                            },
                            "label": "Assigned To",
                            "uitype": "53",
                            "type": {
                                "defaultValue": {
                                    "value": "19x1",
                                    "label": "Administrator"
                                }
                            }
                        },
                        {
                            "name": "date_start",
                            "value": "2014-01-18",
                            "label": "Start Date &amp; Time",
                            "uitype": "6"
                        },
                        {
                            "name": "time_end",
                            "value": "",
                            "label": "End Time",
                            "uitype": 252
                        },
                        {
                            "name": "time_start",
                            "value": "",
                            "label": "Time Start",
                            "uitype": 252
                        },
                        {
                            "name": "due_date",
                            "value": "2014-01-18",
                            "label": "Due Date",
                            "uitype": "23"
                        },
                        {
                            "name": "recurringtype",
                            "value": "",
                            "label": "Recurrence",
                            "uitype": "16"
                        },
                        {
                            "name": "parent_id",
                            "value": {
                                "value": "",
                                "label": ""
                            },
                            "label": "Related to",
                            "uitype": "66"
                        },
                        {
                            "name": "taskstatus",
                            "value": "",
                            "label": "Status",
                            "uitype": "15"
                        },
                        {
                            "name": "contact_id",
                            "value": {
                                "value": "",
                                "label": ""
                            },
                            "label": "Contact Name",
                            "uitype": "57"
                        },
                        {
                            "name": "eventstatus",
                            "value": "",
                            "label": "Status",
                            "uitype": "15"
                        },
                        {
                            "name": "taskpriority",
                            "value": "",
                            "label": "Priority",
                            "uitype": "15"
                        },
                        {
                            "name": "sendnotification",
                            "value": "0",
                            "label": "Send Notification",
                            "uitype": "56"
                        },
                        {
                            "name": "createdtime",
                            "value": "2013-11-25 13:43:49",
                            "label": "Created Time",
                            "uitype": "70"
                        },
                        {
                            "name": "modifiedtime",
                            "value": "2013-11-25 13:43:49",
                            "label": "Modified Time",
                            "uitype": "70"
                        },
                        {
                            "name": "activitytype",
                            "value": "Call",
                            "label": "Activity Type",
                            "uitype": "15"
                        },
                        {
                            "name": "duration_hours",
                            "value": "0",
                            "label": "Duration",
                            "uitype": "63"
                        },
                        {
                            "name": "visibility",
                            "value": "Private",
                            "label": "Visibility",
                            "uitype": "16"
                        },
                        {
                            "name": "duration_minutes",
                            "value": "",
                            "label": "Duration Minutes",
                            "uitype": "16"
                        },
                        {
                            "name": "location",
                            "value": "",
                            "label": "Location",
                            "uitype": "1"
                        },
                        {
                            "name": "notime",
                            "value": "0",
                            "label": "No Time",
                            "uitype": "56"
                        }
                    ]
                },
                {
                    "label": "",
                    "fields": [
                        {
                            "name": "description",
                            "value": "",
                            "label": "Description",
                            "uitype": "19"
                        }
                    ]
                },
                {
                    "label": "Custom Information",
                    "fields": [
                        {
                            "name": "cf_617",
                            "value": "",
                            "label": "Telefono da chiamare per chiarimenti",
                            "uitype": "11"
                        }
                    ]
                }
            ],
            "id": "1x1225"
        }
     }
     }
     
    "success": true,
    "result": {
        "record": {
            "blocks": [
                {
                    "label": "Task Information",
                    "fields": [
                        {
                            "name": "subject",
                            "value": "Call Smith",
                            "label": "Subject",
                            "uitype": "2"
                        },
                        {
                            "name": "reminder_time",
                            "value": "",
                            "label": "Send Reminder",
                            "uitype": "30"
                        },
                        {
                            "name": "assigned_user_id",
                            "value": {
                                "value": "19x1",
                                "label": "Administrator"
                            },
                            "label": "Assigned To",
                            "uitype": "53",
                            "type": {
                                "defaultValue": {
                                    "value": "19x1",
                                    "label": "Administrator"
                                }
                            }
                        },
                        {
                            "name": "date_start",
                            "value": "2014-01-18",
                            "label": "Start Date &amp; Time",
                            "uitype": "6"
                        },
                        {
                            "name": "time_end",
                            "value": "",
                            "label": "End Time",
                            "uitype": 252
                        },
                        {
                            "name": "time_start",
                            "value": "",
                            "label": "Time Start",
                            "uitype": 252
                        },
                        {
                            "name": "due_date",
                            "value": "2014-01-18",
                            "label": "Due Date",
                            "uitype": "23"
                        },
                        {
                            "name": "recurringtype",
                            "value": "",
                            "label": "Recurrence",
                            "uitype": "16"
                        },
                        {
                            "name": "parent_id",
                            "value": {
                                "value": "",
                                "label": ""
                            },
                            "label": "Related to",
                            "uitype": "66"
                        },
                        {
                            "name": "taskstatus",
                            "value": "",
                            "label": "Status",
                            "uitype": "15"
                        },
                        {
                            "name": "contact_id",
                            "value": {
                                "value": "",
                                "label": ""
                            },
                            "label": "Contact Name",
                            "uitype": "57"
                        },
                        {
                            "name": "eventstatus",
                            "value": "",
                            "label": "Status",
                            "uitype": "15"
                        },
                        {
                            "name": "taskpriority",
                            "value": "",
                            "label": "Priority",
                            "uitype": "15"
                        },
                        {
                            "name": "sendnotification",
                            "value": "0",
                            "label": "Send Notification",
                            "uitype": "56"
                        },
                        {
                            "name": "createdtime",
                            "value": "2013-11-25 13:43:49",
                            "label": "Created Time",
                            "uitype": "70"
                        },
                        {
                            "name": "modifiedtime",
                            "value": "2013-11-25 13:43:49",
                            "label": "Modified Time",
                            "uitype": "70"
                        },
                        {
                            "name": "activitytype",
                            "value": "Call",
                            "label": "Activity Type",
                            "uitype": "15"
                        },
                        {
                            "name": "duration_hours",
                            "value": "0",
                            "label": "Duration",
                            "uitype": "63"
                        },
                        {
                            "name": "visibility",
                            "value": "Private",
                            "label": "Visibility",
                            "uitype": "16"
                        },
                        {
                            "name": "duration_minutes",
                            "value": "",
                            "label": "Duration Minutes",
                            "uitype": "16"
                        },
                        {
                            "name": "location",
                            "value": "",
                            "label": "Location",
                            "uitype": "1"
                        },
                        {
                            "name": "notime",
                            "value": "0",
                            "label": "No Time",
                            "uitype": "56"
                        }
                    ]
                },
                {
                    "label": "",
                    "fields": [
                        {
                            "name": "description",
                            "value": "",
                            "label": "Description",
                            "uitype": "19"
                        }
                    ]
                },
                {
                    "label": "Custom Information",
                    "fields": [
                        {
                            "name": "cf_617",
                            "value": "",
                            "label": "Telefono da chiamare per chiarimenti",
                            "uitype": "11"
                        }
                    ]
                }
            ],
            "id": "1x1225"
        }
    }
    }


Example of error:

    {
      "success": false,
      "error": {
        "code": "MANDATORY_FIELDS_MISSING",
        "message": "assigned_user_id does not have a value"
      }
    }

## Module-specific considerations

### Contacts
Contacts have a picture field available, but it can be accessed only through the web interface and its content (e.g. the file name) are not retrieved either by the `webservice.php` or any operation such as `syncModuleRecords`.
When displaying the fields as grouped, a "block" contains the file information but the array is actually empty, even when a contact picture is uploaded.

    {
     "label": "Contact Image Information:",
     "fields": []
    }

### Documents
Documents should be designed to contain files, but the file data is not accessible through the webservice. In fact, even from the official vTiger Mobile application (for iOS), only the metadata of the document are accessible, but the filename and download URL are not accessible through the mobile API.

### HelpDesk (Trouble Tickets)
Trouble Tickets have the possibility to have Comments associated to each, and when trtrieving the records there is even a `Comments` block containing an array. But the array is empty independently from the presence of comments.

    {
      "label": "COMMENTS",
      "fields": []
    }


