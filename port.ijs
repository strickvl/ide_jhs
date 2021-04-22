NB. port utilties - used with Jd/JHS node server
NB. should probably be an addons - for now it can live here
NB. currently routines are duplicated in Jd

coclass'jport'

killport=: 3 : 0 
'must be single port'assert 1=#y
pid=: pidfromport y
if. _1~:pid do. 
 select. UNAME
  case. 'Win' do. shell_jtask_'taskkill /f /pid ',":pid
  case. do. shell_jtask_'kill ',":pid
 end.
end. 
i.0 0
)

NB. pids,.ports
pidport=: 3 : 0
if. UNAME-:'Win' do.
 d=.  CR-.~each deb each <;._2 shell'netstat -ano -p tcp'
 b=. d#~;(<'TCP')-:each 3{.each d
 d=. ><;._2 each d,each' '
 d=. d#~(<'LISTENING')=3{"1 d
 a=. 1{"1 d
 a=. ;0".each(>:;a i: each':')}.each a
 d=. ;0".each 4{"1 d
 d,:a
else.
 d=. shell_jtask_ :: 0: 'lsof -F pn -s TCP:LISTEN -i TCP'
 if. d-:0 do. i.2 0 return. end.
 d=. <;._2 shell_jtask_'lsof -F pn -s TCP:LISTEN -i TCP'
 d=. (3,~<.3%~#d)$d
 pids=. ;_1".each}.each{."1 d
 a=. {:"1 d
 ports=. ;_1".each a}.~each >:;a i: each':'
 pids,:ports
end.
)

pidfromport=: 3 : 0
'pid port'=. pidport''
(port i. y){pid,_1
)
