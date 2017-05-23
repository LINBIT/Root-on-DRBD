include "global_common.conf";

resource r-o-d {
    protocol                  C;
    device                    /dev/drbd13;

    disk {
        resync-rate           1G;
        c-plan-ahead          100;
        c-max-rate            1G;
    }

    net {
        shared-secret         "81019a4c-4121-46b0-b85c-50981964ae79";
        cram-hmac-alg         sha1;
        verify-alg            md5;
    }

    on c7-RoD {
        disk                  /dev/centos_c7-rod/root;
        flexible-meta-disk    internal;
        address               10.43.6.163:7613;
    }

    on very {
        disk                  /dev/system/centos7-root;
        flexible-meta-disk    internal;
        address               10.43.57.44:7613;
    }
}
