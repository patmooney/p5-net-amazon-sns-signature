requires 'LWP::UserAgent';
requires 'Crypt::OpenSSL::RSA';
requires 'Crypt::OpenSSL::X509';

on test => sub {
    requires 'Test::Most';
};

on develop => sub {
    requires 'Net::SSLeay';
    requires 'Path::Class';
};
