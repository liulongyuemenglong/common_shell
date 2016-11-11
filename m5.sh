#!/usr/bin/expect
set IP [lindex $argv 0]
spawn ssh liulong_160@192.168.0.200
expect "*assword:"
send "M2\$123455\#u\r"
expect "*Choice:"
send "1\r"
expect "*Choice:"
send "s\r"
expect "*Choice:"
send "1\r"
expect "*IP:"
send "$IP\r"
expect "*Choice:"
send "1\r"
expect "*Choice:"
send "1\r"
expect {
    "res_dev*]" { send "sudo su - web\r"; exp_continue } 
    "web@" { interact }
}
