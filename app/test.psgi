use Plack::Builder;
use Plack::Request;









my $length = 4000;
my $body = 'x'x$length;

builder {
    enable 'AccessLog', logger => sub { };
    sub {
        my $env = shift;
        my $req = Plack::Request->new($env);
        my @params = $req->param('foo');
        my $res = $req->new_response(200);
        $res->content_type('text/plain');
        $res->content_length($length);
        $res->body($body);
        $res->finalize;
    }
};
