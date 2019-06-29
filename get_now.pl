sub set_target_date{
 my $lDEG=1;#2017/1/28
  require "/home/koshida/lib/perl/hzk.pl"; # 3/28'18
  #get it.now as @it
  $cdate = `/bin/date '+%c/%m/%d:%H:%M:%S'`;
  $cdate = `/bin/date '+%Y/%m/%d:%H:%M:%S'`; #3/28'18
  ###$cdate = "Fri Jun 04 08:37:00 2007/10/04:08:37:00"; ### offline
  ## comment out following line >> can't understand why this line exist?
  ###$cdate = "2017/11/19:16:33:29"; ### offline
  #           #0123456789#1
  chomp $cdate;
  print"cdate:$cdate\n" if $DEG;
  $it[0]=substr($cdate, 0,4);
  $it[1]=substr($cdate, 5,2);
  $it[2]=substr($cdate, 8,2);
  $it[3]=substr($cdate,11,2);
  $it[4]=substr($cdate,14,2);
  print "it :@it \n" if $DEG;
  if($offline eq "yes") {
    &set_target_date_off();   ### get it_now, its,ite
  }

  $ite[0]=$it[0];
  $ite[1]=$it[1];
  $ite[2]=$it[2];
  $ite[3]=0;  ## set HH=0
  $ite[4]=0;  ## set FF=0

  print "it :@it \n" if $lDEG;
  #set 24hours.before
  @its = hzk(@ite,1440,-1);   ### retro.spectol every 10.min
  #@it_get = hzk(@it,10,$n*(-1));   ### retro.spectol every 10.min
#  @year = qw( 2007 );
#  @month = qw( 9 );
#  @day =   qw( 22 );
  $year[0] =  $its[0];
  $month[0] = $its[1];
  $day[0] =   $its[2];
  open(DAM,">/export/raid2/koshida/MRR/data/prg/read_mrr2/dammy.txt");
  print DAM "Now  :$it[0] $it[1] $it[2] $it[3] $it[4]\n";
  print DAM "start:$year[0] $month[0] $day[0] $its[3] $its[4]\n";
  print DAM "end  :$ite[0] $ite[1] $ite[2] $ite[3] $ite[4]\n";
  close(DAM);
  open(DATE,">/export/raid2/koshida/MRR/data/prg/read_mrr2/ccyymmdd.txt");
  print DATE "$year[0] $month[0] $day[0] \n";
  close(DATE);
  $ccyymmdd = sprintf("%4d%02d%02d",$its[0],$its[1],$its[2]);
  $ccyymm=sprintf("%04d%02d",$its[0],$its[1]);
}
