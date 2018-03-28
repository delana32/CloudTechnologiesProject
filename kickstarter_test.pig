register '/usr/local/pig/lib/*.jar';
define JsonStringToMap 
	com.twitter.elephantbird.pig.piggybank.JsonStringToMap();



A1= LOAD 'kickstarter_test.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS (backers_count:int,blurb:chararray,category:chararray,converted_pledged_amount:double,country:chararray,created_at:long,creator:chararray,currency:chararray,currency_symbol:chararray,currency_trailing_code:chararray,current_currency:chararray,deadline:long,disable_communication:chararray,fx_rate:int,goal:double,id:int,is_starrable:chararray,launched_at:long,name:chararray,photo:chararray,pledged:chararray,profile:chararray,slug,source_url:chararray,spotlight:chararray,staff_pick:chararray,state:chararray,state_changed_at:long,static_usd_rate:chararray,urls:chararray,usd_pledged:chararray,usd_type:chararray,location:chararray,friends:chararray,is_backing:chararray,is_starred:chararray,permissions:chararray);


A1_DATES = FOREACH A1 GENERATE backers_count, blurb, category, converted_pledged_amount, country, ToDate(created_at) as creation_ts, creator, currency, current_currency,ToDate(deadline) as deadline_ts,fx_rate,goal,id,ToDate(launched_at) as launched_ts,name,pledged,state,ToDate(state_changed_at) as state_changed_ts,static_usd_rate,usd_pledged,usd_type,location;


A1_JSON = FOREACH A1_DATES GENERATE backers_count, blurb, JsonStringToMap(category) AS CATEGORY,converted_pledged_amount,country,creation_ts, JsonStringToMap(creator) as CREATOR, currency, current_currency, deadline_ts, fx_rate, goal, id, launched_ts, name, pledged, state, state_changed_ts, static_usd_rate, usd_pledged,usd_type,JsonStringToMap(location) as LOCATION;


A1_CATEGORY = FOREACH A1_JSON GENERATE backers_count,blurb,  CATEGORY#'name' as category, converted_pledged_amount, country, creation_ts, CREATOR#'name' as creator, CREATOR#'id' as creator_id, currency, current_currency, deadline_ts, fx_rate, goal, id, launched_ts, name, pledged, state, state_changed_ts, static_usd_rate, usd_pledged, usd_type, LOCATION#'name' as location ;


A1_group = GROUP A1_CATEGORY ALL;
COUNT_A1 = FOREACH A1_group GENERATE COUNT(A1_CATEGORY);
DUMP COUNT_A1
--DUMP A1_CATEGORY;
