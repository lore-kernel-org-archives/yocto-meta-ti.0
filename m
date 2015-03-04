Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5585DE00754; Wed,  4 Mar 2015 10:13:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF0C2E006EF
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2015 10:13:09 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24ID9em023769
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 12:13:09 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24ID7KE024942
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2015 12:13:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 12:13:07 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24ID7i1003744;	Wed, 4 Mar 2015 12:13:07 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 4 Mar 2015 13:13:04 -0500
Message-ID: <1425492784-18788-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Update to new version of ipc 3.35.00.05
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 18:13:18 -0000
Content-Type: text/plain

- Update license checksum
- Add support for k2hk, k2l & k2e evm.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc_git.bb |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 10ae431..6f46295 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -2,17 +2,18 @@ DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Mul
 HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f156e5eb9b0f3e202e48747f9a"
+LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.30.03.14"
+PV = "3.35.00.05"
 
-BRANCH = "3.30"
+BRANCH = "master"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            "
-SRCREV = "ff0ca0e3943ab67be47673bfc77f40c53daac078"
+# Commit corresponds to 3.35.00.05
+SRCREV = "ce35c999f5c3368e387740a38aef3358290579b3"
 
 S = "${WORKDIR}/git"
 
@@ -21,12 +22,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PLATFORM = "UNKNOWN"
 PLATFORM_omap5-evm = "OMAP54XX"
 PLATFORM_dra7xx = "DRA7XX"
-PLATFORM_keystone = "TCI6638"
+PLATFORM_k2hk-evm = "TCI6638"
+PLATFORM_k2l-evm = "TCI6630"
+PLATFORM_k2e-evm = "66AK2E"
 
 DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
 DAEMON_dra7xx = "lad_dra7xx"
-DAEMON_keystone = "lad_tci6638"
+DAEMON_k2hk-evm = "lad_tci6638"
+DAEMON_k2l-evm = "lad_tci6630"
+DAEMON_k2e-evm = "lad_66ak2e"
 
 inherit autotools pkgconfig update-rc.d
 
@@ -56,4 +61,3 @@ FILES_${PN}-test = " \
     ${bindir}/MessageQApp \
     ${bindir}/MessageQMulti \
     ${bindir}/ping_rpmsg"
-
-- 
1.7.9.5


