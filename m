Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80EECE009F0; Wed, 15 Feb 2017 12:15:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DAADE00992
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 12:15:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D77DA52A34; Wed, 15 Feb 2017 20:15:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170215201535.D77DA52A34@arago-project.org>
Date: Wed, 15 Feb 2017 20:15:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: add LCD-specific DTB entries for dra7/ am57/k2g
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
X-List-Received-Date: Wed, 15 Feb 2017 20:15:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty-next
Commit: c7c35e3a27a8250e2fea83f7528dcc6a30d33a91
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c7c35e3a27a8250e2fea83f7528dcc6a30d33a91

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Feb 15 12:31:58 2017 +0000

conf/machine: add LCD-specific DTB entries for dra7/am57/k2g

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-evm.conf |    4 ++--
 conf/machine/dra7xx-evm.conf |    8 ++++----
 conf/machine/k2g-evm.conf    |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index ec63418..eef98f2 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,8 +14,8 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
                     am57xx-evm.dtb am57xx-evm-reva3.dtb \
-                    am571x-idk.dtb \
-                    am572x-idk.dtb"
+                    am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-osd101t2587.dtb \
+                    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-osd101t2587.dtb"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 6049914..86d2dbf 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -12,10 +12,10 @@ SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-KERNEL_DEVICETREE = "dra7-evm.dtb \
-                    dra72-evm.dtb \
-                    dra72-evm-revc.dtb \
-                    dra71-evm.dtb"
+KERNEL_DEVICETREE = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2045.dtb dra7-evm-lcd-osd101t2587.dtb \
+                    dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd101t2045.dtb dra72-evm-lcd-osd101t2587.dtb \
+                    dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
+                    dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index b8e55e4..d7bf609 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa opencl"
 
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb"
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"
 
 UBOOT_MACHINE = "k2g_evm_config"
 


