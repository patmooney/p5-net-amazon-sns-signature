#!/usr/bin/env perl
use Test::Most;
use Path::Class ();
use_ok('Net::Amazon::SNS::Signature');

my $message = {
    'Message' => 'I am a message',
    'SignatureVersion' => '1',
    'Signature' => 'o9QVyuMPNphFdMUIW/lXqtWto0zJbUn84w/DV1sZG4fy9f3cBlvE0Le2QXVdoBqwrCCS6HpHjILZYMACrQRe6B5Y2zDXVaD5mZ7UcEMKtFy/5evpTemq+PamPh4GDcvtCl0be9DUbFeINBGwxwdxO+u+73LrBQrdi3tA/YyGiD+SoObtfbljb7aa4NCrly4+72l64WHTo6INzA/o+FsHqf5jD8o9OHxafgYTJYKXH6sSQmyLlCZbiC57PN2Jrk6SliumaTBiMgRPcXalEHmUfMEuUyGC+sGl+Lvg5rHjOyCzWkDPbnkusn+L7BOONMig/ef5YfkymBBoCSE+e4hQBQ==',
    'Timestamp' => '2016-03-15T12:08:48.856Z',
    'TopicArn' => 'arn:aws:sns:eu-west-1:12345:test',
    'Subject' => 'This is the subject',
    'MessageId' => '12345-abcdef',
    'Type' => 'Notification',
    'UnsubscribeURL' => 'http://www.example.com',
    'SigningCertURL' => 'http://www.example.com',
};

my $sns_sign = Net::Amazon::SNS::Signature->new();
my $string = Path::Class::file('t/share/cert.pem')->slurp();
is ( $sns_sign->verify( $message, $string ), 1 );

done_testing();
