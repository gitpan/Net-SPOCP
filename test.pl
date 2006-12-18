# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 1 };
use Net::SPOCP qw(:all);
ok(1); # If we made it this far, we're ok.

#########################

my $e1 = Net::SPOCP::SExpr->new(spocp=>
				[resource=>[file=>'etc','groups']],
				[action=>'read'],
				[subject=>[uid=>100]]);

ok(2);

my $e2 = Net::SPOCP->rule(resource => spocp_split_parts('/','internal','foo/index.html','-'),
			  action   => [0,1],
			  subject  => spocp_map(ip=>'130.237.95.42',
						host=>'trurl.it.su.se',
						sslver=>300,
						user=>'leifj',
						authname=>'foo',
						authtype=>'Basic'));


ok(3);
print $e1->toString(),"\n";
ok(4);
print $e2->toString(),"\n";
ok(5);
my $client = Net::SPOCP::Client->new(server=>'auth2.su.se:3456');
ok(6);
my $res = $client->query([test => [host => 'trurl.it.su.se'],[uid => 'leifj']]);
ok(7);
printf "%s\n",$res->error;
printf "%s\n",$res->code;
ok(8);
# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.
