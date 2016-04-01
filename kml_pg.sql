-- Table: kml_pg

-- DROP TABLE kml_pg;

CREATE TABLE kml_pg
(
  id_kml_pg serial NOT NULL,
  name character varying,
  desc_no character varying,
  desc_sector_name character varying,
  desc_site_name character varying,
  desc_latitude character varying,
  desc_longitude character varying,
  desc_antenna_height character varying,
  desc_azimuth character varying,
  desc_mdt character varying,
  desc_area character varying,
  visibility character varying,
  open character varying,
  linestyle_color character varying,
  linestyle_width character varying,
  polystyle_fill character varying,
  polystyle_outline character varying,
  polystyle_color character varying,
  extrude character varying,
  altitudemode character varying,
  tessellate character varying,
  coordinates geometry(Polygon,4326),
  CONSTRAINT kml_pg_pkey PRIMARY KEY (id_kml_pg)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE kml_pg
  OWNER TO postgres;
