# Create user Admin : Full access to the system read, write, change, delete
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpwd';
CREATE USER 'admin'@'%' IDENTIFIED BY 'adminpwd';
GRANT SELECT, INSERT, UPDATE, DELETE ON olympicsdb.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON olympicsdb.* TO 'admin'@'%';

# Create user Senior Secretary: Read and write but can also change data on cells of the DB
CREATE USER 'snrsecretary'@'localhost' IDENTIFIED BY 'snrsecretarypwd';
CREATE USER 'snrsecretary'@'%' IDENTIFIED BY 'snrsecretarypwd';
GRANT SELECT, INSERT, UPDATE ON olympicsdb.* TO 'snrsecretary'@'localhost';
GRANT SELECT, INSERT, UPDATE ON olympicsdb.* TO 'snrsecretary'@'%';

# Create user Secretary: Only Read and Write (for Inserting new data)
CREATE USER 'secretary'@'localhost' IDENTIFIED BY 'secretarypwd';
CREATE USER 'secretary'@'%' IDENTIFIED BY 'secretarypwd';
GRANT SELECT, INSERT ON olympicsdb.* TO 'secretary'@'localhost';
GRANT SELECT, INSERT ON olympicsdb.* TO 'secretary'@'%';

# Create user Visitor: The common user of the db. Only has reading right of all the contents of the DB.
CREATE USER 'visitor'@'localhost' IDENTIFIED BY 'visitorpwd';
CREATE USER 'visitor'@'%' IDENTIFIED BY 'visitorpwd';
GRANT SELECT ON olympicsdb.* TO 'visitor'@'localhost';
GRANT SELECT ON olympicsdb.* TO 'visitor'@'%';