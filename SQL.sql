prompt ���ӹ���Ա�û�
connect sys/tbsoft as sysdba;
prompt �����jl�û���ɾ��
drop user jl cascade;
prompt �����û�jl
create user jl identified by jl;
prompt ���û�jl����connect,resource��ɫȨ��
grant connect,resource to jl;
prompt �޸�jl��system�еı�ռ����
alter user jl quota unlimited on system;
prompt �����û�jl
connect jl/jl;

drop sequence S_PERSON;
drop sequence S_ITEM;
drop sequence S_MESSAGE;
drop table t_Message;

drop table t_Item;
drop table t_UserManage;
drop table t_Popedom;


create table t_Popedom
(
   popedom  Varchar2(6)constraint PK_T_POPEDOM_USERPOPEDOM primary key,
   popedomname  Varchar2(10)not null
) ;
insert into T_POPEDOM (POPEDOM,POPEDOMNAME) values('01','ϵͳ����Ա');
insert into T_POPEDOM (POPEDOM,POPEDOMNAME) values('02','��Ŀά��Ա');
insert into T_POPEDOM (POPEDOM,POPEDOMNAME) values('03','����׫дԱ');


create table t_UserManage
(
       userid Varchar2(10) constraint PK_T_USERMANAGE_USERID primary key,
       loginid Varchar2(10) not null,
       password  Varchar2(20)not null,
       popedom  Varchar2(2)not null,
       username Varchar2(10),
       sex  Varchar2(4),
       age  number(2,0),
       email  Varchar2(20),  
 constraint FK_T_USERMANAGE_POPEDOM foreign key(popedom) references T_POPEDOM (popedom)
);

create table t_Item
(
       itemid varchar2(6) constraint PK_T_ITEM_ITEMID primary key,
       itemname varchar2(20) not null
);

create table T_Message
( 
  messageid varchar2(6) constraint PK_T_MESSAGE_MESSAGEID primary key,
  itemid varchar2(6) not null,
  title varchar2(30) not null,
  content varchar2(2000) not null,
  author varchar2(20) not null,
  infodate date not null
-- constraint FK_T_MESSAGE_ITEMID foreign key(ITEMID) references T_ITEM(ITEMID)
);

create sequence S_PERSON
start with 1
increment by 1;

create sequence S_ITEM
start with 1
increment by 1;

create sequence S_MESSAGE
start with 1
increment by 1;

insert into T_USERMANAGE (USERID,LOGINID,PASSWORD,POPEDOM,USERNAME) values ('P'||lpad(S_PERSON.nextval,5,'0'),'jl','123456','01','admin');


commit;
