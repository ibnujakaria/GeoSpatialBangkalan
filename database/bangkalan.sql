--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: atm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE atm (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    geom geometry(Point,4269)
);


ALTER TABLE atm OWNER TO postgres;

--
-- Name: atm_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atm_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE atm_gid_seq OWNER TO postgres;

--
-- Name: atm_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atm_gid_seq OWNED BY atm.gid;


--
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bank (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    jam_buka character varying(20),
    geom geometry(Point,4269),
    pictures character varying(1000)
);


ALTER TABLE bank OWNER TO postgres;

--
-- Name: bank_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bank_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bank_gid_seq OWNER TO postgres;

--
-- Name: bank_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bank_gid_seq OWNED BY bank.gid;


--
-- Name: gedung_olahraga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gedung_olahraga (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    kapasitas character varying(80),
    geom geometry(Point,4269),
    pictures character varying(1000)
);


ALTER TABLE gedung_olahraga OWNER TO postgres;

--
-- Name: gedung_olahraga_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gedung_olahraga_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gedung_olahraga_gid_seq OWNER TO postgres;

--
-- Name: gedung_olahraga_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gedung_olahraga_gid_seq OWNED BY gedung_olahraga.gid;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hotel (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    kapasitas character varying(80),
    geom geometry(Point,4269),
    pictures character varying
);


ALTER TABLE hotel OWNER TO postgres;

--
-- Name: hotel_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hotel_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_gid_seq OWNER TO postgres;

--
-- Name: hotel_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hotel_gid_seq OWNED BY hotel.gid;


--
-- Name: jalan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jalan (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    geom geometry(MultiLineString,4269),
    pictures character varying(1000)
);


ALTER TABLE jalan OWNER TO postgres;

--
-- Name: jalan_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jalan_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jalan_gid_seq OWNER TO postgres;

--
-- Name: jalan_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jalan_gid_seq OWNED BY jalan.gid;


--
-- Name: mall_dan_swalayan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mall_dan_swalayan (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    jam_buka character varying(80),
    geom geometry(Point,4269),
    pictures character varying(1000)
);


ALTER TABLE mall_dan_swalayan OWNER TO postgres;

--
-- Name: mall_dan_swalayan_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mall_dan_swalayan_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mall_dan_swalayan_gid_seq OWNER TO postgres;

--
-- Name: mall_dan_swalayan_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mall_dan_swalayan_gid_seq OWNED BY mall_dan_swalayan.gid;


--
-- Name: masjid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE masjid (
    gid integer NOT NULL,
    id numeric(10,0),
    namamasjid character varying(80),
    kapasitas character varying(80),
    geom geometry(Point,4269),
    pictures character varying(1000)
);


ALTER TABLE masjid OWNER TO postgres;

--
-- Name: masjid_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE masjid_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE masjid_gid_seq OWNER TO postgres;

--
-- Name: masjid_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE masjid_gid_seq OWNED BY masjid.gid;


--
-- Name: rumah_makan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rumah_makan (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    menu character varying(80),
    kapasitas character varying(80),
    geom geometry(Point,4269),
    pictures character varying(1000)
);


ALTER TABLE rumah_makan OWNER TO postgres;

--
-- Name: rumah_makan_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rumah_makan_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rumah_makan_gid_seq OWNER TO postgres;

--
-- Name: rumah_makan_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rumah_makan_gid_seq OWNED BY rumah_makan.gid;


--
-- Name: sekolahan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sekolahan (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    kapasitas character varying(80),
    geom geometry(Point,4269),
    pictures character varying
);


ALTER TABLE sekolahan OWNER TO postgres;

--
-- Name: sekolahan_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sekolahan_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sekolahan_gid_seq OWNER TO postgres;

--
-- Name: sekolahan_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sekolahan_gid_seq OWNED BY sekolahan.gid;


--
-- Name: tempat_wisata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tempat_wisata (
    gid integer NOT NULL,
    id numeric(10,0),
    nama character varying(80),
    tiket character varying(80),
    jam_buka character varying(80),
    geom geometry(Point,4269),
    pictures character varying(1000)
);


ALTER TABLE tempat_wisata OWNER TO postgres;

--
-- Name: tempat_wisata_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tempat_wisata_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempat_wisata_gid_seq OWNER TO postgres;

--
-- Name: tempat_wisata_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tempat_wisata_gid_seq OWNED BY tempat_wisata.gid;


--
-- Name: atm gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atm ALTER COLUMN gid SET DEFAULT nextval('atm_gid_seq'::regclass);


--
-- Name: bank gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank ALTER COLUMN gid SET DEFAULT nextval('bank_gid_seq'::regclass);


--
-- Name: gedung_olahraga gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gedung_olahraga ALTER COLUMN gid SET DEFAULT nextval('gedung_olahraga_gid_seq'::regclass);


--
-- Name: hotel gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hotel ALTER COLUMN gid SET DEFAULT nextval('hotel_gid_seq'::regclass);


--
-- Name: jalan gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jalan ALTER COLUMN gid SET DEFAULT nextval('jalan_gid_seq'::regclass);


--
-- Name: mall_dan_swalayan gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mall_dan_swalayan ALTER COLUMN gid SET DEFAULT nextval('mall_dan_swalayan_gid_seq'::regclass);


--
-- Name: masjid gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY masjid ALTER COLUMN gid SET DEFAULT nextval('masjid_gid_seq'::regclass);


--
-- Name: rumah_makan gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rumah_makan ALTER COLUMN gid SET DEFAULT nextval('rumah_makan_gid_seq'::regclass);


--
-- Name: sekolahan gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sekolahan ALTER COLUMN gid SET DEFAULT nextval('sekolahan_gid_seq'::regclass);


--
-- Name: tempat_wisata gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tempat_wisata ALTER COLUMN gid SET DEFAULT nextval('tempat_wisata_gid_seq'::regclass);


--
-- Data for Name: atm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY atm (gid, id, nama, geom) FROM stdin;
1	1	ATM BTN Telang	0101000020AD100000C1CBEA47092E5C40C5DEC3F540801CC0
2	2	ATM Bank BNI Kamal	0101000020AD10000090381BA4E62D5C40C784FD7A639F1CC0
3	3	ATM Bank BCA Kamal	0101000020AD10000086CA0F78E72D5C40F409DA251FA01CC0
4	4	ATM Bank BRI Kamal	0101000020AD1000002BBF7F72042E5C404235E6F0CAA31CC0
5	5	ATM BNI Toko AKA	0101000020AD1000002544914C072E5C403B8A906921A51CC0
6	7	ATM Bank BTN Bangkalan	0101000020AD100000F2972C11582F5C403E4DCD3740291CC0
7	6	ATM Bank BCA Swalayan	0101000020AD1000003F802E708B2F5C408E54529E09221CC0
8	8	ATM BTN Bangkalan	0101000020AD100000EA2DFE98B42F5C408C107D1D69211CC0
9	9	ATM Bank Syariah Mandiri	0101000020AD100000B8DCB103B52F5C40CC8D9B332F211CC0
10	10	ATM BCA Nusa Indah	0101000020AD1000002C30C512AA2F5C404026322153201CC0
11	11	ATM BNI	0101000020AD100000D0D423ADE52F5C40636E8D66A91D1CC0
12	12	ATM BCA	0101000020AD100000B1DCAFEF42305C408302860CF91A1CC0
13	13	ATM BTN	0101000020AD100000C1C2EBDE39305C402FDC4B31E51A1CC0
14	14	ATM BCA Indomaret	0101000020AD100000CC3E4F075E305C40FA3AE2A0751C1CC0
\.


--
-- Name: atm_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atm_gid_seq', 14, true);


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bank (gid, id, nama, jam_buka, geom, pictures) FROM stdin;
6	6	Bank BRI Bangkalan	09.00-16.00	0101000020AD1000007398CF52432F5C4084D9AE49682B1CC0	http://cdn1-a.production.liputan6.static6.com/medias/669391/big/Bank+BRI.jpg
8	8	Bank BRI cab. Bangkalan	08.00-16.00	0101000020AD10000010C890BF052E5C402B9D98CFCBA31CC0	http://www.panggon.com/wp-content/uploads/2014/05/Bank-BRI-Unit-Menganti-Cilacap.jpg
7	7	Bank BCA Bangkalan	08.00-15.00	0101000020AD100000066E25C031305C40232CBB97DB1A1CC0	http://2.bp.blogspot.com/-GhkSWexWRqM/VYQT7cuKNEI/AAAAAAAABLU/Y1bGMIp8o3g/s1600/alamat%2Bbank%2Bbca.jpg
5	5	Bank Mandiri Bangkalan	08.00-15.00	0101000020AD1000004ED5A3453D2F5C400DC1D736A62B1CC0	http://cdn1-a.production.liputan6.static6.com/medias/929579/big/091601700_1436946439-FOTO_LIPUTAN6.jpg
4	4	Bank BNI Bangkalan	08.00-16.00	0101000020AD100000DEEEF70BE12E5C402C67E141BC341CC0	http://cdn-kisikisi.jobs.id/assets/images/company/53312d02582635886f8b45e6/bank_negara_indonesia_persero_tbk_pt_main_kantorpusat1.jpg
3	3	Bank CIMB Niaga	08.00-16.00	0101000020AD10000048EE7A3B112E5C404508EE911AA61CC0	http://img1.beritasatu.com/data/media/images/medium/1366181507.jpg
2	2	Bank BTN KCP Kama	09.00-16.00	0101000020AD1000007C26B712092E5C4045FCC70A3F801CC0	https://iqbalrois.files.wordpress.com/2012/09/bank-btn-syariah.jpg
1	1	Bank BTN cab. Bangkalan	08.00-16.00	0101000020AD10000064646860552F5C404210122B34291CC0	http://iradiofm.com/wp-content/uploads/2014/06/images_2014_daerah_berita126-_4_-_bank_BTN.jpg
\.


--
-- Name: bank_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bank_gid_seq', 8, true);


--
-- Data for Name: gedung_olahraga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gedung_olahraga (gid, id, nama, kapasitas, geom, pictures) FROM stdin;
1	1	Stadion Gelora Bangkalan	10000	0101000020AD100000FAE2A1E4532F5C40C81417A96C2C1CC0	http://3.bp.blogspot.com/-eoQeoihggz8/Uv-ou3X9H0I/AAAAAAAAIYI/GASf9MUgRWA/s1600/gelora+bangkalan+stadium.jpg
2	2	Gedung Olahraga Sultan Abdul Kadirun	300	0101000020AD10000095E57F132E2F5C40C4F2A5AE74321CC0	http://static.panoramio.com/photos/medium/65528341.jpg
\.


--
-- Name: gedung_olahraga_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gedung_olahraga_gid_seq', 2, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hotel (gid, id, nama, kapasitas, geom, pictures) FROM stdin;
1	1	Hotel Ningrat	50	0101000020AD100000A247F2F87F2F5C40287BCBA831261CC0	https://perahukayu.files.wordpress.com/2012/09/sany05421.jpg
\.


--
-- Name: hotel_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hotel_gid_seq', 1, true);


--
-- Data for Name: jalan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jalan (gid, id, nama, geom, pictures) FROM stdin;
1	1	Jl. Raya Kamal	0105000020AD1000000100000001020000000500000012BBD8413A2E5C406342C55443B01CC0134DE35B322E5C400BDE44BD49AD1CC01259EA172D2E5C4019CAE172EDAB1CC012EBF431252E5C40CC794B0F1DAA1CC010D91F5F1A2E5C400301494C10A81CC0	http://sebandung.com/wp-content/uploads/2014/10/Perempatan-Jalan-Supratman-Bandung.png
2	2	Jl. Kusuma Bangsa	0105000020AD1000000100000001020000000300000048ADED8F062E5C4046477D53AEA41CC010BFF00E132E5C40E9F5FADDCFA61CC010D91F5F1A2E5C400301494C10A81CC0	http://static.panoramio.com/photos/original/40612723.jpg
3	3	Jl. Trunojoyo	0105000020AD1000000100000001020000000A000000BD49E174A52D5C409B4790ED24881CC053C1F3EAA62D5C40B9260D59608A1CC010EAFB60AB2D5C4046103B4F04901CC0D7C5B092B12D5C40ADE9EE20BA951CC05EDE4319B62D5C40F58CEF0C61971CC0510568C9C12D5C4068E29B5FFE981CC04BAF9378CB2D5C4074E57C00B49A1CC0863E9BCAD72D5C40D0D94291579C1CC0C19B209CE62D5C407E7BEC280B9F1CC048ADED8F062E5C4046477D53AEA41CC0	http://gambar-rumah.com/attachments/surabaya/5637550d1463736513-ruko-dijual-jalan-veteran-perempatan-veteran-kebon-rojo-pahlawan-veteran.jpg
24	27	Jl. Sembilangan	0105000020AD100000010000000102000000120000003C2C63A34F2B5C40C1E33D2EC1391CC03C2C63A34F2B5C40FED52723B1361CC0EC2A5D9C5A2B5C40A11DC5D3C8351CC0B35548B2592B5C401348A834F8331CC0942BE01F552B5C40C6961C81ED311CC0CD00F509562B5C4098F6203105311CC097AA9B5A5D2B5C400971F7C2C52F1CC0A0A812D06D2B5C407B4479BB3D2E1CC050A70CC9782B5C4089CE5822F52D1CC02C4DA104A12B5C4008F0A15EA32E1CC039CAD3B4B92B5C408F3091CF772E1CC0319AD082E62B5C406696267F8F2D1CC09A953BEA0C2C5C40AA33829F7B2C1CC01E3C53A92F2C5C40EA70E3D3A12B1CC02E384194502C5C408C0326F2F82B1CC042B3EAB9792C5C40044710E8DB2B1CC0572E94DFA22C5C4001C45E1C022B1CC06BA93D05CC2C5C40FC58BEDF532A1CC0	https://kusnantokarasan2014.files.wordpress.com/2014/11/dsc03746.jpg
4	4	Jl. kamal Kalianget	0105000020AD1000000100000001020000001C000000BD49E174A52D5C409B4790ED24881CC07652D249A32D5C40B0421EE1E2841CC07652D249A32D5C4073DA2393E2821CC05F3DB6C5A32D5C4050FD9C743A811CC0118BB466A32D5C4002E87E8E2B801CC04426AE9CA22D5C40E7C4F9D9DC7E1CC061227CCDA12D5C40E1332E374D7C1CC047355527A02D5C40F9C5737E9D791CC06BDB0E919E2D5C40B541531D8F771CC0E0D3BE8D9D2D5C405CF49E6A28751CC0333474369D2D5C40B642758485731CC068A538709D2D5C405EA0DBBE34721CC06DDB0E919E2D5C4038105EB1A1701CC0420CCDB9A12D5C406C0DFFF0CF6E1CC04627384AA22D5C402FB766B8356D1CC04AC55130A22D5C405437FF1F846C1CC079B03DA59D2D5C405F8EAF7E7C6A1CC0A42A6312992D5C4094819E88B3641CC015098E8F932D5C4064D0E63B85611CC0C6728D17932D5C40C39A8FEECB601CC0FE192872942D5C40D615358DCD5F1CC043991B509A2D5C40858667240F5C1CC0E8FAF2499B2D5C40E1EDE191D65A1CC0F7168FDDA02D5C40F8173A21B7571CC074A89854A52D5C40BE7DF2914B541CC0739D6833E12D5C40E39F4A547B4E1CC0E7C2AEA04F2E5C4002E616A6A6431CC09D30DADF7F2E5C40A2F59224E13E1CC0	http://www.idjakarta.com/selatan/kebayoranbaru/kramatpela/kodepos12130/jalanbulungan-kebayoranbaru-jakartaselatan17.jpg
5	5	Jl. Soekarno Hatta	0105000020AD100000010000000102000000060000009D30DADF7F2E5C40A2F59224E13E1CC04F0B33DBC52E5C402B19D8E104381CC032B6FEDFE82E5C40D85D4D0B96341CC0EA2216C9F12E5C405FBC406CB6331CC0FD1BA8AB262F5C401CAE8331872E1CC0EE118B5D392F5C4005CF9E03B22C1CC0	http://www.idjakarta.com/selatan/kebayoranbaru/kramatpela/kodepos12130/jalanbulungan-kebayoranbaru-jakartaselatan15.jpg
23	26	Jl. Maritim	0105000020AD1000000100000001020000000A000000501BBDF9412D5C4086AC7C1FF05D1CC013AAC088C62C5C401117067330571CC0BB8D17C04E2C5C40F677BFC98D501CC01FED9AA0FA2B5C4039BF8CBDD84B1CC0A6F5414EB32B5C408E345F63C3471CC0C7D0F1D7822B5C40C41F75F6FB441CC036FC5F717C2B5C40E3D6E6D294411CC0F0A918D7622B5C40193A56C1673E1CC07501788D502B5C40095360AE3A3B1CC03C2C63A34F2B5C40C1E33D2EC1391CC0	http://berita.suaramerdeka.com/konten/uploads/2016/04/4dflyover_G2.sal_.jpg
6	6	Jl. Raya Teuku Umar	0105000020AD10000001000000010200000002000000EE118B5D392F5C4005CF9E03B22C1CC0EC5B62806A2F5C40D6784EF8D1271CC0	http://tangseloke.com/wp-content/uploads/2012/10/perbaikan_jalan_05.jpg
7	7	Jl. Kh. Moch Kholil	0105000020AD10000001000000010200000002000000EC5B62806A2F5C40D6784EF8D1271CC0EE207C1CD52F5C4018EF745F681D1CC0	http://www.depoknews.id/wp-content/uploads/2015/04/jalan-raya-bogor-yadi.jpg
8	8	Jl. Panglima Sudirman	0105000020AD10000001000000010200000006000000EE207C1CD52F5C4018EF745F681D1CC08860B08BD62F5C404ECA844A411D1CC0E36DB120EF2F5C40D37A3285A31A1CC035925B02FB2F5C40B97FD593B6191CC0A1BAEBBB0E305C4053E5B0ECD8191CC0202B2A1D50305C40577F7428FE1B1CC0	http://gambar-rumah.com/attachments/bali/72586d1331261351-tanah-13-6-pinggir-jalan-raya-batu-bolong-canggu-13-batu-bolong.jpg
10	10	Jl. Mayjen Sungkono	0105000020AD10000001000000010200000004000000B0CEEB9300305C40423AC730AD1E1CC05A95496904305C4079F2011F881E1CC0151FDA2928305C4061094D397B1F1CC0044BFD9834305C405BE9A829911F1CC0	https://id1-cdn.pgimgs.com/listing/9723215/UPHO.45571028.V800/Tanah-dekat-jalan-raya-desa-tukadmungga-singaraja-Buleleng-Indonesia.jpg
9	9	Jl. Jend. A. Yani	0105000020AD10000001000000010200000002000000EE207C1CD52F5C4018EF745F681D1CC0B0CEEB9300305C40423AC730AD1E1CC0	https://media-cdn.tripadvisor.com/media/photo-s/0b/6c/2f/ee/jalan-raya-seberang-hotel.jpg
11	11	Jl. Jokotole	0105000020AD10000001000000010200000004000000202B2A1D50305C40577F7428FE1B1CC002213A1244305C40627B1B4D681D1CC0BBA6A93A3B305C402959C32E421F1CC0074BFD9834305C406AE9A829911F1CC0	https://img.okezone.com/content/2016/07/11/338/1435192/hari-pertama-kerja-jalan-raya-bkt-dan-kalimalang-lancar-8gmQlLLw8H.jpg
13	15	Jl. Halim Perdana Kusuma	0105000020AD10000001000000010200000009000000EA2216C9F12E5C405FBC406CB6331CC01B99AFD22D2F5C40E30CEC3005331CC06F9343346E2F5C40BA53995A12331CC00EF35CADD12F5C400C4FFA2A54331CC03671AD5512305C40D21D1A1B6A331CC08FD371079C305C40A0930E8C4F2E1CC0991CF04AB8305C406A149FCDFF2A1CC08918DE37BC305C400F8BC9932D261CC006980781BB305C407FEC350113201CC0	https://cdn.pixabay.com/photo/2014/02/06/21/41/road-260476_960_720.jpg
15	17	Jl. Mertajasah	0105000020AD1000000100000001020000000C000000BA6409F8AB2E5C40C1A095CCD3291CC04B7CCA638E2E5C40D2952A368F291CC0202A4A317F2E5C400125F02B56291CC064B9E5C86D2E5C4098B565B3B6291CC0CD8549CC602E5C4040E7D2C7282A1CC0EB42BBB4522E5C40CB34FA78962A1CC0530F1FB8452E5C406919A3D6E92A1CC069227796342E5C4053A4598D082B1CC0E31FF332202E5C40A73BF541F22A1CC054B7177E112E5C400347958BE12A1CC00F534D52012E5C4090ADDD56472B1CC0F55B86E0EA2D5C403867FA97DC2B1CC0	https://4.bp.blogspot.com/-McDxWqrjCso/VpY7hKL2uxI/AAAAAAAAO_w/9jdavuONDZw/s1600/pengaspalan%2Bjalan%2Braya%2Bpancing%2Bcikarang%2Btimur.jpg
16	18	Jl. Anggrek	0105000020AD10000001000000010200000007000000FA18523BAC2E5C40CBE523DDC3291CC039E9C808B22E5C40E2CB6D7F70291CC022D6702AC32E5C40C05EEB13AE261CC0F8DA637FCC2E5C404C1D9F1B74251CC0C5345D3FDC2E5C40F169E179F0241CC01FD8F7B1F52E5C40E989FDE2D4231CC0E31CBF12092F5C406E88A8F0F5221CC0	https://id1-cdn.pgimgs.com/listing/9859727/UPHO.46353488.V800/Tanah-225-Ha-Hektar-SHM-Jalan-Raya-Kresek-Balaraja-150-Ribu-Tangerang-Indonesia.jpg
17	19	Jl. K.H. Hasyim Asyari	0105000020AD100000010000000102000000040000008860B08BD62F5C404ECA844A411D1CC094E7D055BE2F5C40CADCE33CA71C1CC0241BC04BA62F5C401E0C799FD41B1CC03BC3796D8D2F5C40AF5FF601021B1CC0	http://cdn2.tstatic.net/wartakota/foto/bank/images/20150107-jalan-raya-tajur-bogor-ramai-lancar.jpg
19	21	Jl. K.H. Zainal Alim	0105000020AD10000001000000010200000007000000E61CBF12092F5C406E88A8F0F5221CC070E71C3B2A2F5C40C96FD2B6AC241CC011C5D2413A2F5C4089AB762972251CC080B2B82B3D2F5C40A945285494251CC0713DB0374C2F5C406871CAC544261CC01AC57F485F2F5C4000FB0D7C3A271CC0EC5B62806A2F5C40D6784EF8D1271CC0	https://massayur.files.wordpress.com/2012/10/100_32591.jpg
20	12	Jl. Raya Tunjung	0105000020AD10000001000000010200000006000000515E83AEC3315C403A2E2013312C1CC0903F5F3A28325C40E0C8C78BB82E1CC001D83D6341325C40B537054EAF2F1CC047B88D9B43325C4038CF2110A6301CC0692A3FB529325C40FF626D183D351CC0DC699F4425325C40F564685AA9361CC0	https://upload.wikimedia.org/wikipedia/commons/8/80/Kawasan_Jalan_Raya_Sindangwangi,_Kecamatan_Sindangwangi,_Kabupaten_Majalengka_(4).jpg
22	24	Jl. Raya Telang	0105000020AD1000000100000001020000000B000000118BB466A32D5C4002E87E8E2B801CC010CE31FEDF2D5C409586AC9642801CC066D196B2092E5C40E27CE3735C801CC02B78FA3B2C2E5C4046C55FCC66801CC096D999EA562E5C40CF3896A980801CC0D4B7CDEF722E5C40F64ECC869A801CC0B58946658A2E5C40F0606C1EE8801CC0DF094070A52E5C40839BB7EB59811CC004C342C6B32E5C40EDA0EAC873811CC04D6E51BDC32E5C4057B23C934F811CC01BE501D7CD2E5C40BA5565217E811CC0	https://jalankemanagitu.files.wordpress.com/2009/06/jalan1.jpg
25	28	Jl. Raya Kramat	0105000020AD1000000100000001020000000B0000006BA93D05CC2C5C40FC58BEDF532A1CC0F3CE10FFF62C5C40DE2A2CADC2291CC05BCA7B661D2D5C405738DAE9702A1CC0521BBDF9412D5C40741C2B08C82A1CC078439C01572D5C40C9E91D83B92A1CC0E03E07697D2D5C404BE977261F2B1CC064E51E28A02D5C408C0326F2F82B1CC06CE3959DB02D5C40AA33829F7B2C1CC0978A30E0CD2D5C40C069781A6D2C1CC0BDB20FE8E22D5C408C0326F2F82B1CC0F55B86E0EA2D5C403867FA97DC2B1CC0	http://3.bp.blogspot.com/-oixUjC6cZM4/UeUBDWIROUI/AAAAAAAAAEo/cG6HpaDBKBg/s1600/arti-garis-putih-pada-jalan-raya.gif
27	30	Jl. Nusa Indah	0105000020AD10000001000000010200000009000000FD1BA8AB262F5C401CAE8331872E1CC0AAB795CD122F5C40464294F4AE2D1CC0E5E0876EFC2E5C40A437E8F8B42C1CC080EA1D13F22E5C407E9E51EE092C1CC022155D3BE52E5C40647063F08C2B1CC0C54A7F8FD72E5C407AC1BCAE232B1CC06980A1E3C92E5C40C9EFE50F722A1CC0F952C8ACC32E5C40AB729D1E232A1CC0F952C8ACC32E5C40C699512DD4291CC0	http://static.panoramio.com/photos/large/21454181.jpg
28	31	Jl. Sidangkap	0105000020AD1000000100000001020000000800000039E9C808B22E5C40E2CB6D7F70291CC0F952C8ACC32E5C40C699512DD4291CC05E493208CE2E5C402E1DFE70C0291CC03162926EDF2E5C4049E7904CB9281CC0E7EB6A9AFB2E5C40ABEACD34E0271CC02727C10B142F5C40D2915938E6261CC05815E249322F5C40F18EC33BEC251CC080B2B82B3D2F5C40A945285494251CC0	http://gambar-rumah.com/attachments/bali/3898191d1447729233-tanah-di-jual-jalan-raya-kuta-1-425-m2-img20151007093447.jpg
12	13	Jl. Pemuda Kaffa	0105000020AD1000000100000001020000000D000000202B2A1D50305C40577F7428FE1B1CC0194B57A67E305C40DF7F81422F1D1CC062B0DCBDA1305C4062B536E0D81E1CC008980781BB305C408EEC350113201CC058329329D0305C408D7A24E60E211CC098EDFE36F0305C4045CE65EB44231CC052B654250F315C40B59ABB6A83251CC0FBCCD31325315C40BCAFB4AAE9261CC01B7841533F315C4072E9832B21281CC01E4B1CCF5E315C40F736706305291CC07EB60CA684315C401C9A6CC1492A1CC03B02B6B4A1315C4046DCCBA5792B1CC0515E83AEC3315C403A2E2013312C1CC0	http://bulletinmetropolis.com/home/wp-content/uploads/2011/07/Anak-bermain-layangan-di-jalan-raya.-Bisa-membahayakan-keselamatan.jpg
14	16	Jl. R. E. Martadinata	0105000020AD1000000100000001020000000A00000032B6FEDFE82E5C40D85D4D0B96341CC0365467C5B92E5C4004E76FEDD4321CC042284456AD2E5C406E9E47689D311CC07239E952A52E5C40959C868F4B301CC0AAF4A759A02E5C402AAB66A2872E1CC074CE4A969D2E5C40A87E203C242D1CC09061F9F79E2E5C4077894119F12B1CC0F16E3831A92E5C409BB980257C2A1CC0BA6409F8AB2E5C40C1A095CCD3291CC0FA18523BAC2E5C40CBE523DDC3291CC0	https://id2-cdn.pgimgs.com/listing/10555469/UPHO.50404169.V800/Tanah-luas-pinggir-jalan-raya-puspitek-serpong-Tangerang-Selatan-Indonesia.jpg
18	20	Jl. K.H. Moh. Toha	0105000020AD1000000100000001020000000B0000003BC3796D8D2F5C40AF5FF601021B1CC03FED3CF47D2F5C400C6C50C9E11B1CC06754C8E6722F5C4038936D08611C1CC020DA370F6A2F5C405D59100EE91C1CC0E39E22855C2F5C4083E71D8CE71D1CC078E7C9414F2F5C408C09A8D59F1E1CC0186FEC4B3D2F5C409106BFB6A21F1CC0AEB79308302F5C409A4762635F201CC04BAA54CF252F5C4098FC367320211CC085FA7419192F5C406AA8E4C611221CC0E61CBF12092F5C406E88A8F0F5221CC0	http://static.panoramio.com/photos/original/58350998.jpg
21	13	Jl. Raya Burneh	0105000020AD1000000100000001020000000C000000DC699F4425325C40F564685AA9361CC0BDA1C467E6325C40FC42699F1F3C1CC0923EA11523335C4056FD18E0BA3D1CC00C76DBAE8A335C40E73A6660F1401CC0F0A69800BD335C40709713A05D421CC02D967600E2335C4038D9B25F54431CC01D5B14F609345C40466A4C1F1C441CC05160E88EE0345C402011939C81471CC08B562E6094355C40396C75D8C34A1CC022B216461D365C40A0C3F552FA4D1CC08DAEEED4AC365C40A024420B83511CC07BCC0A64F2365C40E35CBD8885521CC0	http://2.bp.blogspot.com/-dhYELEJxDDc/VQr7qMCcvwI/AAAAAAAAIpM/NNwUr7QR6Ec/s1600/Rumah%2BPinggir%2BJalan%2BRaya.jpg
26	29	Jl. Kini Balu	0105000020AD10000001000000010200000012000000F55B86E0EA2D5C403867FA97DC2B1CC02D3C4ADAF62D5C40AC54BF94802D1CC0C93908490E2E5C409CC52824A12E1CC0798B8AEF202E5C40C67EC703392F1CC0FB4EC9953E2E5C40F9199DC3752F1CC0D004ADA0482E5C409CB77083B22F1CC0AFE47247502E5C40BD574243EF2F1CC099EE1A8A552E5C400E5B90E2C3301CC0974C8704562E5C4041321EF937321CC0974C8704562E5C402174AFB09A321CC06EA4FE945F2E5C40C76F0D6023331CC05D946168632E5C4005984D3FBB331CC0EC2316307E2E5C40C7B2B365E3341CC0B0C95C0E8C2E5C40C2387004B8351CC0958FDD45922E5C408B5714A38C361CC035D1C2BFA82E5C40FEE2F1B133371CC0CE2CEDA8C02E5C404AD7A3F0E9371CC04F0B33DBC52E5C402B19D8E104381CC0	http://merdeka-online.com/home/wp-content/uploads/2014/01/lebuhraya.jpg
\.


--
-- Name: jalan_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jalan_gid_seq', 28, true);


--
-- Data for Name: mall_dan_swalayan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mall_dan_swalayan (gid, id, nama, jam_buka, geom, pictures) FROM stdin;
1	1	Bangkalan Plaza	09.00-21.00	0101000020AD10000000A0F9AE932F5C40BE017931C9331CC0	http://static.panoramio.com/photos/large/76399821.jpg
2	2	Hypermart Bangkalan	08.00-21.00	0101000020AD100000BE38A167822F5C40FB8044C5E8311CC0	http://www.kabarbisnis.com/images/picture/201510/2243-Hypermart2.jpg
3	3	Alfamart Kamal	00.00-00.00	0101000020AD100000452D4A55E22D5C40328519A49C9E1CC0	http://fakta.co.id/wp-content/uploads/2015/11/67623033.jpg
4	4	Indomaret	00.00-00.00	0101000020AD100000EEC3D23E3C2F5C40B25CC649CE251CC0	http://www.hemat.id/artikel/wp-content/uploads/2016/09/Indomart.jpg
5	5	Matahari	09.00-21.00	0101000020AD1000005C178F92A72F5C409BC316DB16221CC0	https://media-cdn.tripadvisor.com/media/photo-s/06/ad/b5/1f/kuta-square.jpg
\.


--
-- Name: mall_dan_swalayan_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mall_dan_swalayan_gid_seq', 5, true);


--
-- Data for Name: masjid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY masjid (gid, id, namamasjid, kapasitas, geom, pictures) FROM stdin;
1	1	Masjid Agung	1000	0101000020AD10000038958D50CB2F5C405AAC5E9FE21D1CC0	https://liandamarta.files.wordpress.com/2013/12/dsc01248.jpg
2	2	Masjid Syaichona Moh. Cholil	500	0101000020AD100000EE3A5A57612E5C40BDC0B97F2B4C1CC0	https://images.detik.com/content/2013/11/28/1520/160537_masjid1.jpg?w=455&q=90
3	3	Masjid Al Arqom	100	0101000020AD100000D785E1F3E62D5C402A5E7F7A3A8A1CC0	http://www.hidayatullah.com/files/bfi_thumb/masjid-jumah-moskow-2zy5uh7c1cdl5p612q20ao.jpg
4	4	Masjid Jami’ Arrohmah	100	0101000020AD10000074763597022C5C40C7266EFD252C1CC0	https://i.ytimg.com/vi/icHNInwm-jY/maxresdefault.jpg
5	5	Masjid Imam Syafi’i	150	0101000020AD1000000A1BBAA96A2E5C404DFBB36838311CC0	http://tango.image-static.hipwee.com/wp-content/uploads/2016/06/hipwee-Masjid-Cheng-Ho-papasemar.com--750x503.jpg
6	6	Masjid Al Kautsar	150	0101000020AD1000000FF4FF70F22D5C405129F769FB9F1CC0	http://bimasislam.kemenag.go.id/uploads/post/f39ae9ff3a81f499230c4126e01f421b-masjid-raya-dan-masjid-agung-apa-bedanya.jpg
7	7	Masjid Syaichona Moh. Cholil	700	0101000020AD100000774CE7234A2E5C408E21D1E0222B1CC0	http://4.bp.blogspot.com/-BBguTycOWsY/UYJfUee3wOI/AAAAAAAAA3A/DmKIHcvEUPg/s1600/Masjid+Raya+Baiturrahman+Banda+Aceh.jpg
8	8	Masjid Nurul Hidayah	100	0101000020AD100000CA5F1054A22D5C40F3597D5D6D881CC0	https://uberflip.cdntwrk.com/files/aHViPTQ0ODg0JmNtZD1pdGVtZWRpdG9yaW1hZ2UmZmlsZW5hbWU9aXRlbWVkaXRvcmltYWdlXzU1OTNhNjQzNmZhZTMuanBnJnZlcnNpb249MDAwMCZzaWc9ZTBlMzVmMzViZDA5ZmRhZjIyZTBiOTQ4NzYwYTMyZDM%253D
9	9	Masjid Darus Salam	100	0101000020AD100000CC2B9120972D5C40DE18D62621881CC0	http://simas.kemenag.go.id/public/upload/images/masjid-al-markaz-al-islami-kab-maros-depan.jpg
\.


--
-- Name: masjid_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('masjid_gid_seq', 9, true);


--
-- Data for Name: rumah_makan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rumah_makan (gid, id, nama, menu, kapasitas, geom, pictures) FROM stdin;
1	6	Rumah Makan Budi Luhur	Makanan Khas Nasi Campur	30	0101000020AD1000006E37CDA807305C40873A719BDF191CC0	http://bali.panduanwisata.id/files/2011/12/rumah-makan-bidadari3.jpg
2	1	Bebek Sinjay	menjual bebek goreng	50	0101000020AD1000008CC0DBD029315C40275A7779FD261CC0	http://www.niaga.tv/wp-content/uploads/2016/01/Kiat-Sukses-Memulai-Bisnis-Rumah-Makan-niagatv.jpg
3	2	Tera Bulan	Makanan Khas Madura	60	0101000020AD10000099226D7F8D315C40BAC00EFC8B2A1CC0	http://sebandung.com/wp-content/uploads/2014/06/Rumah-Makan-Grafika-Bandung.png
4	3	Suramadu Resto & Cafe	Makanan sehari-hari	30	0101000020AD10000008DE086CC8325C40D94FC761F23B1CC0	http://gambar-rumah.com/attachments/jakarta-pusat/408312d1365410085-dikontrakan-rumah-makan-lokasi-strategis-depan-hero-dan-hotel-img-20130105-01098.jpg
5	5	Rumah Makan Barokah Suramadu	Nasi Pecel dan Campur	20	0101000020AD100000FBB44A12B3335C406838DF26CD411CC0	http://dolandolen.com/wp-content/uploads/2015/11/Rumah-Makan-Inggil-Cover.jpg
6	7	Rumah Makan Bambu	Nasi pecel, Nasi Campur dan Lain-lain	20	0101000020AD100000805830A6A02D5C4064A9CCCC757F1CC0	https://saribahari.files.wordpress.com/2010/12/17-restaurant-hall.jpg
7	8	Kuliner Khas Sewel Socah	Aneka Macam Sewel	50	0101000020AD10000022F5667C1C2D5C40025D603B475E1CC0	http://indoturs.com/wp-content/uploads/2013/10/Rumah-Makan-Inggil-2.jpg
8	9	Nadia Rumah Makan	Nasi Padang	50	0101000020AD100000C14BC2F9462E5C40DF6DD446302A1CC0	http://1.bp.blogspot.com/-tQWCkdZ58gQ/VQmtgdX_jEI/AAAAAAAASb8/Krmr8oAyD4g/s1600/SAM_1772.jpg
9	10	Warung Madu Rasa	Nasi Pecel	30	0101000020AD1000006A8D259BA02D5C40BE4E4383BB801CC0	http://2.bp.blogspot.com/-GkJOaBgiXtQ/VnXtuTpIc5I/AAAAAAAAGJM/6K-B_PP5vAg/s1600/Ruang%2BMakan%2Bberatap%2Brumbia%2Bdengan%2Btiang%2Bpenyangga%2Bbatang%2Bkelapa.jpg
10	11	Rumah Makan Santai	Nasi Campur	20	0101000020AD100000C18F5BB99F2D5C4052FBE0C1067F1CC0	http://cdn2.tstatic.net/kaltim/foto/bank/images/banjir-rumah-makan-sepi_20150427_031423.jpg
11	12	Depot Marysini	Nasi Pecel dan Campur	20	0101000020AD10000054A4D69BEB2D5C409962E6C835A01CC0	http://arsindociptakarya.com/wp-content/uploads/2014/02/drm.jpg
\.


--
-- Name: rumah_makan_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rumah_makan_gid_seq', 11, true);


--
-- Data for Name: sekolahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sekolahan (gid, id, nama, kapasitas, geom, pictures) FROM stdin;
1	2	SMKN 1 Bangkalan	350	0101000020AD100000E5EF2BAFB92E5C40438359F933271CC0	http://foto2.data.kemdikbud.go.id/getImage/20531224/3.jpg
2	3	SMKN 3 Bangkalan	250	0101000020AD100000C67C6844022E5C405FDDFFA9F52A1CC0	http://static.panoramio.com/photos/large/75648503.jpg
3	4	SMAN 3 Bangkalan	300	0101000020AD1000003C8DDA8BC82E5C4093A019108E311CC0	http://foto2.data.kemdikbud.go.id/getImage/20531227/3.jpg
4	5	SMAN 2 Bangkalan	350	0101000020AD10000090491B120E2F5C405DE0DBA41C301CC0	http://2.bp.blogspot.com/-cyyeuhQtOAY/Ub1W4HOL2gI/AAAAAAAADHs/N286K_LyhPI/s1600/SAM_0919.JPG
5	6	MAN Bangkalan	250	0101000020AD100000BAAC6B4E412F5C4044FDB51A5E2D1CC0	http://1.bp.blogspot.com/-jHElRbaqxjI/TtElSDnF_jI/AAAAAAAAAJY/CeVNROS19Ug/s1600/Gerbang+MAN+Bangkalan+-+alumni-manbkl.blogspot.jpg
6	1	SMAN 1 Kamal	300	0101000020AD10000075ECB651A42D5C4045BF905A687F1CC0	http://foto2.data.kemdikbud.go.id/getImage/20531130/3.jpg
7	7	SMKN 1 Kamal	300	0101000020AD100000DBF46EC3B62D5C408AE0802596801CC0	http://www.maduraterkini.com/wp-content/uploads/2015/10/Smkn.jpg
\.


--
-- Name: sekolahan_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sekolahan_gid_seq', 7, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: tempat_wisata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tempat_wisata (gid, id, nama, tiket, jam_buka, geom, pictures) FROM stdin;
4	2	Kolam Renang Gua Pote	5000	08.00-16.00	0101000020AD100000DDDF77CB8C305C4087F43E46BC521CC0	https://1.bp.blogspot.com/-bnj53vDGZtQ/VQlMWLbtvUI/AAAAAAAAF1g/xBgHRU002vw/w800-h800/kolam-renang-guweh-pote.jpg
5	3	Goa Kapur	5000	09.00-16.00	0101000020AD100000EC016F187D2F5C401D955136A45A1CC0	https://eloratour.files.wordpress.com/2013/10/goa-jatijajar.jpg
3	1	Bukit Jeddih	10000	08.00-16.00	0101000020AD100000D48F25B498305C40D9538B84C2541CC0	http://www.redio.in/asset/upload/2015/06/bukit-jaddih-pesona-keindahan-komplit-dari-pulau-madura-MjAxNS0wNi0xNyAxNzoyNDoxNQ==.jpg
2	5	Kolam Renang TRETAN	5000	08.00-16.00	0101000020AD1000009D4332CB722F5C40207C96A0C82C1CC0	https://4.bp.blogspot.com/-u2CPKR7jgHA/V01KT20o42I/AAAAAAAADs8/CT2Xov6cxtYMNT5nYZTgx5OdSMejTyTCwCLcB/s1600/kolam%2Brenang.jpg
1	4	Objek Wisata Taman Rekreasi Kota Bangkalan	10000	08.00-16.00	0101000020AD1000005273E8DD632F5C40B721AD00AF2C1CC0	http://korankabar.com/wp-content/uploads/2015/09/AAA.jpg
\.


--
-- Name: tempat_wisata_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tempat_wisata_gid_seq', 5, true);


--
-- Name: atm atm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atm
    ADD CONSTRAINT atm_pkey PRIMARY KEY (gid);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (gid);


--
-- Name: gedung_olahraga gedung_olahraga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gedung_olahraga
    ADD CONSTRAINT gedung_olahraga_pkey PRIMARY KEY (gid);


--
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (gid);


--
-- Name: jalan jalan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jalan
    ADD CONSTRAINT jalan_pkey PRIMARY KEY (gid);


--
-- Name: mall_dan_swalayan mall_dan_swalayan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mall_dan_swalayan
    ADD CONSTRAINT mall_dan_swalayan_pkey PRIMARY KEY (gid);


--
-- Name: masjid masjid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY masjid
    ADD CONSTRAINT masjid_pkey PRIMARY KEY (gid);


--
-- Name: rumah_makan rumah_makan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rumah_makan
    ADD CONSTRAINT rumah_makan_pkey PRIMARY KEY (gid);


--
-- Name: sekolahan sekolahan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sekolahan
    ADD CONSTRAINT sekolahan_pkey PRIMARY KEY (gid);


--
-- Name: tempat_wisata tempat_wisata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tempat_wisata
    ADD CONSTRAINT tempat_wisata_pkey PRIMARY KEY (gid);


--
-- Name: atm_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX atm_geom_idx ON atm USING gist (geom);


--
-- Name: bank_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bank_geom_idx ON bank USING gist (geom);


--
-- Name: gedung_olahraga_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gedung_olahraga_geom_idx ON gedung_olahraga USING gist (geom);


--
-- Name: hotel_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hotel_geom_idx ON hotel USING gist (geom);


--
-- Name: jalan_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jalan_geom_idx ON jalan USING gist (geom);


--
-- Name: mall_dan_swalayan_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mall_dan_swalayan_geom_idx ON mall_dan_swalayan USING gist (geom);


--
-- Name: masjid_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX masjid_geom_idx ON masjid USING gist (geom);


--
-- Name: rumah_makan_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rumah_makan_geom_idx ON rumah_makan USING gist (geom);


--
-- Name: sekolahan_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sekolahan_geom_idx ON sekolahan USING gist (geom);


--
-- Name: tempat_wisata_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tempat_wisata_geom_idx ON tempat_wisata USING gist (geom);


--
-- PostgreSQL database dump complete
--

