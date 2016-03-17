# NAME

Net::Amazon::SNS::Signature

# DESCRIPTION

For the verification of Amazon SNS messages

# USAGE

    # Will automatically download the certificate using LWP::UserAgent->get
    my $sns_signature = Net::Amazon::SNS::Signature->new( message => $message_ref );
    if ( $sns_signature->verify() ){
        ...
    }

    # Provide the certificate yourself
    my $sns_signature = Net::Amazon::SNS::Signature->new( message => $message_ref, certificate => $public_key );
    if ( $sns_signature->verify() ){
        ...
    }

## verify

Call to verify the message, `$message` is required as first parameter, `$cert` is
optional and should be a raw x509 certificate as downloaded from Amazon.

## build\_sign\_string

Given a `$message_ref` will return a formatted string ready to be signed.

Usage:

    my $sign_string = $this->build_sign_string({
        Message     => 'Hello',
        MessageId   => '12345',
        Subject     => 'I am a message',
        Timestamp   => '2016-01-20T14:37:01Z',
        TopicArn    => 'xyz123',
        Type        => 'Notification'
    });
