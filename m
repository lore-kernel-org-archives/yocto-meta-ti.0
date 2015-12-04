Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9703CE009AD; Fri,  4 Dec 2015 14:15:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 658ABE00948
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 14:15:39 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYU00F72TTJOT00@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 04 Dec 2015 16:15:20 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=-hBVzlJ2wXB_Bp5hjOgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BAB2A161D36;	Fri,
	4 Dec 2015 17:15:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 04 Dec 2015 17:15:15 -0500
Message-id: <1449267317-27742-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] ti-sci-fw: rename PMMC firmware to TI SCI and update to the latest
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
X-List-Received-Date: Fri, 04 Dec 2015 22:15:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{pmmc-fw/pmmc-fw_git.bb => ti-sci-fw/ti-sci-fw_git.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-bsp/{pmmc-fw/pmmc-fw_git.bb => ti-sci-fw/ti-sci-fw_git.bb} (82%)

diff --git a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
similarity index 82%
rename from recipes-bsp/pmmc-fw/pmmc-fw_git.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 8d86234..4294c6b 100644
--- a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "PMMC firmware"
+DESCRIPTION = "TI SCI firmware"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.0.63"
+PV = "0.1.0.70"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,13 +12,13 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
+SRCREV = "a5b1c3d043fef5869eaa937276976c0e3e23b966"
 BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-TARGET = "pmmc-firmware.bin"
+TARGET = "ti-sci-firmware-k2g.bin"
 
 do_install() {
 	install -d ${D}/boot
-- 
2.2.0


