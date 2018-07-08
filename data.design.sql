#数据结构设计

use my_account;

# 用户表
create table users (
    id int auto_increment primary key,
    mobile char(11) not null,
    pwd char(32) not null,
    created datetime default NOW(),
    modified datetime default NOW()
) engine = InnoDB;

# 用户帐户表
create table user_accounts (
    id bigint auto_increment primary key,
    u_id int not null,
    account_no bigint unique key not null,
    balance decimal(15, 3) default 0.000,
    today_available decimal(15,3) default 10000.000,
    passcode char(64) not null,
    type tinyint default 0,
    status tinyint  default 0,
    created datetime default NOW(),
    modified datetime default NOW()
);

# 账户类型表
create table account_types (
    type_id tinyint unique key not null,
    type_name char(124) not null,
    rate smallint not null default 0 commonet "divide 100"
);

# 帐户操作事务表
create table account_trans (
    id bigint auto_increment primary key not null,
    trans_type tinyint default 0,
    from bigint not null,
    to bigint not null,
    charge decimal(8, 3) default 0.000,
    created datetime default NOW(),
    modified datetime default NOW()
);

# 转账日志表
create table transfer_log (
    id bigint auto_increment primary key not null,
    from bigint not null,
    to bigint not null,
    charge decimal(8, 3) default 0.000,
    created datetime default NOW(),
    modified datetime default NOW()
);

# 提现日志表 
create table withdraw_log (
    id bigint auto_increment primary key not null,
    account_no bigint not null,
    amount decimal(9, 2) default 0.00
    created datetime default NOW(),
    modified datetime default NOW()
);
