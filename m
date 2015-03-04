Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26182E00754; Wed,  4 Mar 2015 10:30:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6017FE00754
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2015 10:30:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 24EC252A62; Wed,  4 Mar 2015 18:30:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150304183036.24EC252A62@arago-project.org>
Date: Wed,  4 Mar 2015 18:30:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update to new version of ipc 3.35.00.05
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
X-List-Received-Date: Wed, 04 Mar 2015 18:30:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9991516e5da2eff7cdd9cb76c619793156abbebd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9991516e5da2eff7cdd9cb76c619793156abbebd

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Mar  5 00:13:04 2015 +0000

ti-ipc: Update to new version of ipc 3.35.00.05

- Update license checksum
- Add support for k2hk, k2l & k2e evm.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

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


