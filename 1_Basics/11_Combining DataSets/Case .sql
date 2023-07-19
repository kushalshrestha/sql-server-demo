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
