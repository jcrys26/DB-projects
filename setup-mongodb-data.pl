#!/usr/bin/perl

use strict;
use warnings;

use MongoDB;
use Data::Dumper;

my $username = "db_user";
my $password = "db_pass";
my $database = "yt_data";

my $mc = MongoDB::MongoClient->new(
    username => "$username",
    password => "$password",
    db_name  => "$database"
) or die ("Failed to create MongoClient.\n");

my $db = $mc->get_database("$database");

my @input_data = (
    {
        title  => "Setting up nodes table\n",
        file   => "YT-data/nodes.csv",
        table  => "nodes",
        fields => ["id"],
    },
    {
        title  => "Setting up groups table\n",
        file   => "YT-data/groups.csv",
        table  => "groups",
        fields => ["id"],
    },
    {
        title  => "Setting up edges table\n",
        file   => "YT-data/edges.csv",
        table  => "edges",
        fields => ["node1", "node2"]
    },
    {
        title  => "Setting up group-edges table\n",
        file   => "YT-data/group-edges.csv",
        table  => "group_edges",
        fields => ["group_id", "node_id"],
    },
);

my %in_data;
my $process;
my $file;
my $fh;
my $collection;
my $coll;
my $fields;

foreach my $in_data (@input_data) {
    $process = $in_data->{title};
    $collection = $in_data->{table};
    $file = $in_data->{file};
    $fields = $in_data->{fields};
    
    print $process;
    
    open($fh, "<", $file) or die "Can't open $file\n";

    $coll = $db->get_collection("$collection");
    $coll->drop;

    my @input;
    while (<$fh>) {
        chomp($_);
        @input = split(/,/,$_);
        my %data;
        my $i = 0;
        foreach my $key (@$fields) {
            $data{$key} = $input[$i];
            $i++;
        }
        $coll->insert_one( \%data );
    }
}

