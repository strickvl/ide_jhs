0 : 0
define project verbs
default location for this script is: ~temp/sp/spfile.ijs
template is: ~addons/ide/jhs/spfile_template.ijs

   sp 0 NB. set ~temp/sp/spfile.ijs as SPFILE and create it from template
)

project_jhs_z_=: 3 : 0
edit '~/fubar.ijs'
edit      SPFILE
open_jhs_ 'jfif'
open_jhs_ 'jfile' 
open_jhs_ 'jfiles'
open_jhs_ 'jdebug'
)

project_jd_z_=: 3 : 0
edit_jhs_ '~/t1.ijs'
open_jhs_ 'jfile'
open_jhs_ 'jfiles'
open_jhs_ 'jdebug'
load 'git/addons/data/jd/jd.ijs'
myname=: 666777
)

splist_jsp_'' NB. echo recallable project lines