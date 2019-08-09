CREATE TABLE roles(
  role_id int(10) PRIMARY KEY auto_increment,
  role_name VARCHAR(30),
  create_time datetime 
);
COMMENT ON TABLE t_role IS '角色表';
COMMENT ON COLUMN t_role.role_id IS '角色ID';
COMMENT ON COLUMN t_role.role_name IS '角色名称';
COMMENT ON COLUMN t_role.create_time '创建时间';

CREATE TABLE powers(
  power_id int(10) PRIMARY KEY,
  power_name VARCHAR(30),
  create_time datetime
);

CREATE TABLE user_role(
  user_id int(10) NOT NULL,
  role_id int(10) NOT NULL ,
  create_time datetime 
);

CREATE TABLE role_power(
  role_id int(10) NOT NULL,
  power_id int(10) NOT NULL
);

select 
 				r.role_name,r.role_id   
 			from roles r 
 			where role_id in (
 				select 
 					role_id 
 			  from 
 			  	user_role 
 			  where  
 			  	user_id =1 
 			  group by 
 			  	role_id
 			  	)	
 			  	
 			  	select 
 				r.role_name,r.role_id   
 			from roles r 
 			where role_id not in (
 				select 
 					role_id 
 			  from 
 			  	user_role 
 			  where  
 			  	user_id =1 
 			  group by 
 			  	role_id)	