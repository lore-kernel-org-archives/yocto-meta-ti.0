Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D355EE00828; Fri,  9 Jan 2015 10:51:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA7F8E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 10:50:49 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NHX007BPB0H6480@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 09 Jan 2015 12:50:42 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=D9vw8UVm c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=BSHzg4BSgSTw8O1X764A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1E4CF20154;	Fri,
	9 Jan 2015 13:50:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 09 Jan 2015 13:50:40 -0500
Message-id: <1420829440-26225-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot 2015.01: prepare recipe for upcoming mainline 2015.01 release
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
X-List-Received-Date: Fri, 09 Jan 2015 18:51:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2015.01.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot_2015.01.bb

diff --git a/recipes-bsp/u-boot/u-boot_2015.01.bb b/recipes-bsp/u-boot/u-boot_2015.01.bb
new file mode 100644
index 0000000..ee02107
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2015.01.bb
@@ -0,0 +1,27 @@
+require u-boot-ti.inc
+
+# DEPEND on dtc-native for mainline u-boot because the mainline u-boot depends
+# on some of the latest syntax constructs for an appended in dtb used for
+# items like secure boot/image signing.
+DEPENDS += "dtc-native"
+
+DESCRIPTION = "Mainline u-boot bootloader"
+
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
+
+PV = "2014.10+2015.01-rc4"
+
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+# Corresponds to tag v2015.01-rc4 plus more fixes
+SRCREV = "b188067f39627d977bb1db67c8456e9aaab90743"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
+
+SPL_BINARY_omapl138 = ""
+SPL_UART_BINARY_omapl138 = ""
-- 
2.2.0


