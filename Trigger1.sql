create trigger employee_supervisor
before insert or update on employee
for each row
when(new.position != "president")
declare
	dummy integer;
begin
	select count(*) into dummy
	from supervision
	where new.employee_name = supervision.employee.name and supervision.supervisor_name <> NULL;
		supervision.supervisor_name <>NULL;

	if (dummy < 1)
		then raise_application_error( -2000m 'employee must has a supervisor');
	end if
end	
