use capstone1;
select * from account;
select * from card_disp_client;
Select * from card;
select * from transaction_data; 
select * from account inner join loan on account.account_id = loan.account_id; 
select count(* ) from loan inner join order1 on loan.account_id = order1.account_id;
select * from loan inner  join transaction_data on loan.account_id = transaction_data.account_id;
select * from account left join order1 on account.account_id = order1.account_id;  #7213
create table card_disp1
select c.*,disp.account_id,disp.client_id as disposition_client_id,disp.type as disposition_type from card c  join disp on c.disp_id = disp.disp_id;   #892
create table card_disp_client
select *from card_disp1 cd  inner join client on cd.disposition_client_id = client.client_id;#892
create table card_disp_client_district 
select *from card_disp_client cdc inner join  district on cdc.district_id = district.A1;

create table loan_transaction
select td.*, l.loan_id,l.date as loan_date,l.duration,l.payments,l.status from loan l  join transaction_data td on l.account_id = td.account_id;#7213

create table acc_ord
select od.*,acc.district_id,acc.frequency,acc.date from account acc left join order1  od on acc.account_id = od.account_id; #7213
create table cdcd_ao   #7213
select cdcd.*,ao.order_id,ao.bank_to,ao.account_to,ao.amount,ao.k_symbol,ao.frequency,ao.date from acc_ord ao left join card_disp_client_district cdcd on ao.account_id = cdcd.account_id;

create table cdcd_ao_loan  #868 
select cdcd_ao.*,lt.trans_id,lt.operation,lt.balance,lt.bank,lt.loan_id,lt.loan_date,lt.duration,lt.payments,lt.status from loan_transaction lt join cdcd_ao  on lt.account_id  =  cdcd_ao.account_id;






