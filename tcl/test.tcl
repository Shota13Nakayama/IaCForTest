#!/usr/bin/tclsh
puts "SETTING CONFIGURATION"
dbset db ora
dbset bm TPROC-C
diset connection system_user master
diset connection system_password testdbpass
diset tpcc tpcc_user tpcc
diset tpcc tpcc_pass testdbpass
diset connection instance orclse2-dbinstance-9618tft9ylze.cm7z4kzty5t5.us-east-2.rds.amazonaws.com:1521/ORCL
diset tpcc ora_timeprofile true
diset tpcc tpcc_def_tab tpcc
vuset unique 1
vuset logtotemp 1
loadscript
print dict
puts "SEQUENCE STARTED"
foreach z { 1 2 4 8 16} {
puts "$z VU TEST"
vuset vu $z
vucreate
print vuconf
vurun
while { ![vucomplete] } { update }
vudestroy
after 5000
}
puts "TEST SEQUENCE COMPLETE"
exit
