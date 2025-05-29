#!/bin/bash

# Prerequisite check(s) for module.
check() {
    # Return 255 to only include the module, if another module
    # requires it.
    return 0
}

install() {
    inst_multiple \
        "$systemdsystemunitdir"/measure-pcr-validator.service \
        "$systemdutildir"/system-generators/measure-pcr-generator \
        /usr/libexec/measure-pcr-validator \
        cat grep kill mkdir openssl sleep

    $SYSTEMCTL -q --root "$initdir" enable measure-pcr-validator.service

    [ -f "/var/lib/sdbootutil/measure-pcr-public.pem" ] \
        && inst_simple "/var/lib/sdbootutil/measure-pcr-public.pem"
}
