#!/usr/bin/perl

use strict;
use warnings;

use DBI;

my $dsn = "DBI:mysql:yt_data";
my $username = "db_user";
my $password = "db_pass";

my $dbh = DBI->connect($dsn, $username, $password) or die ("Unable to connect to database.\n");

my @input_data = (
    {
        title  => "Setting up nodes table\n",
        file   => "YT-data/nodes.csv",
        table  => "nodes",
        fields => { id => "INT" },
    },
    {
        title  => "Setting up groups table\n",
        file   => "YT-data/groups.csv",
        table  => "groups",
        fields => { id => "INT" },
    },
    {
        title  => "Setting up edges table\n",
        file   => "YT-data/edges.csv",
        table  => "edges",
        fields => { node1 => "INT",
                    node2 => "INT"},
    },
    {
        title  => "Setting up group-edges table\n",
        file   => "YT-data/group-edges.csv",
        table  => "group_edges",
        fields => { group_id => "INT",
                    node_id => "INT"},
    },
);

my %in_data;
my $process;
my $file;
my $fh;
my $table;
my $field_settings;
my $field;
my $sql_drop_table;
my $sql_create_table;
my $sql_insert_data;
my $sql;
my @data;

foreach my $in_data (@input_data) {
    $process = $in_data->{title};
    $table = $in_data->{table};
    $file = $in_data->{file};
    my @fields;
    my @db_fields;
    foreach my $key (keys %{$in_data->{fields}}) {
        push @db_fields, "$key $in_data->{fields}->{$key}";
        push @fields, $key;
    }
    $field_settings = join (", ", @db_fields);
    $field = join (", ", @fields);
    $sql_drop_table = "DROP TABLE IF EXISTS $table";
    $sql_create_table = "CREATE TABLE $table ( $field_settings ) ENGINE=InnoDB;";
    
    print $process;

    open($fh, "<", $file) or die "Can't open $file\n";

    $dbh->do($sql_drop_table) or die ("Unable to drop table $table from DB\n");

    $dbh->do($sql_create_table) or die ("Unable to create table $table in DB\n");

    while (<$fh>) {
        chomp($_);
        $sql_insert_data = "insert into $table ($field) values ($_)";
        $sql = $dbh->prepare($sql_insert_data);
        $sql->execute() or die ("Unable to insert record $_ in table $table\n$sql_insert_data\n");
    }
}

