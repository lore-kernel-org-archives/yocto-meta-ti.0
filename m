Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 159D7E007DC; Tue, 29 Jul 2014 17:50:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEC1FE003FA
	for <meta-ti@yoctoproject.org>; Tue, 29 Jul 2014 17:50:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 739A652A63; Wed, 30 Jul 2014 00:50:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140730005029.739A652A63@arago-project.org>
Date: Wed, 30 Jul 2014 00:50:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: add TI staging version of u-boot 2014.07
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
X-List-Received-Date: Wed, 30 Jul 2014 00:50:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 26e782c71aa9916e259b834c6824d8a0633c58a9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=26e782c71aa9916e259b834c6824d8a0633c58a9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jul 30 05:53:36 2014 +0000

u-boot-ti-staging: add TI staging version of u-boot 2014.07

Mainline version of 2014.07 will be pushed to mainline OE-Core soon.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

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


