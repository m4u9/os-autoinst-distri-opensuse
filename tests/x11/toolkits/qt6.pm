# SUSE's openQA tests
#
# Copyright SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: Test UI toolkit: Qt6
# Maintainer: Dominik Heidler <dheidler@suse.de>

use base 'x11test';
use strict;
use warnings;
use testapi;

sub run {
    select_console 'x11';

    x11_start_program('xterm');
    assert_script_run 'cd data/toolkits';

    assert_script_run 'make qt6';
    script_run './qt6', 0;
    assert_screen 'ui-toolkit-qt6';
    wait_screen_change { send_key 'alt-f4' };
    assert_script_run '$(exit $?)';

    enter_cmd 'exit';
}

1;
