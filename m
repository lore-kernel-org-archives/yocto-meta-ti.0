Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E539E00BFD; Mon, 16 Jun 2014 15:38:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 455F5E00BFD
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 15:38:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2DDEC529F5; Mon, 16 Jun 2014 22:38:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140616223843.2DDEC529F5@arago-project.org>
Date: Mon, 16 Jun 2014 22:38:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : u-boot: Add mainline u-boot version 2014.07-rc3
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
X-List-Received-Date: Mon, 16 Jun 2014 22:38:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7c5088b0d0d1e624edf1116c36dc175c7d63eb34
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7c5088b0d0d1e624edf1116c36dc175c7d63eb34

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Sat Jun 14 03:55:54 2014 +0000

u-boot: Add mainline u-boot version 2014.07-rc3

* The latest mainline u-boot works well for most TI devices and
  we want to enable more people to use and test it.  Adding
  version 2014.07-rc3 will allow more people to build and use this
  u-boot version
* Add a dependency on dtc-native since the latest mainline of u-boot
  now requires this and not every build host will have the right
  version.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2014.07.bb |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
new file mode 100644
index 0000000..b326aa1
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
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
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+
+# This is still an RC so set the PV accordingly to allow proper version
+# ordering when the RC is dropped.
+PV = "2014.04+2014.07-rc3"
+PR = "r0"
+
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+# Corresponds to tag v2014.07-rc3
+SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"


