Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.24550.1617408630774824358
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 076F640C88;
	Sat,  3 Apr 2021 00:10:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uc1VzQeU56lA; Sat,  3 Apr 2021 00:10:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF8FC40A77;
	Sat,  3 Apr 2021 00:10:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B977C174577;
	Fri,  2 Apr 2021 20:10:27 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 00/11] hardknott/master fixes
Date: Fri,  2 Apr 2021 20:09:52 -0400
Message-Id: <1617408603-2482-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Set of fixes for meta-ti hardknott/master

gcc10 "multiple definition" errors are currently suppressed. Proper fixing in
code is needed. Although, some components, like LLDs, are out of maintenance
and are considered for deprecation.

https://gcc.gnu.org/gcc-10/porting_to.html

Denys Dmytriyenko (11):
  Revert "optee-os: upgrade to upstream 3.11.0"
  ti-ipc-examples: fix deprecation of sys_errlist[] in glibc
  ti-img-rogue-driver: support OE toolchain alongside Poky one
  ti-ipc: suppress gcc10 multiple definitions of
    _GateHWSpinlock_cfgParams
  gdbc6x: suppress gcc10 multiple definitions of *_varobj_ops
  mpm-transport: suppress gcc10 multiple definiton of fw_qmss*
  {qmss,cppi,srio,pa,sa}-lld-test: suppress gcc10 multiple definition of
    fw_qmss*
  vis: suppress "ldflags" QA error
  edma3-lld: suppress ldflags QA error
  multiprocmgr-test: suppress ldflags and staticdev QA errors
  cuia: suppress installed-vs-shipped QA error

 recipes-bsp/cppi-lld/cppi-lld-test_git.bb          |  2 +
 recipes-bsp/cuia/cuia_1.0.0.13.bb                  |  2 +-
 recipes-bsp/edma3-lld/edma3-lld_git.bb             |  3 ++
 recipes-bsp/pa-lld/pa-lld-test_git.bb              |  2 +
 ...k-support-OE-toolchain-alongside-Poky-one.patch | 26 +++++++++
 .../ti-img-rogue-driver_1.13.5776728.bb            |  4 +-
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb          |  2 +
 recipes-bsp/sa-lld/sa-lld-test_git.bb              |  2 +
 recipes-bsp/srio-lld/srio-lld-test_git.bb          |  2 +
 recipes-bsp/vis-fw/vis_01.50.07.15.bb              |  1 +
 recipes-devtools/gdbc6x/gdbc6x_git.bb              |  2 +
 ...-provide-empty-__getauxval-implementation.patch | 62 ----------------------
 ...lement-support-for-libnames-after-libgcc-.patch | 55 -------------------
 ...mk-make-sure-that-libutils-is-linked-seco.patch | 44 ---------------
 ...6-allow-setting-sysroot-for-libgcc-lookup.patch | 34 ------------
 .../0007-allow-setting-sysroot-for-clang.patch     | 29 ----------
 recipes-security/optee/optee-os_%.bbappend         | 15 ------
 ...usterMgr-sys_errlist-has-been-deprecated-.patch | 40 ++++++++++++++
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb        |  2 +
 recipes-ti/ipc/ti-ipc.inc                          |  2 +
 recipes-ti/mpm-transport/mpm-transport_git.bb      |  1 +
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb   |  2 +
 22 files changed, 93 insertions(+), 241 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
 delete mode 100644 recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
 delete mode 100644 recipes-security/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.patch
 delete mode 100644 recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
 delete mode 100644 recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch

-- 
2.7.4

