___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Analytics Storage Variable",
  "categories": ["ANALYTICS"],
  "description": "Safely parse the Google Analytics client_id, session_id, session_number, and measurement_id for a specific Measurement ID on a website.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "valueSelect",
    "displayName": "",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "client_id",
        "displayValue": "Client ID"
      },
      {
        "value": "session_id",
        "displayValue": "Session ID"
      },
      {
        "value": "session_number",
        "displayValue": "Session Number"
      },
      {
        "value": "measurement_id",
        "displayValue": "Measurement ID"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "measurementId",
    "displayName": "Measurement ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "STRING_LENGTH",
        "args": [
          4,
          20
        ]
      }
    ],
    "valueHint": "G-1234567890"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const readAnalyticsStorage = require('readAnalyticsStorage');
const analyticsStorageData = readAnalyticsStorage();
const valueSelect = data.valueSelect;
const measurementId = data.measurementId;
log(measurementId);
const object = analyticsStorageData.sessions;
log(object);
for (const obj of object) {
    if (obj.measurement_id === measurementId) {
    log(obj.measurement_id);
    // The logic for selecting the value is inside this block
       if (valueSelect === 'session_id') {
            log(obj.session_id);
            return obj.session_id;
        } else if (valueSelect === 'session_number') {
            log(obj.session_number);
            return obj.session_number;
        } else if (valueSelect === 'measurement_id') {
            log(obj.measurement_id);
            return obj.measurement_id;
        } else if (valueSelect === 'client_id') {
            log(analyticsStorageData.client_id);
            return analyticsStorageData.client_id;
        } 
    }
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_analytics_storage",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 9/2/2025, 3:57:07 PM


