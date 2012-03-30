Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A3D8E00596
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 16:11:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DBD7B52A74; Fri, 30 Mar 2012 23:11:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330231125.DBD7B52A74@arago-project.org>
Date: Fri, 30 Mar 2012 23:11:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2.13
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 23:11:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7df8fc578b63662ec03ad3e69ecc6f04f7d77fb8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7df8fc578b63662ec03ad3e69ecc6f04f7d77fb8

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Mar 26 08:52:27 2012 -0500

linux-ti33x-psp 3.2: update to 3.2.13

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...neo1973-fix-neo1973-wm8753-initialization.patch |   42 +++
 ...altek-Apply-the-coef-setup-only-to-ALC269.patch |   56 ++++
 .../0003-aio-fix-io_setup-io_destroy-race.patch    |   54 ++++
 .../0004-aio-fix-the-too-late-munmap-race.patch    |   81 ++++++
 .../0005-x86-Derandom-delay_tsc-for-64-bit.patch   |   63 +++++
 ...pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch |   38 +++
 ...ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch |   40 +++
 .../3.2.12/0008-rt2x00-fix-random-stalls.patch     |   99 +++++++
 ...x-local-vs-remote-memory-events-for-NHM-W.patch |  222 +++++++++++++++
 ...-Do-not-kmalloc-under-the-flocks-spinlock.patch |  140 ++++++++++
 .../0011-vfs-fix-return-value-from-do_last.patch   |   34 +++
 ...12-vfs-fix-double-put-after-complete_walk.patch |   35 +++
 ...cer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch |   77 ++++++
 .../0014-atl1c-dont-use-highprio-tx-queue.patch    |   51 ++++
 ...neighbour-Fixed-race-condition-at-tbl-nht.patch |   48 ++++
 ...ec-be-careful-of-non-existing-mac-headers.patch |  144 ++++++++++
 ...ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch |   90 ++++++
 ...ignment-of-ip_summed-for-pre-allocated-sk.patch |   56 ++++
 ...alse-reordering-signal-in-tcp_shifted_skb.patch |   72 +++++
 .../0020-vmxnet3-Fix-transport-header-size.patch   |   58 ++++
 .../0021-packetengines-fix-config-default.patch    |   33 +++
 ...-corrupted-IP-fragments-fix-for-large-mtu.patch |   49 ++++
 ...ragment-SACKed-skbs-in-tcp_mark_head_lost.patch |   55 ++++
 ...-check-return-value-of-ipv6_dev_get_saddr.patch |   39 +++
 ..._shift_skb_data-to-not-shift-SACKed-data-.patch |   89 ++++++
 ...t-join-all-router-mcast-group-when-forwar.patch |   36 +++
 .../0027-usb-asix-Patch-for-Sitecom-LN-031.patch   |   36 +++
 ...ix-setting-selector-in-tps6524x-set_volta.patch |   33 +++
 ...ULL-pointer-dereference-in-sd_revalidate_.patch |  170 ++++++++++++
 ...fix-pointer-math-issue-getting-fw-version.patch |   34 +++
 ...-__blkdev_get-and-add_disk-race-condition.patch |  163 +++++++++++
 ...-freezable-workqueue-for-disk-event-polli.patch |  129 +++++++++
 ...sparc32-Add-Av8-to-assembler-command-line.patch |   40 +++
 ...7ehf-Fix-writing-into-fan_stop_time-for-N.patch |   35 +++
 ...3627ehf-Fix-memory-leak-in-probe-function.patch |   53 ++++
 ...-w83627ehf-Fix-temp2-source-for-W83627UHG.patch |   69 +++++
 ...721-fix-bug-in-register-offset-definition.patch |  103 +++++++
 ...t-Fix-spurious-SCL-timeouts-under-heavy-l.patch |   46 ++++
 ...t-Fix-reservation-conflict-EBUSY-response.patch |   51 ++++
 ...compatible-reservation-handling-CRH-1-wit.patch |  152 +++++++++++
 ...0-Enable-interval-between-chip-accesses-f.patch |   72 +++++
 .../3.2.12/0042-Linux-3.2.12.patch                 |   24 ++
 ...NULL-pointer-dereference-in-nilfs_load_su.patch |   62 +++++
 .../0002-afs-Read-of-file-returns-EBADMSG.patch    |   56 ++++
 ...-Remote-abort-can-cause-BUG-in-rxrpc-code.patch |   68 +++++
 ...Incorrect-use-of-snprintf-results-in-SEGV.patch |   66 +++++
 ...perf-tools-Use-scnprintf-where-applicable.patch |  283 ++++++++++++++++++++
 .../3.2.13/0006-tcp-fix-syncookie-regression.patch |  111 ++++++++
 ...Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch |   36 +++
 ...-possible-il-txq-NULL-pointer-dereference.patch |   63 +++++
 ...c-Fix-SMP-kernels-on-pre-core99-UP-machin.patch |   36 +++
 .../3.2.13/0010-Linux-3.2.13.patch                 |   24 ++
 recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh  |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   52 ++++
 55 files changed, 3870 insertions(+), 2 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=7df8fc578b63662ec03ad3e69ecc6f04f7d77fb8

