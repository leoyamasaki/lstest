select userid, username, group_concat(if(stylesid=1, score, null)) as 'estilo1', group_concat(if(stylesid=3, score, null)) as 'estilo2',group_concat(if(stylesid=3, score, null)) as 'estilo3' from mdl_lstest_user_scores as us, mdl_user as u, mdl_lstest_styles as st where us.userid = u.id and us.stylesid = st.id group by userid;


select userid, username, group_concat(if(stylesid=1, score, null)) as 'estilo1', group_concat(if(stylesid=3, score, null)) as 'estilo2',group_concat(if(stylesid=3, score, null)) as 'estilo3' from mdl_lstest_user_scores as us, mdl_user as u, mdl_lstest_styles as st where us.userid = u.id and us.stylesid = st.id group by userid;


select userid, username, group_concat(if(stylesid=1, score, null)) , group_concat(if(stylesid=3, score, null)),  group_concat(if(stylesid=3, score, null)) from mdl_lstest_user_scores as us, mdl_user as u where us.userid = u.id group by userid;


select userid, username, group_concat(if(stylesid=1, score, null)) as 'visual', group_concat(if(stylesid=3, score, null)) as 'auditivo',group_concat(if(stylesid=3, score, null)) as 'cenestesico' from pnl_lstest as us, mdl_user as u, mdl_lstest_styles as st where us.userid = u.id and us.stylesid = st.id group by userid;


*************************
create or replace view pnl_lstest as select userid, name, stylesid, score , time from mdl_lstest_user_scores as us, mdl_lstest_styles as st where (stylesid=1 or stylesid=2 or stylesid=3) and us.stylesid = st.id order by userid, time, stylesid;


create or replace view pnl_score as select userid, group_concat(if(stylesid=1, score, null)) as 'visual', group_concat(if(stylesid=3, score, null)) as 'auditivo',group_concat(if(stylesid=3, score, null)) as 'cinestesico' from pnl_lstest group by userid;

*************************
create or replace view felder_lstest as select userid, name, stylesid, score , time from mdl_lstest_user_scores as us, mdl_lstest_styles as st where (stylesid=4 or stylesid=5 or stylesid=6 or stylesid=7) and us.stylesid = st.id order by userid, time, stylesid;


create or replace view felder_score as select userid, group_concat(if(stylesid=4, score, null)) as 'Activo-Reflexivo', group_concat(if(stylesid=5, score, null)) as 'Sensorial-Intuitivo', group_concat(if(stylesid=6, score, null)) as 'Visual-Verbal', group_concat(if(stylesid=7, score, null)) as 'Secuencial-Global' from felder_lstest group by userid;

select userid, group_concat(if(stylesid=1, score, null)) as 'visual', group_concat(if(stylesid=3, score, null)) as 'auditivo',group_concat(if(stylesid=3, score, null)) as 'cinestesico' from (select userid,name,stylesid,score,time from mdl_lstest_user_scores as us, mdl_lstest_styles as st where (stylesid=1 or stylesid=2 or stylesid=3) and us.stylesid = st.id order by userid, time, stylesid) group by userid;