resource cacao-backup {
    protocol            A;
    device              /dev/drbd9;
    flexible-meta-disk  internal;


    syncer {
        c-plan-ahead    100;
        c-max-rate      30M;
    }

    disk {
        al-extents 150;
    }

    handlers {
        after-resync-target "/usr/local/bin/drbd-after-sync-create-snapshot.sh |
           > /tmp/.cacao-backup.after-resync-handler.log 2>&1";
    }

    net {
        verify-alg      "crc32";
        shared-secret   "some-value";
        cram-hmac-alg   "sha1";
    }

    on cacao {
        address         10.3.7.1:7609;
        disk            /dev/sda2;
    }

    on beverages {
        address         10.3.7.44:7609;
        disk            /dev/backup/cacao.bac;
    }
}
