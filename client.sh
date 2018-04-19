#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! swagger-codegen (https://github.com/swagger-api/swagger-codegen)
# ! FROM SWAGGER SPECIFICATION IN JSON.
# !
# ! Generated on: 2018-04-19T15:02:16.110-07:00
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for LaunchDarkly REST API.
#
# LICENSE:
# http://www.apache.org/licenses/LICENSE-2.0.html
#
# CONTACT:
# support@launchdarkly.com
#
# MORE INFORMATION:
# 
#

# For improved pattern matching in case statemets
shopt -s extglob

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=$(basename "$0")

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# Declare colors with autodection if output is terminal
if [ -t 1 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
    BOLD="$(tput bold)"
    OFF="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    MAGENTA=""
    CYAN=""
    WHITE=""
    BOLD=""
    OFF=""
fi

declare -a result_color_table=( "$WHITE" "$WHITE" "$GREEN" "$YELLOW" "$WHITE" "$MAGENTA" "$WHITE" )

##
# This array stores the minimum number of required occurrences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurrences
operation_parameters_minimum_occurrences["getAuditLogEntries:::before"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::after"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::q"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::limit"]=0
operation_parameters_minimum_occurrences["getAuditLogEntries:::spec"]=0
operation_parameters_minimum_occurrences["getAuditLogEntry:::resourceId"]=1
operation_parameters_minimum_occurrences["deleteCustomRole:::customRoleKey"]=1
operation_parameters_minimum_occurrences["getCustomRole:::customRoleKey"]=1
operation_parameters_minimum_occurrences["patchCustomRole:::customRoleKey"]=1
operation_parameters_minimum_occurrences["patchCustomRole:::patchDelta"]=1
operation_parameters_minimum_occurrences["postCustomRole:::customRoleBody"]=1
operation_parameters_minimum_occurrences["deleteEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteEnvironment:::environmentKey"]=1
operation_parameters_minimum_occurrences["getEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["getEnvironment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["patchEnvironment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchEnvironment:::patchDelta"]=1
operation_parameters_minimum_occurrences["postEnvironment:::projectKey"]=1
operation_parameters_minimum_occurrences["postEnvironment:::environmentBody"]=1
operation_parameters_minimum_occurrences["deleteFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlag:::env"]=0
operation_parameters_minimum_occurrences["getFeatureFlagStatus:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatus:::environmentKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatus:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatuses:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlagStatuses:::environmentKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlags:::projectKey"]=1
operation_parameters_minimum_occurrences["getFeatureFlags:::env"]=0
operation_parameters_minimum_occurrences["getFeatureFlags:::tag"]=0
operation_parameters_minimum_occurrences["patchFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["patchFeatureFlag:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["patchFeatureFlag:::patchComment"]=1
operation_parameters_minimum_occurrences["postFeatureFlag:::projectKey"]=1
operation_parameters_minimum_occurrences["postFeatureFlag:::featureFlagBody"]=1
operation_parameters_minimum_occurrences["deleteProject:::projectKey"]=1
operation_parameters_minimum_occurrences["getProject:::projectKey"]=1
operation_parameters_minimum_occurrences["patchProject:::projectKey"]=1
operation_parameters_minimum_occurrences["patchProject:::patchDelta"]=1
operation_parameters_minimum_occurrences["postProject:::projectBody"]=1
operation_parameters_minimum_occurrences["deleteMember:::memberId"]=1
operation_parameters_minimum_occurrences["getMember:::memberId"]=1
operation_parameters_minimum_occurrences["patchMember:::memberId"]=1
operation_parameters_minimum_occurrences["patchMember:::patchDelta"]=1
operation_parameters_minimum_occurrences["postMembers:::membersBody"]=1
operation_parameters_minimum_occurrences["deleteUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["deleteUserSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegments:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserSegments:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserSegments:::tag"]=0
operation_parameters_minimum_occurrences["patchUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::userSegmentKey"]=1
operation_parameters_minimum_occurrences["patchUserSegment:::PatchOnly"]=1
operation_parameters_minimum_occurrences["postUserSegment:::projectKey"]=1
operation_parameters_minimum_occurrences["postUserSegment:::environmentKey"]=1
operation_parameters_minimum_occurrences["postUserSegment:::userSegmentBody"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::userKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSetting:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSettings:::projectKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSettings:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUserFlagSettings:::userKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::projectKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::environmentKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::userKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::featureFlagKey"]=1
operation_parameters_minimum_occurrences["putFlagSetting:::userSettingsBody"]=1
operation_parameters_minimum_occurrences["deleteUser:::projectKey"]=1
operation_parameters_minimum_occurrences["deleteUser:::environmentKey"]=1
operation_parameters_minimum_occurrences["deleteUser:::userKey"]=1
operation_parameters_minimum_occurrences["getSearchUsers:::projectKey"]=1
operation_parameters_minimum_occurrences["getSearchUsers:::environmentKey"]=1
operation_parameters_minimum_occurrences["getSearchUsers:::q"]=0
operation_parameters_minimum_occurrences["getSearchUsers:::limit"]=0
operation_parameters_minimum_occurrences["getSearchUsers:::offset"]=0
operation_parameters_minimum_occurrences["getSearchUsers:::after"]=0
operation_parameters_minimum_occurrences["getUser:::projectKey"]=1
operation_parameters_minimum_occurrences["getUser:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUser:::userKey"]=1
operation_parameters_minimum_occurrences["getUsers:::projectKey"]=1
operation_parameters_minimum_occurrences["getUsers:::environmentKey"]=1
operation_parameters_minimum_occurrences["getUsers:::limit"]=0
operation_parameters_minimum_occurrences["getUsers:::h"]=0
operation_parameters_minimum_occurrences["getUsers:::scrollId"]=0
operation_parameters_minimum_occurrences["deleteWebhook:::resourceId"]=1
operation_parameters_minimum_occurrences["getWebhook:::resourceId"]=1
operation_parameters_minimum_occurrences["patchWebhook:::resourceId"]=1
operation_parameters_minimum_occurrences["patchWebhook:::patchDelta"]=1
operation_parameters_minimum_occurrences["postWebhook:::webhookBody"]=1

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["getAuditLogEntries:::before"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::after"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::q"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::limit"]=0
operation_parameters_maximum_occurrences["getAuditLogEntries:::spec"]=0
operation_parameters_maximum_occurrences["getAuditLogEntry:::resourceId"]=0
operation_parameters_maximum_occurrences["deleteCustomRole:::customRoleKey"]=0
operation_parameters_maximum_occurrences["getCustomRole:::customRoleKey"]=0
operation_parameters_maximum_occurrences["patchCustomRole:::customRoleKey"]=0
operation_parameters_maximum_occurrences["patchCustomRole:::patchDelta"]=0
operation_parameters_maximum_occurrences["postCustomRole:::customRoleBody"]=0
operation_parameters_maximum_occurrences["deleteEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteEnvironment:::environmentKey"]=0
operation_parameters_maximum_occurrences["getEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["getEnvironment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["patchEnvironment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchEnvironment:::patchDelta"]=0
operation_parameters_maximum_occurrences["postEnvironment:::projectKey"]=0
operation_parameters_maximum_occurrences["postEnvironment:::environmentBody"]=0
operation_parameters_maximum_occurrences["deleteFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlag:::env"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatus:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatus:::environmentKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatus:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatuses:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlagStatuses:::environmentKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::projectKey"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::env"]=0
operation_parameters_maximum_occurrences["getFeatureFlags:::tag"]=0
operation_parameters_maximum_occurrences["patchFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["patchFeatureFlag:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["patchFeatureFlag:::patchComment"]=0
operation_parameters_maximum_occurrences["postFeatureFlag:::projectKey"]=0
operation_parameters_maximum_occurrences["postFeatureFlag:::featureFlagBody"]=0
operation_parameters_maximum_occurrences["deleteProject:::projectKey"]=0
operation_parameters_maximum_occurrences["getProject:::projectKey"]=0
operation_parameters_maximum_occurrences["patchProject:::projectKey"]=0
operation_parameters_maximum_occurrences["patchProject:::patchDelta"]=0
operation_parameters_maximum_occurrences["postProject:::projectBody"]=0
operation_parameters_maximum_occurrences["deleteMember:::memberId"]=0
operation_parameters_maximum_occurrences["getMember:::memberId"]=0
operation_parameters_maximum_occurrences["patchMember:::memberId"]=0
operation_parameters_maximum_occurrences["patchMember:::patchDelta"]=0
operation_parameters_maximum_occurrences["postMembers:::membersBody"]=0
operation_parameters_maximum_occurrences["deleteUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["deleteUserSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegments:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserSegments:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserSegments:::tag"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::userSegmentKey"]=0
operation_parameters_maximum_occurrences["patchUserSegment:::PatchOnly"]=0
operation_parameters_maximum_occurrences["postUserSegment:::projectKey"]=0
operation_parameters_maximum_occurrences["postUserSegment:::environmentKey"]=0
operation_parameters_maximum_occurrences["postUserSegment:::userSegmentBody"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::userKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSetting:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSettings:::projectKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSettings:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUserFlagSettings:::userKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::projectKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::environmentKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::userKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::featureFlagKey"]=0
operation_parameters_maximum_occurrences["putFlagSetting:::userSettingsBody"]=0
operation_parameters_maximum_occurrences["deleteUser:::projectKey"]=0
operation_parameters_maximum_occurrences["deleteUser:::environmentKey"]=0
operation_parameters_maximum_occurrences["deleteUser:::userKey"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::projectKey"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::environmentKey"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::q"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::limit"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::offset"]=0
operation_parameters_maximum_occurrences["getSearchUsers:::after"]=0
operation_parameters_maximum_occurrences["getUser:::projectKey"]=0
operation_parameters_maximum_occurrences["getUser:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUser:::userKey"]=0
operation_parameters_maximum_occurrences["getUsers:::projectKey"]=0
operation_parameters_maximum_occurrences["getUsers:::environmentKey"]=0
operation_parameters_maximum_occurrences["getUsers:::limit"]=0
operation_parameters_maximum_occurrences["getUsers:::h"]=0
operation_parameters_maximum_occurrences["getUsers:::scrollId"]=0
operation_parameters_maximum_occurrences["deleteWebhook:::resourceId"]=0
operation_parameters_maximum_occurrences["getWebhook:::resourceId"]=0
operation_parameters_maximum_occurrences["patchWebhook:::resourceId"]=0
operation_parameters_maximum_occurrences["patchWebhook:::patchDelta"]=0
operation_parameters_maximum_occurrences["postWebhook:::webhookBody"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["getAuditLogEntries:::before"]=""
operation_parameters_collection_type["getAuditLogEntries:::after"]=""
operation_parameters_collection_type["getAuditLogEntries:::q"]=""
operation_parameters_collection_type["getAuditLogEntries:::limit"]=""
operation_parameters_collection_type["getAuditLogEntries:::spec"]=""
operation_parameters_collection_type["getAuditLogEntry:::resourceId"]=""
operation_parameters_collection_type["deleteCustomRole:::customRoleKey"]=""
operation_parameters_collection_type["getCustomRole:::customRoleKey"]=""
operation_parameters_collection_type["patchCustomRole:::customRoleKey"]=""
operation_parameters_collection_type["patchCustomRole:::patchDelta"]=
operation_parameters_collection_type["postCustomRole:::customRoleBody"]=""
operation_parameters_collection_type["deleteEnvironment:::projectKey"]=""
operation_parameters_collection_type["deleteEnvironment:::environmentKey"]=""
operation_parameters_collection_type["getEnvironment:::projectKey"]=""
operation_parameters_collection_type["getEnvironment:::environmentKey"]=""
operation_parameters_collection_type["patchEnvironment:::projectKey"]=""
operation_parameters_collection_type["patchEnvironment:::environmentKey"]=""
operation_parameters_collection_type["patchEnvironment:::patchDelta"]=
operation_parameters_collection_type["postEnvironment:::projectKey"]=""
operation_parameters_collection_type["postEnvironment:::environmentBody"]=""
operation_parameters_collection_type["deleteFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["deleteFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlag:::env"]=""
operation_parameters_collection_type["getFeatureFlagStatus:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagStatus:::environmentKey"]=""
operation_parameters_collection_type["getFeatureFlagStatus:::featureFlagKey"]=""
operation_parameters_collection_type["getFeatureFlagStatuses:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlagStatuses:::environmentKey"]=""
operation_parameters_collection_type["getFeatureFlags:::projectKey"]=""
operation_parameters_collection_type["getFeatureFlags:::env"]=""
operation_parameters_collection_type["getFeatureFlags:::tag"]=""
operation_parameters_collection_type["patchFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["patchFeatureFlag:::featureFlagKey"]=""
operation_parameters_collection_type["patchFeatureFlag:::patchComment"]=""
operation_parameters_collection_type["postFeatureFlag:::projectKey"]=""
operation_parameters_collection_type["postFeatureFlag:::featureFlagBody"]=""
operation_parameters_collection_type["deleteProject:::projectKey"]=""
operation_parameters_collection_type["getProject:::projectKey"]=""
operation_parameters_collection_type["patchProject:::projectKey"]=""
operation_parameters_collection_type["patchProject:::patchDelta"]=
operation_parameters_collection_type["postProject:::projectBody"]=""
operation_parameters_collection_type["deleteMember:::memberId"]=""
operation_parameters_collection_type["getMember:::memberId"]=""
operation_parameters_collection_type["patchMember:::memberId"]=""
operation_parameters_collection_type["patchMember:::patchDelta"]=
operation_parameters_collection_type["postMembers:::membersBody"]=
operation_parameters_collection_type["deleteUserSegment:::projectKey"]=""
operation_parameters_collection_type["deleteUserSegment:::environmentKey"]=""
operation_parameters_collection_type["deleteUserSegment:::userSegmentKey"]=""
operation_parameters_collection_type["getUserSegment:::projectKey"]=""
operation_parameters_collection_type["getUserSegment:::environmentKey"]=""
operation_parameters_collection_type["getUserSegment:::userSegmentKey"]=""
operation_parameters_collection_type["getUserSegments:::projectKey"]=""
operation_parameters_collection_type["getUserSegments:::environmentKey"]=""
operation_parameters_collection_type["getUserSegments:::tag"]=""
operation_parameters_collection_type["patchUserSegment:::projectKey"]=""
operation_parameters_collection_type["patchUserSegment:::environmentKey"]=""
operation_parameters_collection_type["patchUserSegment:::userSegmentKey"]=""
operation_parameters_collection_type["patchUserSegment:::PatchOnly"]=
operation_parameters_collection_type["postUserSegment:::projectKey"]=""
operation_parameters_collection_type["postUserSegment:::environmentKey"]=""
operation_parameters_collection_type["postUserSegment:::userSegmentBody"]=""
operation_parameters_collection_type["getUserFlagSetting:::projectKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::environmentKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::userKey"]=""
operation_parameters_collection_type["getUserFlagSetting:::featureFlagKey"]=""
operation_parameters_collection_type["getUserFlagSettings:::projectKey"]=""
operation_parameters_collection_type["getUserFlagSettings:::environmentKey"]=""
operation_parameters_collection_type["getUserFlagSettings:::userKey"]=""
operation_parameters_collection_type["putFlagSetting:::projectKey"]=""
operation_parameters_collection_type["putFlagSetting:::environmentKey"]=""
operation_parameters_collection_type["putFlagSetting:::userKey"]=""
operation_parameters_collection_type["putFlagSetting:::featureFlagKey"]=""
operation_parameters_collection_type["putFlagSetting:::userSettingsBody"]=""
operation_parameters_collection_type["deleteUser:::projectKey"]=""
operation_parameters_collection_type["deleteUser:::environmentKey"]=""
operation_parameters_collection_type["deleteUser:::userKey"]=""
operation_parameters_collection_type["getSearchUsers:::projectKey"]=""
operation_parameters_collection_type["getSearchUsers:::environmentKey"]=""
operation_parameters_collection_type["getSearchUsers:::q"]=""
operation_parameters_collection_type["getSearchUsers:::limit"]=""
operation_parameters_collection_type["getSearchUsers:::offset"]=""
operation_parameters_collection_type["getSearchUsers:::after"]=""
operation_parameters_collection_type["getUser:::projectKey"]=""
operation_parameters_collection_type["getUser:::environmentKey"]=""
operation_parameters_collection_type["getUser:::userKey"]=""
operation_parameters_collection_type["getUsers:::projectKey"]=""
operation_parameters_collection_type["getUsers:::environmentKey"]=""
operation_parameters_collection_type["getUsers:::limit"]=""
operation_parameters_collection_type["getUsers:::h"]=""
operation_parameters_collection_type["getUsers:::scrollId"]=""
operation_parameters_collection_type["deleteWebhook:::resourceId"]=""
operation_parameters_collection_type["getWebhook:::resourceId"]=""
operation_parameters_collection_type["patchWebhook:::resourceId"]=""
operation_parameters_collection_type["patchWebhook:::patchDelta"]=
operation_parameters_collection_type["postWebhook:::webhookBody"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""

##
# The user API key
apikey_auth_credential=""

##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/\t/%09/g' \
       -e 's/?/%3F/g' <<<"$raw_url");

    echo "$value"
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type="$1"

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo "${mime_type_abbreviations[$mime_type]}"
    else
        echo "$mime_type"
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""
    local api_key_header=""
    local api_key_header_in_cli=""
    api_key_header="Authorization"

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
        if [[ "${key}XX" == "${api_key_header}XX" ]]; then
            api_key_header_in_cli="YES"
        fi
    done
    #
    # If the api_key was not provided in the header, try one from the
    # environment variable
    #
    if [[ -z $api_key_header_in_cli && -n $apikey_auth_credential ]]; then
        headers_curl+="-H \"${api_key_header}: ${apikey_auth_credential}\""
    fi
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add conversion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    local body_json="-d '{"
    local count=0
    for key in "${!body_parameters[@]}"; do
        if [[ $((count++)) -gt 0 ]]; then
            body_json+=", "
        fi
        body_json+="\"${key}\": ${body_parameters[${key}]}"
    done
    body_json+="}'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_json}"
    fi
}

##############################################################################
#
# Helper method for showing error because for example echo in
# build_request_path() is evaluated as part of command line not printed on
# output. Anyway better idea for resource clean up ;-).
#
##############################################################################
ERROR_MSG=""
function finish {
    if [[ -n "$ERROR_MSG" ]]; then
        echo >&2 "${OFF}${RED}$ERROR_MSG"
        echo >&2 "${OFF}Check usage: '${script_name} --help'"
    fi
}
trap finish EXIT


##############################################################################
#
# Validate and build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    #
    # Check input parameters count against minimum and maximum required
    #
    if [[ "$force" = false ]]; then
        local was_error=""
        for qparam in "${query_params[@]}" "${path_params[@]}"; do
            local parameter_values
            mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

            #
            # Check if the number of provided values is not less than minimum required
            #
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too few values provided for '${qparam}' parameter."
                was_error=true
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too many values provided for '${qparam}' parameter"
                was_error=true
            fi
        done
        if [[ -n "$was_error" ]]; then
            exit 1
        fi
    fi

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        local path_regex="(.*)(\\{$pparam\\})(.*)"
        if [[ $path_template =~ $path_regex ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    local count=0
    for qparam in "${query_params[@]}"; do
        # Get the array of parameter values
        local parameter_value=""
        local parameter_values
        mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

        if [[ -n "${parameter_values[*]}" ]]; then
            if [[ $((count++)) -gt 0 ]]; then
                query_request_part+="&"
            fi
        fi


        #
        # Append parameters without specific cardinality
        #
        local collection_type="${operation_parameters_collection_type["${operation}:::${qparam}"]}"
        if [[ "${collection_type}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'mutli' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${collection_type}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${collection_type}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=","
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${collection_type}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=" "
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${collection_type}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="\\t"
                fi
                parameter_value+="${qvalue}"
            done
        else
            echo "Unsupported collection format \"${collection_type}\""
            exit 1
        fi

        if [[ -n "${parameter_value}" ]]; then
            query_request_part+="${parameter_value}"
        fi

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?${query_request_part}"
    fi

    echo "$path_template"
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

${BOLD}${WHITE}LaunchDarkly REST API command line client (API version 2.0.0)${OFF}

${BOLD}${WHITE}Usage${OFF}

  ${GREEN}${script_name}${OFF} [-h|--help] [-V|--version] [--about] [${RED}<curl-options>${OFF}]
           [-ac|--accept ${GREEN}<mime-type>${OFF}] [-ct,--content-type ${GREEN}<mime-type>${OFF}]
           [--host ${CYAN}<url>${OFF}] [--dry-run] [-nc|--no-colors] ${YELLOW}<operation>${OFF} [-h|--help]
           [${BLUE}<headers>${OFF}] [${MAGENTA}<parameters>${OFF}] [${MAGENTA}<body-parameters>${OFF}]

  - ${CYAN}<url>${OFF} - endpoint of the REST service without basepath

  - ${RED}<curl-options>${OFF} - any valid cURL options can be passed before ${YELLOW}<operation>${OFF}
  - ${GREEN}<mime-type>${OFF} - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - ${BLUE}<headers>${OFF} - HTTP headers can be passed in the form ${YELLOW}HEADER${OFF}:${BLUE}VALUE${OFF}
  - ${MAGENTA}<parameters>${OFF} - REST operation parameters can be passed in the following
                   forms:
                   * ${YELLOW}KEY${OFF}=${BLUE}VALUE${OFF} - path or query parameters
  - ${MAGENTA}<body-parameters>${OFF} - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * ${YELLOW}KEY${OFF}==${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": "${BLUE}VALUE${OFF}", ... }'
                        * ${YELLOW}KEY${OFF}:=${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": ${BLUE}VALUE${OFF}, ... }'

EOF
    echo -e "${BOLD}${WHITE}Authentication methods${OFF}"
    echo -e ""
    echo -e "  - ${BLUE}Api-key${OFF} - add '${RED}Authorization:<api-key>${OFF}' after ${YELLOW}<operation>${OFF}"
    
    echo ""
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[auditLog]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getAuditLogEntries${OFF};Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query. (AUTH)
  ${CYAN}getAuditLogEntry${OFF};Use this endpoint to fetch a single audit log entry by its resouce ID. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customRoles]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteCustomRole${OFF};Delete a custom role by key. (AUTH)
  ${CYAN}getCustomRole${OFF};Get one custom role by key. (AUTH)
  ${CYAN}getCustomRoles${OFF};Return a complete list of custom roles. (AUTH)
  ${CYAN}patchCustomRole${OFF};Modify a custom role by key. (AUTH)
  ${CYAN}postCustomRole${OFF};Create a new custom role. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[environments]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteEnvironment${OFF};Delete an environment in a specific project. (AUTH)
  ${CYAN}getEnvironment${OFF};Get an environment given a project and key. (AUTH)
  ${CYAN}patchEnvironment${OFF};Modify an environment by ID. (AUTH)
  ${CYAN}postEnvironment${OFF};Create a new environment in a specified project with a given name, key, and swatch color. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[featureFlags]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteFeatureFlag${OFF};Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application. (AUTH)
  ${CYAN}getFeatureFlag${OFF};Get a single feature flag by key. (AUTH)
  ${CYAN}getFeatureFlagStatus${OFF};Get the status for a particular feature flag. (AUTH)
  ${CYAN}getFeatureFlagStatuses${OFF};Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag. (AUTH)
  ${CYAN}getFeatureFlags${OFF};Get a list of all features in the given project. (AUTH)
  ${CYAN}patchFeatureFlag${OFF};Perform a partial update to a feature. (AUTH)
  ${CYAN}postFeatureFlag${OFF};Creates a new feature flag. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[projects]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteProject${OFF};Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account. (AUTH)
  ${CYAN}getProject${OFF};Fetch a single project by key. (AUTH)
  ${CYAN}getProjects${OFF};Returns a list of all projects in the account. (AUTH)
  ${CYAN}patchProject${OFF};Modify a project by ID. (AUTH)
  ${CYAN}postProject${OFF};Create a new project with the given key and name. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[root]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getRoot${OFF}; (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[teamMembers]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteMember${OFF};Delete a team member by ID. (AUTH)
  ${CYAN}getMember${OFF};Get a single team member by ID. (AUTH)
  ${CYAN}getMembers${OFF};Returns a list of all members in the account. (AUTH)
  ${CYAN}patchMember${OFF};Modify a team member by ID. (AUTH)
  ${CYAN}postMembers${OFF};Invite new members. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[userSegments]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteUserSegment${OFF};Delete a user segment. (AUTH)
  ${CYAN}getUserSegment${OFF};Get a single user segment by key. (AUTH)
  ${CYAN}getUserSegments${OFF};Get a list of all user segments in the given project. (AUTH)
  ${CYAN}patchUserSegment${OFF};Perform a partial update to a user segment. (AUTH)
  ${CYAN}postUserSegment${OFF};Creates a new user segment. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[userSettings]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getUserFlagSetting${OFF};Fetch a single flag setting for a user by key. (AUTH)
  ${CYAN}getUserFlagSettings${OFF};Fetch a single flag setting for a user by key. (AUTH)
  ${CYAN}putFlagSetting${OFF};Specifically enable or disable a feature flag for a user based on their key. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[users]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteUser${OFF};Delete a user by ID. (AUTH)
  ${CYAN}getSearchUsers${OFF};Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource. (AUTH)
  ${CYAN}getUser${OFF};Get a user by key. (AUTH)
  ${CYAN}getUsers${OFF};List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[webhooks]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteWebhook${OFF};Delete a webhook by ID. (AUTH)
  ${CYAN}getWebhook${OFF};Get a webhook by ID. (AUTH)
  ${CYAN}getWebhooks${OFF};Fetch a list of all webhooks. (AUTH)
  ${CYAN}patchWebhook${OFF};Modify a webhook by ID. (AUTH)
  ${CYAN}postWebhook${OFF};Create a webhook. (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://app.launchdarkly.com')"

    echo -e "  --force\\t\\t\\t\\tForce command invocation in spite of missing"
    echo -e "         \\t\\t\\t\\trequired parameters or wrong content type"
    echo -e "  --dry-run\\t\\t\\t\\tPrint out the cURL command without"
    echo -e "           \\t\\t\\t\\texecuting it"
    echo -e "  -nc,--no-colors\\t\\t\\tEnforce print without colors, otherwise autodected"
    echo -e "  -ac,--accept ${YELLOW}<mime-type>${OFF}\\t\\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type ${YELLOW}<mime-type>${OFF}\\tSet the 'Content-type' header in "
    echo -e "                                \\tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "${BOLD}${WHITE}LaunchDarkly REST API command line client (API version 2.0.0)${OFF}"
    echo ""
    echo -e "License: Apache 2.0"
    echo -e "Contact: support@launchdarkly.com"
    echo ""
read -r -d '' appdescription <<EOF

Build custom integrations with the LaunchDarkly REST API
EOF
echo "$appdescription" | paste -sd' ' | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "${BOLD}LaunchDarkly REST API command line client (API version 2.0.0)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for getAuditLogEntries operation
#
##############################################################################
print_getAuditLogEntries_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAuditLogEntries - Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}before${OFF} ${BLUE}[integer]${OFF}${OFF} - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have before this timestamp.${YELLOW} Specify as: before=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}after${OFF} ${BLUE}[integer]${OFF}${OFF} - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occured after this timestamp.${YELLOW} Specify as: after=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}q${OFF} ${BLUE}[string]${OFF}${OFF} - Text to search for. You can search for the full or partial name of the resource involved or fullpartial email address of the member who made the change.${YELLOW} Specify as: q=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - A limit on the number of audit log entries to be returned, between 1 and 20.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}spec${OFF} ${BLUE}[string]${OFF}${OFF} - A resource specifier, allowing you to filter audit log listings by resource.${YELLOW} Specify as: spec=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Audit log entries response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getAuditLogEntry operation
#
##############################################################################
print_getAuditLogEntry_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAuditLogEntry - Use this endpoint to fetch a single audit log entry by its resouce ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Audit log entry response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteCustomRole operation
#
##############################################################################
print_deleteCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteCustomRole - Delete a custom role by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customRoleKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The custom role key. ${YELLOW}Specify as: customRoleKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCustomRole operation
#
##############################################################################
print_getCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomRole - Get one custom role by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customRoleKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The custom role key. ${YELLOW}Specify as: customRoleKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Custom role response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCustomRoles operation
#
##############################################################################
print_getCustomRoles_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomRoles - Return a complete list of custom roles.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Custom roles response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchCustomRole operation
#
##############################################################################
print_patchCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchCustomRole - Modify a custom role by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}customRoleKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The custom role key. ${YELLOW}Specify as: customRoleKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Custom role response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postCustomRole operation
#
##############################################################################
print_postCustomRole_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postCustomRole - Create a new custom role.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New role or roles to create." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteEnvironment operation
#
##############################################################################
print_deleteEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteEnvironment - Delete an environment in a specific project.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getEnvironment operation
#
##############################################################################
print_getEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getEnvironment - Get an environment given a project and key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchEnvironment operation
#
##############################################################################
print_patchEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchEnvironment - Modify an environment by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Environment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postEnvironment operation
#
##############################################################################
print_postEnvironment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postEnvironment - Create a new environment in a specified project with a given name, key, and swatch color.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New environment." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteFeatureFlag operation
#
##############################################################################
print_deleteFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteFeatureFlag - Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlag operation
#
##############################################################################
print_getFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlag - Get a single feature flag by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}env${OFF} ${BLUE}[string]${OFF}${OFF} - By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=production will restrict the returned configurations to just your production environment.${YELLOW} Specify as: env=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Flag response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagStatus operation
#
##############################################################################
print_getFeatureFlagStatus_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagStatus - Get the status for a particular feature flag.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Status of the requested feature flag.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlagStatuses operation
#
##############################################################################
print_getFeatureFlagStatuses_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlagStatuses - Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;List of feature flag statuses.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getFeatureFlags operation
#
##############################################################################
print_getFeatureFlags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFeatureFlags - Get a list of all features in the given project.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}env${OFF} ${BLUE}[string]${OFF}${OFF} - By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=production will restrict the returned configurations to just your production environment.${YELLOW} Specify as: env=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag${OFF} ${BLUE}[string]${OFF}${OFF} - Filter by tag. A tag can be used to group flags across projects.${YELLOW} Specify as: tag=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Flags response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchFeatureFlag operation
#
##############################################################################
print_patchFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchFeatureFlag - Perform a partial update to a feature.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project, and an optional comment. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Feature flag response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postFeatureFlag operation
#
##############################################################################
print_postFeatureFlag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postFeatureFlag - Creates a new feature flag.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new feature flag." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteProject operation
#
##############################################################################
print_deleteProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteProject - Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getProject operation
#
##############################################################################
print_getProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getProject - Fetch a single project by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Project response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getProjects operation
#
##############################################################################
print_getProjects_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getProjects - Returns a list of all projects in the account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Projects response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchProject operation
#
##############################################################################
print_patchProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchProject - Modify a project by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Project response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postProject operation
#
##############################################################################
print_postProject_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postProject - Create a new project with the given key and name.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Project keys must be unique within an account." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getRoot operation
#
##############################################################################
print_getRoot_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRoot - ${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "You can issue a GET request to the root resource to find all of the resource categories supported by the API." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A list of links to available resources in the API.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteMember operation
#
##############################################################################
print_deleteMember_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteMember - Delete a team member by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}memberId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The member ID. ${YELLOW}Specify as: memberId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMember operation
#
##############################################################################
print_getMember_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMember - Get a single team member by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}memberId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The member ID. ${YELLOW}Specify as: memberId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Member response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getMembers operation
#
##############################################################################
print_getMembers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getMembers - Returns a list of all members in the account.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Projects response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchMember operation
#
##############################################################################
print_patchMember_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchMember - Modify a team member by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}memberId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The member ID. ${YELLOW}Specify as: memberId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Member response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postMembers operation
#
##############################################################################
print_postMembers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postMembers - Invite new members.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New members to invite." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUserSegment operation
#
##############################################################################
print_deleteUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUserSegment - Delete a user segment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserSegment operation
#
##############################################################################
print_getUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserSegment - Get a single user segment by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserSegments operation
#
##############################################################################
print_getUserSegments_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserSegments - Get a list of all user segments in the given project.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag${OFF} ${BLUE}[string]${OFF}${OFF} - Filter by tag. A tag can be used to group flags across projects.${YELLOW} Specify as: tag=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Segments response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchUserSegment operation
#
##############################################################################
print_patchUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchUserSegment - Perform a partial update to a user segment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userSegmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user segment's key. The key identifies the user segment in your code. ${YELLOW}Specify as: userSegmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User segment response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postUserSegment operation
#
##############################################################################
print_postUserSegment_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postUserSegment - Creates a new user segment.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Create a new user segment." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserFlagSetting operation
#
##############################################################################
print_getUserFlagSetting_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserFlagSetting - Fetch a single flag setting for a user by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User flag setting response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserFlagSettings operation
#
##############################################################################
print_getUserFlagSettings_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserFlagSettings - Fetch a single flag setting for a user by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User flags settings response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for putFlagSetting operation
#
##############################################################################
print_putFlagSetting_help() {
    echo ""
    echo -e "${BOLD}${WHITE}putFlagSetting - Specifically enable or disable a feature flag for a user based on their key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}featureFlagKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The feature flag's key. The key identifies the flag in your code. ${YELLOW}Specify as: featureFlagKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUser operation
#
##############################################################################
print_deleteUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUser - Delete a user by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getSearchUsers operation
#
##############################################################################
print_getSearchUsers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getSearchUsers - Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}q${OFF} ${BLUE}[string]${OFF}${OFF} - Search query.${YELLOW} Specify as: q=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - Pagination limit.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF}${OFF} - Specifies the first item to return in the collection.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}after${OFF} ${BLUE}[integer]${OFF}${OFF} - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occured after this timestamp.${YELLOW} Specify as: after=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Users response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUser operation
#
##############################################################################
print_getUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUser - Get a user by key.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The user's key. ${YELLOW}Specify as: userKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUsers operation
#
##############################################################################
print_getUsers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUsers - List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}projectKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The project key, used to tie the flags together under one project so they can be managed together. ${YELLOW}Specify as: projectKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}environmentKey${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. ${YELLOW}Specify as: environmentKey=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF}${OFF} - Pagination limit.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}h${OFF} ${BLUE}[string]${OFF}${OFF} - This parameter is required when following \"next\" links.${YELLOW} Specify as: h=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}scrollId${OFF} ${BLUE}[string]${OFF}${OFF} - This parameter is required when following \"next\" links.${YELLOW} Specify as: scrollId=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Users response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteWebhook operation
#
##############################################################################
print_deleteWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteWebhook - Delete a webhook by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Action completed successfully.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getWebhook operation
#
##############################################################################
print_getWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getWebhook - Get a webhook by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Webhook response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getWebhooks operation
#
##############################################################################
print_getWebhooks_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getWebhooks - Fetch a list of all webhooks.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Webhooks response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for patchWebhook operation
#
##############################################################################
print_patchWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}patchWebhook - Modify a webhook by ID.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}resourceId${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - The resource ID. ${YELLOW}Specify as: resourceId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/'" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Webhook response.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Invalid resource specifier.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=409
    echo -e "${result_color_table[${code:0:1}]}  409;Status conflict.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postWebhook operation
#
##############################################################################
print_postWebhook_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postWebhook - Create a webhook.${OFF}${BLUE}(AUTH - HEADER)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - New webhook." | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Resource created.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Invalid request body.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Invalid access token.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}


##############################################################################
#
# Call getAuditLogEntries operation
#
##############################################################################
call_getAuditLogEntries() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(before after q limit spec  )
    local path

    if ! path=$(build_request_path "/api/v2/auditlog" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getAuditLogEntry operation
#
##############################################################################
call_getAuditLogEntry() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/auditlog/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteCustomRole operation
#
##############################################################################
call_deleteCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(customRoleKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles/{customRoleKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCustomRole operation
#
##############################################################################
call_getCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(customRoleKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles/{customRoleKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCustomRoles operation
#
##############################################################################
call_getCustomRoles() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchCustomRole operation
#
##############################################################################
call_patchCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(customRoleKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles/{customRoleKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postCustomRole operation
#
##############################################################################
call_postCustomRole() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/roles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteEnvironment operation
#
##############################################################################
call_deleteEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getEnvironment operation
#
##############################################################################
call_getEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchEnvironment operation
#
##############################################################################
call_patchEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postEnvironment operation
#
##############################################################################
call_postEnvironment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}/environments" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteFeatureFlag operation
#
##############################################################################
call_deleteFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlag operation
#
##############################################################################
call_getFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(env  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagStatus operation
#
##############################################################################
call_getFeatureFlagStatus() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flag-statuses/{projectKey}/{environmentKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlagStatuses operation
#
##############################################################################
call_getFeatureFlagStatuses() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flag-statuses/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getFeatureFlags operation
#
##############################################################################
call_getFeatureFlags() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(env tag  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchFeatureFlag operation
#
##############################################################################
call_patchFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postFeatureFlag operation
#
##############################################################################
call_postFeatureFlag() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/flags/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteProject operation
#
##############################################################################
call_deleteProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getProject operation
#
##############################################################################
call_getProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getProjects operation
#
##############################################################################
call_getProjects() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchProject operation
#
##############################################################################
call_patchProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects/{projectKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postProject operation
#
##############################################################################
call_postProject() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/projects" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call getRoot operation
#
##############################################################################
call_getRoot() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteMember operation
#
##############################################################################
call_deleteMember() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(memberId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/{memberId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMember operation
#
##############################################################################
call_getMember() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(memberId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/{memberId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getMembers operation
#
##############################################################################
call_getMembers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchMember operation
#
##############################################################################
call_patchMember() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(memberId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members/{memberId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postMembers operation
#
##############################################################################
call_postMembers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/members" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUserSegment operation
#
##############################################################################
call_deleteUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserSegment operation
#
##############################################################################
call_getUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserSegments operation
#
##############################################################################
call_getUserSegments() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(tag  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchUserSegment operation
#
##############################################################################
call_patchUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userSegmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}/{userSegmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postUserSegment operation
#
##############################################################################
call_postUserSegment() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/segments/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call getUserFlagSetting operation
#
##############################################################################
call_getUserFlagSetting() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserFlagSettings operation
#
##############################################################################
call_getUserFlagSettings() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call putFlagSetting operation
#
##############################################################################
call_putFlagSetting() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey featureFlagKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}/flags/{featureFlagKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUser operation
#
##############################################################################
call_deleteUser() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getSearchUsers operation
#
##############################################################################
call_getSearchUsers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(q limit offset after  )
    local path

    if ! path=$(build_request_path "/api/v2/user-search/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUser operation
#
##############################################################################
call_getUser() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey userKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}/{userKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUsers operation
#
##############################################################################
call_getUsers() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(projectKey environmentKey)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit h scrollId  )
    local path

    if ! path=$(build_request_path "/api/v2/users/{projectKey}/{environmentKey}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteWebhook operation
#
##############################################################################
call_deleteWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getWebhook operation
#
##############################################################################
call_getWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getWebhooks operation
#
##############################################################################
call_getWebhooks() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call patchWebhook operation
#
##############################################################################
call_patchWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(resourceId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks/{resourceId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call postWebhook operation
#
##############################################################################
call_postWebhook() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v2/webhooks" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguments before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    -nc|--no-colors)
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""
        BOLD=""
        OFF=""
        result_color_table=( "" "" "" "" "" "" "" )
    ;;
    getAuditLogEntries)
    operation="getAuditLogEntries"
    ;;
    getAuditLogEntry)
    operation="getAuditLogEntry"
    ;;
    deleteCustomRole)
    operation="deleteCustomRole"
    ;;
    getCustomRole)
    operation="getCustomRole"
    ;;
    getCustomRoles)
    operation="getCustomRoles"
    ;;
    patchCustomRole)
    operation="patchCustomRole"
    ;;
    postCustomRole)
    operation="postCustomRole"
    ;;
    deleteEnvironment)
    operation="deleteEnvironment"
    ;;
    getEnvironment)
    operation="getEnvironment"
    ;;
    patchEnvironment)
    operation="patchEnvironment"
    ;;
    postEnvironment)
    operation="postEnvironment"
    ;;
    deleteFeatureFlag)
    operation="deleteFeatureFlag"
    ;;
    getFeatureFlag)
    operation="getFeatureFlag"
    ;;
    getFeatureFlagStatus)
    operation="getFeatureFlagStatus"
    ;;
    getFeatureFlagStatuses)
    operation="getFeatureFlagStatuses"
    ;;
    getFeatureFlags)
    operation="getFeatureFlags"
    ;;
    patchFeatureFlag)
    operation="patchFeatureFlag"
    ;;
    postFeatureFlag)
    operation="postFeatureFlag"
    ;;
    deleteProject)
    operation="deleteProject"
    ;;
    getProject)
    operation="getProject"
    ;;
    getProjects)
    operation="getProjects"
    ;;
    patchProject)
    operation="patchProject"
    ;;
    postProject)
    operation="postProject"
    ;;
    getRoot)
    operation="getRoot"
    ;;
    deleteMember)
    operation="deleteMember"
    ;;
    getMember)
    operation="getMember"
    ;;
    getMembers)
    operation="getMembers"
    ;;
    patchMember)
    operation="patchMember"
    ;;
    postMembers)
    operation="postMembers"
    ;;
    deleteUserSegment)
    operation="deleteUserSegment"
    ;;
    getUserSegment)
    operation="getUserSegment"
    ;;
    getUserSegments)
    operation="getUserSegments"
    ;;
    patchUserSegment)
    operation="patchUserSegment"
    ;;
    postUserSegment)
    operation="postUserSegment"
    ;;
    getUserFlagSetting)
    operation="getUserFlagSetting"
    ;;
    getUserFlagSettings)
    operation="getUserFlagSettings"
    ;;
    putFlagSetting)
    operation="putFlagSetting"
    ;;
    deleteUser)
    operation="deleteUser"
    ;;
    getSearchUsers)
    operation="getSearchUsers"
    ;;
    getUser)
    operation="getUser"
    ;;
    getUsers)
    operation="getUsers"
    ;;
    deleteWebhook)
    operation="deleteWebhook"
    ;;
    getWebhook)
    operation="getWebhook"
    ;;
    getWebhooks)
    operation="getWebhooks"
    ;;
    patchWebhook)
    operation="patchWebhook"
    ;;
    postWebhook)
    operation="postWebhook"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without qoutes
    if [[ "$operation" ]]; then
        # ignore error about 'sep' being unused
        # shellcheck disable=SC2034
        IFS=':=' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    +\([^=]\):*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read -r header_name header_value <<< "$key"
        #
        # If the header key is the same as the api_key expected by API in the
        # header, override the ${apikey_auth_credential} variable
        #
        if [[ $header_name == "Authorization" ]]; then
            apikey_auth_credential=$header_value
        fi
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > "$body_content_temp_file"
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read -r parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    ERROR_MSG="ERROR: No hostname provided!!! You have to  provide on command line option '--host ...'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    ERROR_MSG="ERROR: No operation specified!!!"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    getAuditLogEntries)
    call_getAuditLogEntries
    ;;
    getAuditLogEntry)
    call_getAuditLogEntry
    ;;
    deleteCustomRole)
    call_deleteCustomRole
    ;;
    getCustomRole)
    call_getCustomRole
    ;;
    getCustomRoles)
    call_getCustomRoles
    ;;
    patchCustomRole)
    call_patchCustomRole
    ;;
    postCustomRole)
    call_postCustomRole
    ;;
    deleteEnvironment)
    call_deleteEnvironment
    ;;
    getEnvironment)
    call_getEnvironment
    ;;
    patchEnvironment)
    call_patchEnvironment
    ;;
    postEnvironment)
    call_postEnvironment
    ;;
    deleteFeatureFlag)
    call_deleteFeatureFlag
    ;;
    getFeatureFlag)
    call_getFeatureFlag
    ;;
    getFeatureFlagStatus)
    call_getFeatureFlagStatus
    ;;
    getFeatureFlagStatuses)
    call_getFeatureFlagStatuses
    ;;
    getFeatureFlags)
    call_getFeatureFlags
    ;;
    patchFeatureFlag)
    call_patchFeatureFlag
    ;;
    postFeatureFlag)
    call_postFeatureFlag
    ;;
    deleteProject)
    call_deleteProject
    ;;
    getProject)
    call_getProject
    ;;
    getProjects)
    call_getProjects
    ;;
    patchProject)
    call_patchProject
    ;;
    postProject)
    call_postProject
    ;;
    getRoot)
    call_getRoot
    ;;
    deleteMember)
    call_deleteMember
    ;;
    getMember)
    call_getMember
    ;;
    getMembers)
    call_getMembers
    ;;
    patchMember)
    call_patchMember
    ;;
    postMembers)
    call_postMembers
    ;;
    deleteUserSegment)
    call_deleteUserSegment
    ;;
    getUserSegment)
    call_getUserSegment
    ;;
    getUserSegments)
    call_getUserSegments
    ;;
    patchUserSegment)
    call_patchUserSegment
    ;;
    postUserSegment)
    call_postUserSegment
    ;;
    getUserFlagSetting)
    call_getUserFlagSetting
    ;;
    getUserFlagSettings)
    call_getUserFlagSettings
    ;;
    putFlagSetting)
    call_putFlagSetting
    ;;
    deleteUser)
    call_deleteUser
    ;;
    getSearchUsers)
    call_getSearchUsers
    ;;
    getUser)
    call_getUser
    ;;
    getUsers)
    call_getUsers
    ;;
    deleteWebhook)
    call_deleteWebhook
    ;;
    getWebhook)
    call_getWebhook
    ;;
    getWebhooks)
    call_getWebhooks
    ;;
    patchWebhook)
    call_patchWebhook
    ;;
    postWebhook)
    call_postWebhook
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac