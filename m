Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1974DE00968; Fri,  9 Jan 2015 11:50:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9BCFE00828
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 11:50:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C8EF552A09; Fri,  9 Jan 2015 19:50:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150109195042.C8EF552A09@arago-project.org>
Date: Fri,  9 Jan 2015 19:50:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot 2015.01: prepare recipe for upcoming mainline 2015.01 release
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
X-List-Received-Date: Fri, 09 Jan 2015 19:50:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 147207eb6c6a1716239d68c0ad9f838ec870d766
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=147207eb6c6a1716239d68c0ad9f838ec870d766

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jan 10 00:50:40 2015 +0000

u-boot 2015.01: prepare recipe for upcoming mainline 2015.01 release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2015.01.bb |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

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


