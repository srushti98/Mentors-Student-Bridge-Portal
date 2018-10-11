create table activity_list(
activity_id int auto_increment,
mentor_id varchar(11),
activity_name varchar(15),
activity_date date,
activity_title varchar(100),
activity_content varchar(255),
primary key(activity_id),
foreign key (mentor_id) references mentor(emp_id));

create table student_activitylist(
student_id char(11),
activity_id int,
is_seen int,
attended int,
foreign key (student_id) references student(stud_mis_id),
foreign key (activity_id) references activity_list(activity_id),
primary key(activity_id,student_id));

/*procedure and cursor*/
delimiter //
create procedure update_instudentactivity(in activity_id varchar(5),in mentor_id varchar(11))
begin
	declare flag int default 0;
	declare stud_id char(11);
	declare c1 cursor for select stud_mis_id from studentmentorrel where emp_id=mentor_id;
	declare continue handler for not found set flag=1;
	open c1;
	stud_loop: loop
	fetch c1 into stud_id;
	if flag then
	leave stud_loop;
	end if;
	insert into student_activitylist values(stud_id,activity_id,0,0);
	end loop stud_loop;
	close c1;
end//
delimiter; 

/*trigger*/
delimiter //
create trigger insert_instudentslist 
after insert on activity_list
for each row
begin
call update_instudentactivity(new.activity_id,new.mentor_id);
end//
delimiter ; 
