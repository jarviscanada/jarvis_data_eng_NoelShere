CREATE TABLE IF NOT EXITS PUBLIC.host_info
(
    id SERIAL PRIMARY KEY NOT NULL,
	hostname VARCHAR (255) NOT NULL UNIQUE,
	cpu_number INTEGER NOT NULL,
	cpu_architecture VARCHAR (50) NOT NULL,
	cpu_model VARCHAR (255) NOT NULL,
	cpu_mhz FLOAT NOT NULL,
	L2_cache VARCHAR NOT NULL,
	total_mem INTEGER NOT NULL,
	"timestamp" TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS PUBLIC.host_usage
(
    "timestamp" TIMESTAMP NOT NULL,
    host_id SERIAL NOT NULL REFERENCES,
    memory_free INTEGER NOT NULL,
    cpu_idle INTEGER NOT NULL,
    cpu_kernel INTEGER,
    disk_io INTEGER,
    disk_available INTEGER NOT NULL
);