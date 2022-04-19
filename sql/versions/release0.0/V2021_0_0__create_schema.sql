CREATE TABLE IF NOT EXISTS cit_rte_hdr
(
    stor_id                  char(3)                            NOT NULL,
    dsc_rte_id               varchar(25)                        NOT NULL,
    dlv_dt                   date                               NOT NULL,
    shft_num_cd              smallint                           NOT NULL,
    uniq_wave_id             smallint                           NOT NULL,
    mds_load_id              smallint,
    stop_qy                  smallint,
    est_dprt_dt_tm           timestamp(3080),
    est_rtrn_dt_tm           timestamp(3080),
    est_mile_qy              smallint,
    last_stop_est_rtrn_dt_tm timestamp(3080),
    act_dprt_dt_tm           timestamp(3080),
    gps_dprt_dt_tm           timestamp(3080),
    act_rtrn_dt_tm           timestamp(3080),
    gps_rtrn_dt_tm           timestamp(3080),
    act_mile_qy              smallint,
    file_id                  char(7),
    truk_id                  varchar(25)                        NOT NULL,
    gps_rte_id               varchar(25),
    drvr_type_cd             char(1),
    depo_id                  char(3),
    call_drvr_stat_cd        varchar(20) default 'NOT ASSIGNED' NOT NULL,
    drvr_strt_tm             timestamp(3080),
    drvr_text_tm             timestamp(3080),
    truk_rdy_cd              char(1)     default 'N'            NOT NULL,
    truk_loc_cd              char(4),
    tote_inj_cd              char(1)     default 'N'            NOT NULL,
    dspr_id                  char(8),
    rte_note                 varchar(1000),
    drvr_hhld_phon_cd        char(20),
    est_mile_to_depo         float(17),
    audt_cr_dt_tm            timestamp(3594) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    audt_upd_dt_tm           timestamp(3594) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    audt_upd_id              char(8)                            NOT NULL,
    xfer_cd                  char(1),
    xfer_dt                  date,
    veh_type                 varchar(25),
    constraint pk_cit_rte_hdr
    primary key (stor_id, dsc_rte_id, dlv_dt, shft_num_cd),
    constraint cit_rte_hdr_i1
    unique (rte_note, stor_id, dsc_rte_id, dlv_dt, shft_num_cd),
    constraint cit_rte_hdri2
    unique (rte_note, dsc_rte_id, dlv_dt)
    );

-- cit_rte_dtl (ROUTE DETAIL)
create table IF NOT EXISTS cit_rte_dtl
(
    stor_id            char(3)                 NOT NULL,
    dsc_rte_id         varchar(25)             NOT NULL,
    dlv_dt             date                    NOT NULL,
    shft_num_cd        smallint                NOT NULL,
    stop_id            smallint                NOT NULL,
    act_stop_id        smallint,
    uniq_wave_id       int                     NOT NULL,
    cnsm_id            char(7),
    ord_id             char(10),
    est_ariv_dt_tm     timestamp(3080),
    est_comp_dt_tm     timestamp(3080),
    act_ariv_dt_tm     timestamp(3080),
    act_comp_dt_tm     timestamp(3080),
    lat_qy             float(17),
    long_qy            float(17),
    est_mile_qy        float(17),
    new_est_ariv_dt_tm timestamp(3080),
    eta_text_run_cd    char(1)     default 'N' NOT NULL,
    audt_cr_dt_tm      timestamp(3594)  DEFAULT CURRENT_TIMESTAMP NOT NULL,
    audt_upd_dt_tm     timestamp(3594)  DEFAULT CURRENT_TIMESTAMP NOT NULL,
    audt_upd_id        char(8)                 NOT NULL,
    xfer_cd            char(1),
    xfer_dt            date,
    stop_stat          varchar(25) default 'PENDING',
    constraint cit_rte_dtl_i1
    unique (stor_id, dsc_rte_id, dlv_dt, shft_num_cd, stop_id, act_stop_id),
    constraint cit_rte_dtl_i2
    unique (stor_id, dsc_rte_id, dlv_dt, shft_num_cd),
    constraint cit_rte_dtl_i3
    unique (ord_id, act_stop_id),
    constraint cit_rte_dtl_i4
    unique (cnsm_id, ord_id),
    constraint cit_rte_dtl_i5
    unique (dlv_dt, ord_id, act_stop_id)
    );

create unique index if not exists " 124_2054"
    on cit_rte_dtl (stor_id, dsc_rte_id, dlv_dt, shft_num_cd, stop_id);

alter table cit_rte_dtl
    add constraint pk_cit_rte_dtl
        primary key (stor_id, dsc_rte_id, dlv_dt, shft_num_cd, stop_id);

-- pit_rte_rlse (ROUTE RELEASE)
create table if not exists pit_rte_rlse
(
    stor_id        char(3)             not null,
    dlv_dt         date             not null,
    rlse_id        smallint          not null,
    rlse_dt_tm     time(1128)         not null,
    rlse_user_id   char(8)             not null,
    rlse_desc_tx   char(20)            not null,
    upld_to_wms_cd char(1) default 'N' not null
    );

create unique index if not exists pit_rte_rlse1
    on pit_rte_rlse (stor_id, dlv_dt, rlse_id);

-- alter table pit_rte_rlse
--     add constraint pit_rte_rlse
--         primary key (stor_id, dlv_dt, rlse_id);
--


-- pit_rte_brk (ROUTE BREAK)
create table if not exists pit_rte_brk
(
    stor_id          char(3)     not null,
    dsc_rte_id       varchar(25) not null,
    dlv_dt           date        not null,
    brk_aftr_stop_id smallint    not null,
    est_ariv_dt_tm   timestamp(3080) not null,
    est_comp_dt_tm   timestamp(3080) not null,
    act_ariv_dt_tm   timestamp(3080),
    act_comp_dt_tm   timestamp(3080),
    act_stop_id      smallint,
    brk_id           varchar(25)
    );

create unique index if not exists pit_rte_brk1
    on pit_rte_brk (stor_id, dsc_rte_id, dlv_dt, brk_aftr_stop_id);

alter table pit_rte_brk
    add constraint pk_pit_rte_brk
        primary key (stor_id, dsc_rte_id, dlv_dt, brk_aftr_stop_id);


-- pit_rte_file_ctl
create table if not exists pit_rte_file_ctl
(
    stor_id       char(3),
    dlv_dt        date,
    shft_num_cd   smallint,
    rte_file_name char(9),
    seq_id        smallint,
    constraint pit_rte_file_ctl2
    unique (rte_file_name, seq_id)
    );

-- cit_rte_dspr
create table if not exists cit_rte_dspr
(
    dspr_id        char(8)  not null,
    stor_id        char(3)  not null,
    frst_name_tx   char(35) not null,
    last_name_tx   char(35) not null,
    actv_cd        char(1)  not null,
    audt_cr_id     varchar(60),
    audt_cr_dt_tm  timestamp(3594) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    audt_upd_id    varchar(60),
    audt_upd_dt_tm timestamp(3594)
    );

create unique index if not exists cit_rte_dspr_pk
    on cit_rte_dspr (dspr_id);

alter table cit_rte_dspr
    add constraint pk_cit_rte_dspr
        primary key (dspr_id);


-- cit_rte_drvr
create table if not exists cit_rte_drvr
(
    drvr_id      char(8)             not null,
    stor_id      char(3)             not null,
    depo_id      char(3),
    alt_stor_id  char(3),
    frst_name_tx char(35)            not null,
    last_name_tx char(35)            not null,
    actv_cd      char(1)             not null,
    sns_ee_id    char(10),
    team_cd      char(3),
    phon_1_cd    char(13),
    phon_2_cd    char(13),
    phon_3_cd    char(13),
    mail_tx      varchar(60),
    msg_mail_tx  varchar(60),
    full_tm_cd   char(1) default 'N' not null,
    drvr_img     bytea
    );

create unique index if not exists cit_rte_drvr1
    on cit_rte_drvr (drvr_id);

alter table cit_rte_drvr
    add constraint cit_rte_drvr_pk
        primary key (drvr_id);

-- pit_dlv_depo
create table if not exists pit_dlv_depo
(
    stor_id             char(3)             not null,
    depo_id             char(3)             not null,
    seq_id              smallint         not null,
    depo_desc_tx        char(20),
    truk_rte_id         smallint,
    strt_van_rte_id     smallint,
    trsh_van_rte_id     smallint,
    shft_grp_cd         smallint,
    time_diff_qy        smallint     default 0 not null,
    drvr_strt_tm_pad_qy smallint     default 0 not null,
    depo_leg_tm         timestamp(1128),
    use_leg_tm_cd       char(1) default 'Y' not null,
    shft_grp_mod_qy     smallint default 0 not null,
    rvse_time_cd        char(1) default 'N' not null,
    max_rte_per_trlr_qy smallint default 999 not null
    );

create unique index if not exists pit_dlv_depo1
    on pit_dlv_depo (stor_id, depo_id, seq_id);

alter table pit_dlv_depo
    add constraint pk_dlv_depo
        primary key (stor_id, depo_id, seq_id);

-- -- pit_tote_eqtn_ctl
-- create table if not exists pit_tote_eqtn_ctl
-- (
--     stor_id          char(3) not null,
--     type_cd          char(1) not null,
--     parm_cnst_qy     float(17),
--     parm_doll_qy     float(17),
--     parm_doll_sq_qy  float(17),
--     parm_am_pm_qy    float(17),
--     parm_manl_adj_qy float(17)
-- );
--
-- create unique index if not exists pit_tote_eqtn_ctl_pk
--     on pit_tote_eqtn_ctl (stor_id, type_cd);
--
-- alter table pit_tote_eqtn_ctl
--     add constraint pk_pit_tote_eqtn_ctl
--         primary key (stor_id, type_cd);

-- pit_dlv_depo_firm_tm
create table if not exists pit_dlv_depo_firm_tm
(
    stor_id          char(3)             not null,
    depo_id          char(3)             not null,
    shft_grp_cd      smallint not null,
    dprt_seq_qy      smallint not null,
    dprt_tm          time(1128) not null,
    dprt_prev_day_cd char(1) default 'N' not null
    );

create unique index if not exists pit_dlv_depo_firm_tm_pk
    on pit_dlv_depo_firm_tm (stor_id, depo_id, shft_grp_cd, dprt_seq_qy);

alter table pit_dlv_depo_firm_tm
    add constraint pk_pit_dlv_depo_firm_tm
        primary key (stor_id, depo_id, shft_grp_cd, dprt_seq_qy);

-- pit_tote_eqtn_ctl
create table if not exists pit_tote_eqtn_ctl
(
    stor_id          char(3) not null,
    type_cd          char(1) not null,
    parm_cnst_qy     float(17),
    parm_doll_qy     float(17),
    parm_doll_sq_qy  float(17),
    parm_am_pm_qy    float(17),
    parm_manl_adj_qy float(17)
    );

create unique index if not exists pit_tote_eqtn_ctl_pk
    on pit_tote_eqtn_ctl (stor_id, type_cd);

alter table pit_tote_eqtn_ctl
    add constraint pk_pit_tote_eqtn_ctl
        primary key (stor_id, type_cd);

-- cit_rte_rpt_dtl
create table if not exists cit_rte_rpt_dtl
(
    uniq_wave_id     int             not null,
    dlv_dt           date            not null,
    stor_id          char(3)             not null,
    shft_num_cd      smallint            not null,
    pup_id           smallint    default 0 not null,
    depo_adr_1_tx    varchar(20)         not null,
    depo_city_tx     varchar(20)         not null,
    depo_st_cd       char(3)             not null,
    depo_zip_cd      varchar(10)         not null,
    dsc_rte_id       varchar(25)         not null,
    mds_load_id      smallint           not null,
    est_dprt_dt_tm   timestamp(3080) not null,
    est_rtrn_dt_tm   timestamp(3080) not null,
    est_rte_mile_qy  smallint        not null,
    stop_id          smallint        not null,
    est_stop_mile_qy float(17)           not null,
    ord_id           char(10)
    constraint cit_rte_rpt_dtl_i2
    unique,
    ord_tot_qy       decimal(10, 10),
    dlv_wnd_beg_tm   time(1128),
    dlv_wnd_end_tm   time(1128),
    cnsm_id          char(7),
    cnsm_type_cd     char(1),
    cnsm_name_tx     varchar(51),
    cnsm_adr_1_tx    varchar(30),
    cnsm_city_tx     varchar(20),
    cnsm_st_cd       char(2),
    cnsm_zip_cd      varchar(10),
    day_phon_cd      char(13),
    home_phon_cd     char(13),
    est_ariv_tm      timestamp(3080),
    est_comp_tm      timestamp(3080),
    org_stn_id       char(7)             not null,
    dest_stn_id      char(7)             not null,
    tot_leg_sec_qy   smallint            not null,
    leg_mile_qy      float(17)           not null,
    leg_id           smallint            not null,
    dir_tx           varchar(255)        not null,
    tote_pckp_cd     char(1) default 'N' not null
    );

create unique index if not exists cit_rte_rpt_dtl_i1
    on cit_rte_rpt_dtl (dlv_dt, uniq_wave_id, dsc_rte_id, stop_id, leg_id);

alter table cit_rte_rpt_dtl
    add constraint cit_rte_rpt_dtl_pk
        primary key (dlv_dt, uniq_wave_id, dsc_rte_id, stop_id, leg_id);


-- cit_cnsm_rte
create table if not exists cit_cnsm_rte
(
    cnsm_id              char(8)                                  not null,
    last_sent_adr1_tx    varchar(30)                              not null,
    last_sent_city_tx    varchar(20)                              not null,
    last_sent_st_cd      varchar(2)                               not null,
    last_sent_zip_cd     varchar(10)                              not null,
    last_day_phon_cd     char(13),
    last_day_phon_ext_cd char(4),
    last_istr_1_tx       varchar(60),
    last_istr_2_tx       varchar(60),
    last_istr_3_tx       varchar(60),
    last_uniq_wave_id    smallint,
    last_type_cd         char(1),
    ovrd_lat_qy          float(17)     default 0.0000000000000000 not null,
    ovrd_long_qy         float(17)     default 0.0000000000000000 not null,
    ovrd_stop_min_qy     smallint default 0 not null,
    lrnd_stop_min_qy     smallint default 0 not null,
    num_ord_avgd_qy      smallint default 0 not null,
    hold_stop_min_qy     decimal(6, 2) default 0.00               not null,
    sent_cd              char(1)       default 'N'                not null,
    constraint cit_cnsm_rte_i2
    unique (ovrd_lat_qy, ovrd_long_qy)
    );

create unique index if not exists cit_cnsm_rte1
    on cit_cnsm_rte (cnsm_id);

alter table cit_cnsm_rte
    add constraint cit_cnsm_rte_pk
        primary key (cnsm_id);

-- cit_site_type
create table if not exists cit_site_type
(
    ship_type_cd char(10) not null,
    mbr_type_cd  char(1)  not null,
    stop_time_cd smallint not null,
    stop_mint_qy smallint
    );

create unique index if not exists cit_site_type_i1
    on cit_site_type (ship_type_cd, mbr_type_cd, stop_time_cd);

alter table cit_site_type
    add constraint pk_cit_site_type
        primary key (ship_type_cd, mbr_type_cd, stop_time_cd);

-- pit_drvr_blk_out_time
create table if not exists pit_drvr_blk_out_time
(
    stor_id     char(3) not null,
    shft_num_cd smallint not null,
    strt_tm     time(1642) not null,
    end_tm      time(1642) not null
    );

create unique index if not exists pit_drvr_blk_out_time_pk
    on pit_drvr_blk_out_time (stor_id, shft_num_cd);

alter table pit_drvr_blk_out_time
    add constraint pk_pit_drvr_blk_out_time
        primary key (stor_id, shft_num_cd);



