CREATE SCHEMA nlp;

CREATE TABLE nlp.pipeline_config
(
	pipeline_id bigserial not null
		constraint pipeline_config_pkey
			primary key,
	owner varchar(100),
	config text,
  pipeline_type varchar(100),
	name varchar(256),
	description text,
	date_created timestamp,
	date_updated timestamp
);

CREATE UNIQUE INDEX nlp.pipeline_config_pipeline_id_uindex
	on nlp.pipeline_config (pipeline_id)
;


CREATE TABLE nlp.nlp_job
(
    nlp_job_id BIGSERIAL PRIMARY KEY NOT NULL,
		job_type VARCHAR(100),
    name VARCHAR(512),
    description TEXT,
    owner VARCHAR(100),
    pipeline_id BIGSERIAL,
    status VARCHAR(256),
    date_started TIMESTAMP,
    date_ended TIMESTAMP
);
CREATE UNIQUE INDEX nlp_job_nlp_job_id_uindex ON nlp.nlp_job (nlp_job_id);

create table nlp_job_status
(
	nlp_job_status_id bigserial not null
		constraint nlp_job_status_pkey
			primary key,
	status varchar(256) not null,
	description text,
	date_updated timestamp not null,
	source_id bigint
)
;

create unique index nlp_job_status_nlp_job_status_id_uindex
	on nlp_job_status (nlp_job_status_id)
;

create index nlp_job_status_phenotype_id_index
	on nlp_job_status (source_id)
;
