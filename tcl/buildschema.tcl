#!/usr/bin/tclsh
puts "SETTING CONFIGURATION"

source ./tcl/db_host.tcl

dbset db ora
dbset bm TPROC-C
diset connection system_user master
diset connection system_password testdbpass
diset tpcc tpcc_user tpcc
diset tpcc tpcc_pass testdbpass
diset connection instance "${db_host}:1521/ORCL"
diset tpcc ora_timeprofile true
diset tpcc tpcc_def_tab tpcc
vuset unique 1
vuset logtotemp 1
loadscript
puts "BUILD SCHEMA"
buildschema
puts "SCHEMA BULID COMPLETE"
exit
