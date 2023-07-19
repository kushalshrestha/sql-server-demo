declare @myOption as varchar(10) = 'Option A';

-- 1st way: more versatile b/c 1st when @myOption = 'OptionA'.... , 2nd when @myOption != 'Option B' and @anotherVariable = 'another condition'
select case 
            when @myOption = 'Option A' then 'First Option'
            when @myOption = 'Option B' then 'Second Option'
            else 'Invalid Option'
        end as SelectedOption;

-- Another way: variable set outside. Simpler, and reduce repetition
select case @myOption
            when 'Option A' then 'First Option'
            when 'Option B' then 'Second Option'
            else 'Invalid Option'
        end as SelectedOption;


select top 100 EmployeeNumber, employeeFirstName , case left(EmployeeFirstName,1) 
                                                        when  'A' THEN 'Team A'
                                                        when  'B' THEN 'Team B'
                                                        when 'C' THEN 'Team C'
                                                        else 'Team D'
                                                    end + ' Member' as initials
from tblEmployee


-----------------------------
-- won't give output b/c the selected case ->'First Option' needs to be converted to the highest order data type among the available case
declare @myOption1 as varchar(10) = 'Option A';
select case @myOption1
            when 'Option A' then 'First Option'
            when 'Option B' then 23423
            else 'Invalid Option'
        end as SelectedOption;

-- but the below will give output
declare @myOption2 as varchar(10) = 'Option A';
select case @myOption2
            when 'Option A' then 32432
            when 'Option B' then 'Option B'
            else 'Invalid Option'
        end as SelectedOption;
-- SO THE CORRECT FORM IS:
declare @myOption3 as varchar(10) = 'Option A';
select case @myOption3
            when 'Option A' then 'Option A'
            when 'Option B' then convert(varchar(10), 3)
            else 'Invalid Option'
        end as SelectedOption;
