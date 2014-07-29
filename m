Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E0C5E007B5; Tue, 29 Jul 2014 16:54:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E1DBE003FA
	for <meta-ti@yoctoproject.org>; Tue, 29 Jul 2014 16:54:01 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9H007W3ZPCP8F0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 29 Jul 2014 18:53:42 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BDB2A2001F; Tue,
	29 Jul 2014 19:53:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 29 Jul 2014 19:53:36 -0400
Message-id: <1406678016-10376-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH v2] u-boot-ti-staging: add TI staging version of u-boot 2014.07
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
X-List-Received-Date: Tue, 29 Jul 2014 23:54:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Mainline version of 2014.07 will be pushed to mainline OE-Core soon.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - add DEPENDS on dtc-native

 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
new file mode 100644
index 0000000..d9c3787
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -0,0 +1,21 @@
+require u-boot-ti.inc
+
+# u-boot needs devtree compiler to parse dts files
+DEPENDS += "dtc-native"
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+
+PV = "2014.07"
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "ti-u-boot-2014.07"
+
+# Corresponds to tag ti2014.07
+SRCREV = "053adddee4c97315059e08d4b3f5ebd264ed295f"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.0.2


