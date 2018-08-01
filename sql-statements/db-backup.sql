--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-2.pgdg16.04+1)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-2.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appellation; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.appellation (
    id integer NOT NULL,
    name text NOT NULL,
    region_id_id integer NOT NULL
);


ALTER TABLE public.appellation OWNER TO hrsuser;

--
-- Name: appellation_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.appellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appellation_id_seq OWNER TO hrsuser;

--
-- Name: appellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.appellation_id_seq OWNED BY public.appellation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO hrsuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO hrsuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO hrsuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO hrsuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO hrsuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO hrsuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO hrsuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO hrsuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO hrsuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO hrsuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO hrsuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO hrsuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.categories OWNER TO hrsuser;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO hrsuser;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: characteristics_headers; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.characteristics_headers (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    min_value integer NOT NULL,
    max_value integer NOT NULL
);


ALTER TABLE public.characteristics_headers OWNER TO hrsuser;

--
-- Name: characteristics_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.characteristics_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characteristics_headers_id_seq OWNER TO hrsuser;

--
-- Name: characteristics_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.characteristics_headers_id_seq OWNED BY public.characteristics_headers.id;


--
-- Name: characteristics_values; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.characteristics_values (
    id integer NOT NULL,
    name text NOT NULL,
    value integer NOT NULL,
    c_header_id_id integer NOT NULL
);


ALTER TABLE public.characteristics_values OWNER TO hrsuser;

--
-- Name: characteristics_values_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.characteristics_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characteristics_values_id_seq OWNER TO hrsuser;

--
-- Name: characteristics_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.characteristics_values_id_seq OWNED BY public.characteristics_values.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.countries OWNER TO hrsuser;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO hrsuser;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO hrsuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO hrsuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO hrsuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO hrsuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO hrsuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO hrsuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO hrsuser;

--
-- Name: expert_product_characteristic; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.expert_product_characteristic (
    id integer NOT NULL,
    characteristic_values integer NOT NULL,
    c_header_id_id integer NOT NULL,
    expert_id_id integer NOT NULL,
    product_id_id integer NOT NULL
);


ALTER TABLE public.expert_product_characteristic OWNER TO hrsuser;

--
-- Name: expert_product_characteristic_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.expert_product_characteristic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expert_product_characteristic_id_seq OWNER TO hrsuser;

--
-- Name: expert_product_characteristic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.expert_product_characteristic_id_seq OWNED BY public.expert_product_characteristic.id;


--
-- Name: expert_rates; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.expert_rates (
    id integer NOT NULL,
    rate integer NOT NULL,
    comment text NOT NULL,
    expert_id_id integer NOT NULL,
    product_id_id integer NOT NULL
);


ALTER TABLE public.expert_rates OWNER TO hrsuser;

--
-- Name: expert_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.expert_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expert_rates_id_seq OWNER TO hrsuser;

--
-- Name: expert_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.expert_rates_id_seq OWNED BY public.expert_rates.id;


--
-- Name: experts; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.experts (
    id integer NOT NULL,
    email text NOT NULL,
    avatar text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.experts OWNER TO hrsuser;

--
-- Name: experts_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.experts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experts_id_seq OWNER TO hrsuser;

--
-- Name: experts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.experts_id_seq OWNED BY public.experts.id;


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.inventory (
    id integer NOT NULL,
    in_stock boolean NOT NULL,
    product_id_id integer NOT NULL,
    price numeric(6,2) NOT NULL
);


ALTER TABLE public.inventory OWNER TO hrsuser;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_id_seq OWNER TO hrsuser;

--
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    photo_path text NOT NULL,
    appellation_id_id integer NOT NULL,
    category_id_id integer NOT NULL,
    vendor_id_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO hrsuser;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO hrsuser;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name text NOT NULL,
    country_id_id integer NOT NULL
);


ALTER TABLE public.regions OWNER TO hrsuser;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO hrsuser;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: star_ratings_rating; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.star_ratings_rating (
    id integer NOT NULL,
    count integer NOT NULL,
    total integer NOT NULL,
    average numeric(6,3) NOT NULL,
    object_id integer,
    content_type_id integer,
    CONSTRAINT star_ratings_rating_count_check CHECK ((count >= 0)),
    CONSTRAINT star_ratings_rating_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT star_ratings_rating_total_check CHECK ((total >= 0))
);


ALTER TABLE public.star_ratings_rating OWNER TO hrsuser;

--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.star_ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ratings_rating_id_seq OWNER TO hrsuser;

--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.star_ratings_rating_id_seq OWNED BY public.star_ratings_rating.id;


--
-- Name: star_ratings_userrating; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.star_ratings_userrating (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ip inet,
    score smallint NOT NULL,
    rating_id integer NOT NULL,
    user_id integer,
    CONSTRAINT star_ratings_userrating_score_check CHECK ((score >= 0))
);


ALTER TABLE public.star_ratings_userrating OWNER TO hrsuser;

--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.star_ratings_userrating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ratings_userrating_id_seq OWNER TO hrsuser;

--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.star_ratings_userrating_id_seq OWNED BY public.star_ratings_userrating.id;


--
-- Name: user_rates; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.user_rates (
    id integer NOT NULL,
    rate integer NOT NULL,
    comment text NOT NULL,
    product_id_id integer NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.user_rates OWNER TO hrsuser;

--
-- Name: user_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.user_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_rates_id_seq OWNER TO hrsuser;

--
-- Name: user_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.user_rates_id_seq OWNED BY public.user_rates.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    avatar text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.users OWNER TO hrsuser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hrsuser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: hrsuser
--

CREATE TABLE public.vendors (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    region_id_id integer NOT NULL
);


ALTER TABLE public.vendors OWNER TO hrsuser;

--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: hrsuser
--

CREATE SEQUENCE public.vendors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_id_seq OWNER TO hrsuser;

--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hrsuser
--

ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;


--
-- Name: appellation id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.appellation ALTER COLUMN id SET DEFAULT nextval('public.appellation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: characteristics_headers id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.characteristics_headers ALTER COLUMN id SET DEFAULT nextval('public.characteristics_headers_id_seq'::regclass);


--
-- Name: characteristics_values id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.characteristics_values ALTER COLUMN id SET DEFAULT nextval('public.characteristics_values_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: expert_product_characteristic id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_product_characteristic ALTER COLUMN id SET DEFAULT nextval('public.expert_product_characteristic_id_seq'::regclass);


--
-- Name: expert_rates id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_rates ALTER COLUMN id SET DEFAULT nextval('public.expert_rates_id_seq'::regclass);


--
-- Name: experts id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.experts ALTER COLUMN id SET DEFAULT nextval('public.experts_id_seq'::regclass);


--
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: star_ratings_rating id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_rating ALTER COLUMN id SET DEFAULT nextval('public.star_ratings_rating_id_seq'::regclass);


--
-- Name: star_ratings_userrating id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_userrating ALTER COLUMN id SET DEFAULT nextval('public.star_ratings_userrating_id_seq'::regclass);


--
-- Name: user_rates id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.user_rates ALTER COLUMN id SET DEFAULT nextval('public.user_rates_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);


--
-- Data for Name: appellation; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.appellation (id, name, region_id_id) FROM stdin;
1	Puligny Montrachet	23
2	Gevrey Chambertin	23
3	Napa Valley	24
4	Toro	25
5	Italy	26
6	Corbieres	27
7	Cote Rotie	27
8	Saint Emilion	29
9	Margaux	29
10	Haut Médoc	29
11	Saint Julien	29
12	Pessac-Leognan	29
13	Saint Estephe	29
14	Fronsac	29
15	Pomerol	29
16	Saint Emilion Grand Cru	29
17	Castillon	29
18	Pauillac	29
19	Châteauneuf du Pape	28
20	Sauternes	29
21	Haut-Medoc	29
22	Montagne Saint Emilion	29
23	Saint Estèphe	29
24	Pessac Leognan	29
26	Lebanon	30
27	Médoc	29
28	Cotes de Francs	29
29	Priorat	31
30	Montagny 1er cru	23
31	Chambolle Musigny	23
32	Port	32
33	Bierzo	33
34	Echezeaux Grand Cru	23
35	Nuits St Georges 1er Cru	23
36	Clos des Lambrays grand cru	23
37	Saint Aubin	23
38	Morgon	34
39	Nahe	35
40	Puligny Montrachet 1er Cru	23
41	Morey St Denis	23
42	Chambolle Musigny 1er Cru	23
43	Tuscany	26
44	Mosel	37
45	Roccamonfina	38
46	Australia	39
47	Vosne Romanée	23
48	Crozes Hermitage	28
49	Auxey Duresses	23
50	Chablis Vaulorent 1er Cru	23
51	Champagne	40
53	Lalande de Pomerol	29
54	Clos St Denis grand cru	23
55	Chevalier Montrachet Grand Cru	23
56	Montrachet grand cru	23
57	Meursault 1er Cru	23
58	Savigny les Beaune 1er Cru	23
59	Corton Grand Cru	23
60	Madeira	42
61	Bonnes Mares grand cru	23
62	Ribera Del Duero	44
63	Vin Doux Naturel	45
64	California	46
65	Menetou Salon	47
67	America	24
68	Hermitage	28
69	Chassagne Montrachet 1er Cru	23
70	Chorey-Les-Beaune	23
71	Bordeaux	29
72	Chile	49
25	Bordeaux Supérieur	29
52	Rioja Gran Reserva	41
66	Coteaux Varois En Provence	48
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add appellation	1	add_appellation
2	Can change appellation	1	change_appellation
3	Can delete appellation	1	delete_appellation
4	Can add categories	2	add_categories
5	Can change categories	2	change_categories
6	Can delete categories	2	delete_categories
7	Can add characteristics_headers	3	add_characteristics_headers
8	Can change characteristics_headers	3	change_characteristics_headers
9	Can delete characteristics_headers	3	delete_characteristics_headers
10	Can add characteristics_values	4	add_characteristics_values
11	Can change characteristics_values	4	change_characteristics_values
12	Can delete characteristics_values	4	delete_characteristics_values
13	Can add countries	5	add_countries
14	Can change countries	5	change_countries
15	Can delete countries	5	delete_countries
16	Can add expert_product_characteristic	6	add_expert_product_characteristic
17	Can change expert_product_characteristic	6	change_expert_product_characteristic
18	Can delete expert_product_characteristic	6	delete_expert_product_characteristic
19	Can add expert_rates	7	add_expert_rates
20	Can change expert_rates	7	change_expert_rates
21	Can delete expert_rates	7	delete_expert_rates
22	Can add experts	8	add_experts
23	Can change experts	8	change_experts
24	Can delete experts	8	delete_experts
25	Can add inventory	9	add_inventory
26	Can change inventory	9	change_inventory
27	Can delete inventory	9	delete_inventory
28	Can add products	10	add_products
29	Can change products	10	change_products
30	Can delete products	10	delete_products
31	Can add regions	11	add_regions
32	Can change regions	11	change_regions
33	Can delete regions	11	delete_regions
34	Can add user_rates	12	add_user_rates
35	Can change user_rates	12	change_user_rates
36	Can delete user_rates	12	delete_user_rates
37	Can add users	13	add_users
38	Can change users	13	change_users
39	Can delete users	13	delete_users
40	Can add vendors	14	add_vendors
41	Can change vendors	14	change_vendors
42	Can delete vendors	14	delete_vendors
43	Can add log entry	15	add_logentry
44	Can change log entry	15	change_logentry
45	Can delete log entry	15	delete_logentry
46	Can add permission	16	add_permission
47	Can change permission	16	change_permission
48	Can delete permission	16	delete_permission
49	Can add group	17	add_group
50	Can change group	17	change_group
51	Can delete group	17	delete_group
52	Can add user	18	add_user
53	Can change user	18	change_user
54	Can delete user	18	delete_user
55	Can add content type	19	add_contenttype
56	Can change content type	19	change_contenttype
57	Can delete content type	19	delete_contenttype
58	Can add session	20	add_session
59	Can change session	20	change_session
60	Can delete session	20	delete_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$bwTJCk7f5SbX$u4kNq46NKfe3cIOVKQtUPptrTSkQ3ekwB5I23ADFCTY=	2018-07-05 14:21:31.151627+03	t	stan	Stanislav	Genchev	stanislav.genchev@quanterall.com	t	t	2018-07-05 10:34:41+03
2	pbkdf2_sha256$100000$T6uQ75w3UgzR$emQ1B+FKqE6qpKsuOew+duHd91sh3tf49g0oHNODrwk=	2018-07-09 16:34:15.637145+03	t	yuri	Yuri	Dimitrov	yndimitrov@gmail.com	t	t	2018-07-05 14:13:42+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.categories (id, name, description) FROM stdin;
1	White	White wine is a wine whose colour can be straw-yellow, yellow-green, or yellow-gold.
2	Red	Red wine is made from dark-colored grape varieties. The actual color of the wine can range from intense violet, typical of young wines, through to brick red for mature wines and brown for older red wines.
3	Fortified	Fortified wine is a wine to which a distilled spirit, usually brandy, is added.
4	Sparkling	Sparkling wine is a wine with significant levels of carbon dioxide in it, making it fizzy.
5	Rose	A rosé is a type of wine that incorporates some of the color from the grape skins, but not enough to qualify it as a red wine.
\.


--
-- Data for Name: characteristics_headers; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.characteristics_headers (id, name, description, min_value, max_value) FROM stdin;
1	Sweetness	The subjective sweetness of a wine is determined by the interaction of several factors, including the amount of sugar in the wine, but also the relative levels of alcohol, acids, and tannins.	1	5
2	Acidity	The acids in wine are an important component in both winemaking and the finished product of wine. Acidity gives wine its tart and sour taste.	1	5
3	Tannin	Tannin is a textural element that makes wine taste dry. It adds both bitterness and astringency, as well as complexity.	1	5
4	Alcohol	Alcohol by volume is a standard measure of how much alcohol (ethanol) is contained in a given volume of an alcoholic beverage.	1	5
5	Body	Body is a snapshot of the overall impression of a wine.	1	5
\.


--
-- Data for Name: characteristics_values; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.characteristics_values (id, name, value, c_header_id_id) FROM stdin;
1	Bone Dry	1	1
2	Dry	2	1
3	Off-dry	3	1
4	Sweet	4	1
5	Very Sweet	5	1
6	Very Low Red	1	2
7	Low Red	2	2
8	Red-White	3	2
9	White	4	2
10	Sweet	5	2
11	Low	1	3
12	Medium	3	3
13	High	5	3
14	Low	1	4
15	Medium	3	4
16	High	5	4
17	Light	1	5
18	Medium	3	5
19	Full	5	5
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.countries (id, name) FROM stdin;
454	France
455	America
456	Spain
457	Italy
458	Lebanon
459	Portugal
460	Germany
461	Chile
462	Australia
463	Chile
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-07-05 14:15:26.70701+03	1	stan	2	[{"changed": {"fields": ["first_name", "last_name", "last_login"]}}]	18	2
2	2018-07-05 14:15:52.432635+03	2	yuri	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	18	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	hrsapp	appellation
2	hrsapp	categories
3	hrsapp	characteristics_headers
4	hrsapp	characteristics_values
5	hrsapp	countries
6	hrsapp	expert_product_characteristic
7	hrsapp	expert_rates
8	hrsapp	experts
9	hrsapp	inventory
10	hrsapp	products
11	hrsapp	regions
12	hrsapp	user_rates
13	hrsapp	users
14	hrsapp	vendors
15	admin	logentry
16	auth	permission
17	auth	group
18	auth	user
19	contenttypes	contenttype
20	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-25 11:07:52.822331+03
2	auth	0001_initial	2018-06-25 11:07:52.988637+03
3	admin	0001_initial	2018-06-25 11:07:53.042517+03
4	admin	0002_logentry_remove_auto_add	2018-06-25 11:07:53.06394+03
5	contenttypes	0002_remove_content_type_name	2018-06-25 11:07:53.10903+03
6	auth	0002_alter_permission_name_max_length	2018-06-25 11:07:53.126234+03
7	auth	0003_alter_user_email_max_length	2018-06-25 11:07:53.146865+03
8	auth	0004_alter_user_username_opts	2018-06-25 11:07:53.166084+03
9	auth	0005_alter_user_last_login_null	2018-06-25 11:07:53.187388+03
10	auth	0006_require_contenttypes_0002	2018-06-25 11:07:53.192197+03
11	auth	0007_alter_validators_add_error_messages	2018-06-25 11:07:53.212169+03
12	auth	0008_alter_user_username_max_length	2018-06-25 11:07:53.24037+03
13	auth	0009_alter_user_last_name_max_length	2018-06-25 11:07:53.262703+03
14	hrsapp	0001_initial	2018-06-25 11:07:53.820252+03
15	sessions	0001_initial	2018-06-25 11:07:53.852556+03
16	hrsapp	0002_auto_20180626_1306	2018-06-26 13:06:39.413652+03
17	hrsapp	0003_auto_20180626_1502	2018-06-26 15:02:59.685212+03
23	hrsapp	0004_inventory_price	2018-07-03 14:22:03.505639+03
24	hrsapp	0005_auto_20180702_1649	2018-07-03 14:22:03.669291+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bwk106zcqf99o3t6tcpywt6f7642sfnl	MzU4NWM5NzVlNTk0NTUzOTM0OTI0MTgyZDZjYTZhN2RmNmRhMzBjYjp7ImNvdW50cnkiOiI0NTgiLCJ2ZW5kb3IiOiI4NiIsImNhdGVnb3J5IjoiMiJ9	2018-07-28 18:08:59.542136+03
6ijl7rbv6gey1hxq418sc0gfs21eivi6	MmZhMjk3ODFlNDdiY2E0ZjJhZTg2MDMyNWJhMzIyODU0NDFmNTljMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDdiOWY5YTVkOWM2ZGEwNzY2YjhhZGYwNjU2NmY5Y2ViYmU5NmJjMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-19 14:25:19.19013+03
9y1ze9xnvn8be1dgbzfn7cspyec9de4w	ZmQwNWNlM2IyNTA4MjgzYTZiZjcwMWIyMDQ0Y2EwZjI3NmEzYzZjODp7ImNvdW50cnkiOiI0NTQiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidmVuZG9yIjoiOCIsImNhdGVnb3J5IjoiMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjQ3YjlmOWE1ZDljNmRhMDc2NmI4YWRmMDY1NjZmOWNlYmJlOTZiYzEifQ==	2018-07-29 16:45:27.612978+03
79fp8y82fjashr2btmn0d7uvv7z7p65h	YjAxMjE1M2I4NDUyNDdhZmExMTY5MDgxNDU1ZjAyZTFmMDFiZWRjNjp7ImNvdW50cnkiOiI0NTUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidmVuZG9yIjoiNyIsImNhdGVnb3J5IjoiMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjQ3YjlmOWE1ZDljNmRhMDc2NmI4YWRmMDY1NjZmOWNlYmJlOTZiYzEifQ==	2018-07-30 11:14:14.291157+03
oi5e125jh9h5wguenjzx8ehkhmz8v80j	N2QxNjc4ZTEwNTI0MDVkMWZkNzY2MzNkNTBmYWZmNzFkZDQxNGEzMTp7ImNhdGVnb3J5IjoiMiIsInZlbmRvciI6IjEzOCIsImNvdW50cnkiOiI0NTYifQ==	2018-07-28 14:35:15.830853+03
qaz1ty9g4of324b86sb3cc0deohvo9vd	ZDYyZmQwMmZkMDUxMzY4YWUzZjYyNmMxYzMxYzBmM2M5NGM2YzhhNzp7ImNhdGVnb3J5IjoiMiIsImNvdW50cnkiOiI0NTUiLCJ2ZW5kb3IiOiI0In0=	2018-07-28 17:58:20.049816+03
dsd2629zf4cvnw0p0dmc04li5xd42g0k	MDdjNzA0NzA3ZTg0N2Y4MWIyMDkxZDc4MjUzOTllNmM1MzY4Y2M5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0N2I5ZjlhNWQ5YzZkYTA3NjZiOGFkZjA2NTY2ZjljZWJiZTk2YmMxIiwiY2F0ZWdvcnkiOiIyIiwiY291bnRyeSI6IjQ2MiIsInZlbmRvciI6IjE0MSJ9	2018-07-30 13:36:03.675045+03
\.


--
-- Data for Name: expert_product_characteristic; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.expert_product_characteristic (id, characteristic_values, c_header_id_id, expert_id_id, product_id_id) FROM stdin;
\.


--
-- Data for Name: expert_rates; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.expert_rates (id, rate, comment, expert_id_id, product_id_id) FROM stdin;
\.


--
-- Data for Name: experts; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.experts (id, email, avatar, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.inventory (id, in_stock, product_id_id, price) FROM stdin;
510	t	1	99.10
511	t	2	8.65
512	t	3	362.70
513	t	4	797.98
514	t	5	17.88
515	t	6	102.47
516	t	7	24.37
517	t	8	898.70
518	t	9	16.60
519	t	10	871.82
520	t	11	869.85
521	t	12	385.29
522	t	13	21.40
523	t	14	820.10
524	t	15	960.78
525	t	16	789.65
526	t	17	690.98
527	t	18	174.13
528	t	19	369.72
529	t	20	368.50
530	t	21	10.88
531	t	22	789.71
532	t	23	221.85
533	t	24	779.84
534	t	25	318.55
535	t	26	428.76
536	t	27	629.66
537	t	28	303.46
538	t	29	193.31
539	t	30	770.51
540	t	31	942.92
541	t	32	375.50
542	t	33	148.96
543	t	34	395.57
544	t	35	25.36
545	t	36	953.57
546	t	37	89.92
547	t	38	420.70
548	t	39	972.92
549	t	40	506.68
550	t	41	388.21
551	t	42	529.70
552	t	43	907.90
553	t	44	966.34
554	t	45	341.34
555	t	46	539.36
556	t	47	91.41
557	t	48	869.25
558	t	49	202.22
559	t	50	675.59
560	t	51	757.37
561	t	52	360.52
562	t	53	9.50
563	t	54	955.71
564	t	55	463.12
565	t	56	513.84
566	t	57	194.83
567	t	58	521.87
568	t	59	834.77
569	t	60	395.26
570	t	61	141.15
571	t	62	614.87
572	t	63	416.92
573	t	64	685.14
574	t	65	371.61
575	t	66	32.66
576	t	67	748.13
577	t	68	226.70
578	t	69	465.48
579	t	70	638.15
580	t	71	822.90
581	t	72	970.47
582	t	73	423.60
583	t	74	119.38
584	t	75	132.87
585	t	76	1000.80
586	t	77	204.35
587	t	78	326.84
588	t	79	756.96
589	t	80	132.42
590	t	81	698.79
591	t	82	319.96
592	t	83	467.89
593	t	84	792.43
594	t	85	980.58
595	t	86	676.60
596	t	87	729.26
597	t	88	698.11
598	t	89	302.10
599	t	90	258.39
600	t	91	782.87
601	t	92	771.71
602	t	93	671.16
603	t	94	640.88
604	t	95	374.29
605	t	96	740.50
606	t	97	346.28
607	t	98	753.90
608	t	99	998.76
609	t	187	33.82
610	t	188	265.70
611	t	189	691.47
612	t	190	128.33
613	t	191	551.70
614	t	192	721.73
615	t	193	886.70
616	t	194	671.99
617	t	195	836.21
618	t	196	722.81
619	t	197	561.94
620	t	198	479.62
621	t	199	522.47
622	t	200	197.45
623	t	201	378.23
624	t	202	280.58
625	t	203	455.31
626	t	204	852.57
627	t	205	386.36
628	t	206	124.32
629	t	207	828.63
630	t	208	914.30
631	t	209	607.88
632	t	210	41.64
633	t	211	394.85
634	t	212	417.63
635	t	213	983.67
636	t	214	266.94
637	t	215	729.84
638	t	216	804.89
639	t	217	656.65
640	t	218	686.95
641	t	219	975.32
642	t	220	792.22
643	t	221	33.65
644	t	222	226.50
645	t	223	710.14
646	t	224	435.90
647	t	225	683.57
648	t	226	885.34
649	t	227	782.13
650	t	228	104.13
651	t	229	99.00
652	t	230	431.91
653	t	231	570.80
654	t	232	793.12
655	t	233	247.67
656	t	234	390.55
657	t	235	441.16
658	t	236	99.84
659	t	237	50.57
660	t	238	962.48
661	t	239	846.54
662	t	240	862.71
663	t	241	588.21
664	t	242	976.76
665	t	243	544.91
666	t	244	274.70
667	t	245	812.53
668	t	246	627.88
669	t	247	37.38
670	t	248	413.67
671	t	249	407.44
672	t	250	938.61
673	t	251	691.52
674	t	252	69.83
675	t	253	459.30
676	t	254	121.31
677	t	255	894.20
678	t	256	328.71
679	t	257	47.00
680	t	258	845.92
681	t	259	453.80
682	t	260	585.16
683	t	261	503.96
684	t	262	632.80
685	t	263	357.41
686	t	264	442.63
687	t	265	564.60
688	t	266	546.59
689	t	267	246.10
690	t	268	152.28
691	t	269	279.92
692	t	270	168.40
693	t	271	372.15
694	t	272	599.55
695	t	273	640.34
696	t	274	589.50
697	t	275	106.65
698	t	276	844.56
699	t	277	803.92
700	t	278	220.91
701	t	279	953.36
702	t	280	269.73
703	t	281	376.10
704	t	282	375.50
705	t	283	219.20
706	t	284	445.36
707	t	285	956.45
708	t	286	154.34
709	t	287	632.15
710	t	288	373.53
711	t	289	49.53
712	t	290	421.16
713	t	291	769.50
714	t	292	477.74
715	t	293	822.80
716	t	294	899.50
717	t	295	227.71
718	t	296	910.69
719	t	297	466.71
720	t	298	538.81
721	t	299	864.26
722	t	300	726.24
723	t	301	628.81
724	t	302	265.27
725	t	334	384.20
726	t	335	284.45
727	t	336	556.93
728	t	337	605.70
729	t	338	640.19
730	t	339	376.41
731	t	340	32.18
732	t	341	604.64
733	t	342	39.88
734	t	343	314.16
735	t	344	932.40
736	t	345	272.34
737	t	346	449.54
738	t	347	937.71
739	t	348	108.64
740	t	349	842.42
741	t	350	783.17
742	t	351	801.21
743	t	352	958.70
744	t	353	33.22
745	t	354	23.68
746	t	355	846.20
747	t	356	518.12
748	t	357	520.94
749	t	358	523.70
750	t	359	810.42
751	t	360	276.46
752	t	361	974.80
753	t	362	973.95
754	t	363	923.99
755	t	364	708.50
756	t	365	204.84
757	t	366	256.90
758	t	367	532.35
759	t	368	77.45
760	t	369	88.95
761	t	370	556.74
762	t	371	572.95
763	t	372	662.12
764	t	373	157.93
765	t	374	236.85
766	t	375	465.67
767	t	376	108.58
768	t	377	646.31
769	t	378	724.80
770	t	379	738.25
771	t	380	581.53
772	t	381	363.90
773	t	382	766.60
774	t	383	261.63
775	t	384	11.78
776	t	385	310.41
777	t	386	423.89
778	t	387	468.21
779	t	388	660.78
780	t	389	738.14
781	t	390	100.90
782	t	391	588.10
783	t	392	929.70
784	t	393	224.65
785	t	394	239.28
786	t	395	334.15
787	t	396	601.15
788	t	397	294.35
789	t	398	930.76
790	t	399	612.48
791	t	400	22.81
792	t	401	259.88
793	t	402	119.74
794	t	403	746.71
795	t	404	743.67
796	t	405	717.98
797	t	406	928.56
798	t	407	281.40
799	t	408	228.56
800	t	409	344.26
801	t	410	106.93
802	t	411	804.32
803	t	412	868.61
804	t	413	322.93
805	t	414	750.38
806	t	415	517.63
807	t	416	291.88
808	t	417	988.80
809	t	418	23.32
810	t	419	963.60
811	t	420	649.60
812	t	421	61.45
813	t	422	620.54
814	t	423	396.50
815	t	424	432.58
816	t	425	121.55
817	t	426	14.22
818	t	427	717.65
819	t	428	572.60
820	t	429	774.70
821	t	430	163.61
822	t	431	405.35
823	t	432	390.78
824	t	433	77.22
825	t	434	609.90
826	t	435	825.14
827	t	436	452.65
828	t	437	791.33
829	f	11	958.47
830	f	12	735.69
831	f	13	191.50
832	f	14	307.48
833	f	15	75.90
834	f	16	365.49
835	f	17	376.82
836	f	18	106.89
837	f	19	180.82
838	f	20	335.90
839	f	21	538.22
840	f	22	236.49
841	f	23	587.11
842	f	24	443.11
843	f	25	483.13
844	f	26	675.85
845	f	27	656.49
846	f	28	72.29
847	f	29	275.47
848	f	30	524.70
849	f	31	917.19
850	f	32	388.29
851	f	33	434.50
852	f	34	743.24
853	f	35	110.26
854	f	36	721.11
855	f	37	643.41
856	f	38	941.15
857	f	39	52.40
858	f	40	961.51
859	f	41	275.97
860	f	42	253.41
861	f	43	898.37
862	f	44	160.15
863	f	45	375.61
864	f	46	853.10
865	f	47	487.14
866	f	48	727.63
867	f	49	980.30
868	f	50	73.14
869	f	51	545.20
870	f	52	801.70
871	f	53	690.67
872	f	54	216.45
873	f	55	754.10
874	f	56	308.76
875	f	57	763.46
876	f	58	763.76
877	f	59	896.16
878	f	60	97.97
879	f	61	731.60
880	f	62	684.64
881	f	63	992.76
882	f	64	808.64
883	f	65	516.60
884	f	66	813.28
885	f	67	745.59
886	f	68	304.36
887	f	69	951.85
888	f	70	728.94
889	f	71	519.42
890	f	100	491.38
891	f	101	324.88
892	f	102	791.29
893	f	103	642.75
894	f	104	110.14
895	f	105	397.37
896	f	106	117.84
897	f	107	976.45
898	f	108	579.60
899	f	109	822.49
900	f	110	602.95
901	f	111	217.59
902	f	112	742.23
903	f	113	160.15
904	f	114	391.60
905	f	115	512.40
906	f	116	107.84
907	f	117	937.17
908	f	118	673.79
909	f	119	875.82
910	f	120	569.10
911	f	121	577.98
912	f	122	161.34
913	f	123	122.59
914	f	124	16.15
915	f	125	175.50
916	f	126	104.80
917	f	127	214.89
918	f	128	319.60
919	f	129	244.43
920	f	130	330.44
921	f	131	445.28
922	f	132	966.14
923	f	133	352.39
924	f	134	828.13
925	f	135	274.70
926	f	136	946.67
927	f	137	516.31
928	f	138	702.62
929	f	139	487.20
930	f	140	451.80
931	f	141	962.76
932	f	142	638.34
933	f	143	433.47
934	f	144	6.64
935	f	145	677.20
936	f	146	542.26
937	f	147	734.67
938	f	148	817.28
939	f	149	357.14
940	f	150	669.14
941	f	151	173.12
942	f	152	746.72
943	f	153	565.79
944	f	154	921.97
945	f	155	290.90
946	f	156	388.48
947	f	157	964.84
948	f	158	170.74
949	f	159	540.00
950	f	160	75.14
951	f	161	520.76
952	f	162	28.96
953	f	163	347.88
954	f	164	986.11
955	f	165	896.34
956	f	166	753.87
957	f	167	946.45
958	f	168	657.72
959	f	169	95.60
960	f	170	102.82
961	f	171	362.87
962	f	172	973.41
963	f	173	985.54
964	f	174	723.23
965	f	175	794.88
966	f	176	897.82
967	f	177	526.10
968	f	178	362.65
969	f	179	421.83
970	f	180	97.58
971	f	181	472.35
972	f	182	791.90
973	f	183	74.35
974	f	184	800.53
975	f	185	14.79
976	f	186	594.10
977	f	303	311.97
978	f	304	815.38
979	f	305	474.10
980	f	306	40.41
981	f	307	751.73
982	f	308	297.16
983	f	309	802.73
984	f	310	135.49
985	f	311	567.29
986	f	312	615.11
987	f	313	237.54
988	f	314	917.85
989	f	315	210.83
990	f	316	494.14
991	f	317	536.81
992	f	318	57.83
993	f	319	470.64
994	f	320	25.34
995	f	321	782.11
996	f	322	426.54
997	f	323	910.87
998	f	324	957.97
999	f	325	413.14
1000	f	326	386.80
1001	f	327	919.57
1002	f	328	447.17
1003	f	329	123.48
1004	f	330	456.97
1005	f	331	425.91
1006	f	332	28.12
1007	f	333	75.43
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.products (id, name, description, photo_path, appellation_id_id, category_id_id, vendor_id_id) FROM stdin;
1	Puligny Montrachet Les Folatieres	This is where the description of the wine will be placed.	white-wine.jpg	1	1	1
2	Puligny Montrachet	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
3	Puligny Montrachet Les Enseigneres	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
4	Saint Aubin Murgers Dents de Chien 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
5	Chassagne Montrachet Tête du Clos 1er Cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
6	Mercurey Blanc Clos des Barraults 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
7	Meursault Charmes 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
8	Rully Montpalais 1er Cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
9	Puligny Montrachet Champ Canet 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
10	Chassagne Montrachet Blanchot Dessus 1er Cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	2
11	Gevrey Chambertin Aux Etelois	This is where the description of the wine will be placed.	red-wine.jpg	2	2	3
12	Marsannay Clos du Jeu	This is where the description of the wine will be placed.	red-wine.jpg	2	2	3
13	Gevrey Chambertin La Perriere 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	2	2	3
14	Private Reserve Cabernet Sauvignon	This is where the description of the wine will be placed.	red-wine.jpg	3	2	4
15	Opus One	This is where the description of the wine will be placed.	red-wine.jpg	3	2	4
16	Termanthia	This is where the description of the wine will be placed.	red-wine.jpg	4	2	5
17	Numanthia	This is where the description of the wine will be placed.	red-wine.jpg	4	2	5
18	Il Blu	This is where the description of the wine will be placed.	red-wine.jpg	5	2	6
19	Giorgio Primo	This is where the description of the wine will be placed.	red-wine.jpg	5	2	6
20	Tignanello	This is where the description of the wine will be placed.	red-wine.jpg	5	2	6
21	Cardinale	This is where the description of the wine will be placed.	red-wine.jpg	3	2	7
22	Le Rouge Vigneron, Corbieres	This is where the description of the wine will be placed.	red-wine.jpg	6	2	8
23	Bila Haut Lapidem Occultum	This is where the description of the wine will be placed.	red-wine.jpg	7	2	9
24	Cote Rotie La Mordorée	This is where the description of the wine will be placed.	red-wine.jpg	7	2	9
25	Ermitage Le Pavillon	This is where the description of the wine will be placed.	red-wine.jpg	7	2	9
26	Châteauneuf du Pape Cuvée de la Reine des Bois	This is where the description of the wine will be placed.	red-wine.jpg	7	2	9
27	Angelus	This is where the description of the wine will be placed.	red-wine.jpg	8	2	10
28	Angludet	This is where the description of the wine will be placed.	red-wine.jpg	9	2	11
29	Beauregard	This is where the description of the wine will be placed.	red-wine.jpg	9	2	11
30	Calon Ségur	This is where the description of the wine will be placed.	red-wine.jpg	9	2	11
31	Fombrauge	This is where the description of the wine will be placed.	red-wine.jpg	9	2	11
32	Giscours	This is where the description of the wine will be placed.	red-wine.jpg	9	2	11
33	Ausone	This is where the description of the wine will be placed.	red-wine.jpg	8	2	12
34	Belair	This is where the description of the wine will be placed.	red-wine.jpg	8	2	13
35	Brane Cantenac	This is where the description of the wine will be placed.	red-wine.jpg	8	2	13
36	Batailley	This is where the description of the wine will be placed.	red-wine.jpg	8	2	13
37	Chasse Spleen	This is where the description of the wine will be placed.	red-wine.jpg	8	2	13
38	Grand Puy Ducasse	This is where the description of the wine will be placed.	red-wine.jpg	8	2	13
39	Belair Monange	This is where the description of the wine will be placed.	red-wine.jpg	8	2	13
40	Belgrave	This is where the description of the wine will be placed.	red-wine.jpg	10	2	14
41	Haut Bailly	This is where the description of the wine will be placed.	red-wine.jpg	10	2	14
42	Haut Batailley	This is where the description of the wine will be placed.	red-wine.jpg	10	2	14
43	Beychevelle	This is where the description of the wine will be placed.	red-wine.jpg	11	2	15
44	Branaire Ducru	This is where the description of the wine will be placed.	red-wine.jpg	11	2	16
45	Branon	This is where the description of the wine will be placed.	red-wine.jpg	12	2	17
46	Canon La Gaffeliere	This is where the description of the wine will be placed.	red-wine.jpg	8	2	18
47	Cantemerle	This is where the description of the wine will be placed.	red-wine.jpg	10	2	19
48	Clarke (Rothschild)	This is where the description of the wine will be placed.	red-wine.jpg	10	2	19
49	Clerc Milon	This is where the description of the wine will be placed.	red-wine.jpg	10	2	19
50	Gazin	This is where the description of the wine will be placed.	red-wine.jpg	10	2	19
51	Cantenac Brown	This is where the description of the wine will be placed.	red-wine.jpg	9	2	20
52	Capbern	This is where the description of the wine will be placed.	red-wine.jpg	13	2	21
53	Carlmagnus (Fronsac)	This is where the description of the wine will be placed.	red-wine.jpg	14	2	22
54	Caronne St Gemme	This is where the description of the wine will be placed.	red-wine.jpg	10	2	23
55	Charmail	This is where the description of the wine will be placed.	red-wine.jpg	10	2	24
56	Clos Les Lunelles	This is where the description of the wine will be placed.	red-wine.jpg	10	2	24
57	d`Aighuilhe	This is where the description of the wine will be placed.	red-wine.jpg	10	2	24
58	Balthus	This is where the description of the wine will be placed.	red-wine.jpg	10	2	24
59	Fonbel	This is where the description of the wine will be placed.	red-wine.jpg	10	2	24
60	Gloria	This is where the description of the wine will be placed.	red-wine.jpg	10	2	24
61	Cheval Blanc	This is where the description of the wine will be placed.	red-wine.jpg	8	2	25
62	Clinet	This is where the description of the wine will be placed.	red-wine.jpg	15	2	26
63	Clos St Julien	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
64	Bernadotte	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
65	Guillot Clauzel	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
66	La Prade	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
67	La Tour de Mons	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
68	Lafleur	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
69	Lanessan	This is where the description of the wine will be placed.	red-wine.jpg	16	2	27
70	Clos St Martin	This is where the description of the wine will be placed.	red-wine.jpg	8	2	28
71	Cos d`Estournel	This is where the description of the wine will be placed.	red-wine.jpg	13	2	29
72	Cos d`Estournel Blanc	This is where the description of the wine will be placed.	white-wine.jpg	13	1	30
73	Côte Montpezat	This is where the description of the wine will be placed.	red-wine.jpg	17	2	31
74	Croix Labrie	This is where the description of the wine will be placed.	red-wine.jpg	8	2	32
75	La Fleur De Gay	This is where the description of the wine will be placed.	red-wine.jpg	8	2	32
76	Larcis Ducasse	This is where the description of the wine will be placed.	red-wine.jpg	8	2	32
77	Les Carmes Haut Brion	This is where the description of the wine will be placed.	red-wine.jpg	8	2	32
78	Historical XIX Century Blend L.20.06	This is where the description of the wine will be placed.	red-wine.jpg	8	2	32
79	Saint Pierre (St Julien)	This is where the description of the wine will be placed.	red-wine.jpg	8	2	32
80	d`Aiguilhe Querre	This is where the description of the wine will be placed.	red-wine.jpg	17	2	33
81	d`Armailhac	This is where the description of the wine will be placed.	red-wine.jpg	18	2	34
82	d`Issan	This is where the description of the wine will be placed.	red-wine.jpg	9	2	35
83	Châteauneuf du Pape	This is where the description of the wine will be placed.	red-wine.jpg	19	2	36
84	Hermitage	This is where the description of the wine will be placed.	red-wine.jpg	19	2	36
85	Hermitage La Chapelle	This is where the description of the wine will be placed.	red-wine.jpg	19	2	36
86	Cote Rotie La Landonne	This is where the description of the wine will be placed.	red-wine.jpg	19	2	36
87	Cote Rotie Cote Blonde	This is where the description of the wine will be placed.	red-wine.jpg	19	2	36
88	Doisy Vedrines	This is where the description of the wine will be placed.	white-wine.jpg	20	1	37
89	Du Tertre	This is where the description of the wine will be placed.	red-wine.jpg	9	2	38
90	Enclos Tourmaline	This is where the description of the wine will be placed.	red-wine.jpg	15	2	39
91	Figeac	This is where the description of the wine will be placed.	red-wine.jpg	8	2	40
92	La Lagune	This is where the description of the wine will be placed.	red-wine.jpg	8	2	40
93	Léoville Las Cases	This is where the description of the wine will be placed.	red-wine.jpg	8	2	40
94	Pape Clement	This is where the description of the wine will be placed.	red-wine.jpg	8	2	40
95	Canon	This is where the description of the wine will be placed.	red-wine.jpg	8	2	40
96	Petit Figeac	This is where the description of the wine will be placed.	red-wine.jpg	8	2	40
97	Grand Puy Lacoste	This is where the description of the wine will be placed.	red-wine.jpg	18	2	41
98	Gruaud Larose	This is where the description of the wine will be placed.	red-wine.jpg	11	2	42
99	Guiraud	This is where the description of the wine will be placed.	white-wine.jpg	20	1	43
100	Haut Bages Libéral	This is where the description of the wine will be placed.	red-wine.jpg	18	2	44
101	Haut Bellevue	This is where the description of the wine will be placed.	red-wine.jpg	21	2	45
102	Haut Bergey	This is where the description of the wine will be placed.	red-wine.jpg	12	2	46
103	Le Clarence de Haut Brion	This is where the description of the wine will be placed.	red-wine.jpg	12	2	46
104	Haut Carles	This is where the description of the wine will be placed.	red-wine.jpg	14	2	47
105	Joanin Becot	This is where the description of the wine will be placed.	red-wine.jpg	17	2	48
106	La Clotte	This is where the description of the wine will be placed.	red-wine.jpg	17	2	48
107	La Fleur Petrus	This is where the description of the wine will be placed.	red-wine.jpg	17	2	48
108	la Gaffelière	This is where the description of the wine will be placed.	red-wine.jpg	17	2	48
109	L`Archange	This is where the description of the wine will be placed.	red-wine.jpg	17	2	48
110	Magrez Fombrauge	This is where the description of the wine will be placed.	red-wine.jpg	17	2	48
111	Kirwan	This is where the description of the wine will be placed.	red-wine.jpg	9	2	49
112	Prieuré Lichine	This is where the description of the wine will be placed.	red-wine.jpg	9	2	49
113	Puygueraud	This is where the description of the wine will be placed.	red-wine.jpg	9	2	49
114	L`Arrosee	This is where the description of the wine will be placed.	red-wine.jpg	8	2	50
115	L`Eglise Clinet	This is where the description of the wine will be placed.	red-wine.jpg	15	2	51
116	L`Enclos	This is where the description of the wine will be placed.	red-wine.jpg	15	2	52
117	Pavie	This is where the description of the wine will be placed.	red-wine.jpg	15	2	52
118	Rauzan Gassies	This is where the description of the wine will be placed.	red-wine.jpg	15	2	52
119	Sociando Mallet	This is where the description of the wine will be placed.	red-wine.jpg	15	2	52
120	Soutard	This is where the description of the wine will be placed.	red-wine.jpg	15	2	52
121	L`Evangile	This is where the description of the wine will be placed.	red-wine.jpg	15	2	51
122	La Cabanne	This is where the description of the wine will be placed.	red-wine.jpg	8	2	53
123	La Mondotte	This is where the description of the wine will be placed.	red-wine.jpg	8	2	53
124	Yon Figeac	This is where the description of the wine will be placed.	red-wine.jpg	8	2	53
125	Berliquet	This is where the description of the wine will be placed.	red-wine.jpg	8	2	53
126	Feytit Clinet	This is where the description of the wine will be placed.	red-wine.jpg	8	2	53
127	Haut Marbuzet	This is where the description of the wine will be placed.	red-wine.jpg	8	2	53
128	La Conseillante	This is where the description of the wine will be placed.	red-wine.jpg	15	2	54
129	La Couronne	This is where the description of the wine will be placed.	red-wine.jpg	22	2	55
130	Lynch Moussas	This is where the description of the wine will be placed.	red-wine.jpg	22	2	55
131	La Chenade	This is where the description of the wine will be placed.	red-wine.jpg	22	2	55
132	Les Cruzelles	This is where the description of the wine will be placed.	red-wine.jpg	22	2	55
133	Certan de May	This is where the description of the wine will be placed.	red-wine.jpg	22	2	55
134	Croix Mouton	This is where the description of the wine will be placed.	red-wine.jpg	22	2	55
135	La Croix de Gay	This is where the description of the wine will be placed.	red-wine.jpg	15	2	56
136	Pomeaux	This is where the description of the wine will be placed.	red-wine.jpg	15	2	56
137	Smith Haut Lafitte	This is where the description of the wine will be placed.	red-wine.jpg	15	2	56
138	La Tour Haut Brion	This is where the description of the wine will be placed.	red-wine.jpg	15	2	56
139	La Dominique	This is where the description of the wine will be placed.	red-wine.jpg	8	2	57
140	Léoville Barton	This is where the description of the wine will be placed.	red-wine.jpg	8	2	57
141	Monbrison	This is where the description of the wine will be placed.	red-wine.jpg	8	2	57
142	La Fleur de Plince	This is where the description of the wine will be placed.	red-wine.jpg	8	2	58
143	La Gurgue	This is where the description of the wine will be placed.	red-wine.jpg	9	2	59
144	La Violette	This is where the description of the wine will be placed.	red-wine.jpg	15	2	60
145	Labegorce	This is where the description of the wine will be placed.	red-wine.jpg	9	2	61
146	Lafite	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
147	La Mission Haut Brion	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
148	Montrose	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
149	Carruades de Lafite	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
150	Trotanoy	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
151	Beaumont	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
152	Beausejour Becot	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
153	Beausejour Duffau	This is where the description of the wine will be placed.	red-wine.jpg	18	2	62
154	Lafon Rochet	This is where the description of the wine will be placed.	red-wine.jpg	23	2	63
155	Laforge	This is where the description of the wine will be placed.	red-wine.jpg	8	2	64
156	Lalande Borie	This is where the description of the wine will be placed.	red-wine.jpg	11	2	65
157	Langoa Barton	This is where the description of the wine will be placed.	red-wine.jpg	11	2	66
158	Lascombes	This is where the description of the wine will be placed.	red-wine.jpg	9	2	67
159	Latour	This is where the description of the wine will be placed.	red-wine.jpg	18	2	68
160	Latour A Pomerol	This is where the description of the wine will be placed.	red-wine.jpg	15	2	69
161	Latour Martillac Blanc	This is where the description of the wine will be placed.	white-wine.jpg	24	1	70
162	Le Conseiller	This is where the description of the wine will be placed.	red-wine.jpg	25	2	71
163	La Reserve de Malartic	This is where the description of the wine will be placed.	red-wine.jpg	25	2	71
164	Pouget	This is where the description of the wine will be placed.	red-wine.jpg	25	2	71
165	Tour St Bonnet	This is where the description of the wine will be placed.	red-wine.jpg	25	2	71
166	Cambon La Pelouse	This is where the description of the wine will be placed.	red-wine.jpg	25	2	71
167	Climens	This is where the description of the wine will be placed.	red-wine.jpg	25	2	71
168	Le Crock	This is where the description of the wine will be placed.	red-wine.jpg	23	2	72
169	Lilian Ladouys	This is where the description of the wine will be placed.	red-wine.jpg	23	2	72
170	Malartic Lagraviere	This is where the description of the wine will be placed.	red-wine.jpg	23	2	72
171	Moulin Riche	This is where the description of the wine will be placed.	red-wine.jpg	23	2	72
172	Saint Pierre	This is where the description of the wine will be placed.	red-wine.jpg	23	2	72
173	La Dame de Montrose	This is where the description of the wine will be placed.	red-wine.jpg	23	2	72
174	Léoville Poyferré	This is where the description of the wine will be placed.	red-wine.jpg	11	2	73
175	Les Ormes de Pez	This is where the description of the wine will be placed.	red-wine.jpg	13	2	74
176	Les Trois Croix	This is where the description of the wine will be placed.	red-wine.jpg	14	2	75
177	Lynch Bages	This is where the description of the wine will be placed.	red-wine.jpg	18	2	76
178	Echo de Lynch Bages	This is where the description of the wine will be placed.	red-wine.jpg	18	2	76
179	Magdelaine	This is where the description of the wine will be placed.	red-wine.jpg	8	2	77
180	Malescot St Exupery	This is where the description of the wine will be placed.	red-wine.jpg	9	2	78
181	Margaux	This is where the description of the wine will be placed.	red-wine.jpg	9	2	79
182	Mouton Rothschild	This is where the description of the wine will be placed.	red-wine.jpg	9	2	79
183	Haut Brion	This is where the description of the wine will be placed.	red-wine.jpg	9	2	79
184	Pavillon Rouge du Margaux	This is where the description of the wine will be placed.	red-wine.jpg	9	2	79
185	Pavillon Blanc du Margaux	This is where the description of the wine will be placed.	white-wine.jpg	9	1	79
186	Marquis d`Alesme	This is where the description of the wine will be placed.	red-wine.jpg	9	2	80
187	d`Yquem	This is where the description of the wine will be placed.	white-wine.jpg	9	1	80
188	Lafaurie Peyraguey	This is where the description of the wine will be placed.	white-wine.jpg	9	1	80
189	Coutet	This is where the description of the wine will be placed.	white-wine.jpg	9	1	80
190	La Tour Blanche	This is where the description of the wine will be placed.	white-wine.jpg	9	1	80
191	Meyney	This is where the description of the wine will be placed.	red-wine.jpg	23	2	81
192	Pontet Canet	This is where the description of the wine will be placed.	red-wine.jpg	23	2	81
193	Valandraud	This is where the description of the wine will be placed.	red-wine.jpg	23	2	81
194	Clos Fourtet	This is where the description of the wine will be placed.	red-wine.jpg	23	2	81
195	Duhart Milon	This is where the description of the wine will be placed.	red-wine.jpg	23	2	81
196	Monbousquet	This is where the description of the wine will be placed.	red-wine.jpg	8	2	82
197	Montalbert	This is where the description of the wine will be placed.	red-wine.jpg	8	2	83
198	Montlandrie	This is where the description of the wine will be placed.	red-wine.jpg	17	2	84
199	Pédesclaux	This is where the description of the wine will be placed.	red-wine.jpg	17	2	84
200	Siran	This is where the description of the wine will be placed.	red-wine.jpg	17	2	84
201	Tour Saint Christophe	This is where the description of the wine will be placed.	red-wine.jpg	17	2	84
202	Moulin Haut Laroque	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
203	Alter Ego de Palmer	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
204	Poujeaux	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
205	Saintayme	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
206	Sénéjac	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
207	Clos La Madeleine	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
208	La Petite Eglise	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
209	Capbern Gasqueston	This is where the description of the wine will be placed.	red-wine.jpg	14	2	85
210	Musar	This is where the description of the wine will be placed.	red-wine.jpg	26	2	86
211	Palmer	This is where the description of the wine will be placed.	red-wine.jpg	9	2	87
212	Petit Faurie de Souchard	This is where the description of the wine will be placed.	red-wine.jpg	8	2	88
213	Petrus	This is where the description of the wine will be placed.	red-wine.jpg	15	2	89
214	Pichon Baron	This is where the description of the wine will be placed.	red-wine.jpg	18	2	90
215	Pichon Lalande	This is where the description of the wine will be placed.	red-wine.jpg	18	2	91
216	Potensac	This is where the description of the wine will be placed.	red-wine.jpg	27	2	92
217	Puygueraud Cuvée George	This is where the description of the wine will be placed.	red-wine.jpg	28	2	93
218	Troplong Mondot	This is where the description of the wine will be placed.	red-wine.jpg	28	2	93
219	Durfort Vivens	This is where the description of the wine will be placed.	red-wine.jpg	28	2	93
220	Bellevue	This is where the description of the wine will be placed.	red-wine.jpg	28	2	93
221	de Chambrun	This is where the description of the wine will be placed.	red-wine.jpg	28	2	93
222	Fontenil	This is where the description of the wine will be placed.	red-wine.jpg	28	2	93
223	Quinault L`Enclos	This is where the description of the wine will be placed.	red-wine.jpg	16	2	94
224	Rauzan Ségla	This is where the description of the wine will be placed.	red-wine.jpg	9	2	95
225	Rieussec	This is where the description of the wine will be placed.	white-wine.jpg	20	1	96
226	Smith Haut Lafitte Blanc	This is where the description of the wine will be placed.	white-wine.jpg	20	1	96
227	Clos Haut Peyraguey	This is where the description of the wine will be placed.	white-wine.jpg	20	1	96
228	de Fargues	This is where the description of the wine will be placed.	white-wine.jpg	20	1	96
229	Le Petit Haut Lafitte Rouge	This is where the description of the wine will be placed.	red-wine.jpg	12	2	97
230	Les Terres Rouge	This is where the description of the wine will be placed.	red-wine.jpg	12	2	97
231	Hosanna	This is where the description of the wine will be placed.	red-wine.jpg	12	2	97
232	La Marzelle	This is where the description of the wine will be placed.	red-wine.jpg	12	2	97
233	Saintem	This is where the description of the wine will be placed.	red-wine.jpg	12	2	97
234	Tronquoy Lalande	This is where the description of the wine will be placed.	red-wine.jpg	12	2	97
235	Suduiraut	This is where the description of the wine will be placed.	white-wine.jpg	20	1	98
236	Domaine de Chevalier Blanc	This is where the description of the wine will be placed.	white-wine.jpg	20	1	98
237	Grand Vin Sec	This is where the description of the wine will be placed.	white-wine.jpg	20	1	98
238	Pape Clement Blanc	This is where the description of the wine will be placed.	white-wine.jpg	20	1	98
239	Beaune 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	20	2	98
240	Talbot	This is where the description of the wine will be placed.	red-wine.jpg	11	2	99
241	Terrey Gros Caillou	This is where the description of the wine will be placed.	red-wine.jpg	11	2	100
242	Priorat `Classic`	This is where the description of the wine will be placed.	red-wine.jpg	29	2	101
243	Priorat, El Vell Coster	This is where the description of the wine will be placed.	red-wine.jpg	29	2	101
244	Finca Dofi	This is where the description of the wine will be placed.	red-wine.jpg	29	2	101
245	Gratallops	This is where the description of the wine will be placed.	red-wine.jpg	29	2	101
246	Coma Blanca Mas d`En Gil	This is where the description of the wine will be placed.	white-wine.jpg	29	1	101
247	Clos du Marquis	This is where the description of the wine will be placed.	red-wine.jpg	11	2	102
248	Montagny 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	30	1	103
249	Colgin IX Estate Proprietary Red	This is where the description of the wine will be placed.	red-wine.jpg	3	2	104
250	Chambolle Musigny Reserve	This is where the description of the wine will be placed.	red-wine.jpg	31	2	105
251	Corton Clos des Cortons Grand Cru	This is where the description of the wine will be placed.	red-wine.jpg	31	2	105
252	Nuits St Georges Clos Marechale 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	31	2	105
253	Chapelle Chambertin grand cru	This is where the description of the wine will be placed.	red-wine.jpg	31	2	105
254	Corton Pougets grand cru	This is where the description of the wine will be placed.	red-wine.jpg	31	2	105
255	Croft Vintage Port	This is where the description of the wine will be placed.	fortified-wine.jpg	32	3	106
256	Quinta de Vargellas	This is where the description of the wine will be placed.	fortified-wine.jpg	32	3	106
257	Vesuvio Capela	This is where the description of the wine will be placed.	fortified-wine.jpg	32	3	106
258	Corullon Las Lamas	This is where the description of the wine will be placed.	red-wine.jpg	33	2	107
259	Villa de Corullon	This is where the description of the wine will be placed.	red-wine.jpg	33	2	107
260	Echezeaux Les Loachausses grand cru	This is where the description of the wine will be placed.	red-wine.jpg	34	2	108
261	Beaune Les Greves 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	34	2	108
262	Corton Cuvee Du Bourdon grand cru	This is where the description of the wine will be placed.	red-wine.jpg	34	2	108
263	Domaine de Chevalier	This is where the description of the wine will be placed.	red-wine.jpg	12	2	109
264	de Fieuzal	This is where the description of the wine will be placed.	red-wine.jpg	12	2	109
265	Lagrange	This is where the description of the wine will be placed.	red-wine.jpg	12	2	109
266	Ducru Beaucaillou	This is where the description of the wine will be placed.	red-wine.jpg	12	2	109
267	Nuits St Georges Clos des Forêts 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	35	2	110
268	Morey St Denis La Riotte 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	35	2	110
269	Corton Bressandes grand cru	This is where the description of the wine will be placed.	red-wine.jpg	35	2	110
270	Vosne Romanée Aux Malconsorts 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	35	2	110
271	Musigny Vieilles Vignes grand cru	This is where the description of the wine will be placed.	red-wine.jpg	35	2	110
272	Clos des Lambrays grand cru	This is where the description of the wine will be placed.	red-wine.jpg	36	2	111
273	Clos de la Roche Vieille Vignes	This is where the description of the wine will be placed.	red-wine.jpg	36	2	111
274	Charmes Chambertin grand cru	This is where the description of the wine will be placed.	red-wine.jpg	36	2	111
275	Clos Vougeot Le Grand Maupertui	This is where the description of the wine will be placed.	red-wine.jpg	36	2	111
276	Châteauneuf du Pape Cuvée Les Origines	This is where the description of the wine will be placed.	red-wine.jpg	19	2	112
277	Cotes du Rhone Villages `Plan de Dieu`	This is where the description of the wine will be placed.	red-wine.jpg	19	2	112
278	Châteauneuf du Pape Les Safres	This is where the description of the wine will be placed.	red-wine.jpg	19	2	112
279	Côtes du Rhône Réserve	This is where the description of the wine will be placed.	red-wine.jpg	19	2	112
280	Châteauneuf du Pape Cuvée Quet	This is where the description of the wine will be placed.	red-wine.jpg	19	2	112
281	Saint Aubin Les Frionnes	This is where the description of the wine will be placed.	white-wine.jpg	37	1	113
282	Morgon Cote Du Py	This is where the description of the wine will be placed.	red-wine.jpg	38	2	114
283	Côte de Brouilly	This is where the description of the wine will be placed.	red-wine.jpg	38	2	114
284	Fleurie	This is where the description of the wine will be placed.	red-wine.jpg	38	2	114
285	Oberhauser Brucke Riesling Spatlese	This is where the description of the wine will be placed.	white-wine.jpg	39	1	115
286	Oberhauser Brucke Riesling Beerenauslese	This is where the description of the wine will be placed.	white-wine.jpg	39	1	115
287	Niederhauser Hermannshole Riesling Spatlese	This is where the description of the wine will be placed.	white-wine.jpg	39	1	115
288	Dellchen Grosses Gewachs Dry Riesling	This is where the description of the wine will be placed.	white-wine.jpg	39	1	115
289	Sena	This is where the description of the wine will be placed.	red-wine.jpg	72	2	116
290	Puligny Montrachet Combettest 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	40	1	117
291	Morey St Denis Clos Baulet 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	41	2	118
292	Chambolle Musigny Les Drazey Domaine Gagey	This is where the description of the wine will be placed.	red-wine.jpg	41	2	118
293	Gevrey Chambertin Estournelles St Jacques 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	41	2	118
294	Vosne Romanée Beaux Monts 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	41	2	118
295	Vougeot Les Petits Vougeots 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	41	2	118
296	Chambolle Musigny Coeur de Pierre 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	42	2	119
297	Chambolle Musigny	This is where the description of the wine will be placed.	red-wine.jpg	42	2	119
298	Beaune Bressandes 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	42	2	119
299	Volnay Les Caillerets 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	42	2	119
300	Masseto	This is where the description of the wine will be placed.	red-wine.jpg	43	2	120
301	Brauneberger Juffer Sonnenuhr Auslese	This is where the description of the wine will be placed.	white-wine.jpg	44	1	121
302	Zeltinger Sonnenuhr Trockenbeerenauslese	This is where the description of the wine will be placed.	white-wine.jpg	44	1	121
303	Terra di Lavoro	This is where the description of the wine will be placed.	red-wine.jpg	45	2	122
304	Glaetzer Godolphin	This is where the description of the wine will be placed.	red-wine.jpg	46	2	123
305	Apricot Shiraz	This is where the description of the wine will be placed.	red-wine.jpg	46	2	124
306	Shiraz	This is where the description of the wine will be placed.	red-wine.jpg	46	2	124
307	Sojourn	This is where the description of the wine will be placed.	red-wine.jpg	46	2	124
308	Alice`s Shiraz	This is where the description of the wine will be placed.	red-wine.jpg	46	2	124
309	Seven Acre	This is where the description of the wine will be placed.	red-wine.jpg	46	2	124
310	Griffons de Pichon Baron	This is where the description of the wine will be placed.	red-wine.jpg	18	2	125
311	Vosne Romanée	This is where the description of the wine will be placed.	red-wine.jpg	47	2	126
312	Gevrey Chambertin	This is where the description of the wine will be placed.	red-wine.jpg	47	2	126
313	Morey St Denis Les Chaffots 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	47	2	126
314	Corton Grancey grand cru	This is where the description of the wine will be placed.	red-wine.jpg	47	2	126
315	Cote Rotie d`Ampuis	This is where the description of the wine will be placed.	red-wine.jpg	7	2	127
316	Châteauneuf du Pape Hommages a Jacques Perrin	This is where the description of the wine will be placed.	red-wine.jpg	7	2	127
317	Châteauneuf du Pape Cuvée Reservée	This is where the description of the wine will be placed.	red-wine.jpg	7	2	127
318	Châteauneuf du Pape Deus Ex-Machina	This is where the description of the wine will be placed.	red-wine.jpg	7	2	127
319	Châteauneuf du Pape Cuvée Mon Aieul	This is where the description of the wine will be placed.	red-wine.jpg	7	2	127
320	Keyneton Estate Euphonium	This is where the description of the wine will be placed.	red-wine.jpg	46	2	128
321	Savitar Shiraz	This is where the description of the wine will be placed.	red-wine.jpg	46	2	128
322	Carnival of Love Shiraz	This is where the description of the wine will be placed.	red-wine.jpg	46	2	128
323	Noon Reserve Shiraz	This is where the description of the wine will be placed.	red-wine.jpg	46	2	128
324	Cepparello	This is where the description of the wine will be placed.	red-wine.jpg	5	2	129
325	Solaia	This is where the description of the wine will be placed.	red-wine.jpg	5	2	129
326	Guado Al Tasso	This is where the description of the wine will be placed.	red-wine.jpg	5	2	129
327	Messorio	This is where the description of the wine will be placed.	red-wine.jpg	5	2	129
328	Crozes Hermitage Domaine de Roure	This is where the description of the wine will be placed.	red-wine.jpg	48	2	130
329	Châteauneuf du Pape Cuvée da Capo	This is where the description of the wine will be placed.	red-wine.jpg	48	2	130
330	Châteauneuf du Pape Cuvée Vieilles Vignes	This is where the description of the wine will be placed.	red-wine.jpg	48	2	130
331	Gigondas Grand Grenache Cuvée 66	This is where the description of the wine will be placed.	red-wine.jpg	48	2	130
332	Crozes Hermitage	This is where the description of the wine will be placed.	red-wine.jpg	48	2	131
333	Cairanne Cotes du Rhone Villages	This is where the description of the wine will be placed.	red-wine.jpg	48	2	131
334	Hermitage Blanc	This is where the description of the wine will be placed.	white-wine.jpg	48	1	131
335	Châteauneuf du Pape Blanc Vieilles Vignes	This is where the description of the wine will be placed.	white-wine.jpg	48	1	131
336	St Joseph Les Granits Blanc	This is where the description of the wine will be placed.	white-wine.jpg	48	1	131
337	Auxey Duresses Blanc Les Boutonniers	This is where the description of the wine will be placed.	white-wine.jpg	49	1	132
338	Puligny Montrachet Referts 1er Cru	This is where the description of the wine will be placed.	white-wine.jpg	1	1	133
339	Chablis Vaulorent 1er Cru	This is where the description of the wine will be placed.	white-wine.jpg	50	1	134
340	Wehlener Sonnenuhr Riesling Auslese	This is where the description of the wine will be placed.	white-wine.jpg	44	1	135
341	Maximin Grunhauser Herrenberg Auslese 188	This is where the description of the wine will be placed.	white-wine.jpg	44	1	135
342	Krug	This is where the description of the wine will be placed.	sparkling-wine.jpg	51	4	136
343	La Grande Dame Rosé	This is where the description of the wine will be placed.	sparkling-wine.jpg	51	4	136
344	Krug Rose	This is where the description of the wine will be placed.	sparkling-wine.jpg	51	4	136
345	Yellow Label Brut	This is where the description of the wine will be placed.	sparkling-wine.jpg	51	4	136
346	La Chapelle de la Mission	This is where the description of the wine will be placed.	red-wine.jpg	24	2	137
347	Les Pagodes de Cos	This is where the description of the wine will be placed.	red-wine.jpg	24	2	137
348	Bellevue Mondotte	This is where the description of the wine will be placed.	red-wine.jpg	24	2	137
349	Clos L`Oratoire	This is where the description of the wine will be placed.	red-wine.jpg	24	2	137
350	Fleur de Jean Gué Réserve	This is where the description of the wine will be placed.	red-wine.jpg	24	2	137
351	Les Hauts Conseillants	This is where the description of the wine will be placed.	red-wine.jpg	24	2	137
352	Rioja Gran Reserva 890 Seleccion Especial	This is where the description of the wine will be placed.	red-wine.jpg	52	2	138
353	Rioja Gran Reserva 904	This is where the description of the wine will be placed.	red-wine.jpg	52	2	138
354	Viña Ardanza Reserva	This is where the description of the wine will be placed.	red-wine.jpg	52	2	138
355	Gevrey Chambertin Cuvée de l`Abeille	This is where the description of the wine will be placed.	red-wine.jpg	2	2	139
356	Echezeaux grand cru Domaine Gagey	This is where the description of the wine will be placed.	red-wine.jpg	2	2	139
357	Gevrey Chambertin Petite Chapelle 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	2	2	139
358	Morey St Denis Clos Des Ormes 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	2	2	139
359	Vosne Romanée Les Chaumes 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	2	2	139
360	Nuits St Georges Les Vaucrains 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	2	2	139
361	Le Plus de la Fleur de Bouard	This is where the description of the wine will be placed.	red-wine.jpg	53	2	140
362	Art Series Cabernet Sauvignon	This is where the description of the wine will be placed.	red-wine.jpg	46	2	141
363	Art Series Chardonnay	This is where the description of the wine will be placed.	white-wine.jpg	46	1	141
364	Les Hauts de Pontet Canet	This is where the description of the wine will be placed.	red-wine.jpg	18	2	142
365	Clos St Denis grand cru	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
366	Chambolle Musigny Baudes 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
367	Nuits St Georges Les Damodes 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
368	Chambertin Clos de Beze grand cru	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
369	Chambolle Musigny 1er cru Les Fuées	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
370	Clos de la Roche grand cru	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
371	Gevrey Chambertin Clos St Jacques 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	54	2	143
372	Chevalier Montrachet Les Demoiselles grand cru	This is where the description of the wine will be placed.	white-wine.jpg	55	1	143
373	Le Montrachet grand cru	This is where the description of the wine will be placed.	white-wine.jpg	56	1	143
374	Meursault Tillets 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	57	1	143
375	Savigny Les Beaune Clos des Guettes 1er Cru , Domaine Gagey	This is where the description of the wine will be placed.	white-wine.jpg	58	1	143
376	Corton les Rognets Grand Cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
377	Gevrey Chambertin Clos Tamisot	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
378	Nuits St Georges Aux Boudots 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
379	Givry 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
380	Gevrey Chambertin Lavault St Jacques 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
381	Bourgogne Hautes Cotes de Nuits	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
382	Morey St Denis	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
383	Beaune Clos des Couchereaux 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	144
384	Malmsey Cossart	This is where the description of the wine will be placed.	fortified-wine.jpg	60	3	145
385	Barolo Monprivato	This is where the description of the wine will be placed.	red-wine.jpg	5	2	146
386	Bonnes Mares grand cru	This is where the description of the wine will be placed.	red-wine.jpg	61	2	147
387	Echezeaux Grand Cru	This is where the description of the wine will be placed.	red-wine.jpg	61	2	147
388	Latricieres Chambertin Grand Cru	This is where the description of the wine will be placed.	red-wine.jpg	61	2	147
389	Corton Clos du Roi grand cru	This is where the description of the wine will be placed.	red-wine.jpg	61	2	147
390	Nuits St Georges Les Pruliers 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	61	2	147
391	Penfolds Grange	This is where the description of the wine will be placed.	red-wine.jpg	46	2	148
392	Pesus Vina Sastre	This is where the description of the wine will be placed.	red-wine.jpg	62	2	149
393	Quinta Sardonia	This is where the description of the wine will be placed.	red-wine.jpg	62	2	149
394	Alion	This is where the description of the wine will be placed.	red-wine.jpg	62	2	149
395	Rivesaltes Vieil Homme	This is where the description of the wine will be placed.	fortified-wine.jpg	63	3	150
396	Rivesaltes Ambre Grande Reserve	This is where the description of the wine will be placed.	fortified-wine.jpg	63	3	150
397	Corton grand cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
398	Beaune Clos du Roi 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
399	Volnay Les Mitans 1er Cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
400	Morey St Denis Clos Solon	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
401	Pommard Les Petits Noizons	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
402	Gevrey Chambertin Les Evocelles	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
403	Lavaux St Jacques 1er cru	This is where the description of the wine will be placed.	red-wine.jpg	59	2	151
404	Monte Bello Cabernet Sauvignon	This is where the description of the wine will be placed.	red-wine.jpg	64	2	152
405	Menetou Salon Clos de la Cure	This is where the description of the wine will be placed.	white-wine.jpg	65	1	153
406	L`Oratoire Rosé	This is where the description of the wine will be placed.	rose-wine.jpg	66	5	154
407	Sassicaia	This is where the description of the wine will be placed.	red-wine.jpg	5	2	155
408	Atlantis 2B	This is where the description of the wine will be placed.	red-wine.jpg	67	2	156
409	Sloan Proprietary Red	This is where the description of the wine will be placed.	red-wine.jpg	3	2	157
410	Hermitage Le Greal	This is where the description of the wine will be placed.	red-wine.jpg	68	2	158
411	Châteauneuf du Pape L`Accent de la Roquete	This is where the description of the wine will be placed.	red-wine.jpg	68	2	158
412	Châteauneuf du Pape Vieilles Vignes	This is where the description of the wine will be placed.	red-wine.jpg	68	2	158
413	Châteauneuf du Pape Cuvée Felix	This is where the description of the wine will be placed.	red-wine.jpg	68	2	158
414	Châteauneuf du Pape Côte Capelan	This is where the description of the wine will be placed.	red-wine.jpg	68	2	158
415	Chassagne Montrachet Morgeot 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	69	1	159
416	Chorey-Les-Beaune	This is where the description of the wine will be placed.	red-wine.jpg	70	2	160
417	Corton Charlemagne grand cru	This is where the description of the wine will be placed.	white-wine.jpg	70	1	160
418	Batard Montrachet Grand Cru	This is where the description of the wine will be placed.	white-wine.jpg	70	1	160
419	Puligny Montrachet La Garenne 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	70	1	160
420	Chassagne Montrachet Cailleret 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	70	1	160
421	Meursault Clos des Perrieres 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	70	1	160
422	Meursault Perrieres 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	70	1	160
423	Hayne Vineyard Zinfandel	This is where the description of the wine will be placed.	red-wine.jpg	67	2	161
424	Unico	This is where the description of the wine will be placed.	red-wine.jpg	62	2	162
425	Valbuena No.5	This is where the description of the wine will be placed.	red-wine.jpg	62	2	162
426	Cyclo	This is where the description of the wine will be placed.	red-wine.jpg	62	2	162
427	La Muse	This is where the description of the wine will be placed.	red-wine.jpg	67	2	163
428	Bond St Eden	This is where the description of the wine will be placed.	red-wine.jpg	67	2	163
429	Vesuvio	This is where the description of the wine will be placed.	fortified-wine.jpg	32	3	164
430	Cockburn	This is where the description of the wine will be placed.	fortified-wine.jpg	32	3	164
431	Vieux Certan	This is where the description of the wine will be placed.	red-wine.jpg	15	2	165
432	Chassagne Montrachet Maltroie 1er cru	This is where the description of the wine will be placed.	white-wine.jpg	69	1	166
433	Y d`Yquem	This is where the description of the wine will be placed.	white-wine.jpg	71	1	167
434	Doisy Daene	This is where the description of the wine will be placed.	white-wine.jpg	71	1	167
435	Rayne Vigneau	This is where the description of the wine will be placed.	white-wine.jpg	71	1	167
436	Sigalas Rabaud	This is where the description of the wine will be placed.	white-wine.jpg	71	1	167
437	Les Carmes de Rieussec	This is where the description of the wine will be placed.	white-wine.jpg	71	1	167
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.regions (id, name, country_id_id) FROM stdin;
23	Burgundy	454
24	America	455
25	Toro	456
26	Tuscany	457
27	Languedoc	454
28	Rhone	454
29	Bordeaux	454
30	Bekaa Valley	458
31	Priorat	456
32	Oporto	459
33	Bierzo	456
34	Beaujolais	454
35	Nahe	460
36	Chile	461
37	Mosel	460
38	Campania	457
39	Australia	462
40	Champagne	454
41	Rioja	456
42	Madeira	459
43	Piemonte	457
44	Ribera Del Duero	456
45	Rivesaltes	454
46	California	455
47	Loire	454
48	Provence	454
49	Chile	463
\.


--
-- Data for Name: star_ratings_rating; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.star_ratings_rating (id, count, total, average, object_id, content_type_id) FROM stdin;
\.


--
-- Data for Name: star_ratings_userrating; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.star_ratings_userrating (id, created, modified, ip, score, rating_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_rates; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.user_rates (id, rate, comment, product_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.users (id, email, avatar, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: hrsuser
--

COPY public.vendors (id, name, description, region_id_id) FROM stdin;
1	Alain Chavy	This is the place for the producer description.	23
2	Alex Gambal	This is the place for the producer description.	23
3	Benjamin Leroux	This is the place for the producer description.	23
4	Beringer	Founded in 1876, Beringer Vineyards is the oldest continuously operating winery in the Napa Valley, and is listed under both the National Register of Historical Places and as a California Historical Landmark.	24
5	Bodega Numanthia	Firmly rooted into Spanish history and terroir, Bodega Numanthia is the birthplace of powerful and intense wines, iconic incarnations of the prestigious Designation of Origin Toro.	25
6	Brancaia	This is the place for the producer description.	26
7	Cardinale	This is the place for the producer description.	24
8	Castelmaure	This is the place for the producer description.	27
9	Chapoutier	Chapoutier is a winery and négociant business situated in Tain-l`Hermitage in the Rhône region in France. Chapoutier produces wine from appellations across the Rhône region, but it is typically their top Hermitage wines, both red and white, that receive the most attention and accolades.	28
10	Château Angelus	This is the place for the producer description.	29
11	Château Angludet	This is the place for the producer description.	29
12	Château Ausone	This is the place for the producer description.	29
13	Château Belair	This is the place for the producer description.	29
14	Château Belgrave	This is the place for the producer description.	29
15	Château Beychevelle	This is the place for the producer description.	29
16	Château Branaire Ducru	This is the place for the producer description.	29
17	Château Branon	This is the place for the producer description.	29
18	Château Canon La Gaffeliere	This is the place for the producer description.	29
19	Château Cantemerle	This is the place for the producer description.	29
20	Château Cantenac Brown	This is the place for the producer description.	29
21	Château Capbern	This is the place for the producer description.	29
22	Château Carlmagnus (Fronsac)	This is the place for the producer description.	29
23	Château Caronne St Gemme	This is the place for the producer description.	29
24	Château Charmail	This is the place for the producer description.	29
25	Château Cheval Blanc	This is the place for the producer description.	29
26	Château Clinet	This is the place for the producer description.	29
27	Château Clos St Julien	This is the place for the producer description.	29
28	Château Clos St Martin	This is the place for the producer description.	29
29	Château Cos d`Estournel	This is the place for the producer description.	29
30	Château Cos d`Estournel Blanc	This is the place for the producer description.	29
31	Château Côte Montpezat	This is the place for the producer description.	29
32	Château Croix de Labrie	This is the place for the producer description.	29
33	Château d`Aiguilhe Querre	This is the place for the producer description.	29
34	Château d`Armailhac	This is the place for the producer description.	29
35	Château d`Issan	This is the place for the producer description.	29
36	Château de Beaucastel	This is the place for the producer description.	28
37	Château Doisy Vedrines	This is the place for the producer description.	29
38	Château Du Tertre	This is the place for the producer description.	29
39	Château Enclos Tourmaline	This is the place for the producer description.	29
40	Château Figeac	This is the place for the producer description.	29
41	Château Grand Puy Lacoste	This is the place for the producer description.	29
42	Château Gruaud Larose	This is the place for the producer description.	29
43	Château Guiraud	This is the place for the producer description.	29
44	Château Haut Bages Libéral	This is the place for the producer description.	29
45	Château Haut Bellevue	This is the place for the producer description.	29
46	Château Haut Bergey	This is the place for the producer description.	29
47	Château Haut Carles	This is the place for the producer description.	29
48	Château Joanin Becot	This is the place for the producer description.	29
49	Château Kirwan	This is the place for the producer description.	29
50	Château L`Arrosee	This is the place for the producer description.	29
51	Château L`Evangile	This is the place for the producer description.	29
52	Château L`Enclos	This is the place for the producer description.	29
53	Château La Cabanne	This is the place for the producer description.	29
54	Château La Conseillante	This is the place for the producer description.	29
55	Château La Couronne	This is the place for the producer description.	29
56	Château La Croix de Gay	This is the place for the producer description.	29
57	Château La Dominique	This is the place for the producer description.	29
58	Château La Fleur de Plince	This is the place for the producer description.	29
59	Château La Gurgue	This is the place for the producer description.	29
60	Château La Violette	This is the place for the producer description.	29
61	Château Labegorce	This is the place for the producer description.	29
62	Château Lafite	This is the place for the producer description.	29
63	Château Lafon Rochet	This is the place for the producer description.	29
64	Château Laforge	This is the place for the producer description.	29
65	Château Lalande Borie	This is the place for the producer description.	29
66	Château Langoa Barton	This is the place for the producer description.	29
67	Château Lascombes	This is the place for the producer description.	29
68	Château Latour	This is the place for the producer description.	29
69	Château Latour A Pomerol	This is the place for the producer description.	29
70	Château Latour Martillac Blanc	This is the place for the producer description.	29
71	Château Le Conseiller	This is the place for the producer description.	29
72	Château Le Crock	This is the place for the producer description.	29
73	Château Léoville Poyferré	This is the place for the producer description.	29
74	Château Les Ormes de Pez	This is the place for the producer description.	29
75	Château Les Trois Croix	This is the place for the producer description.	29
76	Château Lynch Bages	This is the place for the producer description.	29
77	Château Magdelaine	This is the place for the producer description.	29
78	Château Malescot St Exupery	This is the place for the producer description.	29
79	Château Margaux	This is the place for the producer description.	29
80	Château Marquis d`Alesme	This is the place for the producer description.	29
81	Château Meyney	This is the place for the producer description.	29
82	Château Monbousquet	This is the place for the producer description.	29
83	Château Montalbert	This is the place for the producer description.	29
84	Château Montlandrie	This is the place for the producer description.	29
85	Château Moulin Haut Laroque	This is the place for the producer description.	29
86	Château Musar	This is the place for the producer description.	30
87	Château Palmer	This is the place for the producer description.	29
88	Château Petit Faurie de Souchard	This is the place for the producer description.	29
89	Château Petrus	This is the place for the producer description.	29
90	Château Pichon Baron	This is the place for the producer description.	29
91	Château Pichon Lalande	This is the place for the producer description.	29
92	Château Potensac	This is the place for the producer description.	29
93	Château Puygueraud Cuvée George	This is the place for the producer description.	29
94	Château Quinault L`Enclos	This is the place for the producer description.	29
95	Château Rauzan Ségla	This is the place for the producer description.	29
96	Château Rieussec	This is the place for the producer description.	29
97	Château Smith Haut Lafitte	This is the place for the producer description.	29
98	Château Suduiraut	This is the place for the producer description.	29
99	Château Talbot	This is the place for the producer description.	29
100	Château Terrey Gros Caillou	This is the place for the producer description.	29
101	Cims de Porrera	This is the place for the producer description.	31
102	Clos du Marquis	This is the place for the producer description.	29
103	Clos du Salomon	This is the place for the producer description.	23
104	Colgin IX Estate Proprietary Red	This is the place for the producer description.	24
105	Comte de Vogue	This is the place for the producer description.	23
106	Croft Vintage Port	This is the place for the producer description.	32
107	Descendientes de Jose Palacios	This is the place for the producer description.	33
108	Domaine Anne Gros	This is the place for the producer description.	23
109	Domaine de Chevalier	This is the place for the producer description.	29
110	Domaine de l`Arlot	This is the place for the producer description.	23
111	Domaine des Lambrays	This is the place for the producer description.	23
112	Domaine Grand Veneur	This is the place for the producer description.	28
113	Domaine Hubert Lamy	This is the place for the producer description.	23
114	Dominique Piron	This is the place for the producer description.	34
115	Donnhoff	This is the place for the producer description.	35
116	Eduardo Chadwick	This is the place for the producer description.	36
117	Etienne Sauzet	This is the place for the producer description.	23
118	Frederic Magnien	This is the place for the producer description.	23
119	Chambolle	This is the place for the producer description.	23
120	Frescobaldi	This is the place for the producer description.	26
121	Fritz Haag	This is the place for the producer description.	37
122	Galardi	This is the place for the producer description.	38
123	Glaetzer Godolphin	This is the place for the producer description.	39
124	Greenock Creek	This is the place for the producer description.	39
125	Griffons de Pichon Baron	This is the place for the producer description.	29
126	Grivot	This is the place for the producer description.	23
127	Guigal	This is the place for the producer description.	28
128	Henschke	This is the place for the producer description.	39
129	Isole e Olena	This is the place for the producer description.	26
130	Jaboulet	This is the place for the producer description.	28
131	Jann Chave	This is the place for the producer description.	28
132	Jean & Gilles Lafouge	This is the place for the producer description.	23
133	Jean-Marc Boillot	This is the place for the producer description.	23
134	Jean-Paul Droin	This is the place for the producer description.	23
135	Joh. Jos. Prum	This is the place for the producer description.	37
136	Krug	This is the place for the producer description.	40
137	La Chapelle de la Mission	This is the place for the producer description.	29
138	La Rioja Alta	This is the place for the producer description.	41
139	Laurent Ponsot	This is the place for the producer description.	23
140	Le Plus de la Fleur de Bouard	This is the place for the producer description.	29
141	Leeuwin Estate	This is the place for the producer description.	39
142	Les Hauts de Pontet Canet	This is the place for the producer description.	29
143	Louis Jadot	This is the place for the producer description.	23
144	Maison Roche de Bellene	This is the place for the producer description.	23
145	Malmsey Cossart	This is the place for the producer description.	42
146	Mascarello	This is the place for the producer description.	43
147	Nicolas Potel	This is the place for the producer description.	23
148	Penfolds Grange	This is the place for the producer description.	39
149	Pesus Vina Sastre	This is the place for the producer description.	44
150	Pierre Janny	This is the place for the producer description.	45
151	Rapet Père et Fils	This is the place for the producer description.	23
152	Ridge Vineyards	This is the place for the producer description.	46
153	Roger Champault	This is the place for the producer description.	47
154	Saint Andrieu	This is the place for the producer description.	48
155	Sassicaia	This is the place for the producer description.	26
156	Sine Qua Non	This is the place for the producer description.	24
157	Sloan Proprietary Red	This is the place for the producer description.	24
158	Sorrel	This is the place for the producer description.	28
159	Thomas Morey	This is the place for the producer description.	23
160	Tollot Beaut	This is the place for the producer description.	23
161	Turley	This is the place for the producer description.	24
162	Vega Sicilia	This is the place for the producer description.	44
163	Vérité	This is the place for the producer description.	24
164	Vesuvio	This is the place for the producer description.	32
165	Vieux Château Certan	This is the place for the producer description.	29
166	Vincent Morey	This is the place for the producer description.	23
167	Y d`Yquem	This is the place for the producer description.	29
\.


--
-- Name: appellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.appellation_id_seq', 72, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 66, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: characteristics_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.characteristics_headers_id_seq', 5, true);


--
-- Name: characteristics_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.characteristics_values_id_seq', 19, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.countries_id_seq', 463, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: expert_product_characteristic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.expert_product_characteristic_id_seq', 1, false);


--
-- Name: expert_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.expert_rates_id_seq', 1, false);


--
-- Name: experts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.experts_id_seq', 1, false);


--
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.inventory_id_seq', 1007, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.products_id_seq', 437, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.regions_id_seq', 49, true);


--
-- Name: star_ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.star_ratings_rating_id_seq', 1, false);


--
-- Name: star_ratings_userrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.star_ratings_userrating_id_seq', 1, false);


--
-- Name: user_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.user_rates_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hrsuser
--

SELECT pg_catalog.setval('public.vendors_id_seq', 167, true);


--
-- Name: appellation appellation_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.appellation
    ADD CONSTRAINT appellation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: characteristics_headers characteristics_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.characteristics_headers
    ADD CONSTRAINT characteristics_headers_pkey PRIMARY KEY (id);


--
-- Name: characteristics_values characteristics_values_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.characteristics_values
    ADD CONSTRAINT characteristics_values_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: expert_product_characteristic expert_product_characteristic_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_product_characteristic
    ADD CONSTRAINT expert_product_characteristic_pkey PRIMARY KEY (id);


--
-- Name: expert_rates expert_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_rates
    ADD CONSTRAINT expert_rates_pkey PRIMARY KEY (id);


--
-- Name: experts experts_email_key; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.experts
    ADD CONSTRAINT experts_email_key UNIQUE (email);


--
-- Name: experts experts_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.experts
    ADD CONSTRAINT experts_pkey PRIMARY KEY (id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_rating star_ratings_rating_content_type_id_object_id_f170c88b_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_content_type_id_object_id_f170c88b_uniq UNIQUE (content_type_id, object_id);


--
-- Name: star_ratings_rating star_ratings_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_userrating star_ratings_userrating_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_pkey PRIMARY KEY (id);


--
-- Name: star_ratings_userrating star_ratings_userrating_user_id_rating_id_25ba0a69_uniq; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_user_id_rating_id_25ba0a69_uniq UNIQUE (user_id, rating_id);


--
-- Name: user_rates user_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.user_rates
    ADD CONSTRAINT user_rates_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: appellation_region_id_id_5b63ef38; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX appellation_region_id_id_5b63ef38 ON public.appellation USING btree (region_id_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: characteristics_values_c_header_id_id_ee3fa9b8; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX characteristics_values_c_header_id_id_ee3fa9b8 ON public.characteristics_values USING btree (c_header_id_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: expert_product_characteristic_c_header_id_id_56dd4411; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX expert_product_characteristic_c_header_id_id_56dd4411 ON public.expert_product_characteristic USING btree (c_header_id_id);


--
-- Name: expert_product_characteristic_expert_id_id_34b4337c; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX expert_product_characteristic_expert_id_id_34b4337c ON public.expert_product_characteristic USING btree (expert_id_id);


--
-- Name: expert_product_characteristic_product_id_id_64d4d7b9; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX expert_product_characteristic_product_id_id_64d4d7b9 ON public.expert_product_characteristic USING btree (product_id_id);


--
-- Name: expert_rates_expert_id_id_1c46703e; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX expert_rates_expert_id_id_1c46703e ON public.expert_rates USING btree (expert_id_id);


--
-- Name: expert_rates_product_id_id_2db455ca; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX expert_rates_product_id_id_2db455ca ON public.expert_rates USING btree (product_id_id);


--
-- Name: experts_email_ac334861_like; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX experts_email_ac334861_like ON public.experts USING btree (email text_pattern_ops);


--
-- Name: inventory_product_id_id_af27dd90; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX inventory_product_id_id_af27dd90 ON public.inventory USING btree (product_id_id);


--
-- Name: products_appellation_id_id_a4690f01; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX products_appellation_id_id_a4690f01 ON public.products USING btree (appellation_id_id);


--
-- Name: products_category_id_id_8e75a3a8; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX products_category_id_id_8e75a3a8 ON public.products USING btree (category_id_id);


--
-- Name: products_vendor_id_id_7aafd08a; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX products_vendor_id_id_7aafd08a ON public.products USING btree (vendor_id_id);


--
-- Name: regions_country_id_id_3404239a; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX regions_country_id_id_3404239a ON public.regions USING btree (country_id_id);


--
-- Name: star_ratings_rating_content_type_id_176abacc; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX star_ratings_rating_content_type_id_176abacc ON public.star_ratings_rating USING btree (content_type_id);


--
-- Name: star_ratings_userrating_rating_id_e7ac9370; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX star_ratings_userrating_rating_id_e7ac9370 ON public.star_ratings_userrating USING btree (rating_id);


--
-- Name: star_ratings_userrating_user_id_33d5d349; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX star_ratings_userrating_user_id_33d5d349 ON public.star_ratings_userrating USING btree (user_id);


--
-- Name: user_rates_product_id_id_bc52b757; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX user_rates_product_id_id_bc52b757 ON public.user_rates USING btree (product_id_id);


--
-- Name: user_rates_user_id_id_6253748b; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX user_rates_user_id_id_6253748b ON public.user_rates USING btree (user_id_id);


--
-- Name: users_email_0ea73cca_like; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX users_email_0ea73cca_like ON public.users USING btree (email text_pattern_ops);


--
-- Name: vendors_region_id_id_07cb83d9; Type: INDEX; Schema: public; Owner: hrsuser
--

CREATE INDEX vendors_region_id_id_07cb83d9 ON public.vendors USING btree (region_id_id);


--
-- Name: appellation appellation_region_id_id_5b63ef38_fk_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.appellation
    ADD CONSTRAINT appellation_region_id_id_5b63ef38_fk_regions_id FOREIGN KEY (region_id_id) REFERENCES public.regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: characteristics_values characteristics_valu_c_header_id_id_ee3fa9b8_fk_character; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.characteristics_values
    ADD CONSTRAINT characteristics_valu_c_header_id_id_ee3fa9b8_fk_character FOREIGN KEY (c_header_id_id) REFERENCES public.characteristics_headers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expert_product_characteristic expert_product_chara_c_header_id_id_56dd4411_fk_character; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_product_characteristic
    ADD CONSTRAINT expert_product_chara_c_header_id_id_56dd4411_fk_character FOREIGN KEY (c_header_id_id) REFERENCES public.characteristics_headers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expert_product_characteristic expert_product_chara_expert_id_id_34b4337c_fk_experts_i; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_product_characteristic
    ADD CONSTRAINT expert_product_chara_expert_id_id_34b4337c_fk_experts_i FOREIGN KEY (expert_id_id) REFERENCES public.experts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expert_product_characteristic expert_product_chara_product_id_id_64d4d7b9_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_product_characteristic
    ADD CONSTRAINT expert_product_chara_product_id_id_64d4d7b9_fk_products_ FOREIGN KEY (product_id_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expert_rates expert_rates_expert_id_id_1c46703e_fk_experts_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_rates
    ADD CONSTRAINT expert_rates_expert_id_id_1c46703e_fk_experts_id FOREIGN KEY (expert_id_id) REFERENCES public.experts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expert_rates expert_rates_product_id_id_2db455ca_fk_products_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.expert_rates
    ADD CONSTRAINT expert_rates_product_id_id_2db455ca_fk_products_id FOREIGN KEY (product_id_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory inventory_product_id_id_af27dd90_fk_products_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_product_id_id_af27dd90_fk_products_id FOREIGN KEY (product_id_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products products_appellation_id_id_a4690f01_fk_appellation_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_appellation_id_id_a4690f01_fk_appellation_id FOREIGN KEY (appellation_id_id) REFERENCES public.appellation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products products_category_id_id_8e75a3a8_fk_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_id_8e75a3a8_fk_categories_id FOREIGN KEY (category_id_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products products_vendor_id_id_7aafd08a_fk_vendors_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_vendor_id_id_7aafd08a_fk_vendors_id FOREIGN KEY (vendor_id_id) REFERENCES public.vendors(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: regions regions_country_id_id_3404239a_fk_countries_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_country_id_id_3404239a_fk_countries_id FOREIGN KEY (country_id_id) REFERENCES public.countries(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_rating star_ratings_rating_content_type_id_176abacc_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_rating
    ADD CONSTRAINT star_ratings_rating_content_type_id_176abacc_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_userrating star_ratings_userrat_rating_id_e7ac9370_fk_star_rati; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrat_rating_id_e7ac9370_fk_star_rati FOREIGN KEY (rating_id) REFERENCES public.star_ratings_rating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: star_ratings_userrating star_ratings_userrating_user_id_33d5d349_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.star_ratings_userrating
    ADD CONSTRAINT star_ratings_userrating_user_id_33d5d349_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_rates user_rates_product_id_id_bc52b757_fk_products_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.user_rates
    ADD CONSTRAINT user_rates_product_id_id_bc52b757_fk_products_id FOREIGN KEY (product_id_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_rates user_rates_user_id_id_6253748b_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.user_rates
    ADD CONSTRAINT user_rates_user_id_id_6253748b_fk_users_id FOREIGN KEY (user_id_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vendors vendors_region_id_id_07cb83d9_fk_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: hrsuser
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_region_id_id_07cb83d9_fk_regions_id FOREIGN KEY (region_id_id) REFERENCES public.regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

