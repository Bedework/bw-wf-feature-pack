--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bw_admingroupmembers; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_admingroupmembers (
    bw_groupid integer NOT NULL,
    memberid integer NOT NULL,
    member_is_group character(1) NOT NULL
);


ALTER TABLE public.bw_admingroupmembers OWNER TO bw;

--
-- Name: bw_admingroups; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_admingroups (
    bw_groupid integer NOT NULL,
    bwseq integer NOT NULL,
    account character varying(255) NOT NULL,
    bw_principal_ref character varying(255) NOT NULL,
    description character varying(2000),
    bw_group_owner character varying(255) NOT NULL,
    bw_owner character varying(255) NOT NULL
);


ALTER TABLE public.bw_admingroups OWNER TO bw;

--
-- Name: bw_alarm_attendees; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_alarm_attendees (
    alarmid integer NOT NULL,
    attendeeid integer NOT NULL
);


ALTER TABLE public.bw_alarm_attendees OWNER TO bw;

--
-- Name: bw_alarm_xprops; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_alarm_xprops (
    alarmid integer NOT NULL,
    bwxp_position integer NOT NULL,
    bw_name character varying(100),
    bw_pars character varying(4000),
    bw_value text
);


ALTER TABLE public.bw_alarm_xprops OWNER TO bw;

--
-- Name: bw_alarmdescriptions; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_alarmdescriptions (
    bw_alarmid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_alarmdescriptions OWNER TO bw;

--
-- Name: bw_alarms; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_alarms (
    alarmid integer NOT NULL,
    bwseq integer NOT NULL,
    alarm_type integer,
    bw_owner character varying(255) NOT NULL,
    publick character(1) NOT NULL,
    trigger_rfctime character varying(16),
    trigger_start character(1) NOT NULL,
    duration character varying(100),
    repetitions integer,
    attach character varying(2000),
    expired character(1) NOT NULL
);


ALTER TABLE public.bw_alarms OWNER TO bw;

--
-- Name: bw_alarmsummaries; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_alarmsummaries (
    bw_alarmid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_alarmsummaries OWNER TO bw;

--
-- Name: bw_attachments; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_attachments (
    bwid integer NOT NULL,
    bw_fmttype character varying(20),
    bw_valuetype character varying(20),
    bw_encoding character varying(2000),
    bw_uri character varying(2000),
    bw_value text
);


ALTER TABLE public.bw_attachments OWNER TO bw;

--
-- Name: bw_attendees; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_attendees (
    attendeeid integer NOT NULL,
    cn character varying(2000),
    cutype character varying(2000),
    delegated_from character varying(2000),
    delegated_to character varying(2000),
    dir character varying(2000),
    lang character varying(100),
    member character varying(2000),
    rsvp character(1),
    role character varying(200),
    partstat character varying(100),
    sent_by character varying(2000),
    attendee_uri character varying(2000),
    rfcsequence integer,
    bw_sched_agent integer,
    bw_sched_status character varying(100),
    dtstamp character varying(16)
);


ALTER TABLE public.bw_attendees OWNER TO bw;

--
-- Name: bw_auth; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_auth (
    userid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_user character varying(255) NOT NULL,
    autoaddcategories character(1) NOT NULL,
    autoaddlocations character(1) NOT NULL,
    autoaddcontacts character(1) NOT NULL,
    autoaddcalendars character(1) NOT NULL,
    usertype integer
);


ALTER TABLE public.bw_auth OWNER TO bw;

--
-- Name: bw_authprefcalendars; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_authprefcalendars (
    userid integer NOT NULL,
    calendarid integer NOT NULL
);


ALTER TABLE public.bw_authprefcalendars OWNER TO bw;

--
-- Name: bw_authprefcategories; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_authprefcategories (
    userid integer NOT NULL,
    categoryid integer NOT NULL
);


ALTER TABLE public.bw_authprefcategories OWNER TO bw;

--
-- Name: bw_authprefcontacts; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_authprefcontacts (
    userid integer NOT NULL,
    contactid integer NOT NULL
);


ALTER TABLE public.bw_authprefcontacts OWNER TO bw;

--
-- Name: bw_authpreflocations; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_authpreflocations (
    userid integer NOT NULL,
    locationid integer NOT NULL
);


ALTER TABLE public.bw_authpreflocations OWNER TO bw;

--
-- Name: bw_calendar_categories; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_calendar_categories (
    calendarid integer NOT NULL,
    categoryid integer NOT NULL
);


ALTER TABLE public.bw_calendar_categories OWNER TO bw;

--
-- Name: bw_calendar_properties; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_calendar_properties (
    bwid integer NOT NULL,
    bw_name character varying(200),
    bw_value text
);


ALTER TABLE public.bw_calendar_properties OWNER TO bw;

--
-- Name: bw_calendars; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_calendars (
    id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    calname character varying(100) NOT NULL,
    bwpath character varying(3000) NOT NULL,
    bw_col_path character varying(3000),
    summary character varying(500),
    description character varying(1000),
    mail_list_id character varying(200),
    caltype integer NOT NULL,
    bw_created character varying(16) NOT NULL,
    bw_filterexpr text,
    bw_alias_uri character varying(500),
    display character(1) NOT NULL,
    affects_free_busy character(1) NOT NULL,
    ignore_transparency character(1) NOT NULL,
    unremoveable character(1) NOT NULL,
    bwrefreshseconds integer,
    bwlastrefresh character varying(16),
    bwlastetag character varying(256),
    bwrid character varying(256),
    bwrpw character varying(500)
);


ALTER TABLE public.bw_calendars OWNER TO bw;

--
-- Name: bw_calsuites; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_calsuites (
    csid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    csname character varying(255) NOT NULL,
    groupid integer NOT NULL,
    bw_root_collection character varying(3000),
    bw_submissions_root character varying(3000)
);


ALTER TABLE public.bw_calsuites OWNER TO bw;

--
-- Name: bw_categories; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_categories (
    categoryid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    bw_catwdid integer NOT NULL,
    bw_catdescid integer,
    bw_uid character varying(50) NOT NULL
);


ALTER TABLE public.bw_categories OWNER TO bw;

--
-- Name: bw_collection_lastmods; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_collection_lastmods (
    bw_id integer NOT NULL,
    bwpath character varying(3000) NOT NULL,
    bw_timestamp character varying(16) NOT NULL,
    bw_sequence integer
);


ALTER TABLE public.bw_collection_lastmods OWNER TO bw;

--
-- Name: bw_contacts; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_contacts (
    entityid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    bw_uid character varying(50) NOT NULL,
    bw_connameid integer NOT NULL,
    bw_phone character varying(255),
    bw_email character varying(255),
    bw_link character varying(500)
);


ALTER TABLE public.bw_contacts OWNER TO bw;

--
-- Name: bw_entity_alarms; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_entity_alarms (
    eventid integer NOT NULL,
    alarmid integer NOT NULL
);


ALTER TABLE public.bw_entity_alarms OWNER TO bw;

--
-- Name: bw_entity_attachments; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_entity_attachments (
    eventid integer NOT NULL,
    attachid integer NOT NULL
);


ALTER TABLE public.bw_entity_attachments OWNER TO bw;

--
-- Name: bw_event_annotations; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_annotations (
    eventid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_entity_type integer,
    bw_col_path character varying(3000) NOT NULL,
    eventname character varying(500),
    bw_uid character varying(1000),
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1),
    start_date_type character(1),
    start_tzid character varying(255),
    start_dtval character varying(16),
    start_date character varying(16),
    bw_start_floating character(1),
    end_date_type character(1),
    end_tzid character varying(255),
    end_dtval character varying(16),
    end_date character varying(16),
    bw_end_floating character(1),
    duration character varying(255),
    end_type character(1),
    bw_nostart character(1),
    bw_deleted character(1),
    bwtombstoned character(1) NOT NULL,
    bw_class character varying(250),
    bw_link character varying(500),
    bw_geolatitude numeric(19,2),
    bw_geolongitude numeric(19,2),
    status character varying(255),
    cost character varying(255),
    bw_dtstamp character varying(16),
    bw_lastmod character varying(16),
    bw_created character varying(16),
    bw_stag character varying(21),
    priority integer,
    locationid integer,
    rfcsequence integer,
    transparency character varying(100),
    percent_complete integer,
    completed character varying(16),
    recurring character(1),
    recurrence_id character varying(16),
    latest_date character varying(255),
    schedule_method integer,
    originator character varying(255),
    bw_org_cn character varying(500),
    bw_org_dir character varying(500),
    bw_org_lang character varying(100),
    bw_org_sentby character varying(500),
    bw_org_uri character varying(500),
    bw_org_sched_status character varying(100),
    bw_org_dtstamp character varying(16),
    bw_reltype character varying(100),
    bw_reltoval character varying(500),
    schedule_state integer,
    targetid integer,
    masterid integer,
    bw_override character(1) NOT NULL,
    bw_empty_flags character varying(200)
);


ALTER TABLE public.bw_event_annotations OWNER TO bw;

--
-- Name: bw_event_attendees; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_attendees (
    eventid integer NOT NULL,
    attendeeid integer NOT NULL
);


ALTER TABLE public.bw_event_attendees OWNER TO bw;

--
-- Name: bw_event_availuids; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_availuids (
    eventid integer NOT NULL,
    avluid character varying(255) NOT NULL
);


ALTER TABLE public.bw_event_availuids OWNER TO bw;

--
-- Name: bw_event_categories; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_categories (
    eventid integer NOT NULL,
    categoryid integer NOT NULL
);


ALTER TABLE public.bw_event_categories OWNER TO bw;

--
-- Name: bw_event_comments; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_comments (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_event_comments OWNER TO bw;

--
-- Name: bw_event_contacts; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_contacts (
    eventid integer NOT NULL,
    contactid integer NOT NULL
);


ALTER TABLE public.bw_event_contacts OWNER TO bw;

--
-- Name: bw_event_descriptions; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_descriptions (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_event_descriptions OWNER TO bw;

--
-- Name: bw_event_exdates; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_exdates (
    eventid integer NOT NULL,
    ex_date_type character(1) NOT NULL,
    ex_tzid character varying(255),
    ex_dtval character varying(16) NOT NULL,
    ex_date character varying(16) NOT NULL
);


ALTER TABLE public.bw_event_exdates OWNER TO bw;

--
-- Name: bw_event_exrules; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_exrules (
    eventid integer NOT NULL,
    exrule character varying(255) NOT NULL
);


ALTER TABLE public.bw_event_exrules OWNER TO bw;

--
-- Name: bw_event_rdates; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_rdates (
    eventid integer NOT NULL,
    r_date_type character(1) NOT NULL,
    r_tzid character varying(255),
    r_dtval character varying(16) NOT NULL,
    r_date character varying(16) NOT NULL
);


ALTER TABLE public.bw_event_rdates OWNER TO bw;

--
-- Name: bw_event_recipients; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_recipients (
    eventid integer NOT NULL,
    recipient character varying(255) NOT NULL
);


ALTER TABLE public.bw_event_recipients OWNER TO bw;

--
-- Name: bw_event_resources; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_resources (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_event_resources OWNER TO bw;

--
-- Name: bw_event_rrules; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_rrules (
    eventid integer NOT NULL,
    rrule character varying(255) NOT NULL
);


ALTER TABLE public.bw_event_rrules OWNER TO bw;

--
-- Name: bw_event_summaries; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_summaries (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_event_summaries OWNER TO bw;

--
-- Name: bw_event_xprops; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_event_xprops (
    bw_eventid integer NOT NULL,
    bwxp_position integer NOT NULL,
    bw_name character varying(100),
    bw_pars character varying(4000),
    bw_value text
);


ALTER TABLE public.bw_event_xprops OWNER TO bw;

--
-- Name: bw_eventann_alarms; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_alarms (
    eventid integer NOT NULL,
    alarmid integer NOT NULL
);


ALTER TABLE public.bw_eventann_alarms OWNER TO bw;

--
-- Name: bw_eventann_attachments; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_attachments (
    eventid integer NOT NULL,
    attachid integer NOT NULL
);


ALTER TABLE public.bw_eventann_attachments OWNER TO bw;

--
-- Name: bw_eventann_attendees; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_attendees (
    eventid integer NOT NULL,
    attendeeid integer NOT NULL
);


ALTER TABLE public.bw_eventann_attendees OWNER TO bw;

--
-- Name: bw_eventann_categories; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_categories (
    eventid integer NOT NULL,
    categoryid integer NOT NULL
);


ALTER TABLE public.bw_eventann_categories OWNER TO bw;

--
-- Name: bw_eventann_comments; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_comments (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_eventann_comments OWNER TO bw;

--
-- Name: bw_eventann_contacts; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_contacts (
    eventid integer NOT NULL,
    contactid integer NOT NULL
);


ALTER TABLE public.bw_eventann_contacts OWNER TO bw;

--
-- Name: bw_eventann_descriptions; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_descriptions (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_eventann_descriptions OWNER TO bw;

--
-- Name: bw_eventann_exdates; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_exdates (
    eventid integer NOT NULL,
    ex_date_type character(1) NOT NULL,
    ex_tzid character varying(255),
    ex_dtval character varying(16) NOT NULL,
    ex_date character varying(16) NOT NULL
);


ALTER TABLE public.bw_eventann_exdates OWNER TO bw;

--
-- Name: bw_eventann_exrules; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_exrules (
    eventid integer NOT NULL,
    exrule character varying(255) NOT NULL
);


ALTER TABLE public.bw_eventann_exrules OWNER TO bw;

--
-- Name: bw_eventann_rdates; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_rdates (
    eventid integer NOT NULL,
    r_date_type character(1) NOT NULL,
    r_tzid character varying(255),
    r_dtval character varying(16) NOT NULL,
    r_date character varying(16) NOT NULL
);


ALTER TABLE public.bw_eventann_rdates OWNER TO bw;

--
-- Name: bw_eventann_recipients; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_recipients (
    eventid integer NOT NULL,
    recipient character varying(255) NOT NULL
);


ALTER TABLE public.bw_eventann_recipients OWNER TO bw;

--
-- Name: bw_eventann_resources; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_resources (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_eventann_resources OWNER TO bw;

--
-- Name: bw_eventann_rrules; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_rrules (
    eventid integer NOT NULL,
    rrule character varying(255)
);


ALTER TABLE public.bw_eventann_rrules OWNER TO bw;

--
-- Name: bw_eventann_rstatus; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_rstatus (
    eventid integer NOT NULL,
    bw_rscode character varying(100),
    bw_rsdescid integer,
    bw_rsdata character varying(250)
);


ALTER TABLE public.bw_eventann_rstatus OWNER TO bw;

--
-- Name: bw_eventann_summaries; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_summaries (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_eventann_summaries OWNER TO bw;

--
-- Name: bw_eventann_xprops; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_eventann_xprops (
    bw_eventannid integer NOT NULL,
    bwxp_position integer NOT NULL,
    bw_name character varying(100),
    bw_pars character varying(4000),
    bw_value text
);


ALTER TABLE public.bw_eventann_xprops OWNER TO bw;

--
-- Name: bw_events; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_events (
    eventid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_entity_type integer,
    bw_col_path character varying(3000) NOT NULL,
    bw_uid character varying(1000),
    eventname character varying(500),
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    start_date_type character(1),
    start_tzid character varying(255),
    start_dtval character varying(16),
    start_date character varying(16),
    bw_start_floating character(1),
    end_date_type character(1),
    end_tzid character varying(255),
    end_dtval character varying(16),
    end_date character varying(16),
    bw_end_floating character(1),
    duration character varying(255),
    end_type character(1) NOT NULL,
    bw_nostart character(1) NOT NULL,
    bw_deleted character(1) NOT NULL,
    bwtombstoned character(1) NOT NULL,
    bw_class character varying(250),
    bw_link character varying(500),
    bw_geolatitude numeric(19,2),
    bw_geolongitude numeric(19,2),
    status character varying(255),
    cost character varying(255),
    bw_dtstamp character varying(16),
    bw_lastmod character varying(16) NOT NULL,
    bw_created character varying(16) NOT NULL,
    bw_stag character varying(21),
    priority integer,
    locationid integer,
    rfcsequence integer,
    transparency character varying(100),
    percent_complete integer,
    completed character varying(16),
    recurring character(1) NOT NULL,
    recurrence_id character varying(16),
    latest_date character varying(255),
    schedule_method integer,
    originator character varying(255),
    bw_org_cn character varying(500),
    bw_org_dir character varying(500),
    bw_org_lang character varying(100),
    bw_org_sentby character varying(500),
    bw_org_uri character varying(500),
    bw_org_sched_status character varying(100),
    bw_org_dtstamp character varying(16),
    bw_reltype character varying(100),
    bw_reltoval character varying(500),
    schedule_state integer,
    bw_org_scheduleobj boolean NOT NULL,
    bw_att_scheduleobj boolean NOT NULL,
    busy_type integer
);


ALTER TABLE public.bw_events OWNER TO bw;

--
-- Name: bw_fbcomp; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_fbcomp (
    bwid integer NOT NULL,
    bwseq integer NOT NULL,
    bwtype integer,
    bwvalue character varying(3900),
    eventid integer,
    fbcomp_position integer
);


ALTER TABLE public.bw_fbcomp OWNER TO bw;

--
-- Name: bw_filter_descriptions; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_filter_descriptions (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_filter_descriptions OWNER TO bw;

--
-- Name: bw_filter_display_names; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_filter_display_names (
    bw_eventid integer NOT NULL,
    bw_strid integer NOT NULL
);


ALTER TABLE public.bw_filter_display_names OWNER TO bw;

--
-- Name: bw_filters; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_filters (
    filterid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_owner character varying(255),
    publick character(1) NOT NULL,
    filtername character varying(200),
    bwdefinition text
);


ALTER TABLE public.bw_filters OWNER TO bw;

--
-- Name: bw_group_members; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_group_members (
    groupid integer NOT NULL,
    memberid integer NOT NULL,
    member_is_group character(1) NOT NULL
);


ALTER TABLE public.bw_group_members OWNER TO bw;

--
-- Name: bw_groups; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_groups (
    bw_group_id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_account character varying(200) NOT NULL,
    bw_principal_ref character varying(255) NOT NULL
);


ALTER TABLE public.bw_groups OWNER TO bw;

--
-- Name: bw_locations; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_locations (
    entityid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    bw_uid character varying(50) NOT NULL,
    bw_locaddrid integer NOT NULL,
    bw_locsubaddrid integer,
    bw_link character varying(500)
);


ALTER TABLE public.bw_locations OWNER TO bw;

--
-- Name: bw_longstrings; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_longstrings (
    bw_id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_lang character varying(100),
    bw_value text
);


ALTER TABLE public.bw_longstrings OWNER TO bw;

--
-- Name: bw_preferences; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_preferences (
    prefid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_owner character varying(255) NOT NULL,
    email character varying(255),
    bw_default_calendar character varying(3900),
    skin_name character varying(255),
    skin_style character varying(255),
    preferred_view character varying(255),
    preferred_view_period character varying(255),
    bw_page_size integer,
    workdays character varying(255),
    workday_start integer,
    workday_end integer,
    preferred_endtype character varying(255),
    bwuser_mode integer,
    bw_hour24 character(1) NOT NULL,
    bw_sched_autoresp character(1) NOT NULL,
    bw_sched_autocancelaction integer,
    bw_sched_double_book character(1) NOT NULL,
    bw_sched_autoproc_resp integer
);


ALTER TABLE public.bw_preferences OWNER TO bw;

--
-- Name: bw_recurrences; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_recurrences (
    recurrence_id character varying(16) NOT NULL,
    masterid integer NOT NULL,
    bwseq integer NOT NULL,
    start_date_type character(1) NOT NULL,
    start_tzid character varying(255),
    start_dtval character varying(16) NOT NULL,
    start_date character varying(16) NOT NULL,
    bw_rstart_floating character(1),
    end_date_type character(1),
    end_tzid character varying(255),
    end_dtval character varying(255),
    end_date character varying(255),
    bw_rend_floating character(1),
    overrideid integer
);


ALTER TABLE public.bw_recurrences OWNER TO bw;

--
-- Name: bw_resource_contents; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_resource_contents (
    id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_col_path character varying(3000),
    bwname character varying(100) NOT NULL,
    bw_value oid
);


ALTER TABLE public.bw_resource_contents OWNER TO bw;

--
-- Name: bw_resources; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_resources (
    id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_col_path character varying(3000) NOT NULL,
    bw_creator character varying(255),
    bw_owner character varying(255),
    bwaccess character varying(3900),
    publick character(1) NOT NULL,
    bwname character varying(100) NOT NULL,
    bw_created character varying(16) NOT NULL,
    bw_lastmod character varying(16) NOT NULL,
    bwsequence integer,
    bw_contenttype character varying(1000),
    bw_encoding character varying(1000),
    bwcontent_length bigint
);


ALTER TABLE public.bw_resources OWNER TO bw;

--
-- Name: bw_rstatus; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_rstatus (
    eventid integer NOT NULL,
    bw_rscode character varying(100),
    bw_rsdescid integer,
    bw_rsdata character varying(250)
);


ALTER TABLE public.bw_rstatus OWNER TO bw;

--
-- Name: bw_sched_msg; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_sched_msg (
    id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_timestamp character varying(16) NOT NULL,
    bw_sequence integer,
    bw_lastproc character varying(16) NOT NULL,
    bw_inbox character(1) NOT NULL,
    bw_principal_href character varying(255),
    bw_eventname character varying(500),
    bw_recurrence_id character varying(16)
);


ALTER TABLE public.bw_sched_msg OWNER TO bw;

--
-- Name: bw_settings; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_settings (
    id integer NOT NULL,
    bwseq integer NOT NULL,
    bwname character varying(200)
);


ALTER TABLE public.bw_settings OWNER TO bw;

--
-- Name: bw_strings; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_strings (
    bw_id integer NOT NULL,
    bwseq integer NOT NULL,
    bw_lang character varying(100),
    bw_value character varying(3900)
);


ALTER TABLE public.bw_strings OWNER TO bw;

--
-- Name: bw_system_properties; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_system_properties (
    bwid integer NOT NULL,
    bw_name character varying(200),
    bw_value text
);


ALTER TABLE public.bw_system_properties OWNER TO bw;

--
-- Name: bw_user_properties; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_user_properties (
    bwid integer NOT NULL,
    bw_name character varying(200),
    bw_value text
);


ALTER TABLE public.bw_user_properties OWNER TO bw;

--
-- Name: bw_user_views; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_user_views (
    prefid integer NOT NULL,
    elt integer NOT NULL
);


ALTER TABLE public.bw_user_views OWNER TO bw;

--
-- Name: bw_users; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_users (
    userid integer NOT NULL,
    bwseq integer NOT NULL,
    bw_account character varying(200) NOT NULL,
    bw_principal_ref character varying(255) NOT NULL,
    instance_owner character(1) NOT NULL,
    bw_created timestamp without time zone,
    bw_last_logon timestamp without time zone,
    bw_last_access timestamp without time zone,
    bw_last_modify timestamp without time zone,
    bw_category_access character varying(3900),
    bw_contact_access character varying(3900),
    bw_location_access character varying(3900),
    bw_quota bigint
);


ALTER TABLE public.bw_users OWNER TO bw;

--
-- Name: bw_view_collections; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_view_collections (
    viewid integer NOT NULL,
    bw_path_positon integer NOT NULL,
    bw_calpath character varying(255) NOT NULL
);


ALTER TABLE public.bw_view_collections OWNER TO bw;

--
-- Name: bw_views; Type: TABLE; Schema: public; Owner: bw
--

CREATE TABLE public.bw_views (
    viewid integer NOT NULL,
    bwseq integer NOT NULL,
    viewname character varying(100) NOT NULL
);


ALTER TABLE public.bw_views OWNER TO bw;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: bw
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO bw;

--
-- Name: 103848; Type: BLOB; Schema: -; Owner: bw
--

SELECT pg_catalog.lo_create('103848');


ALTER LARGE OBJECT 103848 OWNER TO bw;

--
-- Name: 103849; Type: BLOB; Schema: -; Owner: bw
--

SELECT pg_catalog.lo_create('103849');


ALTER LARGE OBJECT 103849 OWNER TO bw;

--
-- Data for Name: bw_admingroupmembers; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_admingroupmembers (bw_groupid, memberid, member_is_group) FROM stdin;
444	20	F
445	15	F
445	21	F
445	444	T
446	22	F
447	22	F
448	21	F
448	17	F
449	22	F
450	20	F
445	448	T
445	450	T
446	447	T
446	449	T
443	445	T
443	446	T
\.


--
-- Data for Name: bw_admingroups; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_admingroups (bw_groupid, bwseq, account, bw_principal_ref, description, bw_group_owner, bw_owner) FROM stdin;
443	0	campusAdminGroups	/principals/groups/bwadmin/campusAdminGroups	Top-level administrative group: all children inherit administrative access to the public calendar root.  All other admin groups should be descendants of this group to provide default access control.\n\nGroup structure should be:\ncampusAdminGroups -> calendar suite group -> typical admin groups containing events administrators	/principals/users/public-user	/principals/users/public-user
444	0	Library	/principals/groups/bwadmin/Library	Typical admin group	/principals/users/calowner	/principals/users/agrp_Library
445	0	calsuite-MainCampus	/principals/groups/bwadmin/calsuite-MainCampus	Group that holds the MainCampus calendar suite.	/principals/users/admin	/principals/users/agrp_calsuite-MainCampus
446	0	calsuite-Engineering	/principals/groups/bwadmin/calsuite-Engineering	Group that holds the School of Engineering calendar suite (SoEDepartmental)	/principals/users/admin	/principals/users/agrp_calsuite-Engineering
447	0	Engineering	/principals/groups/bwadmin/Engineering	Typical admin group	/principals/users/admin	/principals/users/agrp_Engineering
448	0	Communications	/principals/groups/bwadmin/Communications	Typical admin group - a good group to start with.	/principals/users/admin	/principals/users/agrp_Communications
449	0	MechE	/principals/groups/bwadmin/MechE	Typical admin group	/principals/users/admin	/principals/users/agrp_MechE
450	0	English	/principals/groups/bwadmin/English	Typical admin group	/principals/users/admin	/principals/users/agrp_English
\.


--
-- Data for Name: bw_alarm_attendees; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_alarm_attendees (alarmid, attendeeid) FROM stdin;
\.


--
-- Data for Name: bw_alarm_xprops; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_alarm_xprops (alarmid, bwxp_position, bw_name, bw_pars, bw_value) FROM stdin;
\.


--
-- Data for Name: bw_alarmdescriptions; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_alarmdescriptions (bw_alarmid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_alarms; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_alarms (alarmid, bwseq, alarm_type, bw_owner, publick, trigger_rfctime, trigger_start, duration, repetitions, attach, expired) FROM stdin;
\.


--
-- Data for Name: bw_alarmsummaries; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_alarmsummaries (bw_alarmid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_attachments; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_attachments (bwid, bw_fmttype, bw_valuetype, bw_encoding, bw_uri, bw_value) FROM stdin;
\.


--
-- Data for Name: bw_attendees; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_attendees (attendeeid, cn, cutype, delegated_from, delegated_to, dir, lang, member, rsvp, role, partstat, sent_by, attendee_uri, rfcsequence, bw_sched_agent, bw_sched_status, dtstamp) FROM stdin;
\.


--
-- Data for Name: bw_auth; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_auth (userid, bwseq, bw_user, autoaddcategories, autoaddlocations, autoaddcontacts, autoaddcalendars, usertype) FROM stdin;
420	0	/principals/users/public-user	T	T	T	T	194
421	0	/principals/users/caladmin	T	T	T	T	64
422	0	/principals/users/calowner	T	T	T	T	64
423	0	/principals/users/caluser	T	T	T	T	64
424	0	/principals/users/agrp_admGrp1	T	T	T	T	64
425	0	/principals/users/agrp_admGrp2	T	T	T	T	64
426	0	/principals/users/johnsa	T	T	T	T	64
427	0	/principals/users/agrp_Engineering	T	T	T	T	64
428	0	/principals/users/agrp_Library	T	T	T	T	64
429	0	/principals/users/testuser01	T	T	T	T	64
430	0	/principals/users/caluser1	T	T	T	T	64
431	0	/principals/users/admin	T	T	T	T	64
432	0	/principals/users/douglm	T	T	T	T	64
433	0	/principals/users/vbede	T	T	T	T	64
434	0	/principals/users/agrp_MechE	T	T	T	T	64
435	0	/principals/users/gmarconi	T	T	T	T	64
436	0	/principals/users/mtwain	T	T	T	T	64
437	0	/principals/users/bfranklin	T	T	T	T	64
438	0	/principals/users/ggalilei	T	T	T	T	64
439	0	/principals/users/calsuite-MainCampus	T	T	T	T	64
\.


--
-- Data for Name: bw_authprefcalendars; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_authprefcalendars (userid, calendarid) FROM stdin;
420	200
426	202
431	202
431	267
431	268
431	200
433	202
433	200
436	202
437	200
438	200
\.


--
-- Data for Name: bw_authprefcategories; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_authprefcategories (userid, categoryid) FROM stdin;
420	36
426	36
426	38
426	41
426	50
431	167
431	192
431	169
431	171
431	173
431	175
431	178
431	180
431	182
431	184
431	186
431	188
431	190
431	194
431	36
431	38
431	41
431	44
431	47
431	50
431	56
431	58
431	66
431	78
431	89
431	117
431	123
431	126
431	138
431	148
431	152
431	154
431	164
433	192
433	50
433	89
433	117
436	50
436	117
436	154
437	192
437	50
438	192
438	50
\.


--
-- Data for Name: bw_authprefcontacts; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_authprefcontacts (userid, contactid) FROM stdin;
420	418
426	418
431	418
433	418
436	418
437	418
438	418
\.


--
-- Data for Name: bw_authpreflocations; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_authpreflocations (userid, locationid) FROM stdin;
420	407
426	407
431	407
433	407
436	407
437	407
438	407
\.


--
-- Data for Name: bw_calendar_categories; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_calendar_categories (calendarid, categoryid) FROM stdin;
204	126
205	148
206	36
207	38
208	41
209	44
210	58
211	150
212	69
213	156
214	158
215	120
216	30
217	47
218	53
219	103
220	60
221	72
222	115
223	175
224	160
225	162
226	109
227	106
228	112
229	135
230	164
231	75
232	98
233	138
234	75
235	86
237	92
238	33
239	95
240	78
241	167
242	152
243	80
244	117
245	83
246	89
247	154
248	50
249	63
250	169
251	129
252	132
253	123
254	171
255	173
256	66
257	178
258	180
259	192
260	190
261	184
262	182
263	186
264	188
265	194
\.


--
-- Data for Name: bw_calendar_properties; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_calendar_properties (bwid, bw_name, bw_value) FROM stdin;
197	calendar-color	null
198	calendar-color	null
199	calendar-color	null
304	calendar-color	bwltblue
305	calendar-color	bwpink
310	calendar-color	bwltpink
311	calendar-color	null
319	calendar-color	bwpink
360	isTopicalArea	true
361	isTopicalArea	true
362	isTopicalArea	true
363	isTopicalArea	true
364	isTopicalArea	true
365	isTopicalArea	true
366	isTopicalArea	true
367	isTopicalArea	true
368	isTopicalArea	true
369	isTopicalArea	true
370	isTopicalArea	true
371	isTopicalArea	true
372	isTopicalArea	true
373	isTopicalArea	true
377	calendar-color	bwltsteelblue
377	isTopicalArea	false
378	isTopicalArea	false
379	isTopicalArea	false
380	isTopicalArea	true
381	isTopicalArea	true
\.


--
-- Data for Name: bw_calendars; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_calendars (id, bwseq, bw_creator, bw_owner, bwaccess, publick, calname, bwpath, bw_col_path, summary, description, mail_list_id, caltype, bw_created, bw_filterexpr, bw_alias_uri, display, affects_free_busy, ignore_transparency, unremoveable, bwrefreshseconds, bwlastrefresh, bwlastetag, bwrid, bwrpw) FROM stdin;
197	0	/principals/users/public-user	/principals/users/public-user	WONyA WG025 bwadmin/campusAdminGroupsyRycybyu WLNyR 	T	public	/public	\N	public	\N	\N	0	20061120T180553Z	\N	\N	T	T	F	F	900	\N	\N	\N	\N
198	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	WONnA WG025 bwadmin/campusAdminGroupsnA WLNnA 	T	unbrowsable	/public/unbrowsable	/public	unbrowsable	a holder for all calendar collections that should not be publicly browsable	\N	0	20071204T043916Z	\N	\N	T	T	F	F	900	\N	\N	\N	\N
199	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	WONyA WG025 bwadmin/campusAdminGroupsyRycybyu WANycyb 	T	submissions	/public/unbrowsable/submissions	/public/unbrowsable	submissions	\N	\N	0	20071204T044016Z	\N	\N	T	T	F	F	900	\N	\N	\N	\N
200	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	submissions	/public/unbrowsable/submissions/submissions	/public/unbrowsable/submissions	submissions	\N	\N	1	20071204T044035Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
201	0	/principals/users/public-user	/principals/users/public-user	\N	T	cals	/public/cals	/public	cals	\N	\N	0	20090305T152303Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
202	0	/principals/users/public-user	/principals/users/public-user	\N	T	MainCal	/public/cals/MainCal	/public/cals	MainCal	\N	\N	1	20090305T152303Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
203	0	/principals/users/public-user	/principals/users/public-user	\N	T	aliases	/public/aliases	/public	aliases	\N	\N	0	20090305T152309Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
204	0	/principals/users/public-user	/principals/users/public-user	\N	T	Alumni Events	/public/aliases/Alumni Events	/public/aliases	Alumni Events	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389f9a-00000026')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
205	0	/principals/users/public-user	/principals/users/public-user	\N	T	Arts	/public/aliases/Arts	/public/aliases	Arts	\N	\N	0	20090305T152309Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
206	0	/principals/users/public-user	/principals/users/public-user	\N	T	Concerts	/public/aliases/Arts/Concerts	/public/aliases/Arts	Concerts	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389ed0-00000002')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
207	0	/principals/users/public-user	/principals/users/public-user	\N	T	Dance	/public/aliases/Arts/Dance	/public/aliases/Arts	Dance	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389ef9-00000003')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
208	0	/principals/users/public-user	/principals/users/public-user	\N	T	Exhibits	/public/aliases/Arts/Exhibits	/public/aliases/Arts	Exhibits	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389eff-00000004')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
209	0	/principals/users/public-user	/principals/users/public-user	\N	T	Films	/public/aliases/Arts/Films	/public/aliases/Arts	Films	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389f02-00000005')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
210	0	/principals/users/public-user	/principals/users/public-user	\N	T	Readings	/public/aliases/Arts/Readings	/public/aliases/Arts	Readings	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389f15-0000000a')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
211	0	/principals/users/public-user	/principals/users/public-user	\N	T	Theater	/public/aliases/Arts/Theater	/public/aliases/Arts	Theater	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd73b03-011f-d73b065c-00000002')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
212	0	/principals/users/public-user	/principals/users/public-user	\N	T	Athletics	/public/aliases/Athletics	/public/aliases	Athletics	\N	\N	7	20090305T152309Z	catuid=('ff808181-1fd7389e-011f-d7389f24-0000000e')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
213	0	/principals/users/public-user	/principals/users/public-user	\N	T	Other Events	/public/aliases/Other Events	/public/aliases	Other Events	\N	\N	0	20090305T152310Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
214	0	/principals/users/public-user	/principals/users/public-user	\N	T	College Fairs	/public/aliases/Other Events/College Fairs	/public/aliases/Other Events	College Fairs	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd73b03-011f-d73b06f8-0000000c')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
215	0	/principals/users/public-user	/principals/users/public-user	\N	T	Employee Events	/public/aliases/Other Events/Employee Events	/public/aliases/Other Events	Employee Events	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389f8f-00000023')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
216	0	/principals/users/public-user	/principals/users/public-user	\N	T	Fund Raising	/public/aliases/Other Events/Fund Raising	/public/aliases/Other Events	Fund Raising	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389ec8-00000000')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
217	0	/principals/users/public-user	/principals/users/public-user	\N	T	Health Services	/public/aliases/Other Events/Health Services	/public/aliases/Other Events	Health Services	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389f06-00000006')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
218	0	/principals/users/public-user	/principals/users/public-user	\N	T	Open Houses	/public/aliases/Other Events/Open Houses	/public/aliases/Other Events	Open Houses	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389f0d-00000008')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
219	0	/principals/users/public-user	/principals/users/public-user	\N	T	Other	/public/aliases/Other Events/Other	/public/aliases/Other Events	Other	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389f59-0000001c')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
220	0	/principals/users/public-user	/principals/users/public-user	\N	T	Sales	/public/aliases/Other Events/Sales	/public/aliases/Other Events	Sales	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389f18-0000000b')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
221	0	/principals/users/public-user	/principals/users/public-user	\N	T	Tours	/public/aliases/Other Events/Tours	/public/aliases/Other Events	Tours	\N	\N	7	20090305T152310Z	catuid=('ff808181-1fd7389e-011f-d7389f28-0000000f')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
222	0	/principals/users/public-user	/principals/users/public-user	\N	T	University Governance	/public/aliases/Other Events/University Governance	/public/aliases/Other Events	University Governance	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f88-00000021')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
223	0	/principals/users/public-user	/principals/users/public-user	\N	T	Staff Holidays	/public/aliases/Other Events/Staff Holidays	/public/aliases/Other Events	Staff Holidays	\N	\N	7	20090414T013036Z	catuid=('402881e6-20a21413-0120-a236d0b1-00000014')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
224	0	/principals/users/public-user	/principals/users/public-user	\N	T	Social Events	/public/aliases/Social Events	/public/aliases	Social Events	\N	\N	0	20090305T152311Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
225	0	/principals/users/public-user	/principals/users/public-user	\N	T	Gaming	/public/aliases/Social Events/Gaming	/public/aliases/Social Events	Gaming	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd73b03-011f-d73b0714-0000000e')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
226	0	/principals/users/public-user	/principals/users/public-user	\N	T	Receptions	/public/aliases/Social Events/Receptions	/public/aliases/Social Events	Receptions	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f80-0000001f')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
227	0	/principals/users/public-user	/principals/users/public-user	\N	T	Recognitions	/public/aliases/Social Events/Recognitions	/public/aliases/Social Events	Recognitions	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f60-0000001e')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
228	0	/principals/users/public-user	/principals/users/public-user	\N	T	Social Gatherings	/public/aliases/Social Events/Social Gatherings	/public/aliases/Social Events	Social Gatherings	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f84-00000020')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
229	0	/principals/users/public-user	/principals/users/public-user	\N	T	Volunteer Opportunities	/public/aliases/Social Events/Volunteer Opportunities	/public/aliases/Social Events	Volunteer Opportunities	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389fa9-0000002a')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
230	0	/principals/users/public-user	/principals/users/public-user	\N	T	Religious or Spiritual	/public/aliases/Social Events/Religious or Spiritual	/public/aliases/Social Events	Religious or Spiritual	\N	\N	7	20090414T005216Z	catuid=('ff808181-1fd73b03-011f-d73b071a-0000000f')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
231	0	/principals/users/public-user	/principals/users/public-user	\N	T	Training	/public/aliases/Training	/public/aliases	Training	\N	\N	0	20090305T152311Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
232	0	/principals/users/public-user	/principals/users/public-user	\N	T	Short Courses	/public/aliases/Training/Short Courses	/public/aliases/Training	Short Courses	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f4f-00000019')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
233	0	/principals/users/public-user	/principals/users/public-user	\N	T	Student Career Development	/public/aliases/Training/Student Career Development	/public/aliases/Training	Student Career Development	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389fad-0000002b')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
234	0	/principals/users/public-user	/principals/users/public-user	\N	T	Training	/public/aliases/Training/Training	/public/aliases/Training	Training	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f2c-00000010')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
235	0	/principals/users/public-user	/principals/users/public-user	\N	T	Workshops	/public/aliases/Training/Workshops	/public/aliases/Training	Workshops	\N	\N	7	20090305T152311Z	catuid=('ff808181-1fd7389e-011f-d7389f3b-00000014')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
236	0	/principals/users/public-user	/principals/users/public-user	\N	T	Academic Calendar	/public/aliases/Academic Calendar	/public/aliases	Academic Calendar	\N	\N	0	20090413T172850Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
237	0	/principals/users/public-user	/principals/users/public-user	\N	T	Holidays	/public/aliases/Academic Calendar/Holidays	/public/aliases/Academic Calendar	Holidays	holidays in the academic calendar	\N	7	20090413T173004Z	catuid=('ff808181-1fd7389e-011f-d7389f47-00000017')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
238	0	/principals/users/public-user	/principals/users/public-user	\N	T	Commencement	/public/aliases/Academic Calendar/Commencement	/public/aliases/Academic Calendar	Commencement	\N	\N	7	20090413T204403Z	catuid=('ff808181-1fd7389e-011f-d7389ecc-00000001')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
239	0	/principals/users/public-user	/principals/users/public-user	\N	T	Academic Calendar	/public/aliases/Academic Calendar/Academic Calendar	/public/aliases/Academic Calendar	Academic Calendar	\N	\N	7	20090413T204512Z	catuid=('ff808181-1fd7389e-011f-d7389f4b-00000018')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
240	0	/principals/users/public-user	/principals/users/public-user	\N	T	Deadlines	/public/aliases/Academic Calendar/Deadlines	/public/aliases/Academic Calendar	Deadlines	\N	\N	7	20090413T204600Z	catuid=('ff808181-1fd7389e-011f-d7389f30-00000011')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
242	0	/principals/users/public-user	/principals/users/public-user	\N	T	Conferences and Meetings	/public/aliases/Conferences and Meetings	/public/aliases	Conferences and Meetings	\N	\N	0	20090414T004154Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
243	0	/principals/users/public-user	/principals/users/public-user	\N	T	Conferences	/public/aliases/Conferences and Meetings/Conferences	/public/aliases/Conferences and Meetings	Conferences	\N	\N	7	20090414T004237Z	catuid=('ff808181-1fd7389e-011f-d7389f33-00000012')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
244	0	/principals/users/public-user	/principals/users/public-user	\N	T	Discussions	/public/aliases/Conferences and Meetings/Discussions	/public/aliases/Conferences and Meetings	Discussions	\N	\N	7	20090414T004348Z	catuid=('ff808181-1fd7389e-011f-d7389f8b-00000022')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
245	0	/principals/users/public-user	/principals/users/public-user	\N	T	Forums	/public/aliases/Conferences and Meetings/Forums	/public/aliases/Conferences and Meetings	Forums	\N	\N	7	20090414T004458Z	catuid=('ff808181-1fd7389e-011f-d7389f38-00000013')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
246	0	/principals/users/public-user	/principals/users/public-user	\N	T	Meetings	/public/aliases/Conferences and Meetings/Meetings	/public/aliases/Conferences and Meetings	Meetings	\N	\N	7	20090414T004546Z	catuid=('ff808181-1fd7389e-011f-d7389f3f-00000015')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
247	0	/principals/users/public-user	/principals/users/public-user	\N	T	Lectures and Seminars	/public/aliases/Lectures and Seminars	/public/aliases	Lectures and Seminars	\N	\N	0	20090414T005751Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
248	0	/principals/users/public-user	/principals/users/public-user	\N	T	Lectures	/public/aliases/Lectures and Seminars/Lectures	/public/aliases/Lectures and Seminars	Lectures	\N	\N	7	20090414T005904Z	catuid=('ff808181-1fd7389e-011f-d7389f0a-00000007')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
249	0	/principals/users/public-user	/principals/users/public-user	\N	T	Seminars	/public/aliases/Lectures and Seminars/Seminars	/public/aliases/Lectures and Seminars	Seminars	\N	\N	7	20090414T010001Z	catuid=('ff808181-1fd7389e-011f-d7389f1c-0000000c')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
250	0	/principals/users/public-user	/principals/users/public-user	\N	T	Services and Facilities	/public/aliases/Services and Facilities	/public/aliases	Services and Facilities	\N	\N	0	20090414T010244Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
280	0	/principals/users/agrp_admGrp1	/principals/users/agrp_admGrp1	\N	F	Outbox	/user/agrp_admGrp1/Outbox	/user/agrp_admGrp1	Outbox	\N	\N	6	20061121T205447Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
251	0	/principals/users/public-user	/principals/users/public-user	\N	T	Construction	/public/aliases/Services and Facilities/Construction	/public/aliases/Services and Facilities	Construction	\N	\N	7	20090414T010546Z	catuid=('ff808181-1fd7389e-011f-d7389fa2-00000028')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
252	0	/principals/users/public-user	/principals/users/public-user	\N	T	Facilities	/public/aliases/Services and Facilities/Facilities	/public/aliases/Services and Facilities	Facilities	\N	\N	7	20090414T010639Z	catuid=('ff808181-1fd7389e-011f-d7389fa5-00000029')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
253	0	/principals/users/public-user	/principals/users/public-user	\N	T	Parking	/public/aliases/Services and Facilities/Parking	/public/aliases/Services and Facilities	Parking	\N	\N	7	20090414T010732Z	catuid=('ff808181-1fd7389e-011f-d7389f96-00000025')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
254	0	/principals/users/public-user	/principals/users/public-user	\N	T	Room or Building Closings	/public/aliases/Services and Facilities/Room or Building Closings	/public/aliases/Services and Facilities	Room or Building Closings	\N	\N	7	20090414T011151Z	catuid=('402881e6-20a21413-0120-a22de2dd-0000000d')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
255	0	/principals/users/public-user	/principals/users/public-user	\N	T	Service Outages or Changes	/public/aliases/Services and Facilities/Service Outages or Changes	/public/aliases/Services and Facilities	Service Outages or Changes	\N	\N	7	20090414T011309Z	catuid=('402881e6-20a21413-0120-a22fdf78-00000010')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
256	0	/principals/users/public-user	/principals/users/public-user	\N	T	Special Events	/public/aliases/Special Events	/public/aliases	Special Events	\N	\N	7	20090414T012942Z	catuid=('ff808181-1fd7389e-011f-d7389f20-0000000d')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
257	0	/principals/users/public-user	/principals/users/public-user	\N	T	Clubs and Organizations	/public/aliases/Clubs and Organizations	/public/aliases	Clubs and Organizations	\N	\N	7	20090414T013159Z	catuid=('402881e6-20a21413-0120-a23d71e5-00000015')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
258	0	/principals/users/public-user	/principals/users/public-user	\N	T	Departments	/public/aliases/Departments	/public/aliases	Departments	\N	\N	0	20090414T013332Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
259	0	/principals/users/public-user	/principals/users/public-user	\N	T	School of Engineering	/public/aliases/Departments/School of Engineering	/public/aliases/Departments	School of Engineering	\N	\N	0	20090414T013510Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
260	0	/principals/users/public-user	/principals/users/public-user	\N	T	Biomedical Engineering	/public/aliases/Departments/School of Engineering/Biomedical Engineering	/public/aliases/Departments/School of Engineering	Biomedical Engineering	\N	\N	7	20090414T013541Z	catuid=('402881e6-20a21413-0120-a24c742e-00000058')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
262	0	/principals/users/public-user	/principals/users/public-user	\N	T	School of Humanities	/public/aliases/Departments/School of Humanities	/public/aliases/Departments	School of Humanities	\N	\N	0	20090414T013930Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
263	0	/principals/users/public-user	/principals/users/public-user	\N	T	Music Department	/public/aliases/Departments/School of Humanities/Music Department	/public/aliases/Departments/School of Humanities	Music Department	\N	\N	7	20090414T014714Z	catuid=('402881e6-20a21413-0120-a24bc8db-00000056')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
264	0	/principals/users/public-user	/principals/users/public-user	\N	T	English Department	/public/aliases/Departments/School of Humanities/English Department	/public/aliases/Departments/School of Humanities	English Department	\N	\N	7	20090414T014751Z	catuid=('402881e6-20a21413-0120-a24bfbc2-00000057')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
267	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	images	/public/images	/public	images	container for uploaded event images	\N	1	20120927T182254Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
268	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	resources	/public/resources	/public	resources	container for global resources	\N	1	20121121T044445Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
269	0	/principals/users/public-user	/principals/users/public-user	WONyA WANyFyS 	F	user	/user	\N	user	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
270	0	/principals/users/agrp_Engineering	/principals/users/agrp_Engineering	\N	F	agrp_Engineering	/user/agrp_Engineering	/user	agrp_Engineering	\N	\N	0	20070406T200548Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
271	0	/principals/users/agrp_Engineering	/principals/users/agrp_Engineering	\N	F	calendar	/user/agrp_Engineering/calendar	/user/agrp_Engineering	calendar	\N	\N	1	20070406T200548Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
272	0	/principals/users/agrp_Engineering	/principals/users/agrp_Engineering	\N	F	Inbox	/user/agrp_Engineering/Inbox	/user/agrp_Engineering	Inbox	\N	\N	5	20091210T210913Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
273	0	/principals/users/agrp_Engineering	/principals/users/agrp_Engineering	\N	F	Outbox	/user/agrp_Engineering/Outbox	/user/agrp_Engineering	Outbox	\N	\N	6	20091210T210913Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
274	0	/principals/users/agrp_Library	/principals/users/agrp_Library	\N	F	agrp_Library	/user/agrp_Library	/user	agrp_Library	\N	\N	0	20070406T201319Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
275	0	/principals/users/agrp_Library	/principals/users/agrp_Library	\N	F	Inbox	/user/agrp_Library/Inbox	/user/agrp_Library	Inbox	\N	\N	5	20070406T201432Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
276	0	/principals/users/agrp_Library	/principals/users/agrp_Library	\N	F	Outbox	/user/agrp_Library/Outbox	/user/agrp_Library	Outbox	\N	\N	6	20070406T201432Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
277	0	/principals/users/agrp_Library	/principals/users/agrp_Library	\N	F	calendar	/user/agrp_Library/calendar	/user/agrp_Library	calendar	\N	\N	1	20070406T201319Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
278	0	/principals/users/agrp_admGrp1	/principals/users/agrp_admGrp1	WANyR WLNyR 	F	agrp_admGrp1	/user/agrp_admGrp1	/user	agrp_admGrp1	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	900	\N	\N	\N	\N
279	0	/principals/users/agrp_admGrp1	/principals/users/agrp_admGrp1	\N	F	Inbox	/user/agrp_admGrp1/Inbox	/user/agrp_admGrp1	Inbox	\N	\N	5	20061121T205447Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
281	0	/principals/users/agrp_admGrp1	/principals/users/agrp_admGrp1	\N	F	calendar	/user/agrp_admGrp1/calendar	/user/agrp_admGrp1	calendar	\N	\N	1	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
282	0	/principals/users/agrp_admGrp2	/principals/users/agrp_admGrp2	\N	F	agrp_admGrp2	/user/agrp_admGrp2	/user	agrp_admGrp2	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
283	0	/principals/users/agrp_admGrp2	/principals/users/agrp_admGrp2	\N	F	Inbox	/user/agrp_admGrp2/Inbox	/user/agrp_admGrp2	Inbox	\N	\N	5	20070406T183957Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
284	0	/principals/users/agrp_admGrp2	/principals/users/agrp_admGrp2	\N	F	Outbox	/user/agrp_admGrp2/Outbox	/user/agrp_admGrp2	Outbox	\N	\N	6	20070406T183957Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
285	0	/principals/users/agrp_admGrp2	/principals/users/agrp_admGrp2	\N	F	calendar	/user/agrp_admGrp2/calendar	/user/agrp_admGrp2	calendar	\N	\N	1	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
286	0	/principals/users/caladmin	/principals/users/caladmin	\N	F	caladmin	/user/caladmin	/user	caladmin	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
287	0	/principals/users/caladmin	/principals/users/caladmin	\N	F	Inbox	/user/caladmin/Inbox	/user/caladmin	Inbox	\N	\N	5	20061121T205441Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
288	0	/principals/users/caladmin	/principals/users/caladmin	\N	F	Outbox	/user/caladmin/Outbox	/user/caladmin	Outbox	\N	\N	6	20061121T205441Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
289	0	/principals/users/caladmin	/principals/users/caladmin	\N	F	calendar	/user/caladmin/calendar	/user/caladmin	calendar	\N	\N	1	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
290	0	/principals/users/calowner	/principals/users/calowner	\N	F	calowner	/user/calowner	/user	calowner	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
291	0	/principals/users/calowner	/principals/users/calowner	\N	F	Inbox	/user/calowner/Inbox	/user/calowner	Inbox	\N	\N	5	20070406T183954Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
292	0	/principals/users/calowner	/principals/users/calowner	\N	F	Outbox	/user/calowner/Outbox	/user/calowner	Outbox	\N	\N	6	20070406T183954Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
293	0	/principals/users/calowner	/principals/users/calowner	\N	F	calendar	/user/calowner/calendar	/user/calowner	calendar	\N	\N	1	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
294	0	/principals/users/caluser	/principals/users/caluser	\N	F	caluser	/user/caluser	/user	caluser	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
295	0	/principals/users/caluser	/principals/users/caluser	\N	F	calendar	/user/caluser/calendar	/user/caluser	calendar	\N	\N	1	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
296	0	/principals/users/caluser	/principals/users/caluser	\N	F	Inbox	/user/caluser/Inbox	/user/caluser	Inbox	\N	\N	5	20110505T170551Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
297	0	/principals/users/caluser	/principals/users/caluser	\N	F	Outbox	/user/caluser/Outbox	/user/caluser	Outbox	\N	\N	6	20110505T170551Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
298	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	caluser1	/user/caluser1	/user	caluser1	\N	\N	0	20070420T143619Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
299	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	Deleted	/user/caluser1/Deleted	/user/caluser1	Deleted	\N	\N	3	20080318T201952Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
300	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	Inbox	/user/caluser1/Inbox	/user/caluser1	Inbox	\N	\N	5	20070420T143619Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
301	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	Outbox	/user/caluser1/Outbox	/user/caluser1	Outbox	\N	\N	6	20070420T143619Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
302	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	Trash	/user/caluser1/Trash	/user/caluser1	Trash	\N	\N	2	20080318T201339Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
303	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	calendar	/user/caluser1/calendar	/user/caluser1	calendar	\N	\N	1	20070420T143619Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
304	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	Arts	/user/caluser1/Arts	/user/caluser1	Arts	\N	\N	7	20090305T152028Z	\N	bwcal:///public/Arts	T	F	F	F	0	\N	\N	\N	\N
305	0	/principals/users/caluser1	/principals/users/caluser1	\N	F	Lectures	/user/caluser1/Lectures	/user/caluser1	Lectures	\N	\N	7	20090305T152028Z	\N	bwcal:///public/Lectures_Seminars/Lectures	T	F	F	F	0	\N	\N	\N	\N
306	0	/principals/users/johnsa	/principals/users/johnsa	\N	F	johnsa	/user/johnsa	/user	johnsa	\N	\N	0	20061121T205812Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
307	0	/principals/users/johnsa	/principals/users/johnsa	\N	F	Inbox	/user/johnsa/Inbox	/user/johnsa	Inbox	\N	\N	5	20061121T205813Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
308	0	/principals/users/johnsa	/principals/users/johnsa	\N	F	Outbox	/user/johnsa/Outbox	/user/johnsa	Outbox	\N	\N	6	20061121T205813Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
309	0	/principals/users/johnsa	/principals/users/johnsa	\N	F	calendar	/user/johnsa/calendar	/user/johnsa	calendar	\N	\N	1	20061121T205812Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
310	0	/principals/users/johnsa	/principals/users/johnsa	\N	F	Athletics	/user/johnsa/Athletics	/user/johnsa	Athletics	\N	\N	7	20090305T152027Z	\N	bwcal:///public/Athletics	T	F	F	F	0	\N	\N	\N	\N
311	0	/principals/users/public-user	/principals/users/public-user	WG025 bwadmin/campusAdminGroupsyR 	F	public-user	/user/public-user	/user	public-user	\N	\N	0	20061120T180554Z	\N	\N	T	T	F	F	900	\N	\N	\N	\N
312	0	/principals/users/public-user	/principals/users/public-user	\N	F	calendar	/user/public-user/calendar	/user/public-user	calendar	\N	\N	1	20061120T180554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
313	0	/principals/users/public-user	/principals/users/public-user	\N	F	Inbox	/user/public-user/Inbox	/user/public-user	Inbox	\N	\N	5	20090305T152226Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
314	0	/principals/users/public-user	/principals/users/public-user	\N	F	Outbox	/user/public-user/Outbox	/user/public-user	Outbox	\N	\N	6	20090305T152226Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
315	0	/principals/users/testuser01	/principals/users/testuser01	\N	F	testuser01	/user/testuser01	/user	testuser01	\N	\N	0	20070417T192555Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
316	0	/principals/users/testuser01	/principals/users/testuser01	\N	F	Inbox	/user/testuser01/Inbox	/user/testuser01	Inbox	\N	\N	5	20070417T192555Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
317	0	/principals/users/testuser01	/principals/users/testuser01	\N	F	Outbox	/user/testuser01/Outbox	/user/testuser01	Outbox	\N	\N	6	20070417T192555Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
318	0	/principals/users/testuser01	/principals/users/testuser01	\N	F	calendar	/user/testuser01/calendar	/user/testuser01	calendar	\N	\N	1	20070417T192555Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
319	0	/principals/users/testuser01	/principals/users/testuser01	\N	F	Athletics	/user/testuser01/Athletics	/user/testuser01	Athletics	\N	\N	7	20090305T152028Z	\N	bwcal:///public/Athletics	T	F	F	F	0	\N	\N	\N	\N
320	0	/principals/users/admin	/principals/users/admin	\N	F	admin	/user/admin	/user	admin	\N	\N	0	20090305T152558Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
321	0	/principals/users/admin	/principals/users/admin	\N	F	calendar	/user/admin/calendar	/user/admin	calendar	\N	\N	1	20090305T152558Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
322	0	/principals/users/admin	/principals/users/admin	\N	F	Inbox	/user/admin/Inbox	/user/admin	Inbox	\N	\N	5	20090305T152558Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
323	0	/principals/users/admin	/principals/users/admin	\N	F	Outbox	/user/admin/Outbox	/user/admin	Outbox	\N	\N	6	20090305T152558Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
324	0	/principals/users/douglm	/principals/users/douglm	\N	F	douglm	/user/douglm	/user	douglm	\N	\N	0	20090305T154826Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
325	0	/principals/users/douglm	/principals/users/douglm	\N	F	calendar	/user/douglm/calendar	/user/douglm	calendar	\N	\N	1	20090305T154826Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
326	0	/principals/users/douglm	/principals/users/douglm	\N	F	Inbox	/user/douglm/Inbox	/user/douglm	Inbox	\N	\N	5	20090305T164826Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
327	0	/principals/users/douglm	/principals/users/douglm	\N	F	Outbox	/user/douglm/Outbox	/user/douglm	Outbox	\N	\N	6	20090305T164939Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
328	0	/principals/users/vbede	/principals/users/vbede	\N	F	vbede	/user/vbede	/user	vbede	\N	\N	0	20090305T203601Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
329	0	/principals/users/vbede	/principals/users/vbede	\N	F	calendar	/user/vbede/calendar	/user/vbede	calendar	\N	\N	1	20090305T203601Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
330	0	/principals/users/vbede	/principals/users/vbede	\N	F	Inbox	/user/vbede/Inbox	/user/vbede	Inbox	\N	\N	5	20090410T204231Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
331	0	/principals/users/vbede	/principals/users/vbede	\N	F	Outbox	/user/vbede/Outbox	/user/vbede	Outbox	\N	\N	6	20090410T204231Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
332	0	/principals/users/agrp_MechE	/principals/users/agrp_MechE	\N	F	agrp_MechE	/user/agrp_MechE	/user	agrp_MechE	\N	\N	0	20090305T204244Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
333	0	/principals/users/agrp_MechE	/principals/users/agrp_MechE	\N	F	calendar	/user/agrp_MechE/calendar	/user/agrp_MechE	calendar	\N	\N	1	20090305T204244Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
334	0	/principals/users/agrp_MechE	/principals/users/agrp_MechE	\N	F	Inbox	/user/agrp_MechE/Inbox	/user/agrp_MechE	Inbox	\N	\N	5	20090414T044104Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
335	0	/principals/users/agrp_MechE	/principals/users/agrp_MechE	\N	F	Outbox	/user/agrp_MechE/Outbox	/user/agrp_MechE	Outbox	\N	\N	6	20090414T044105Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
336	0	/principals/users/gmarconi	/principals/users/gmarconi	\N	F	gmarconi	/user/gmarconi	/user	gmarconi	\N	\N	0	20090305T205906Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
337	0	/principals/users/gmarconi	/principals/users/gmarconi	\N	F	calendar	/user/gmarconi/calendar	/user/gmarconi	calendar	\N	\N	1	20090305T205906Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
338	0	/principals/users/gmarconi	/principals/users/gmarconi	\N	F	Inbox	/user/gmarconi/Inbox	/user/gmarconi	Inbox	\N	\N	5	20110505T170554Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
339	0	/principals/users/gmarconi	/principals/users/gmarconi	\N	F	Outbox	/user/gmarconi/Outbox	/user/gmarconi	Outbox	\N	\N	6	20110505T170554Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
340	0	/principals/users/mtwain	/principals/users/mtwain	\N	F	mtwain	/user/mtwain	/user	mtwain	\N	\N	0	20090305T210306Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
341	0	/principals/users/mtwain	/principals/users/mtwain	\N	F	calendar	/user/mtwain/calendar	/user/mtwain	calendar	\N	\N	1	20090305T210306Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
342	0	/principals/users/mtwain	/principals/users/mtwain	\N	F	Inbox	/user/mtwain/Inbox	/user/mtwain	Inbox	\N	\N	5	20090414T041304Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
343	0	/principals/users/mtwain	/principals/users/mtwain	\N	F	Outbox	/user/mtwain/Outbox	/user/mtwain	Outbox	\N	\N	6	20090414T041304Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
344	0	/principals/users/bfranklin	/principals/users/bfranklin	\N	F	bfranklin	/user/bfranklin	/user	bfranklin	\N	\N	0	20090305T210533Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
345	0	/principals/users/bfranklin	/principals/users/bfranklin	\N	F	calendar	/user/bfranklin/calendar	/user/bfranklin	calendar	\N	\N	1	20090305T210533Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
346	0	/principals/users/bfranklin	/principals/users/bfranklin	\N	F	Inbox	/user/bfranklin/Inbox	/user/bfranklin	Inbox	\N	\N	5	20090305T215452Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
347	0	/principals/users/bfranklin	/principals/users/bfranklin	\N	F	Outbox	/user/bfranklin/Outbox	/user/bfranklin	Outbox	\N	\N	6	20090305T215452Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
348	0	/principals/users/ggalilei	/principals/users/ggalilei	\N	F	ggalilei	/user/ggalilei	/user	ggalilei	\N	\N	0	20090305T210923Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
349	0	/principals/users/ggalilei	/principals/users/ggalilei	\N	F	calendar	/user/ggalilei/calendar	/user/ggalilei	calendar	\N	\N	1	20090305T210923Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
350	0	/principals/users/ggalilei	/principals/users/ggalilei	\N	F	Inbox	/user/ggalilei/Inbox	/user/ggalilei	Inbox	\N	\N	5	20090305T211719Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
351	0	/principals/users/ggalilei	/principals/users/ggalilei	\N	F	Outbox	/user/ggalilei/Outbox	/user/ggalilei	Outbox	\N	\N	6	20090305T211719Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
352	0	/principals/users/agrp_calsuite-BwClassic	/principals/users/agrp_calsuite-BwClassic	WONyA WU023 agrp_calsuite-BwClassicyA WANyR WLNyR 	F	agrp_calsuite-BwClassic	/user/agrp_calsuite-BwClassic	/user	agrp_calsuite-BwClassic	\N	\N	0	20091210T181554Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
353	0	/principals/users/agrp_calsuite-BwClassic	/principals/users/agrp_calsuite-BwClassic	\N	F	calendar	/user/agrp_calsuite-BwClassic/calendar	/user/agrp_calsuite-BwClassic	calendar	\N	\N	1	20091210T181554Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
354	0	/principals/users/agrp_calsuite-BwClassic	/principals/users/agrp_calsuite-BwClassic	\N	F	Inbox	/user/agrp_calsuite-BwClassic/Inbox	/user/agrp_calsuite-BwClassic	Inbox	\N	\N	5	20091210T191030Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
355	0	/principals/users/agrp_calsuite-BwClassic	/principals/users/agrp_calsuite-BwClassic	\N	F	Outbox	/user/agrp_calsuite-BwClassic/Outbox	/user/agrp_calsuite-BwClassic	Outbox	\N	\N	6	20091210T191030Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
356	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	WU024 agrp_calsuite-MainCampusyA WANyR WLNyR 	F	agrp_calsuite-MainCampus	/user/agrp_calsuite-MainCampus	/user	agrp_calsuite-MainCampus	\N	\N	0	20091210T181857Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
357	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	calendar	/user/agrp_calsuite-MainCampus/calendar	/user/agrp_calsuite-MainCampus	calendar	\N	\N	1	20091210T181857Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
358	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Inbox	/user/agrp_calsuite-MainCampus/Inbox	/user/agrp_calsuite-MainCampus	Inbox	\N	\N	5	20091210T191048Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
359	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Outbox	/user/agrp_calsuite-MainCampus/Outbox	/user/agrp_calsuite-MainCampus	Outbox	\N	\N	6	20091210T191048Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
360	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Alumni Events	/user/agrp_calsuite-MainCampus/Alumni Events	/user/agrp_calsuite-MainCampus	Alumni Events	\N	\N	7	20090305T152311Z	\N	bwcal:///public/aliases/Alumni Events	T	F	F	F	900	\N	\N	\N	\N
361	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Arts	/user/agrp_calsuite-MainCampus/Arts	/user/agrp_calsuite-MainCampus	Arts	\N	\N	7	20090305T152311Z	\N	bwcal:///public/aliases/Arts	T	F	F	F	900	\N	\N	\N	\N
362	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Athletics	/user/agrp_calsuite-MainCampus/Athletics	/user/agrp_calsuite-MainCampus	Athletics	\N	\N	7	20090305T152311Z	\N	bwcal:///public/aliases/Athletics	T	F	F	F	900	\N	\N	\N	\N
363	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Academic Calendar	/user/agrp_calsuite-MainCampus/Academic Calendar	/user/agrp_calsuite-MainCampus	Academic Calendar	\N	\N	7	20090305T152312Z	\N	bwcal:///public/aliases/Academic Calendar	T	F	F	F	900	\N	\N	\N	\N
364	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Social Events	/user/agrp_calsuite-MainCampus/Social Events	/user/agrp_calsuite-MainCampus	Social Events	\N	\N	7	20090305T152312Z	\N	bwcal:///public/aliases/Social Events	T	F	F	F	900	\N	\N	\N	\N
365	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Training	/user/agrp_calsuite-MainCampus/Training	/user/agrp_calsuite-MainCampus	Training	\N	\N	7	20090305T152312Z	\N	bwcal:///public/aliases/Training	T	F	F	F	900	\N	\N	\N	\N
366	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Clubs and Organizations	/user/agrp_calsuite-MainCampus/Clubs and Organizations	/user/agrp_calsuite-MainCampus	Clubs and Organizations	\N	\N	7	20090414T024911Z	\N	bwcal:///public/aliases/Clubs and Organizations	T	F	F	F	900	\N	\N	\N	\N
367	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Conferences and Meetings	/user/agrp_calsuite-MainCampus/Conferences and Meetings	/user/agrp_calsuite-MainCampus	Conferences and Meetings	\N	\N	7	20090414T024952Z	\N	bwcal:///public/aliases/Conferences and Meetings	T	F	F	F	900	\N	\N	\N	\N
368	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Departments	/user/agrp_calsuite-MainCampus/Departments	/user/agrp_calsuite-MainCampus	Departments	\N	\N	7	20090414T025032Z	\N	bwcal:///public/aliases/Departments	T	F	F	F	900	\N	\N	\N	\N
369	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Lectures and Seminars	/user/agrp_calsuite-MainCampus/Lectures and Seminars	/user/agrp_calsuite-MainCampus	Lectures and Seminars	\N	\N	7	20090414T031931Z	\N	bwcal:///public/aliases/Lectures and Seminars	T	F	F	F	900	\N	\N	\N	\N
370	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Other Events	/user/agrp_calsuite-MainCampus/Other Events	/user/agrp_calsuite-MainCampus	Other Events	\N	\N	7	20090414T031956Z	\N	bwcal:///public/aliases/Other Events	T	F	F	F	900	\N	\N	\N	\N
371	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Services and Facilities	/user/agrp_calsuite-MainCampus/Services and Facilities	/user/agrp_calsuite-MainCampus	Services and Facilities	\N	\N	7	20090414T032054Z	\N	bwcal:///public/aliases/Services and Facilities	T	F	F	F	900	\N	\N	\N	\N
372	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Special Events	/user/agrp_calsuite-MainCampus/Special Events	/user/agrp_calsuite-MainCampus	Special Events	\N	\N	7	20090414T033841Z	\N	bwcal:///public/aliases/Special Events	T	F	F	F	900	\N	\N	\N	\N
374	0	/principals/users/public-user	/principals/users/public-user	WLNyR 	F	.csResources	/user/agrp_calsuite-MainCampus/.csResources	/user/agrp_calsuite-MainCampus	.csResources	\N	\N	0	20121121T051944Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
375	0	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	WONyA WU025 agrp_calsuite-EngineeringyA WANyR WLNyR 	F	agrp_calsuite-Engineering	/user/agrp_calsuite-Engineering	/user	agrp_calsuite-Engineering	\N	\N	0	20091210T182509Z	\N	\N	T	F	F	F	900	\N	\N	\N	\N
376	0	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	calendar	/user/agrp_calsuite-Engineering/calendar	/user/agrp_calsuite-Engineering	calendar	\N	\N	1	20091210T182509Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
377	0	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	WONyA WXNyR WZNyR 	F	Academic Calendar	/user/agrp_calsuite-Engineering/Academic Calendar	/user/agrp_calsuite-Engineering	Academic Calendar	\N	\N	7	20090305T152027Z	\N	bwcal:///public/aliases/Academic Calendar	T	F	F	F	900	\N	\N	\N	\N
382	0	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	Inbox	/user/agrp_calsuite-Engineering/Inbox	/user/agrp_calsuite-Engineering	Inbox	\N	\N	5	20091210T205340Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
383	0	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	Outbox	/user/agrp_calsuite-Engineering/Outbox	/user/agrp_calsuite-Engineering	Outbox	\N	\N	6	20091210T205340Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
384	0	/principals/users/calsuite-MainCampus	/principals/users/calsuite-MainCampus	\N	F	calsuite-MainCampus	/user/calsuite-MainCampus	/user	calsuite-MainCampus	\N	\N	0	20091210T183117Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
385	0	/principals/users/calsuite-MainCampus	/principals/users/calsuite-MainCampus	\N	F	calendar	/user/calsuite-MainCampus/calendar	/user/calsuite-MainCampus	calendar	\N	\N	1	20091210T183117Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
386	0	/principals/users/calsuite-MainCampus	/principals/users/calsuite-MainCampus	\N	F	Inbox	/user/calsuite-MainCampus/Inbox	/user/calsuite-MainCampus	Inbox	\N	\N	5	20110505T170557Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
387	0	/principals/users/calsuite-MainCampus	/principals/users/calsuite-MainCampus	\N	F	Outbox	/user/calsuite-MainCampus/Outbox	/user/calsuite-MainCampus	Outbox	\N	\N	6	20110505T170557Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
388	0	/principals/users/agrp_Communications	/principals/users/agrp_Communications	\N	F	agrp_Communications	/user/agrp_Communications	/user	agrp_Communications	\N	\N	0	20091210T184946Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
389	0	/principals/users/agrp_Communications	/principals/users/agrp_Communications	\N	F	calendar	/user/agrp_Communications/calendar	/user/agrp_Communications	calendar	\N	\N	1	20091210T184946Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
390	0	/principals/users/agrp_Communications	/principals/users/agrp_Communications	\N	F	Inbox	/user/agrp_Communications/Inbox	/user/agrp_Communications	Inbox	\N	\N	5	20091210T191841Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
391	0	/principals/users/agrp_Communications	/principals/users/agrp_Communications	\N	F	Outbox	/user/agrp_Communications/Outbox	/user/agrp_Communications	Outbox	\N	\N	6	20091210T191841Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
392	0	/principals/users/agrp_Arts	/principals/users/agrp_Arts	\N	F	agrp_Arts	/user/agrp_Arts	/user	agrp_Arts	\N	\N	0	20091210T191259Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
393	0	/principals/users/agrp_Arts	/principals/users/agrp_Arts	\N	F	calendar	/user/agrp_Arts/calendar	/user/agrp_Arts	calendar	\N	\N	1	20091210T191259Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
394	0	/principals/users/agrp_Arts	/principals/users/agrp_Arts	\N	F	Inbox	/user/agrp_Arts/Inbox	/user/agrp_Arts	Inbox	\N	\N	5	20110505T170558Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
395	0	/principals/users/agrp_Arts	/principals/users/agrp_Arts	\N	F	Outbox	/user/agrp_Arts/Outbox	/user/agrp_Arts	Outbox	\N	\N	6	20110505T170558Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
396	0	/principals/users/agrp_English	/principals/users/agrp_English	\N	F	agrp_English	/user/agrp_English	/user	agrp_English	\N	\N	0	20091210T191350Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
397	0	/principals/users/agrp_English	/principals/users/agrp_English	\N	F	calendar	/user/agrp_English/calendar	/user/agrp_English	calendar	\N	\N	1	20091210T191350Z	\N	\N	T	T	F	F	0	\N	\N	\N	\N
398	0	/principals/users/agrp_English	/principals/users/agrp_English	\N	F	Inbox	/user/agrp_English/Inbox	/user/agrp_English	Inbox	\N	\N	5	20091223T025653Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
399	0	/principals/users/agrp_English	/principals/users/agrp_English	\N	F	Outbox	/user/agrp_English/Outbox	/user/agrp_English	Outbox	\N	\N	6	20091223T025653Z	\N	\N	T	F	F	F	0	\N	\N	\N	\N
241	1	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	T	Openings and Closings	/public/aliases/Academic Calendar/Openings and Closings	/public/aliases/Academic Calendar	Openings and Closings	Scheduled openings and closings	\N	7	20091223T025346Z	catuid=('00f1fcb8-20a0fb67-0120-a144373f-000001ed')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
261	1	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	T	Mechanical Engineering	/public/aliases/Departments/School of Engineering/Mechanical Engineering	/public/aliases/Departments/School of Engineering	Mechanical Engineering	\N	\N	7	20091223T023305Z	catuid=('402881e6-20a21413-0120-a248f865-00000020')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
265	1	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	T	Ongoing	/public/aliases/Ongoing	/public/aliases	Ongoing	\N	\N	7	20091223T035811Z	catuid=('402881e7-25b99d14-0125-b9a50c22-00000002')	bwcal:///public/cals/MainCal	T	F	F	F	900	\N	\N	\N	\N
379	1	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	Deadlines	/user/agrp_calsuite-Engineering/Deadlines	/user/agrp_calsuite-Engineering	Deadlines	\N	\N	7	20090414T160416Z	\N	bwcal:///public/aliases/Academic Calendar/Deadlines	T	F	F	F	900	\N	\N	\N	\N
381	1	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	Engineering Lectures	/user/agrp_calsuite-Engineering/Engineering Lectures	/user/agrp_calsuite-Engineering	Engineering Lectures	\N	\N	7	20090519T155156Z	\N	bwcal:///public/aliases/Lectures and Seminars	T	F	F	F	900	\N	\N	\N	\N
378	1	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	Holidays	/user/agrp_calsuite-Engineering/Holidays	/user/agrp_calsuite-Engineering	Holidays	\N	\N	7	20090414T160400Z	\N	bwcal:///public/aliases/Academic Calendar/Holidays	T	F	F	F	900	\N	\N	\N	\N
380	1	/principals/users/agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	\N	F	School of Engineering	/user/agrp_calsuite-Engineering/School of Engineering	/user/agrp_calsuite-Engineering	School of Engineering	\N	\N	7	20090414T161541Z	\N	bwcal:///public/aliases/Departments/School of Engineering	T	F	F	F	900	\N	\N	\N	\N
373	1	/principals/users/agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	\N	F	Ongoing	/user/agrp_calsuite-MainCampus/Ongoing	/user/agrp_calsuite-MainCampus	Ongoing	\N	\N	7	20091223T035908Z	\N	bwcal:///public/aliases/Ongoing	T	F	F	F	900	\N	\N	\N	\N
\.


--
-- Data for Name: bw_calsuites; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_calsuites (csid, bwseq, bw_creator, bw_owner, bwaccess, publick, csname, groupid, bw_root_collection, bw_submissions_root) FROM stdin;
523	0	/principals/users/admin	/principals/users/public-user	WONyA WU024 agrp_calsuite-MainCampusyA WLNyR 	T	MainCampus	445	/public	\N
524	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	WONyA WU025 agrp_calsuite-EngineeringyA WANyR WLNyR 	T	SoEDepartmental	446	/public	\N
\.


--
-- Data for Name: bw_categories; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_categories (categoryid, bwseq, bw_creator, bw_owner, bwaccess, publick, bw_catwdid, bw_catdescid, bw_uid) FROM stdin;
30	0	/principals/users/admin	/principals/users/public-user	\N	T	31	32	ff808181-1fd7389e-011f-d7389ec8-00000000
33	0	/principals/users/admin	/principals/users/public-user	\N	T	34	35	ff808181-1fd7389e-011f-d7389ecc-00000001
36	0	/principals/users/admin	/principals/users/public-user	\N	T	37	\N	ff808181-1fd7389e-011f-d7389ed0-00000002
38	0	/principals/users/admin	/principals/users/public-user	\N	T	39	40	ff808181-1fd7389e-011f-d7389ef9-00000003
41	0	/principals/users/admin	/principals/users/public-user	\N	T	42	43	ff808181-1fd7389e-011f-d7389eff-00000004
44	0	/principals/users/admin	/principals/users/public-user	\N	T	45	46	ff808181-1fd7389e-011f-d7389f02-00000005
47	0	/principals/users/admin	/principals/users/public-user	\N	T	48	49	ff808181-1fd7389e-011f-d7389f06-00000006
50	0	/principals/users/admin	/principals/users/public-user	\N	T	51	52	ff808181-1fd7389e-011f-d7389f0a-00000007
53	0	/principals/users/admin	/principals/users/public-user	\N	T	54	55	ff808181-1fd7389e-011f-d7389f0d-00000008
56	0	/principals/users/admin	/principals/users/public-user	\N	T	57	\N	ff808181-1fd7389e-011f-d7389f11-00000009
58	0	/principals/users/admin	/principals/users/public-user	\N	T	59	\N	ff808181-1fd7389e-011f-d7389f15-0000000a
60	0	/principals/users/admin	/principals/users/public-user	\N	T	61	62	ff808181-1fd7389e-011f-d7389f18-0000000b
63	0	/principals/users/admin	/principals/users/public-user	\N	T	64	65	ff808181-1fd7389e-011f-d7389f1c-0000000c
66	0	/principals/users/admin	/principals/users/public-user	\N	T	67	68	ff808181-1fd7389e-011f-d7389f20-0000000d
69	0	/principals/users/admin	/principals/users/public-user	\N	T	70	71	ff808181-1fd7389e-011f-d7389f24-0000000e
72	0	/principals/users/admin	/principals/users/public-user	\N	T	73	74	ff808181-1fd7389e-011f-d7389f28-0000000f
75	0	/principals/users/admin	/principals/users/public-user	\N	T	76	77	ff808181-1fd7389e-011f-d7389f2c-00000010
78	0	/principals/users/admin	/principals/users/public-user	\N	T	79	\N	ff808181-1fd7389e-011f-d7389f30-00000011
80	0	/principals/users/admin	/principals/users/public-user	\N	T	81	82	ff808181-1fd7389e-011f-d7389f33-00000012
83	0	/principals/users/admin	/principals/users/public-user	\N	T	84	85	ff808181-1fd7389e-011f-d7389f38-00000013
86	0	/principals/users/admin	/principals/users/public-user	\N	T	87	88	ff808181-1fd7389e-011f-d7389f3b-00000014
89	0	/principals/users/admin	/principals/users/public-user	\N	T	90	91	ff808181-1fd7389e-011f-d7389f3f-00000015
92	0	/principals/users/admin	/principals/users/public-user	\N	T	93	94	ff808181-1fd7389e-011f-d7389f47-00000017
95	0	/principals/users/admin	/principals/users/public-user	\N	T	96	97	ff808181-1fd7389e-011f-d7389f4b-00000018
98	0	/principals/users/admin	/principals/users/public-user	\N	T	99	\N	ff808181-1fd7389e-011f-d7389f4f-00000019
100	0	/principals/users/admin	/principals/users/public-user	\N	T	101	102	ff808181-1fd7389e-011f-d7389f52-0000001a
103	0	/principals/users/admin	/principals/users/public-user	\N	T	104	105	ff808181-1fd7389e-011f-d7389f59-0000001c
106	0	/principals/users/admin	/principals/users/public-user	\N	T	107	108	ff808181-1fd7389e-011f-d7389f60-0000001e
109	0	/principals/users/admin	/principals/users/public-user	\N	T	110	111	ff808181-1fd7389e-011f-d7389f80-0000001f
112	0	/principals/users/admin	/principals/users/public-user	\N	T	113	114	ff808181-1fd7389e-011f-d7389f84-00000020
115	0	/principals/users/admin	/principals/users/public-user	\N	T	116	\N	ff808181-1fd7389e-011f-d7389f88-00000021
117	0	/principals/users/admin	/principals/users/public-user	\N	T	118	119	ff808181-1fd7389e-011f-d7389f8b-00000022
120	0	/principals/users/admin	/principals/users/public-user	\N	T	121	122	ff808181-1fd7389e-011f-d7389f8f-00000023
123	0	/principals/users/admin	/principals/users/public-user	\N	T	124	125	ff808181-1fd7389e-011f-d7389f96-00000025
126	0	/principals/users/admin	/principals/users/public-user	\N	T	127	128	ff808181-1fd7389e-011f-d7389f9a-00000026
129	0	/principals/users/admin	/principals/users/public-user	\N	T	130	131	ff808181-1fd7389e-011f-d7389fa2-00000028
132	0	/principals/users/admin	/principals/users/public-user	\N	T	133	134	ff808181-1fd7389e-011f-d7389fa5-00000029
135	0	/principals/users/admin	/principals/users/public-user	\N	T	136	137	ff808181-1fd7389e-011f-d7389fa9-0000002a
138	0	/principals/users/admin	/principals/users/public-user	\N	T	139	140	ff808181-1fd7389e-011f-d7389fad-0000002b
141	0	/principals/users/johnsa	/principals/users/johnsa	\N	F	142	143	ff808181-1fd7389e-011f-d7389fb4-0000002d
144	0	/principals/users/admin	/principals/users/caluser1	\N	F	145	\N	ff808181-1fd7389e-011f-d738a01b-00000037
146	0	/principals/users/admin	/principals/users/caluser1	\N	F	147	\N	ff808181-1fd7389e-011f-d738a01e-00000038
148	0	/principals/users/admin	/principals/users/public-user	\N	T	149	\N	ff808181-1fd73b03-011f-d73b0642-00000001
150	0	/principals/users/admin	/principals/users/public-user	\N	T	151	\N	ff808181-1fd73b03-011f-d73b065c-00000002
152	0	/principals/users/admin	/principals/users/public-user	\N	T	153	\N	ff808181-1fd73b03-011f-d73b066b-00000004
154	0	/principals/users/admin	/principals/users/public-user	\N	T	155	\N	ff808181-1fd73b03-011f-d73b06e0-0000000a
156	0	/principals/users/admin	/principals/users/public-user	\N	T	157	\N	ff808181-1fd73b03-011f-d73b06f2-0000000b
158	0	/principals/users/admin	/principals/users/public-user	\N	T	159	\N	ff808181-1fd73b03-011f-d73b06f8-0000000c
160	0	/principals/users/admin	/principals/users/public-user	\N	T	161	\N	ff808181-1fd73b03-011f-d73b0703-0000000d
162	0	/principals/users/admin	/principals/users/public-user	\N	T	163	\N	ff808181-1fd73b03-011f-d73b0714-0000000e
164	0	/principals/users/admin	/principals/users/public-user	\N	T	165	166	ff808181-1fd73b03-011f-d73b071a-0000000f
167	0	/principals/users/admin	/principals/users/public-user	\N	T	168	\N	00f1fcb8-20a0fb67-0120-a144373f-000001ed
169	0	/principals/users/admin	/principals/users/public-user	\N	T	170	\N	402881e6-20a21413-0120-a2270ea2-00000008
171	0	/principals/users/admin	/principals/users/public-user	\N	T	172	\N	402881e6-20a21413-0120-a22de2dd-0000000d
173	0	/principals/users/admin	/principals/users/public-user	\N	T	174	\N	402881e6-20a21413-0120-a22fdf78-00000010
175	0	/principals/users/admin	/principals/users/public-user	\N	T	176	177	402881e6-20a21413-0120-a236d0b1-00000014
178	0	/principals/users/admin	/principals/users/public-user	\N	T	179	\N	402881e6-20a21413-0120-a23d71e5-00000015
180	0	/principals/users/admin	/principals/users/public-user	\N	T	181	\N	402881e6-20a21413-0120-a23e31ea-00000016
182	0	/principals/users/admin	/principals/users/public-user	\N	T	183	\N	402881e6-20a21413-0120-a247d070-0000001f
184	0	/principals/users/admin	/principals/users/public-user	\N	T	185	\N	402881e6-20a21413-0120-a248f865-00000020
186	0	/principals/users/admin	/principals/users/public-user	\N	T	187	\N	402881e6-20a21413-0120-a24bc8db-00000056
188	0	/principals/users/admin	/principals/users/public-user	\N	T	189	\N	402881e6-20a21413-0120-a24bfbc2-00000057
190	0	/principals/users/admin	/principals/users/public-user	\N	T	191	\N	402881e6-20a21413-0120-a24c742e-00000058
192	0	/principals/users/admin	/principals/users/public-user	\N	T	193	\N	00f1fcb8-20a5687f-0120-a573f575-0000003e
194	0	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	195	196	402881e7-25b99d14-0125-b9a50c22-00000002
\.


--
-- Data for Name: bw_collection_lastmods; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_collection_lastmods (bw_id, bwpath, bw_timestamp, bw_sequence) FROM stdin;
197	/public	20121121T044456Z	8940
198	/public/unbrowsable	20090306T011329Z	7
199	/public/unbrowsable/submissions	20090414T165307Z	3
200	/public/unbrowsable/submissions/submissions	20090414T165615Z	10
201	/public/cals	20090305T152303Z	2
202	/public/cals/MainCal	20091223T053150Z	31
203	/public/aliases	20091223T035845Z	27
204	/public/aliases/Alumni Events	20090512T151932Z	2
205	/public/aliases/Arts	20090305T152309Z	7
206	/public/aliases/Arts/Concerts	20090512T152109Z	2
207	/public/aliases/Arts/Dance	20090512T152119Z	2
208	/public/aliases/Arts/Exhibits	20090512T152131Z	2
209	/public/aliases/Arts/Films	20090512T152144Z	2
210	/public/aliases/Arts/Readings	20090512T152154Z	2
211	/public/aliases/Arts/Theater	20090512T152218Z	2
212	/public/aliases/Athletics	20090512T152229Z	2
213	/public/aliases/Other Events	20090512T153435Z	14
214	/public/aliases/Other Events/College Fairs	20090512T153448Z	2
215	/public/aliases/Other Events/Employee Events	20090512T153459Z	2
216	/public/aliases/Other Events/Fund Raising	20090512T153507Z	2
217	/public/aliases/Other Events/Health Services	20090512T153516Z	2
218	/public/aliases/Other Events/Open Houses	20090512T153524Z	2
219	/public/aliases/Other Events/Other	20090512T153533Z	2
220	/public/aliases/Other Events/Sales	20090512T153543Z	2
221	/public/aliases/Other Events/Tours	20090512T153603Z	2
222	/public/aliases/Other Events/University Governance	20090512T153614Z	2
223	/public/aliases/Other Events/Staff Holidays	20090512T153554Z	2
224	/public/aliases/Social Events	20090414T005544Z	9
225	/public/aliases/Social Events/Gaming	20090512T154449Z	2
226	/public/aliases/Social Events/Receptions	20090512T154503Z	2
227	/public/aliases/Social Events/Recognitions	20090512T154513Z	2
228	/public/aliases/Social Events/Social Gatherings	20090512T154535Z	2
229	/public/aliases/Social Events/Volunteer Opportunities	20090512T154551Z	2
230	/public/aliases/Social Events/Religious or Spiritual	20090512T154521Z	2
231	/public/aliases/Training	20090305T152311Z	5
232	/public/aliases/Training/Short Courses	20090512T154629Z	2
233	/public/aliases/Training/Student Career Development	20090512T154639Z	2
234	/public/aliases/Training/Training	20090512T154649Z	2
235	/public/aliases/Training/Workshops	20090512T154657Z	2
236	/public/aliases/Academic Calendar	20091223T025439Z	29
237	/public/aliases/Academic Calendar/Holidays	20090512T141049Z	2
238	/public/aliases/Academic Calendar/Commencement	20090512T141014Z	2
239	/public/aliases/Academic Calendar/Academic Calendar	20090512T140434Z	2
240	/public/aliases/Academic Calendar/Deadlines	20090512T141027Z	2
241	/public/aliases/Academic Calendar/Openings and Closings	20091223T025439Z	1
242	/public/aliases/Conferences and Meetings	20090414T004724Z	8
243	/public/aliases/Conferences and Meetings/Conferences	20090512T152246Z	2
244	/public/aliases/Conferences and Meetings/Discussions	20090512T152254Z	2
245	/public/aliases/Conferences and Meetings/Forums	20090512T152305Z	2
246	/public/aliases/Conferences and Meetings/Meetings	20090512T152320Z	2
247	/public/aliases/Lectures and Seminars	20090414T010031Z	3
248	/public/aliases/Lectures and Seminars/Lectures	20090512T152456Z	2
249	/public/aliases/Lectures and Seminars/Seminars	20090512T152505Z	2
250	/public/aliases/Services and Facilities	20091223T024506Z	13
251	/public/aliases/Services and Facilities/Construction	20090512T153647Z	2
252	/public/aliases/Services and Facilities/Facilities	20090512T153659Z	2
253	/public/aliases/Services and Facilities/Parking	20090512T153726Z	2
254	/public/aliases/Services and Facilities/Room or Building Closings	20090512T154332Z	2
255	/public/aliases/Services and Facilities/Service Outages or Changes	20090512T154353Z	2
256	/public/aliases/Special Events	20090512T154616Z	2
257	/public/aliases/Clubs and Organizations	20090512T152235Z	2
258	/public/aliases/Departments	20090414T013951Z	5
259	/public/aliases/Departments/School of Engineering	20091223T024137Z	15
260	/public/aliases/Departments/School of Engineering/Biomedical Engineering	20091223T023426Z	7
261	/public/aliases/Departments/School of Engineering/Mechanical Engineering	20091223T023349Z	1
262	/public/aliases/Departments/School of Humanities	20091223T023931Z	6
263	/public/aliases/Departments/School of Humanities/Music Department	20090512T152435Z	2
264	/public/aliases/Departments/School of Humanities/English Department	20090512T152419Z	2
265	/public/aliases/Ongoing	20091223T035845Z	1
267	/public/images	20121121T081420Z	7420
268	/public/resources	20121121T044539Z	970
269	/user	20061120T180554Z	0
270	/user/agrp_Engineering	20091210T210913Z	2
271	/user/agrp_Engineering/calendar	20070406T200548Z	0
272	/user/agrp_Engineering/Inbox	20091210T210913Z	1
273	/user/agrp_Engineering/Outbox	20091210T210913Z	1
274	/user/agrp_Library	20070406T201319Z	0
275	/user/agrp_Library/Inbox	20070406T201432Z	1
276	/user/agrp_Library/Outbox	20070406T201432Z	1
277	/user/agrp_Library/calendar	20070406T201319Z	0
278	/user/agrp_admGrp1	20090519T161022Z	23
279	/user/agrp_admGrp1/Inbox	20061121T205447Z	1
280	/user/agrp_admGrp1/Outbox	20061121T205447Z	1
281	/user/agrp_admGrp1/calendar	20061120T180554Z	0
282	/user/agrp_admGrp2	20061120T180554Z	0
283	/user/agrp_admGrp2/Inbox	20070406T183957Z	1
284	/user/agrp_admGrp2/Outbox	20070406T183957Z	1
285	/user/agrp_admGrp2/calendar	20061120T180554Z	0
286	/user/caladmin	20061120T180554Z	0
287	/user/caladmin/Inbox	20061121T205441Z	1
288	/user/caladmin/Outbox	20061121T205441Z	1
289	/user/caladmin/calendar	20061120T180554Z	0
290	/user/calowner	20061120T180554Z	0
291	/user/calowner/Inbox	20070406T183954Z	1
292	/user/calowner/Outbox	20070406T183954Z	1
293	/user/calowner/calendar	20061120T180554Z	0
294	/user/caluser	20110505T170551Z	2
295	/user/caluser/calendar	20061120T180554Z	0
296	/user/caluser/Inbox	20110505T170551Z	1
297	/user/caluser/Outbox	20110505T170551Z	1
298	/user/caluser1	20090305T152028Z	2
299	/user/caluser1/Deleted	20080318T202213Z	5
300	/user/caluser1/Inbox	20070420T143619Z	1
301	/user/caluser1/Outbox	20070420T143619Z	1
302	/user/caluser1/Trash	20080318T202449Z	7
303	/user/caluser1/calendar	20080318T202047Z	3
304	/user/caluser1/Arts	20090305T152028Z	1
305	/user/caluser1/Lectures	20090305T152028Z	1
306	/user/johnsa	20090305T152028Z	1
307	/user/johnsa/Inbox	20061121T205813Z	1
308	/user/johnsa/Outbox	20061121T205813Z	1
309	/user/johnsa/calendar	20070418T145459Z	4
310	/user/johnsa/Athletics	20090305T152027Z	1
311	/user/public-user	20090414T033914Z	82
312	/user/public-user/calendar	20061120T180554Z	0
313	/user/public-user/Inbox	20090305T152226Z	1
314	/user/public-user/Outbox	20090305T152226Z	1
315	/user/testuser01	20090305T152028Z	1
316	/user/testuser01/Inbox	20070417T192555Z	1
317	/user/testuser01/Outbox	20070417T192555Z	1
318	/user/testuser01/calendar	20070417T192555Z	0
319	/user/testuser01/Athletics	20090305T152028Z	1
320	/user/admin	20090305T152558Z	2
321	/user/admin/calendar	20090305T152558Z	0
322	/user/admin/Inbox	20090305T152558Z	1
323	/user/admin/Outbox	20090305T152558Z	1
324	/user/douglm	20090305T164939Z	2
325	/user/douglm/calendar	20090305T154826Z	0
326	/user/douglm/Inbox	20090305T164935Z	1
327	/user/douglm/Outbox	20090305T164939Z	1
328	/user/vbede	20090410T204231Z	2
329	/user/vbede/calendar	20090305T203601Z	0
330	/user/vbede/Inbox	20090410T204231Z	1
331	/user/vbede/Outbox	20090410T204231Z	1
332	/user/agrp_MechE	20090414T044105Z	2
333	/user/agrp_MechE/calendar	20090305T204244Z	0
334	/user/agrp_MechE/Inbox	20090414T044104Z	1
335	/user/agrp_MechE/Outbox	20090414T044105Z	1
336	/user/gmarconi	20110505T170554Z	2
337	/user/gmarconi/calendar	20090305T205906Z	0
338	/user/gmarconi/Inbox	20110505T170554Z	1
339	/user/gmarconi/Outbox	20110505T170554Z	1
340	/user/mtwain	20090414T041304Z	2
341	/user/mtwain/calendar	20090305T210306Z	0
342	/user/mtwain/Inbox	20090414T041304Z	1
343	/user/mtwain/Outbox	20090414T041304Z	1
344	/user/bfranklin	20090305T215452Z	2
345	/user/bfranklin/calendar	20090305T210533Z	0
346	/user/bfranklin/Inbox	20090305T215452Z	1
347	/user/bfranklin/Outbox	20090305T215452Z	1
348	/user/ggalilei	20090305T211719Z	2
349	/user/ggalilei/calendar	20090305T210923Z	0
350	/user/ggalilei/Inbox	20090305T211719Z	1
351	/user/ggalilei/Outbox	20090305T211719Z	1
352	/user/agrp_calsuite-BwClassic	20091210T191030Z	2
353	/user/agrp_calsuite-BwClassic/calendar	20091210T181554Z	0
354	/user/agrp_calsuite-BwClassic/Inbox	20091210T191030Z	1
355	/user/agrp_calsuite-BwClassic/Outbox	20091210T191030Z	1
356	/user/agrp_calsuite-MainCampus	20121121T051944Z	4540
357	/user/agrp_calsuite-MainCampus/calendar	20091210T181857Z	0
358	/user/agrp_calsuite-MainCampus/Inbox	20091210T191048Z	1
359	/user/agrp_calsuite-MainCampus/Outbox	20091210T191048Z	1
360	/user/agrp_calsuite-MainCampus/Alumni Events	20090716T172252Z	2
361	/user/agrp_calsuite-MainCampus/Arts	20090716T172258Z	2
362	/user/agrp_calsuite-MainCampus/Athletics	20090716T172303Z	2
363	/user/agrp_calsuite-MainCampus/Academic Calendar	20090716T172247Z	3
364	/user/agrp_calsuite-MainCampus/Social Events	20090716T172349Z	2
365	/user/agrp_calsuite-MainCampus/Training	20090716T172402Z	2
366	/user/agrp_calsuite-MainCampus/Clubs and Organizations	20090716T172313Z	2
367	/user/agrp_calsuite-MainCampus/Conferences and Meetings	20090716T172317Z	2
368	/user/agrp_calsuite-MainCampus/Departments	20090716T172324Z	2
369	/user/agrp_calsuite-MainCampus/Lectures and Seminars	20090716T172329Z	2
370	/user/agrp_calsuite-MainCampus/Other Events	20090716T172336Z	2
371	/user/agrp_calsuite-MainCampus/Services and Facilities	20090716T172343Z	2
372	/user/agrp_calsuite-MainCampus/Special Events	20090716T172357Z	2
373	/user/agrp_calsuite-MainCampus/Ongoing	20091223T035934Z	1
374	/user/agrp_calsuite-MainCampus/.csResources	20121121T151255Z	5690
375	/user/agrp_calsuite-Engineering	20091210T214058Z	5
376	/user/agrp_calsuite-Engineering/calendar	20091210T182509Z	0
377	/user/agrp_calsuite-Engineering/Academic Calendar	20100113T201502Z	6
378	/user/agrp_calsuite-Engineering/Holidays	20100113T201524Z	5
379	/user/agrp_calsuite-Engineering/Deadlines	20100113T201533Z	5
380	/user/agrp_calsuite-Engineering/School of Engineering	20100113T201547Z	3
381	/user/agrp_calsuite-Engineering/Engineering Lectures	20100113T201620Z	5
382	/user/agrp_calsuite-Engineering/Inbox	20091210T205340Z	1
383	/user/agrp_calsuite-Engineering/Outbox	20091210T205340Z	1
384	/user/calsuite-MainCampus	20110505T170557Z	2
385	/user/calsuite-MainCampus/calendar	20091210T183117Z	0
386	/user/calsuite-MainCampus/Inbox	20110505T170557Z	1
387	/user/calsuite-MainCampus/Outbox	20110505T170557Z	1
388	/user/agrp_Communications	20091210T191841Z	2
389	/user/agrp_Communications/calendar	20091210T184946Z	0
390	/user/agrp_Communications/Inbox	20091210T191841Z	1
391	/user/agrp_Communications/Outbox	20091210T191841Z	1
392	/user/agrp_Arts	20110505T170558Z	2
393	/user/agrp_Arts/calendar	20091210T191259Z	0
394	/user/agrp_Arts/Inbox	20110505T170558Z	1
395	/user/agrp_Arts/Outbox	20110505T170558Z	1
396	/user/agrp_English	20091223T025653Z	2
397	/user/agrp_English/calendar	20091210T191350Z	0
398	/user/agrp_English/Inbox	20091223T025653Z	1
399	/user/agrp_English/Outbox	20091223T025653Z	1
\.


--
-- Data for Name: bw_contacts; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_contacts (entityid, bwseq, bw_creator, bw_owner, bwaccess, publick, bw_uid, bw_connameid, bw_phone, bw_email, bw_link) FROM stdin;
412	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf83-00000004	413	\N	\N	\N
414	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf87-00000005	415	\N	\N	\N
416	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf8b-00000006	417	Used as a replacement when the owner of a public sponsor used by others deletes the sponsor	\N	\N
418	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf94-00000007	419	\N	\N	\N
\.


--
-- Data for Name: bw_entity_alarms; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_entity_alarms (eventid, alarmid) FROM stdin;
\.


--
-- Data for Name: bw_entity_attachments; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_entity_attachments (eventid, attachid) FROM stdin;
\.


--
-- Data for Name: bw_event_annotations; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_annotations (eventid, bwseq, bw_entity_type, bw_col_path, eventname, bw_uid, bw_creator, bw_owner, bwaccess, publick, start_date_type, start_tzid, start_dtval, start_date, bw_start_floating, end_date_type, end_tzid, end_dtval, end_date, bw_end_floating, duration, end_type, bw_nostart, bw_deleted, bwtombstoned, bw_class, bw_link, bw_geolatitude, bw_geolongitude, status, cost, bw_dtstamp, bw_lastmod, bw_created, bw_stag, priority, locationid, rfcsequence, transparency, percent_complete, completed, recurring, recurrence_id, latest_date, schedule_method, originator, bw_org_cn, bw_org_dir, bw_org_lang, bw_org_sentby, bw_org_uri, bw_org_sched_status, bw_org_dtstamp, bw_reltype, bw_reltoval, schedule_state, targetid, masterid, bw_override, bw_empty_flags) FROM stdin;
\.


--
-- Data for Name: bw_event_attendees; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_attendees (eventid, attendeeid) FROM stdin;
\.


--
-- Data for Name: bw_event_availuids; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_availuids (eventid, avluid) FROM stdin;
\.


--
-- Data for Name: bw_event_categories; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_categories (eventid, categoryid) FROM stdin;
440	36
440	148
\.


--
-- Data for Name: bw_event_comments; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_comments (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_event_contacts; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_contacts (eventid, contactid) FROM stdin;
440	418
\.


--
-- Data for Name: bw_event_descriptions; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_descriptions (bw_eventid, bw_strid) FROM stdin;
440	442
\.


--
-- Data for Name: bw_event_exdates; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_exdates (eventid, ex_date_type, ex_tzid, ex_dtval, ex_date) FROM stdin;
\.


--
-- Data for Name: bw_event_exrules; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_exrules (eventid, exrule) FROM stdin;
\.


--
-- Data for Name: bw_event_rdates; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_rdates (eventid, r_date_type, r_tzid, r_dtval, r_date) FROM stdin;
\.


--
-- Data for Name: bw_event_recipients; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_recipients (eventid, recipient) FROM stdin;
\.


--
-- Data for Name: bw_event_resources; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_resources (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_event_rrules; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_rrules (eventid, rrule) FROM stdin;
\.


--
-- Data for Name: bw_event_summaries; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_summaries (bw_eventid, bw_strid) FROM stdin;
440	441
\.


--
-- Data for Name: bw_event_xprops; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_event_xprops (bw_eventid, bwxp_position, bw_name, bw_pars, bw_value) FROM stdin;
440	0	X-BEDEWORK-ALIAS	;X-BEDEWORK-PARAM-DISPLAYNAME=Concerts	/user/agrp_calsuite-MainCampus/Arts/Concerts
440	1	X-BEDEWORK-SUBMITTEDBY	\N	admin for calsuite-MainCampus (agrp_calsuite-MainCampus)
\.


--
-- Data for Name: bw_eventann_alarms; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_alarms (eventid, alarmid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_attachments; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_attachments (eventid, attachid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_attendees; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_attendees (eventid, attendeeid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_categories; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_categories (eventid, categoryid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_comments; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_comments (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_contacts; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_contacts (eventid, contactid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_descriptions; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_descriptions (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_exdates; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_exdates (eventid, ex_date_type, ex_tzid, ex_dtval, ex_date) FROM stdin;
\.


--
-- Data for Name: bw_eventann_exrules; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_exrules (eventid, exrule) FROM stdin;
\.


--
-- Data for Name: bw_eventann_rdates; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_rdates (eventid, r_date_type, r_tzid, r_dtval, r_date) FROM stdin;
\.


--
-- Data for Name: bw_eventann_recipients; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_recipients (eventid, recipient) FROM stdin;
\.


--
-- Data for Name: bw_eventann_resources; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_resources (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_rrules; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_rrules (eventid, rrule) FROM stdin;
\.


--
-- Data for Name: bw_eventann_rstatus; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_rstatus (eventid, bw_rscode, bw_rsdescid, bw_rsdata) FROM stdin;
\.


--
-- Data for Name: bw_eventann_summaries; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_summaries (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_eventann_xprops; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_eventann_xprops (bw_eventannid, bwxp_position, bw_name, bw_pars, bw_value) FROM stdin;
\.


--
-- Data for Name: bw_events; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_events (eventid, bwseq, bw_entity_type, bw_col_path, bw_uid, eventname, bw_creator, bw_owner, bwaccess, publick, start_date_type, start_tzid, start_dtval, start_date, bw_start_floating, end_date_type, end_tzid, end_dtval, end_date, bw_end_floating, duration, end_type, bw_nostart, bw_deleted, bwtombstoned, bw_class, bw_link, bw_geolatitude, bw_geolongitude, status, cost, bw_dtstamp, bw_lastmod, bw_created, bw_stag, priority, locationid, rfcsequence, transparency, percent_complete, completed, recurring, recurrence_id, latest_date, schedule_method, originator, bw_org_cn, bw_org_dir, bw_org_lang, bw_org_sentby, bw_org_uri, bw_org_sched_status, bw_org_dtstamp, bw_reltype, bw_reltoval, schedule_state, bw_org_scheduleobj, bw_att_scheduleobj, busy_type) FROM stdin;
440	0	0	/public/images	CAL-00f1fc66-3b216718-013b-21f17765-00000050demobedework@mysite.edu	CAL-00f1fc66-3b216718-013b-21f17765-00000050.ics	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	F	America/New_York	20121121T000000	20121121T050000Z	\N	F	America/New_York	20121121T010000	20121121T060000Z	\N	PT1H	D	F	T	F	\N	\N	\N	\N	CONFIRMED	\N	20121121T081420Z	20121121T081420Z	20121121T074931Z	20121121T075535Z-2044	\N	407	0	\N	\N	\N	F	\N	20121121T081420Z-1cfc	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	f	f	1
\.


--
-- Data for Name: bw_fbcomp; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_fbcomp (bwid, bwseq, bwtype, bwvalue, eventid, fbcomp_position) FROM stdin;
\.


--
-- Data for Name: bw_filter_descriptions; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_filter_descriptions (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_filter_display_names; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_filter_display_names (bw_eventid, bw_strid) FROM stdin;
\.


--
-- Data for Name: bw_filters; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_filters (filterid, bwseq, bw_owner, publick, filtername, bwdefinition) FROM stdin;
\.


--
-- Data for Name: bw_group_members; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_group_members (groupid, memberid, member_is_group) FROM stdin;
\.


--
-- Data for Name: bw_groups; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_groups (bw_group_id, bwseq, bw_account, bw_principal_ref) FROM stdin;
\.


--
-- Data for Name: bw_locations; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_locations (entityid, bwseq, bw_creator, bw_owner, bwaccess, publick, bw_uid, bw_locaddrid, bw_locsubaddrid, bw_link) FROM stdin;
400	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf6e-00000000	401	\N	\N
402	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf75-00000001	403	\N	\N
404	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf7c-00000002	405	406	\N
407	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcdb-0f068baf-010f-068baf7f-00000003	408	\N	\N
409	0	/principals/users/admin	/principals/users/public-user	\N	T	00f1fcec-0f0c4c90-010f-0c4d6762-00000004	410	411	\N
\.


--
-- Data for Name: bw_longstrings; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_longstrings (bw_id, bwseq, bw_lang, bw_value) FROM stdin;
442	0	\N	test
\.


--
-- Data for Name: bw_preferences; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_preferences (prefid, bwseq, bw_owner, email, bw_default_calendar, skin_name, skin_style, preferred_view, preferred_view_period, bw_page_size, workdays, workday_start, workday_end, preferred_endtype, bwuser_mode, bw_hour24, bw_sched_autoresp, bw_sched_autocancelaction, bw_sched_double_book, bw_sched_autoproc_resp) FROM stdin;
451	0	/principals/users/caladmin	\N	/user/caladmin/calendar	\N	\N	All	\N	10	\N	0	0	\N	0	F	F	0	F	0
453	0	/principals/users/caluser	\N	/user/caluser/calendar	\N	\N	All	\N	10	\N	0	0	\N	0	F	F	0	F	0
455	0	/principals/users/calowner	\N	/user/calowner/calendar	\N	\N	All	\N	10	\N	0	0	\N	0	F	F	0	F	0
457	0	/principals/users/public-user	\N	/user/public-user/calendar	\N	\N	All	weekView	10	\N	0	0	\N	0	F	F	0	F	0
459	0	/principals/users/agrp_admGrp1	\N	/user/agrp_admGrp1/calendar	\N	\N	All	monthView	10	\N	0	0	\N	0	F	F	0	F	0
461	0	/principals/users/agrp_admGrp2	\N	/user/agrp_admGrp2/calendar	\N	\N	All	\N	10	\N	0	0	\N	0	F	F	0	F	0
463	0	/principals/users/johnsa	\N	/user/johnsa/calendar	\N	\N	All	\N	10	\N	0	0	\N	0	F	F	0	F	0
465	0	/principals/users/agrp_Engineering	\N	/user/agrp_Engineering/calendar	\N	\N	All	week	10	\N	0	0	\N	0	F	F	0	F	0
467	0	/principals/users/agrp_Library	\N	/user/agrp_Library/calendar	\N	\N	All	week	10	\N	0	0	\N	0	F	F	0	F	0
469	0	/principals/users/testuser01	\N	/user/testuser01/calendar	\N	\N	All	week	10	\N	0	0	\N	0	F	F	0	F	0
471	0	/principals/users/caluser1	\N	/user/caluser1/calendar	\N	\N	All	week	10	\N	0	0	\N	0	F	F	0	F	0
1	1	/principals/users/admin	\N	/user/admin/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
475	0	/principals/users/douglm	\N	/user/douglm/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
477	0	/principals/users/vbede	\N	/user/vbede/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
479	0	/principals/users/agrp_MechE	\N	/user/agrp_MechE/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
481	0	/principals/users/gmarconi	\N	/user/gmarconi/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
483	0	/principals/users/mtwain	\N	/user/mtwain/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
485	0	/principals/users/bfranklin	\N	/user/bfranklin/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
487	0	/principals/users/ggalilei	\N	/user/ggalilei/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	1
489	0	/principals/users/agrp_calsuite-BwClassic	\N	/user/agrp_calsuite-BwClassic/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	0
491	0	/principals/users/agrp_calsuite-MainCampus	\N	/user/agrp_calsuite-MainCampus/calendar	\N	\N	All	weekView	10	\N	0	0	duration	0	F	F	0	F	0
505	0	/principals/users/agrp_calsuite-Engineering	\N	/user/agrp_calsuite-Engineering/calendar	\N	\N	All	monthView	10	\N	0	0	duration	0	T	F	0	F	0
511	0	/principals/users/calsuite-MainCampus	\N	/user/calsuite-MainCampus/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	0
513	0	/principals/users/agrp_Communications	\N	/user/agrp_Communications/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	0
515	0	/principals/users/agrp_Arts	\N	/user/agrp_Arts/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	0
517	0	/principals/users/agrp_English	\N	/user/agrp_English/calendar	\N	\N	All	week	10	\N	0	0	\N	0	T	F	0	F	0
\.


--
-- Data for Name: bw_recurrences; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_recurrences (recurrence_id, masterid, bwseq, start_date_type, start_tzid, start_dtval, start_date, bw_rstart_floating, end_date_type, end_tzid, end_dtval, end_date, bw_rend_floating, overrideid) FROM stdin;
\.


--
-- Data for Name: bw_resource_contents; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_resource_contents (id, bwseq, bw_col_path, bwname, bw_value) FROM stdin;
520	0	/user/agrp_calsuite-MainCampus/.csResources	FeaturedEvents	103848
522	0	/user/agrp_calsuite-MainCampus/.csResources	Test	103849
\.


--
-- Data for Name: bw_resources; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_resources (id, bwseq, bw_col_path, bw_creator, bw_owner, bwaccess, publick, bwname, bw_created, bw_lastmod, bwsequence, bw_contenttype, bw_encoding, bwcontent_length) FROM stdin;
519	0	/user/agrp_calsuite-MainCampus/.csResources	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	FeaturedEvents	20121121T051944Z	20121121T151255Z	5690	application/xml\ttype=FeaturedEvents	\N	2005
521	0	/user/agrp_calsuite-MainCampus/.csResources	/principals/users/agrp_calsuite-MainCampus	/principals/users/public-user	\N	T	Test	20121121T054634Z	20121121T055736Z	7560	text/plain\ttype=text	\N	5
\.


--
-- Data for Name: bw_rstatus; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_rstatus (eventid, bw_rscode, bw_rsdescid, bw_rsdata) FROM stdin;
\.


--
-- Data for Name: bw_sched_msg; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_sched_msg (id, bwseq, bw_timestamp, bw_sequence, bw_lastproc, bw_inbox, bw_principal_href, bw_eventname, bw_recurrence_id) FROM stdin;
\.


--
-- Data for Name: bw_settings; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_settings (id, bwseq, bwname) FROM stdin;
3	0	bedework
\.


--
-- Data for Name: bw_strings; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_strings (bw_id, bwseq, bw_lang, bw_value) FROM stdin;
31	0	\N	Fund Raising
32	0	\N	An event staged to raise money for a unit or organization.
34	0	\N	Commencement
35	0	\N	Any graduation event staged by a University unit or the University as a whole.
37	0	\N	Concerts
39	0	\N	Dance
40	0	\N	All forms of dance, including dance performance and dances
42	0	\N	Exhibits
43	0	\N	Exhibits and installations
45	0	\N	Films
46	0	\N	Films and movies
48	0	\N	Health Services
49	0	\N	Events sponsored by health sciences units.
51	0	\N	Lectures
52	0	\N	A larger gathering (more than 50 people) that could be on an academic subject or a more general one, in which most of the communication is from speaker to audience.
54	0	\N	Open Houses
55	0	\N	An event in which a unit or organization invites visitors to their location during specified hours.
57	0	\N	Theater and Performance
59	0	\N	Readings
61	0	\N	Sales
62	0	\N	Sales
64	0	\N	Seminars
65	0	\N	A relatively small gathering (less than 50 people), usually on an academic subject, in which the speaker expects a lot of interaction.  For purposes of this calendar, colloquia and symposia are considered seminars.
67	0	\N	Special Events
68	0	\N	An event that does not occur on a regular basis and doesn't fit any other category
70	0	\N	Athletics
71	0	\N	Competitive events in football, basketball, baseball, etc.
73	0	\N	Tours
74	0	\N	When a unit offers to guide visitors through their facilities at a specified time.
76	0	\N	Training
77	0	\N	A single session or ongoing class sponsored by a unit.
79	0	\N	sys/Deadlines
81	0	\N	Conferences
82	0	\N	A series of meetings around a particular theme that lasts from half a day up to several days.
84	0	\N	Forums
85	0	\N	A meeting that usually involves several speakers on a particular topic and a fair amount of interaction with the audience.
87	0	\N	Workshops
88	0	\N	A one-session class on a particular topic.
90	0	\N	Meetings
91	0	\N	A single session of a particular group or organization that lasts less than half a day.
93	0	\N	Holidays
94	0	\N	Holidays
96	0	\N	Academic Calendar
97	0	\N	Academic Calendar
99	0	\N	Short Courses
101	0	\N	Emergencies
102	0	\N	Campus-wide emergencies
104	0	\N	Other
105	0	\N	USE ONLY IF NO OTHER CATEGORY EXISTS, and please contact us
107	0	\N	Recognitions
108	0	\N	Awards, dinners, retirement parties
110	0	\N	Receptions
111	0	\N	Receptions
113	0	\N	Social Gatherings
114	0	\N	Social gatherings too broad to fit into other categories
116	0	\N	University Governance
118	0	\N	Discussions
119	0	\N	Chaired discussions, panel discussions
121	0	\N	Employee Events
122	0	\N	Retirement counceling, insurance, hmo, etc
124	0	\N	Parking
125	0	\N	Parking
127	0	\N	Alumni Events
128	0	\N	Alumni Events
130	0	\N	Construction
131	0	\N	Construction events
133	0	\N	Facilities
134	0	\N	Campus facilities events 
136	0	\N	Volunteer Opportunities
137	0	\N	Volunteer Opportunities
139	0	\N	Student Career Development
140	0	\N	for Career Development Center 
142	0	\N	mine
143	0	\N	asdflksajflk lkjsl ksjafl ks jaflk saf
145	0	\N	Concerts
147	0	\N	Conferences
149	0	\N	Arts
151	0	\N	Theater
153	0	\N	Conferences and Meetings
155	0	\N	Lectures and Seminars
157	0	\N	Other Events
159	0	\N	College Fairs
161	0	\N	Social Events
163	0	\N	Gaming
165	0	\N	Religious-Spiritual
166	0	\N	Religious or spiritual events
168	0	\N	Scheduled Openings and Closings
170	0	\N	Services and Facilities
172	0	\N	Room or Building Closings
174	0	\N	Service Outages or Changes
176	0	\N	Staff Holidays
177	0	\N	Staff specific holidays
179	0	\N	Clubs and Organizations
181	0	\N	Departments
183	0	\N	org/Humanities
185	0	\N	org/MechE
187	0	\N	org/Music
189	0	\N	org/English
191	0	\N	org/BioMed
193	0	\N	org/Engineering
195	0	\N	sys/Ongoing
196	0	\N	tag ongoing events for use in the ongoing list if enabled in specific themes
401	0	\N	none
403	0	\N	unknown
405	0	\N	deleted
406	0	\N	Used as a replacement when the owner of a public location used by others deletes the location
408	0	\N	my location
410	0	\N	someplace
411	0	\N	somewhere
413	0	\N	none
415	0	\N	unknown
417	0	\N	deleted
419	0	\N	my contact
441	0	\N	test
\.


--
-- Data for Name: bw_system_properties; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_system_properties (bwid, bw_name, bw_value) FROM stdin;
3	Eventreg:admin-token	0572b879-e781-4871-b3fd-42459db11e1a
3	bedework:global-resources	/public/resources
3	solr-core-admin	admin/cores/
3	solr-default-core	bwpublic
3	solr-url	http://localhost:8080/solr/
3	use-solr	true
\.


--
-- Data for Name: bw_user_properties; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_user_properties (bwid, bw_name, bw_value) FROM stdin;
459	userpref:default-category	00f1fcb8-20a5687f-0120-a573f575-0000003e
491	userpref:default-image-directory	/public/images
491	userpref:default-tzid	America/New_York
491	userpref:default-view-mode	daily
505	userpref:default-category	00f1fcb8-20a5687f-0120-a573f575-0000003e
505	userpref:default-tzid	America/New_York
\.


--
-- Data for Name: bw_user_views; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_user_views (prefid, elt) FROM stdin;
451	452
453	454
455	456
457	458
459	460
461	462
463	464
465	466
467	468
469	470
471	472
1	474
475	476
477	478
479	480
481	482
483	484
485	486
487	488
489	490
491	492
491	493
491	494
491	495
491	496
491	497
491	498
491	499
491	500
491	501
491	502
491	503
491	504
505	506
505	507
505	508
505	509
505	510
511	512
513	514
515	516
517	518
\.


--
-- Data for Name: bw_users; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_users (userid, bwseq, bw_account, bw_principal_ref, instance_owner, bw_created, bw_last_logon, bw_last_access, bw_last_modify, bw_category_access, bw_contact_access, bw_location_access, bw_quota) FROM stdin;
4	0	public-user	/principals/users/public-user	F	\N	2009-12-22 22:04:24.937	2009-12-22 22:04:24.937	\N	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	0
5	0	caladmin	/principals/users/caladmin	F	2003-09-08 09:13:45	2009-03-05 10:25:18.873	2009-03-05 10:25:18.873	\N	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	10000000
6	0	calowner	/principals/users/calowner	F	2003-09-08 09:13:45	2009-03-05 11:58:28.261	2009-03-05 11:58:28.261	\N	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	10000000
7	0	caluser	/principals/users/caluser	F	2003-09-08 09:13:45	2003-09-08 13:39:06	\N	\N	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	WON3A WXN3R WZN3R 	10000000
8	0	agrp_admGrp1	/principals/users/agrp_admGrp1	F	\N	2009-07-16 13:26:22.055	2009-07-16 13:26:22.055	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
9	0	agrp_admGrp2	/principals/users/agrp_admGrp2	F	\N	2009-07-16 13:28:43.539	2009-07-16 13:28:43.539	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
10	0	johnsa	/principals/users/johnsa	F	\N	2009-12-23 00:11:17.921	2009-12-23 00:11:17.921	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
11	0	agrp_Engineering	/principals/users/agrp_Engineering	F	\N	2010-01-13 01:12:16.671	2010-01-13 01:12:16.671	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
12	0	agrp_Library	/principals/users/agrp_Library	F	\N	2009-12-22 21:56:59.828	2009-12-22 21:56:59.828	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
13	0	testuser01	/principals/users/testuser01	F	\N	2007-04-17 15:25:55.093	2007-04-17 15:25:55.093	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
14	0	caluser1	/principals/users/caluser1	F	\N	2008-03-18 16:23:53.689	2008-03-18 16:23:53.689	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
15	0	admin	/principals/users/admin	F	\N	2012-11-21 09:36:50.923	2012-11-21 09:36:50.923	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
16	0	douglm	/principals/users/douglm	F	\N	2009-03-05 23:05:59.498	2009-03-05 23:05:59.498	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
17	0	vbede	/principals/users/vbede	F	\N	2010-01-13 01:16:47.546	2010-01-13 01:16:47.546	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
18	0	agrp_MechE	/principals/users/agrp_MechE	F	\N	2009-12-22 21:57:07.453	2009-12-22 21:57:07.453	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
19	0	gmarconi	/principals/users/gmarconi	F	\N	\N	\N	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
20	0	mtwain	/principals/users/mtwain	F	\N	2009-05-19 12:10:42.109	2009-05-19 12:10:42.109	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
21	0	bfranklin	/principals/users/bfranklin	F	\N	2010-01-13 01:16:34.843	2010-01-13 01:16:34.843	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
22	0	ggalilei	/principals/users/ggalilei	F	\N	2010-01-13 01:16:22.265	2010-01-13 01:16:22.265	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
23	0	agrp_calsuite-BwClassic	/principals/users/agrp_calsuite-BwClassic	F	\N	2009-12-10 14:10:30.656	2009-12-10 14:10:30.656	\N	WONyA WU023 agrp_calsuite-BwClassicyA WANyR WLNyR 	WONyA WU023 agrp_calsuite-BwClassicyA WANyR WLNyR 	WONyA WU023 agrp_calsuite-BwClassicyA WANyR WLNyR 	10000000
24	0	agrp_calsuite-MainCampus	/principals/users/agrp_calsuite-MainCampus	F	\N	2012-11-21 09:36:50.956	2012-11-21 09:36:50.956	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
25	0	agrp_calsuite-Engineering	/principals/users/agrp_calsuite-Engineering	F	\N	2010-01-13 15:16:27.583	2010-01-13 15:16:27.583	\N	WONyA WU025 agrp_calsuite-EngineeringyA WANyR WLNyR 	WONyA WU025 agrp_calsuite-EngineeringyA WANyR WLNyR 	WONyA WU025 agrp_calsuite-EngineeringyA WANyR WLNyR 	10000000
26	0	calsuite-MainCampus	/principals/users/calsuite-MainCampus	F	\N	\N	\N	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
27	0	agrp_Communications	/principals/users/agrp_Communications	F	\N	2010-01-13 01:16:47.64	2010-01-13 01:16:47.64	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
28	0	agrp_Arts	/principals/users/agrp_Arts	F	\N	\N	\N	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
29	0	agrp_English	/principals/users/agrp_English	F	\N	2009-12-22 21:56:53.906	2009-12-22 21:56:53.906	\N	WONyA WZNnA 	WONyA WZNnA 	WONyA WZNnA 	10000000
\.


--
-- Data for Name: bw_view_collections; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_view_collections (viewid, bw_path_positon, bw_calpath) FROM stdin;
452	0	/user/caladmin
458	0	/user/public-user
460	0	/user/agrp_admGrp1
462	0	/user/agrp_admGrp2
464	0	/user/johnsa/Athletics
464	1	/user/johnsa
466	0	/user/agrp_Engineering
468	0	/user/agrp_Library
470	0	/user/testuser01/Athletics
470	1	/user/testuser01
472	0	/user/caluser1/Arts
472	1	/user/caluser1
472	2	/user/caluser1/Lectures
473	0	/user/admin
474	0	/user/admin
476	0	/user/douglm
478	0	/user/vbede
480	0	/user/agrp_MechE
482	0	/user/gmarconi
484	0	/user/mtwain
486	0	/user/bfranklin
488	0	/user/ggalilei
490	0	/user/agrp_calsuite-BwClassic
492	0	/user/agrp_calsuite-MainCampus/Academic Calendar
493	0	/user/agrp_calsuite-MainCampus/Alumni Events
493	1	/user/agrp_calsuite-MainCampus/Arts
493	2	/user/agrp_calsuite-MainCampus/Athletics
493	3	/user/agrp_calsuite-MainCampus/Clubs and Organizations
493	4	/user/agrp_calsuite-MainCampus/Conferences and Meetings
493	5	/user/agrp_calsuite-MainCampus/Departments
493	6	/user/agrp_calsuite-MainCampus/Lectures and Seminars
493	7	/user/agrp_calsuite-MainCampus/Other Events
493	8	/user/agrp_calsuite-MainCampus/Services and Facilities
493	9	/user/agrp_calsuite-MainCampus/Social Events
493	10	/user/agrp_calsuite-MainCampus/Special Events
493	11	/user/agrp_calsuite-MainCampus/Training
493	12	/user/agrp_calsuite-MainCampus/Academic Calendar
494	0	/user/agrp_calsuite-MainCampus/Alumni Events
495	0	/user/agrp_calsuite-MainCampus/Arts
496	0	/user/agrp_calsuite-MainCampus/Athletics
497	0	/user/agrp_calsuite-MainCampus/Clubs and Organizations
498	0	/user/agrp_calsuite-MainCampus/Conferences and Meetings
499	0	/user/agrp_calsuite-MainCampus/Lectures and Seminars
500	0	/user/agrp_calsuite-MainCampus/Other Events
501	0	/user/agrp_calsuite-MainCampus/Services and Facilities
502	0	/user/agrp_calsuite-MainCampus/Social Events
503	0	/user/agrp_calsuite-MainCampus/Special Events
504	0	/user/agrp_calsuite-MainCampus/Training
506	0	/user/agrp_calsuite-Engineering/Academic Calendar
507	0	/user/agrp_calsuite-Engineering/Academic Calendar
507	1	/user/agrp_calsuite-Engineering/School of Engineering
507	2	/user/agrp_calsuite-Engineering/Engineering Lectures
508	0	/user/agrp_calsuite-Engineering/Deadlines
509	0	/user/agrp_calsuite-Engineering/Holidays
510	0	/user/agrp_calsuite-Engineering/Engineering Lectures
512	0	/user/calsuite-MainCampus
514	0	/user/agrp_Communications
516	0	/user/agrp_Arts
518	0	/user/agrp_English
\.


--
-- Data for Name: bw_views; Type: TABLE DATA; Schema: public; Owner: bw
--

COPY public.bw_views (viewid, bwseq, viewname) FROM stdin;
452	0	All
454	0	All
456	0	All
458	0	All
460	0	All
462	0	All
464	0	All
466	0	All
468	0	All
470	0	All
472	0	All
473	1	All
474	1	All
476	0	All
478	0	All
480	0	All
482	0	All
484	0	All
486	0	All
488	0	All
490	0	All
492	0	Academic Calendar
493	0	All
494	0	Alumni Events
495	0	Arts
496	0	Athletics
497	0	Clubs and Organizations
498	0	Conferences and Meetings
499	0	Lectures and Seminars
500	0	Other Events
501	0	Services and Facilities
502	0	Social Events
503	0	Special Events
504	0	Training
506	0	Academic Calendar (complete)
507	0	All
508	0	Deadlines
509	0	Holidays
510	0	Lectures
512	0	All
514	0	All
516	0	All
518	0	All
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: bw
--

SELECT pg_catalog.setval('public.hibernate_sequence', 524, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: -
--

BEGIN;

SELECT pg_catalog.lo_open('103848', 131072);
SELECT pg_catalog.lowrite(0, '\x5044393462577767646d567963326c76626a30694d533477496a382b44516f38495330744945647362324a686243427a5a5852306157356e6379426d623349675a6d5668644856795a5751670a5a585a6c626e527a494746795a53427a5a585167615734676447686c625756545a5852306157356e63793534633277754943414e4369416749434167564768706379426d6157786c494842790a62335a705a47567a4948526f5a53426b5958526849475a766369426d5a57463064584a6c5a43426c646d567564484d6764326c306143427a6232316c49484e336158526a6147567a44516f670a4943416749475a766369426f623363676447686c65534268636d556764584e6c5a4334744c54344e436a786d5a57463064584a6c5a4556325a573530637a344e4369416750475a6c595852310a636d567a5432342b64484a315a5477765a6d5668644856795a584e50626a3467504345744c534230636e566c494852764948567a5a53426d5a57463064584a6c637977675a6d4673633255670a6447386764584e6c4947646c626d567961574d67634778685932566f6232786b5a584a7a494330745067304b4943413863326c755a32786c5457396b5a54356d5957787a5a54777663326c750a5a32786c5457396b5a543467504345744c534230636e566c49475a766369426849484e70626d64735a5342775957356c4943687a6157356e624755704c43426d5957787a5a53426d623349670a59534230636d6c7764486c6a6143416f5a334a7664584170494330745067304b494341385a6d5668644856795a584d2b44516f674943416750476479623356775067304b49434167494341670a50476c745957646c5067304b494341674943416749434138626d46745a54347659324673636e4e795979354e59576c75513246746348567a4c33526f5a57316c637939695a57526c643239790a6131526f5a57316c4c325a6c59585231636d566b4c324a6c5a475575616e426e504339755957316c5067304b49434167494341674943413862476c75617a356f644852774f6938765a5734750a64326c726158426c5a476c684c6d39795a793933615774704c30526c5833526c62584276636e567458334a6864476c76626d55384c327870626d732b44516f674943416749434167494478300a6232397356476c77506b526c4948526c62584276636e567449484a6864476c76626d55384c335276623278556158412b44516f6749434167494341384c326c745957646c5067304b494341670a4943416750476c745957646c5067304b494341674943416749434138626d46745a54347659324673636e4e795979354e59576c75513246746348567a4c33526f5a57316c637939695a57526c0a643239796131526f5a57316c4c325a6c59585231636d566b4c32646c64485270626d647a644746796447566b4c6d70775a7a7776626d46745a54344e436941674943416749434167504778700a626d732b6148523063446f764c33647061326b75616d467a6157637562334a6e4c3252706333427359586b76516c644c4d7a6776516c63724d7934344b30646c64485270626d6372553352680a636e526c5a44777662476c75617a344e43694167494341674943416750485276623278556158412b516d566b5a586476636d73675232563064476c755a794254644746796447566b494564310a6157526c504339306232397356476c775067304b4943416749434167504339706257466e5a54344e4369416749434167494478706257466e5a54344e436941674943416749434167504735680a6257552b4c324e6862484a7a636d4d7554574670626b4e686258423163793930614756745a584d76596d566b5a586476636d7455614756745a53396d5a57463064584a6c5a4339695a57526c0a6432397961793571634763384c3235686257552b44516f6749434167494341674944787361573572506d6830644841364c79393364336375616d467a6157637562334a6e4c324a6c5a4756330a62334a724c325276593356745a57353059585270623234384c327870626d732b44516f674943416749434167494478306232397356476c77506b4a6c5a47563362334a7249455276593356740a5a57353059585270623234384c335276623278556158412b44516f6749434167494341384c326c745957646c5067304b49434167494477765a334a766458412b44516f674943416750484e700a626d64735a54344e4369416749434167494478706257466e5a54344e436941674943416749434167504735686257552b4c324e6862484a7a636d4d7554574670626b4e6862584231637939300a614756745a584d76596d566b5a586476636d7455614756745a53396d5a57463064584a6c5a43396964314e70626d64735a564268626d56734c6d70775a7a7776626d46745a54344e436941670a494341674943416750477870626d732b6148523063446f764c3364336479357159584e705a793576636d6376596d566b5a586476636d73384c327870626d732b44516f6749434167494341670a494478306232397356476c77506b4a6c5a47563362334a724946646c596e4e70644755384c335276623278556158412b44516f6749434167494341384c326c745957646c5067304b494341670a4944777663326c755a32786c5067304b494341384c325a6c59585231636d567a5067304b494341385a3256755a584a7059334d2b44516f674943416750476479623356775067304b494341670a4943416750476c745957646c5067304b435478755957316c5069396a5957787963334a6a4c6b3168615735445957317764584d766447686c6257567a4c324a6c5a47563362334a725647686c0a625755765a6d5668644856795a575176596d566b5a533571634763384c3235686257552b44516f4a50485276623278556158412b52475567644756746347397964573067636d4630615739750a5a54777664473976624652706344344e436941674943416749447776615731685a32552b44516f674943416749434138615731685a32552b44516f674943416749434167494478755957316c0a5069396a5957787963334a6a4c6b3168615735445957317764584d766447686c6257567a4c324a6c5a47563362334a725647686c625755765a6d5668644856795a5751765a32563064476c750a5a334e3059584a305a575175616e426e504339755957316c5067304b4943416749434167494341386447397662465270634435435a57526c643239796179424562324e3162575675644746300a61573975504339306232397356476c775067304b4943416749434167504339706257466e5a54344e4369416749434167494478706257466e5a54344e436941674943416749434167504735680a6257552b4c324e6862484a7a636d4d7554574670626b4e686258423163793930614756745a584d76596d566b5a586476636d7455614756745a53396d5a57463064584a6c5a4339695a57526c0a6432397961793571634763384c3235686257552b44516f674943416749434167494478306232397356476c77506b4a6c5a47563362334a724946646c596e4e70644755384c335276623278550a6158412b44516f6749434167494341384c326c745957646c5067304b49434167494477765a334a766458412b44516f67494477765a3256755a584a7059334d2b44516f384c325a6c595852310a636d566b52585a6c626e527a');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('103849', 131072);
SELECT pg_catalog.lowrite(0, '\x6447567a');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- Name: bw_admingroupmembers bw_admingroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_admingroupmembers
    ADD CONSTRAINT bw_admingroupmembers_pkey PRIMARY KEY (bw_groupid, memberid, member_is_group);


--
-- Name: bw_admingroups bw_admingroups_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_admingroups
    ADD CONSTRAINT bw_admingroups_pkey PRIMARY KEY (bw_groupid);


--
-- Name: bw_alarm_attendees bw_alarm_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarm_attendees
    ADD CONSTRAINT bw_alarm_attendees_pkey PRIMARY KEY (alarmid, attendeeid);


--
-- Name: bw_alarm_xprops bw_alarm_xprops_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarm_xprops
    ADD CONSTRAINT bw_alarm_xprops_pkey PRIMARY KEY (alarmid, bwxp_position);


--
-- Name: bw_alarmdescriptions bw_alarmdescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmdescriptions
    ADD CONSTRAINT bw_alarmdescriptions_pkey PRIMARY KEY (bw_alarmid, bw_strid);


--
-- Name: bw_alarms bw_alarms_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarms
    ADD CONSTRAINT bw_alarms_pkey PRIMARY KEY (alarmid);


--
-- Name: bw_alarmsummaries bw_alarmsummaries_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmsummaries
    ADD CONSTRAINT bw_alarmsummaries_pkey PRIMARY KEY (bw_alarmid, bw_strid);


--
-- Name: bw_attachments bw_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_attachments
    ADD CONSTRAINT bw_attachments_pkey PRIMARY KEY (bwid);


--
-- Name: bw_attendees bw_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_attendees
    ADD CONSTRAINT bw_attendees_pkey PRIMARY KEY (attendeeid);


--
-- Name: bw_auth bw_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_auth
    ADD CONSTRAINT bw_auth_pkey PRIMARY KEY (userid);


--
-- Name: bw_authprefcalendars bw_authprefcalendars_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcalendars
    ADD CONSTRAINT bw_authprefcalendars_pkey PRIMARY KEY (userid, calendarid);


--
-- Name: bw_authprefcategories bw_authprefcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcategories
    ADD CONSTRAINT bw_authprefcategories_pkey PRIMARY KEY (userid, categoryid);


--
-- Name: bw_authprefcontacts bw_authprefcontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcontacts
    ADD CONSTRAINT bw_authprefcontacts_pkey PRIMARY KEY (userid, contactid);


--
-- Name: bw_authpreflocations bw_authpreflocations_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authpreflocations
    ADD CONSTRAINT bw_authpreflocations_pkey PRIMARY KEY (userid, locationid);


--
-- Name: bw_calendar_categories bw_calendar_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calendar_categories
    ADD CONSTRAINT bw_calendar_categories_pkey PRIMARY KEY (calendarid, categoryid);


--
-- Name: bw_calendars bw_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calendars
    ADD CONSTRAINT bw_calendars_pkey PRIMARY KEY (id);


--
-- Name: bw_calsuites bw_calsuites_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calsuites
    ADD CONSTRAINT bw_calsuites_pkey PRIMARY KEY (csid);


--
-- Name: bw_categories bw_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_categories
    ADD CONSTRAINT bw_categories_pkey PRIMARY KEY (categoryid);


--
-- Name: bw_collection_lastmods bw_collection_lastmods_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_collection_lastmods
    ADD CONSTRAINT bw_collection_lastmods_pkey PRIMARY KEY (bw_id);


--
-- Name: bw_contacts bw_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_contacts
    ADD CONSTRAINT bw_contacts_pkey PRIMARY KEY (entityid);


--
-- Name: bw_entity_alarms bw_entity_alarms_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_entity_alarms
    ADD CONSTRAINT bw_entity_alarms_pkey PRIMARY KEY (eventid, alarmid);


--
-- Name: bw_entity_attachments bw_entity_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_entity_attachments
    ADD CONSTRAINT bw_entity_attachments_pkey PRIMARY KEY (eventid, attachid);


--
-- Name: bw_event_annotations bw_event_annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_annotations
    ADD CONSTRAINT bw_event_annotations_pkey PRIMARY KEY (eventid);


--
-- Name: bw_event_attendees bw_event_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_attendees
    ADD CONSTRAINT bw_event_attendees_pkey PRIMARY KEY (eventid, attendeeid);


--
-- Name: bw_event_availuids bw_event_availuids_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_availuids
    ADD CONSTRAINT bw_event_availuids_pkey PRIMARY KEY (eventid, avluid);


--
-- Name: bw_event_categories bw_event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_categories
    ADD CONSTRAINT bw_event_categories_pkey PRIMARY KEY (eventid, categoryid);


--
-- Name: bw_event_comments bw_event_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_comments
    ADD CONSTRAINT bw_event_comments_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_event_contacts bw_event_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_contacts
    ADD CONSTRAINT bw_event_contacts_pkey PRIMARY KEY (eventid, contactid);


--
-- Name: bw_event_descriptions bw_event_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_descriptions
    ADD CONSTRAINT bw_event_descriptions_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_event_exdates bw_event_exdates_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_exdates
    ADD CONSTRAINT bw_event_exdates_pkey PRIMARY KEY (eventid, ex_date_type, ex_dtval, ex_date);


--
-- Name: bw_event_exrules bw_event_exrules_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_exrules
    ADD CONSTRAINT bw_event_exrules_pkey PRIMARY KEY (eventid, exrule);


--
-- Name: bw_event_rdates bw_event_rdates_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_rdates
    ADD CONSTRAINT bw_event_rdates_pkey PRIMARY KEY (eventid, r_date_type, r_dtval, r_date);


--
-- Name: bw_event_recipients bw_event_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_recipients
    ADD CONSTRAINT bw_event_recipients_pkey PRIMARY KEY (eventid, recipient);


--
-- Name: bw_event_resources bw_event_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_resources
    ADD CONSTRAINT bw_event_resources_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_event_rrules bw_event_rrules_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_rrules
    ADD CONSTRAINT bw_event_rrules_pkey PRIMARY KEY (eventid, rrule);


--
-- Name: bw_event_summaries bw_event_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_summaries
    ADD CONSTRAINT bw_event_summaries_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_event_xprops bw_event_xprops_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_xprops
    ADD CONSTRAINT bw_event_xprops_pkey PRIMARY KEY (bw_eventid, bwxp_position);


--
-- Name: bw_eventann_alarms bw_eventann_alarms_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_alarms
    ADD CONSTRAINT bw_eventann_alarms_pkey PRIMARY KEY (eventid, alarmid);


--
-- Name: bw_eventann_attachments bw_eventann_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_attachments
    ADD CONSTRAINT bw_eventann_attachments_pkey PRIMARY KEY (eventid, attachid);


--
-- Name: bw_eventann_attendees bw_eventann_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_attendees
    ADD CONSTRAINT bw_eventann_attendees_pkey PRIMARY KEY (eventid, attendeeid);


--
-- Name: bw_eventann_categories bw_eventann_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_categories
    ADD CONSTRAINT bw_eventann_categories_pkey PRIMARY KEY (eventid, categoryid);


--
-- Name: bw_eventann_comments bw_eventann_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_comments
    ADD CONSTRAINT bw_eventann_comments_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_eventann_contacts bw_eventann_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_contacts
    ADD CONSTRAINT bw_eventann_contacts_pkey PRIMARY KEY (eventid, contactid);


--
-- Name: bw_eventann_descriptions bw_eventann_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_descriptions
    ADD CONSTRAINT bw_eventann_descriptions_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_eventann_exdates bw_eventann_exdates_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_exdates
    ADD CONSTRAINT bw_eventann_exdates_pkey PRIMARY KEY (eventid, ex_date_type, ex_dtval, ex_date);


--
-- Name: bw_eventann_exrules bw_eventann_exrules_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_exrules
    ADD CONSTRAINT bw_eventann_exrules_pkey PRIMARY KEY (eventid, exrule);


--
-- Name: bw_eventann_rdates bw_eventann_rdates_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_rdates
    ADD CONSTRAINT bw_eventann_rdates_pkey PRIMARY KEY (eventid, r_date_type, r_dtval, r_date);


--
-- Name: bw_eventann_recipients bw_eventann_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_recipients
    ADD CONSTRAINT bw_eventann_recipients_pkey PRIMARY KEY (eventid, recipient);


--
-- Name: bw_eventann_resources bw_eventann_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_resources
    ADD CONSTRAINT bw_eventann_resources_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_eventann_summaries bw_eventann_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_summaries
    ADD CONSTRAINT bw_eventann_summaries_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_eventann_xprops bw_eventann_xprops_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_xprops
    ADD CONSTRAINT bw_eventann_xprops_pkey PRIMARY KEY (bw_eventannid, bwxp_position);


--
-- Name: bw_events bw_events_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_events
    ADD CONSTRAINT bw_events_pkey PRIMARY KEY (eventid);


--
-- Name: bw_fbcomp bw_fbcomp_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_fbcomp
    ADD CONSTRAINT bw_fbcomp_pkey PRIMARY KEY (bwid);


--
-- Name: bw_filter_descriptions bw_filter_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_descriptions
    ADD CONSTRAINT bw_filter_descriptions_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_filter_display_names bw_filter_display_names_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_display_names
    ADD CONSTRAINT bw_filter_display_names_pkey PRIMARY KEY (bw_eventid, bw_strid);


--
-- Name: bw_filters bw_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filters
    ADD CONSTRAINT bw_filters_pkey PRIMARY KEY (filterid);


--
-- Name: bw_group_members bw_group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_group_members
    ADD CONSTRAINT bw_group_members_pkey PRIMARY KEY (groupid, memberid, member_is_group);


--
-- Name: bw_groups bw_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_groups
    ADD CONSTRAINT bw_groups_pkey PRIMARY KEY (bw_group_id);


--
-- Name: bw_locations bw_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_locations
    ADD CONSTRAINT bw_locations_pkey PRIMARY KEY (entityid);


--
-- Name: bw_longstrings bw_longstrings_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_longstrings
    ADD CONSTRAINT bw_longstrings_pkey PRIMARY KEY (bw_id);


--
-- Name: bw_preferences bw_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_preferences
    ADD CONSTRAINT bw_preferences_pkey PRIMARY KEY (prefid);


--
-- Name: bw_recurrences bw_recurrences_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_recurrences
    ADD CONSTRAINT bw_recurrences_pkey PRIMARY KEY (recurrence_id, masterid);


--
-- Name: bw_resource_contents bw_resource_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_resource_contents
    ADD CONSTRAINT bw_resource_contents_pkey PRIMARY KEY (id);


--
-- Name: bw_resources bw_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_resources
    ADD CONSTRAINT bw_resources_pkey PRIMARY KEY (id);


--
-- Name: bw_sched_msg bw_sched_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_sched_msg
    ADD CONSTRAINT bw_sched_msg_pkey PRIMARY KEY (id);


--
-- Name: bw_settings bw_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_settings
    ADD CONSTRAINT bw_settings_pkey PRIMARY KEY (id);


--
-- Name: bw_strings bw_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_strings
    ADD CONSTRAINT bw_strings_pkey PRIMARY KEY (bw_id);


--
-- Name: bw_user_views bw_user_views_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_user_views
    ADD CONSTRAINT bw_user_views_pkey PRIMARY KEY (prefid, elt);


--
-- Name: bw_users bw_users_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_users
    ADD CONSTRAINT bw_users_pkey PRIMARY KEY (userid);


--
-- Name: bw_view_collections bw_view_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_view_collections
    ADD CONSTRAINT bw_view_collections_pkey PRIMARY KEY (viewid, bw_path_positon);


--
-- Name: bw_views bw_views_pkey; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_views
    ADD CONSTRAINT bw_views_pkey PRIMARY KEY (viewid);


--
-- Name: bw_preferences uk_64ge5mxj9s57m7lwhyjsrro4i; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_preferences
    ADD CONSTRAINT uk_64ge5mxj9s57m7lwhyjsrro4i UNIQUE (bw_owner);


--
-- Name: bw_eventann_comments uk_8j4d2yhjitnl760neelf5j89; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_comments
    ADD CONSTRAINT uk_8j4d2yhjitnl760neelf5j89 UNIQUE (bw_strid);


--
-- Name: bw_filter_descriptions uk_8mkcck8e5s63dt8fbh33sru7g; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_descriptions
    ADD CONSTRAINT uk_8mkcck8e5s63dt8fbh33sru7g UNIQUE (bw_strid);


--
-- Name: bw_rstatus uk_9xeub1vinqx3cs9jpwgx70xsu; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_rstatus
    ADD CONSTRAINT uk_9xeub1vinqx3cs9jpwgx70xsu UNIQUE (bw_rsdescid);


--
-- Name: bw_alarmsummaries uk_agd2njwc0ubud5jjkc69guvyv; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmsummaries
    ADD CONSTRAINT uk_agd2njwc0ubud5jjkc69guvyv UNIQUE (bw_strid);


--
-- Name: bw_event_comments uk_bepvx4dr6ye3g0mlsojd4nghn; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_comments
    ADD CONSTRAINT uk_bepvx4dr6ye3g0mlsojd4nghn UNIQUE (bw_strid);


--
-- Name: bw_eventann_rstatus uk_bf1kxjooqbu67ommghucv9j1w; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_rstatus
    ADD CONSTRAINT uk_bf1kxjooqbu67ommghucv9j1w UNIQUE (bw_rsdescid);


--
-- Name: bw_locations uk_cl1g4ns6am8r9xpcrdun4kxaw; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_locations
    ADD CONSTRAINT uk_cl1g4ns6am8r9xpcrdun4kxaw UNIQUE (bw_uid);


--
-- Name: bw_locations uk_eq0qj3ayoi4tiossejlgbojrw; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_locations
    ADD CONSTRAINT uk_eq0qj3ayoi4tiossejlgbojrw UNIQUE (bw_locsubaddrid);


--
-- Name: bw_calsuites uk_f09xf5tetup3aurknv6wmkdl9; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calsuites
    ADD CONSTRAINT uk_f09xf5tetup3aurknv6wmkdl9 UNIQUE (csname);


--
-- Name: bw_categories uk_ftcs94ltjhsems3eo52bwsyjc; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_categories
    ADD CONSTRAINT uk_ftcs94ltjhsems3eo52bwsyjc UNIQUE (bw_catdescid);


--
-- Name: bw_categories uk_hdp94b0mo4p6n8tbq4haa0b6e; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_categories
    ADD CONSTRAINT uk_hdp94b0mo4p6n8tbq4haa0b6e UNIQUE (bw_uid);


--
-- Name: bw_event_resources uk_hi8pvu1cr6qxcgsftqj8hynw6; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_resources
    ADD CONSTRAINT uk_hi8pvu1cr6qxcgsftqj8hynw6 UNIQUE (bw_strid);


--
-- Name: bw_contacts uk_ipa5dcrtyhqmnedhujrnv61iy; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_contacts
    ADD CONSTRAINT uk_ipa5dcrtyhqmnedhujrnv61iy UNIQUE (bw_connameid);


--
-- Name: bw_locations uk_irp22ttf09p8dhtf4k5d3rxup; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_locations
    ADD CONSTRAINT uk_irp22ttf09p8dhtf4k5d3rxup UNIQUE (bw_locaddrid);


--
-- Name: bw_filter_display_names uk_kuosxtu558hmi9rwoq6dynt7d; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_display_names
    ADD CONSTRAINT uk_kuosxtu558hmi9rwoq6dynt7d UNIQUE (bw_strid);


--
-- Name: bw_eventann_descriptions uk_lqxnyoqmw2b1l0bcvij4p088j; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_descriptions
    ADD CONSTRAINT uk_lqxnyoqmw2b1l0bcvij4p088j UNIQUE (bw_strid);


--
-- Name: bw_eventann_summaries uk_lvsyvk6tp09glefmhkqmwgsvi; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_summaries
    ADD CONSTRAINT uk_lvsyvk6tp09glefmhkqmwgsvi UNIQUE (bw_strid);


--
-- Name: bw_alarmdescriptions uk_m2efnj4j34psfevyqfbyria0r; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmdescriptions
    ADD CONSTRAINT uk_m2efnj4j34psfevyqfbyria0r UNIQUE (bw_strid);


--
-- Name: bw_contacts uk_ni5bidef7j8dasot6j9rls9ft; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_contacts
    ADD CONSTRAINT uk_ni5bidef7j8dasot6j9rls9ft UNIQUE (bw_uid);


--
-- Name: bw_event_descriptions uk_p12g7wi7540mfrt30uemikb9g; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_descriptions
    ADD CONSTRAINT uk_p12g7wi7540mfrt30uemikb9g UNIQUE (bw_strid);


--
-- Name: bw_categories uk_paxb6fb83dq83lmy7xqskalir; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_categories
    ADD CONSTRAINT uk_paxb6fb83dq83lmy7xqskalir UNIQUE (bw_catwdid);


--
-- Name: bw_eventann_resources uk_pjflu0vdw36yud2kfnw3phxe9; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_resources
    ADD CONSTRAINT uk_pjflu0vdw36yud2kfnw3phxe9 UNIQUE (bw_strid);


--
-- Name: bw_event_summaries uk_q6rhxb656g69a28at99idwsfl; Type: CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_summaries
    ADD CONSTRAINT uk_q6rhxb656g69a28at99idwsfl UNIQUE (bw_strid);


--
-- Name: bw_idx_attsobj; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bw_idx_attsobj ON public.bw_events USING btree (bw_att_scheduleobj);


--
-- Name: bw_idx_orgsobj; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bw_idx_orgsobj ON public.bw_events USING btree (bw_org_scheduleobj);


--
-- Name: bwidx_ag_group_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_ag_group_owner ON public.bw_admingroups USING btree (bw_group_owner);


--
-- Name: bwidx_ag_href; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_ag_href ON public.bw_admingroups USING btree (bw_principal_ref);


--
-- Name: bwidx_ag_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_ag_owner ON public.bw_admingroups USING btree (bw_owner);


--
-- Name: bwidx_alarm_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_alarm_owner ON public.bw_alarms USING btree (bw_owner);


--
-- Name: bwidx_au_user; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_au_user ON public.bw_auth USING btree (bw_user);


--
-- Name: bwidx_cal_colpath; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cal_colpath ON public.bw_calendars USING btree (bw_col_path);


--
-- Name: bwidx_cal_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cal_creator ON public.bw_calendars USING btree (bw_creator);


--
-- Name: bwidx_cal_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cal_owner ON public.bw_calendars USING btree (bw_owner);


--
-- Name: bwidx_calpath; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_calpath ON public.bw_calendars USING btree (bwpath);


--
-- Name: bwidx_cals_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cals_creator ON public.bw_calsuites USING btree (bw_creator);


--
-- Name: bwidx_cals_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cals_owner ON public.bw_calsuites USING btree (bw_owner);


--
-- Name: bwidx_calsuite_group; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_calsuite_group ON public.bw_calsuites USING btree (groupid);


--
-- Name: bwidx_cat_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cat_creator ON public.bw_categories USING btree (bw_creator);


--
-- Name: bwidx_cat_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cat_owner ON public.bw_categories USING btree (bw_owner);


--
-- Name: bwidx_category_uid; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_category_uid ON public.bw_categories USING btree (bw_uid);


--
-- Name: bwidx_collm_path; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_collm_path ON public.bw_collection_lastmods USING btree (bwpath);


--
-- Name: bwidx_con_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_con_creator ON public.bw_contacts USING btree (bw_creator);


--
-- Name: bwidx_con_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_con_owner ON public.bw_contacts USING btree (bw_owner);


--
-- Name: bwidx_contact_uid; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_contact_uid ON public.bw_contacts USING btree (bw_uid);


--
-- Name: bwidx_cs_rootcol; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cs_rootcol ON public.bw_calsuites USING btree (bw_root_collection);


--
-- Name: bwidx_cs_subroot; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_cs_subroot ON public.bw_calsuites USING btree (bw_submissions_root);


--
-- Name: bwidx_eann_colpath; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_colpath ON public.bw_event_annotations USING btree (bw_col_path);


--
-- Name: bwidx_eann_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_creator ON public.bw_event_annotations USING btree (bw_creator);


--
-- Name: bwidx_eann_deleted; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_deleted ON public.bw_event_annotations USING btree (bw_deleted);


--
-- Name: bwidx_eann_end; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_end ON public.bw_event_annotations USING btree (end_date);


--
-- Name: bwidx_eann_end_floating; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_end_floating ON public.bw_event_annotations USING btree (bw_end_floating);


--
-- Name: bwidx_eann_exdate; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_exdate ON public.bw_eventann_exdates USING btree (ex_date);


--
-- Name: bwidx_eann_latest_date; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_latest_date ON public.bw_event_annotations USING btree (latest_date);


--
-- Name: bwidx_eann_location; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_location ON public.bw_event_annotations USING btree (locationid);


--
-- Name: bwidx_eann_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_owner ON public.bw_event_annotations USING btree (bw_owner);


--
-- Name: bwidx_eann_rdate; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_rdate ON public.bw_eventann_rdates USING btree (r_date);


--
-- Name: bwidx_eann_recurring; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_recurring ON public.bw_event_annotations USING btree (recurring);


--
-- Name: bwidx_eann_start; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_start ON public.bw_event_annotations USING btree (start_date);


--
-- Name: bwidx_eann_start_floating; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_start_floating ON public.bw_event_annotations USING btree (bw_start_floating);


--
-- Name: bwidx_eann_tombstoned; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_eann_tombstoned ON public.bw_event_annotations USING btree (bwtombstoned);


--
-- Name: bwidx_ev_colpath; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_ev_colpath ON public.bw_events USING btree (bw_col_path);


--
-- Name: bwidx_event_cal_name_uid; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_cal_name_uid ON public.bw_events USING btree (bw_uid, eventname);


--
-- Name: bwidx_event_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_creator ON public.bw_events USING btree (bw_creator);


--
-- Name: bwidx_event_deleted; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_deleted ON public.bw_events USING btree (bw_deleted);


--
-- Name: bwidx_event_end; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_end ON public.bw_events USING btree (end_date);


--
-- Name: bwidx_event_end_floating; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_end_floating ON public.bw_events USING btree (bw_end_floating);


--
-- Name: bwidx_event_exdate; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_exdate ON public.bw_event_exdates USING btree (ex_date);


--
-- Name: bwidx_event_latest_date; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_latest_date ON public.bw_events USING btree (latest_date);


--
-- Name: bwidx_event_location; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_location ON public.bw_events USING btree (locationid);


--
-- Name: bwidx_event_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_owner ON public.bw_events USING btree (bw_owner);


--
-- Name: bwidx_event_rdate; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_rdate ON public.bw_event_rdates USING btree (r_date);


--
-- Name: bwidx_event_recurring; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_recurring ON public.bw_events USING btree (recurring);


--
-- Name: bwidx_event_start; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_start ON public.bw_events USING btree (start_date);


--
-- Name: bwidx_event_start_floating; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_start_floating ON public.bw_events USING btree (bw_start_floating);


--
-- Name: bwidx_event_tombstoned; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_event_tombstoned ON public.bw_events USING btree (bwtombstoned);


--
-- Name: bwidx_flt_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_flt_owner ON public.bw_filters USING btree (bw_owner);


--
-- Name: bwidx_grp_href; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_grp_href ON public.bw_groups USING btree (bw_principal_ref);


--
-- Name: bwidx_loc_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_loc_creator ON public.bw_locations USING btree (bw_creator);


--
-- Name: bwidx_loc_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_loc_owner ON public.bw_locations USING btree (bw_owner);


--
-- Name: bwidx_loc_uid; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_loc_uid ON public.bw_locations USING btree (bw_uid);


--
-- Name: bwidx_prefs_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_prefs_owner ON public.bw_preferences USING btree (bw_owner);


--
-- Name: bwidx_recur_end; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_recur_end ON public.bw_recurrences USING btree (end_date);


--
-- Name: bwidx_recur_start; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_recur_start ON public.bw_recurrences USING btree (start_date);


--
-- Name: bwidx_rend_floating; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_rend_floating ON public.bw_recurrences USING btree (bw_rend_floating);


--
-- Name: bwidx_rsrc_colpath; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_rsrc_colpath ON public.bw_resources USING btree (bw_col_path);


--
-- Name: bwidx_rsrc_content_colpath; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_rsrc_content_colpath ON public.bw_resource_contents USING btree (bw_col_path);


--
-- Name: bwidx_rsrc_creator; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_rsrc_creator ON public.bw_resources USING btree (bw_creator);


--
-- Name: bwidx_rsrc_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_rsrc_owner ON public.bw_resources USING btree (bw_owner);


--
-- Name: bwidx_rstart_floating; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_rstart_floating ON public.bw_recurrences USING btree (bw_rstart_floating);


--
-- Name: bwidx_smsg_eventname; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_smsg_eventname ON public.bw_sched_msg USING btree (bw_eventname);


--
-- Name: bwidx_smsg_principal; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_smsg_principal ON public.bw_sched_msg USING btree (bw_principal_href);


--
-- Name: bwidx_smsg_timestamp; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_smsg_timestamp ON public.bw_sched_msg USING btree (bw_timestamp);


--
-- Name: bwidx_user_href; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_user_href ON public.bw_users USING btree (bw_principal_ref);


--
-- Name: bwidx_user_instance_owner; Type: INDEX; Schema: public; Owner: bw
--

CREATE INDEX bwidx_user_instance_owner ON public.bw_users USING btree (instance_owner);


--
-- Name: bw_alarm_attendees bw_aa_alarm_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarm_attendees
    ADD CONSTRAINT bw_aa_alarm_fk FOREIGN KEY (alarmid) REFERENCES public.bw_alarms(alarmid);


--
-- Name: bw_alarm_attendees bw_aa_att_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarm_attendees
    ADD CONSTRAINT bw_aa_att_fk FOREIGN KEY (attendeeid) REFERENCES public.bw_attendees(attendeeid);


--
-- Name: bw_alarmdescriptions bw_ad_alarm_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmdescriptions
    ADD CONSTRAINT bw_ad_alarm_fk FOREIGN KEY (bw_alarmid) REFERENCES public.bw_alarms(alarmid);


--
-- Name: bw_alarmdescriptions bw_ad_str_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmdescriptions
    ADD CONSTRAINT bw_ad_str_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_admingroupmembers bw_agm_ag_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_admingroupmembers
    ADD CONSTRAINT bw_agm_ag_fk FOREIGN KEY (bw_groupid) REFERENCES public.bw_admingroups(bw_groupid);


--
-- Name: bw_alarm_xprops bw_alarmxp_aid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarm_xprops
    ADD CONSTRAINT bw_alarmxp_aid_fk FOREIGN KEY (alarmid) REFERENCES public.bw_alarms(alarmid);


--
-- Name: bw_authprefcalendars bw_apcal_ap_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcalendars
    ADD CONSTRAINT bw_apcal_ap_fk1 FOREIGN KEY (userid) REFERENCES public.bw_auth(userid);


--
-- Name: bw_authprefcalendars bw_apcal_cal_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcalendars
    ADD CONSTRAINT bw_apcal_cal_fk1 FOREIGN KEY (calendarid) REFERENCES public.bw_calendars(id);


--
-- Name: bw_authprefcategories bw_apcat_ap_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcategories
    ADD CONSTRAINT bw_apcat_ap_fk1 FOREIGN KEY (userid) REFERENCES public.bw_auth(userid);


--
-- Name: bw_authprefcategories bw_apcat_cat_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcategories
    ADD CONSTRAINT bw_apcat_cat_fk1 FOREIGN KEY (categoryid) REFERENCES public.bw_categories(categoryid);


--
-- Name: bw_authprefcontacts bw_apcon_ap_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcontacts
    ADD CONSTRAINT bw_apcon_ap_fk1 FOREIGN KEY (userid) REFERENCES public.bw_auth(userid);


--
-- Name: bw_authprefcontacts bw_apcon_con_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authprefcontacts
    ADD CONSTRAINT bw_apcon_con_fk1 FOREIGN KEY (contactid) REFERENCES public.bw_contacts(entityid);


--
-- Name: bw_authpreflocations bw_aploc_ap_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authpreflocations
    ADD CONSTRAINT bw_aploc_ap_fk1 FOREIGN KEY (userid) REFERENCES public.bw_auth(userid);


--
-- Name: bw_authpreflocations bw_aploc_loc_fk1; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_authpreflocations
    ADD CONSTRAINT bw_aploc_loc_fk1 FOREIGN KEY (locationid) REFERENCES public.bw_locations(entityid);


--
-- Name: bw_alarmsummaries bw_as_alarm_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmsummaries
    ADD CONSTRAINT bw_as_alarm_fk FOREIGN KEY (bw_alarmid) REFERENCES public.bw_alarms(alarmid);


--
-- Name: bw_alarmsummaries bw_as_str_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_alarmsummaries
    ADD CONSTRAINT bw_as_str_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_calendar_categories bw_cal_cat_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calendar_categories
    ADD CONSTRAINT bw_cal_cat_fk FOREIGN KEY (categoryid) REFERENCES public.bw_categories(categoryid);


--
-- Name: bw_view_collections bw_cal_vid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_view_collections
    ADD CONSTRAINT bw_cal_vid_fk FOREIGN KEY (viewid) REFERENCES public.bw_views(viewid);


--
-- Name: bw_calendar_categories bw_calcat_cid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calendar_categories
    ADD CONSTRAINT bw_calcat_cid_fk FOREIGN KEY (calendarid) REFERENCES public.bw_calendars(id);


--
-- Name: bw_calendar_properties bw_calprp_pid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calendar_properties
    ADD CONSTRAINT bw_calprp_pid_fk FOREIGN KEY (bwid) REFERENCES public.bw_calendars(id);


--
-- Name: bw_categories bw_cat_desc_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_categories
    ADD CONSTRAINT bw_cat_desc_fk FOREIGN KEY (bw_catdescid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_categories bw_cat_wd_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_categories
    ADD CONSTRAINT bw_cat_wd_fk FOREIGN KEY (bw_catwdid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_contacts bw_con_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_contacts
    ADD CONSTRAINT bw_con_name_fk FOREIGN KEY (bw_connameid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_calsuites bw_cs_ag_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_calsuites
    ADD CONSTRAINT bw_cs_ag_fk FOREIGN KEY (groupid) REFERENCES public.bw_admingroups(bw_groupid);


--
-- Name: bw_eventann_alarms bw_eann_alarm_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_alarms
    ADD CONSTRAINT bw_eann_alarm_fk FOREIGN KEY (alarmid) REFERENCES public.bw_alarms(alarmid);


--
-- Name: bw_eventann_attendees bw_eann_att_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_attendees
    ADD CONSTRAINT bw_eann_att_fk FOREIGN KEY (attendeeid) REFERENCES public.bw_attendees(attendeeid);


--
-- Name: bw_eventann_attachments bw_eann_attach_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_attachments
    ADD CONSTRAINT bw_eann_attach_fk FOREIGN KEY (attachid) REFERENCES public.bw_attachments(bwid);


--
-- Name: bw_eventann_categories bw_eann_cat_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_categories
    ADD CONSTRAINT bw_eann_cat_fk FOREIGN KEY (categoryid) REFERENCES public.bw_categories(categoryid);


--
-- Name: bw_eventann_comments bw_eann_com_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_comments
    ADD CONSTRAINT bw_eann_com_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_eventann_contacts bw_eann_con_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_contacts
    ADD CONSTRAINT bw_eann_con_fk FOREIGN KEY (contactid) REFERENCES public.bw_contacts(entityid);


--
-- Name: bw_eventann_descriptions bw_eann_desc_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_descriptions
    ADD CONSTRAINT bw_eann_desc_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_longstrings(bw_id);


--
-- Name: bw_eventann_exdates bw_eann_edate_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_exdates
    ADD CONSTRAINT bw_eann_edate_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_exrules bw_eann_erule_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_exrules
    ADD CONSTRAINT bw_eann_erule_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_event_annotations bw_eann_loc_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_annotations
    ADD CONSTRAINT bw_eann_loc_fk FOREIGN KEY (locationid) REFERENCES public.bw_locations(entityid);


--
-- Name: bw_event_annotations bw_eann_mstr_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_annotations
    ADD CONSTRAINT bw_eann_mstr_fk FOREIGN KEY (masterid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_eventann_rdates bw_eann_rdate_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_rdates
    ADD CONSTRAINT bw_eann_rdate_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_recipients bw_eann_recip_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_recipients
    ADD CONSTRAINT bw_eann_recip_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_resources bw_eann_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_resources
    ADD CONSTRAINT bw_eann_res_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_eventann_rrules bw_eann_rrule_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_rrules
    ADD CONSTRAINT bw_eann_rrule_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_rstatus bw_eann_rst_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_rstatus
    ADD CONSTRAINT bw_eann_rst_fk FOREIGN KEY (bw_rsdescid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_eventann_summaries bw_eann_sum_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_summaries
    ADD CONSTRAINT bw_eann_sum_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_event_annotations bw_eann_tgt_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_annotations
    ADD CONSTRAINT bw_eann_tgt_fk FOREIGN KEY (targetid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_eventann_alarms bw_eannalm_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_alarms
    ADD CONSTRAINT bw_eannalm_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_attendees bw_eannatt_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_attendees
    ADD CONSTRAINT bw_eannatt_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_attachments bw_eannattach_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_attachments
    ADD CONSTRAINT bw_eannattach_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_categories bw_eanncat_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_categories
    ADD CONSTRAINT bw_eanncat_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_comments bw_eanncom_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_comments
    ADD CONSTRAINT bw_eanncom_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_contacts bw_eanncon_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_contacts
    ADD CONSTRAINT bw_eanncon_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_descriptions bw_eanndesc_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_descriptions
    ADD CONSTRAINT bw_eanndesc_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_resources bw_eannres_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_resources
    ADD CONSTRAINT bw_eannres_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_rstatus bw_eannrst_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_rstatus
    ADD CONSTRAINT bw_eannrst_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_eventann_summaries bw_eannsum_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_summaries
    ADD CONSTRAINT bw_eannsum_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_entity_alarms bw_event_alarm_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_entity_alarms
    ADD CONSTRAINT bw_event_alarm_fk FOREIGN KEY (alarmid) REFERENCES public.bw_alarms(alarmid);


--
-- Name: bw_event_attendees bw_event_att_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_attendees
    ADD CONSTRAINT bw_event_att_fk FOREIGN KEY (attendeeid) REFERENCES public.bw_attendees(attendeeid);


--
-- Name: bw_entity_attachments bw_event_attach_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_entity_attachments
    ADD CONSTRAINT bw_event_attach_fk FOREIGN KEY (attachid) REFERENCES public.bw_attachments(bwid);


--
-- Name: bw_event_availuids bw_event_avluid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_availuids
    ADD CONSTRAINT bw_event_avluid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_categories bw_event_cat_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_categories
    ADD CONSTRAINT bw_event_cat_fk FOREIGN KEY (categoryid) REFERENCES public.bw_categories(categoryid);


--
-- Name: bw_event_comments bw_event_com_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_comments
    ADD CONSTRAINT bw_event_com_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_event_contacts bw_event_con_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_contacts
    ADD CONSTRAINT bw_event_con_fk FOREIGN KEY (contactid) REFERENCES public.bw_contacts(entityid);


--
-- Name: bw_event_descriptions bw_event_desc_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_descriptions
    ADD CONSTRAINT bw_event_desc_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_longstrings(bw_id);


--
-- Name: bw_event_exdates bw_event_edate_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_exdates
    ADD CONSTRAINT bw_event_edate_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_exrules bw_event_erule_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_exrules
    ADD CONSTRAINT bw_event_erule_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_events bw_event_loc_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_events
    ADD CONSTRAINT bw_event_loc_fk FOREIGN KEY (locationid) REFERENCES public.bw_locations(entityid);


--
-- Name: bw_event_rdates bw_event_rdate_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_rdates
    ADD CONSTRAINT bw_event_rdate_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_recipients bw_event_recip_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_recipients
    ADD CONSTRAINT bw_event_recip_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_resources bw_event_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_resources
    ADD CONSTRAINT bw_event_res_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_event_rrules bw_event_rrule_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_rrules
    ADD CONSTRAINT bw_event_rrule_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_rstatus bw_event_rst_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_rstatus
    ADD CONSTRAINT bw_event_rst_fk FOREIGN KEY (bw_rsdescid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_event_summaries bw_event_sum_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_summaries
    ADD CONSTRAINT bw_event_sum_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_entity_alarms bw_eventalm_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_entity_alarms
    ADD CONSTRAINT bw_eventalm_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_eventann_xprops bw_eventannxp_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_eventann_xprops
    ADD CONSTRAINT bw_eventannxp_eid_fk FOREIGN KEY (bw_eventannid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_event_attendees bw_eventatt_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_attendees
    ADD CONSTRAINT bw_eventatt_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_entity_attachments bw_eventattach_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_entity_attachments
    ADD CONSTRAINT bw_eventattach_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_categories bw_eventcat_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_categories
    ADD CONSTRAINT bw_eventcat_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_comments bw_eventcom_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_comments
    ADD CONSTRAINT bw_eventcom_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_contacts bw_eventcon_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_contacts
    ADD CONSTRAINT bw_eventcon_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_descriptions bw_eventdesc_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_descriptions
    ADD CONSTRAINT bw_eventdesc_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_fbcomp bw_eventfbc_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_fbcomp
    ADD CONSTRAINT bw_eventfbc_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_resources bw_eventres_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_resources
    ADD CONSTRAINT bw_eventres_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_rstatus bw_eventrst_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_rstatus
    ADD CONSTRAINT bw_eventrst_eid_fk FOREIGN KEY (eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_summaries bw_eventsum_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_summaries
    ADD CONSTRAINT bw_eventsum_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_event_xprops bw_eventxp_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_event_xprops
    ADD CONSTRAINT bw_eventxp_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_filter_descriptions bw_fktr_desc_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_descriptions
    ADD CONSTRAINT bw_fktr_desc_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_longstrings(bw_id);


--
-- Name: bw_filter_descriptions bw_fltrdesc_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_descriptions
    ADD CONSTRAINT bw_fltrdesc_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_filters(filterid);


--
-- Name: bw_filter_display_names bw_fltrdname_eid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_display_names
    ADD CONSTRAINT bw_fltrdname_eid_fk FOREIGN KEY (bw_eventid) REFERENCES public.bw_filters(filterid);


--
-- Name: bw_filter_display_names bw_fltrdname_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_filter_display_names
    ADD CONSTRAINT bw_fltrdname_fk FOREIGN KEY (bw_strid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_group_members bw_grp_grp_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_group_members
    ADD CONSTRAINT bw_grp_grp_fk FOREIGN KEY (groupid) REFERENCES public.bw_groups(bw_group_id);


--
-- Name: bw_locations bw_loc_addr_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_locations
    ADD CONSTRAINT bw_loc_addr_fk FOREIGN KEY (bw_locaddrid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_locations bw_loc_sadd_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_locations
    ADD CONSTRAINT bw_loc_sadd_fk FOREIGN KEY (bw_locsubaddrid) REFERENCES public.bw_strings(bw_id);


--
-- Name: bw_user_views bw_pr_view_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_user_views
    ADD CONSTRAINT bw_pr_view_fk FOREIGN KEY (elt) REFERENCES public.bw_views(viewid);


--
-- Name: bw_user_properties bw_prprp_pid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_user_properties
    ADD CONSTRAINT bw_prprp_pid_fk FOREIGN KEY (bwid) REFERENCES public.bw_preferences(prefid);


--
-- Name: bw_user_views bw_prview_pid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_user_views
    ADD CONSTRAINT bw_prview_pid_fk FOREIGN KEY (prefid) REFERENCES public.bw_preferences(prefid);


--
-- Name: bw_recurrences bw_ri_mstr_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_recurrences
    ADD CONSTRAINT bw_ri_mstr_fk FOREIGN KEY (masterid) REFERENCES public.bw_events(eventid);


--
-- Name: bw_recurrences bw_ri_ov_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_recurrences
    ADD CONSTRAINT bw_ri_ov_fk FOREIGN KEY (overrideid) REFERENCES public.bw_event_annotations(eventid);


--
-- Name: bw_system_properties bw_sysprp_pid_fk; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_system_properties
    ADD CONSTRAINT bw_sysprp_pid_fk FOREIGN KEY (bwid) REFERENCES public.bw_settings(id);


--
-- Name: bw_collection_lastmods fkgqubrhm95m6nvsqtoul0oyobf; Type: FK CONSTRAINT; Schema: public; Owner: bw
--

ALTER TABLE ONLY public.bw_collection_lastmods
    ADD CONSTRAINT fkgqubrhm95m6nvsqtoul0oyobf FOREIGN KEY (bw_id) REFERENCES public.bw_calendars(id);


--
-- PostgreSQL database dump complete
--

