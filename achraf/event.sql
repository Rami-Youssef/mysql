   create event annualTask on schedule
at current_timestamp( )+ interval '12' hour
Do 
BEGIN
end
"2025-02-11"

create event annualTask2 on schedule
starts current_timestamp() '12'
Do 

