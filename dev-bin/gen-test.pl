#!/usr/bin/env perl
use strict; use warnings;

use Path::Class;
use Crypt::OpenSSL::RSA;
use MIME::Base64;

# gen key/cert with `openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem`
use Net::SSLeay; # required to use 509 generated key
Net::SSLeay::OpenSSL_add_all_algorithms();

my $private_key_file = 'key.pem';
my $private_key_content = Path::Class::file($private_key_file)->slurp;
warn $private_key_content;
my $rsa = Crypt::OpenSSL::RSA->new_private_key( $private_key_content );

my $message = q{Message
I am a message
MessageId
12345-abcdef
Subject
This is the subject
Timestamp
2016-03-15T12:08:48.856Z
TopicArn
arn:aws:sns:eu-west-1:12345:test
Type
Notification
};

my $signature = $rsa->sign( $message );
print "\n\n" .  MIME::Base64::encode_base64( $signature, "" ) . "\n\n";
