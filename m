Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE51EE009C1; Mon, 20 Apr 2015 13:20:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5534DE00952
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 13:20:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B9BCD5297F; Mon, 20 Apr 2015 20:20:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150420202002.B9BCD5297F@arago-project.org>
Date: Mon, 20 Apr 2015 20:20:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 1.0.6.0
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
X-List-Received-Date: Mon, 20 Apr 2015 20:20:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 44b0f284c51f831d66b21c33809890247d05234c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=44b0f284c51f831d66b21c33809890247d05234c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Apr 13 20:38:49 2015 +0000

mpm-transport: Update to new version 1.0.6.0

- Add new transport using qmss, srio modules
- Update new dependency on cmem, rm-lld, qmss-lld, cppi-lld & srio-lld

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index cb0f6c4..fd68721 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -1,22 +1,29 @@
 DESCRIPTION = "Multiproc transport layer for KeyStone devices: Provide basic transport layer for moving data between different processing nodes"
 HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/mpm-transport.git"
 LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE = "keystone"
-DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld"
+DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld srio-lld"
 
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.06.00
-SRCREV = "af2d2ad8721b769012662c539a86b94f7d44dbda"
-PV = "1.0.6.0"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-01.00.07.00A
+SRCREV = "267db40a9c551bd91dbed470d57cd1ed0d9e9141"
+
+PV = "1.0.7.0"
 PR = "r1"
 
 S = "${WORKDIR}/git"
 
 PACKAGES =+ "${PN}-test"
-FILES_${PN}-test = "${bindir}/mpm_transport_test.out ${bindir}/mpm_transport_hyplnk_loopback.out ${bindir}/mpm_transport_hyplnk_remote.out ${bindir}/mpm_transport_hyplnk_loopback_dma.out ${bindir}/mpm_transport_hyplnk_loopback64.out"
+FILES_${PN}-test = "${bindir}/mpm_transport_test.out \
+					${bindir}/mpm_transport_hyplnk_loopback.out \
+					${bindir}/mpm_transport_hyplnk_remote.out \
+					${bindir}/mpm_transport_hyplnk_loopback_dma.out \
+					${bindir}/mpm_transport_hyplnk_loopback64.out \
+					${bindir}/mpm_transport_qmss_arm_mt.out \
+					${bindir}/mpm_transport_srio_arm_mt.out"
 
 do_compile () {
 	cd ${S}


