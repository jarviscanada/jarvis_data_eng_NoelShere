SELECT	cpu_number,
       	id,
          SUM(total_mem) AS total_mem

FROM host_info
GROUP BY
	cpu_number,
	id

ORDER BY total_mem DESC;

CREATE FUNCTION round5(ts timestamp) RETURNS timestamp AS
    $$
    BEGIN
	    RETURN date_trunc('hour', ts) + date_part('minute', ts):: int / 5 * interval '5 min';
    END
    $$ LANGUAGE PLPGSQL;


SELECT 	host_id,
	hostname,
	round5(host_usage.timestamp),
	AVG(((total_mem - memory_free)*100)/ total_mem) AS avg_used_memory

FROM host_info
LEFT JOIN host_usage ON host_info.id = host_usage.host_id
GROUP BY host_id, hostname, round5(timestamp);

