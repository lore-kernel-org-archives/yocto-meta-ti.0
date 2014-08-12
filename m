Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC7F8E0079A; Tue, 12 Aug 2014 11:21:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1C43E00796
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 11:21:46 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NA700543HNUV5C0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Aug 2014 13:21:45 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 39A6A20015; Tue,
	12 Aug 2014 14:21:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 12 Aug 2014 14:21:29 -0400
Message-id: <1407867689-22855-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] am33x-cm3: update with version 1.8.7
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
X-List-Received-Date: Tue, 12 Aug 2014 18:21:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Move repo to git.ti.com
* Bump PE due to versioning schema change

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/am33x-cm3/am33x-cm3_git.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index 42f20da..97c45ad 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "05.00.00.03"
-PR = "r1"
+PV = "1.8.7"
+PR = "r0"
+PE = "1"
 
 # Make package machine specific due to different init scripts
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# SRCREV corresponds to tag v05.00.00.03
-SRCREV = "a0ddffb63147e2079a08944c0e399c75538201a9"
-BRANCH ?= "master"
+SRCREV = "fb0117edd5810a8d3bd9b1cd8abe34e12ff2d0ba"
+BRANCH ?= "next"
 
 # This init script is only used for older kernels that do not support
 # hotplug of the firmware.  Newer kernels do not require the initscript
@@ -25,7 +25,7 @@ UPDATERCPN = "${PN}-initscript"
 
 RDEPENDS_${PN}-initscript = "am33x-cm3"
 
-SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH} \
            file://init-am33x-cm3 \
            file://init-am43x-cm3 \
           "
@@ -41,7 +41,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware
-	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
+	install -m 0644 bin/am335x-pm-firmware.elf ${D}${base_libdir}/firmware/
 
 	# Install the init script to load the PM firmware at boot
 	install -d ${D}${sysconfdir}/init.d
-- 
2.0.4


