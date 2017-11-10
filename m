Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D123E00CF1; Fri, 10 Nov 2017 14:25:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81CC6E00CEC
	for <meta-ti@yoctoproject.org>; Fri, 10 Nov 2017 14:25:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A221120A40;
	Fri, 10 Nov 2017 22:25:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fiWr4fsP39sl; Fri, 10 Nov 2017 22:25:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81EE2207BA;
	Fri, 10 Nov 2017 22:25:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 022CE162717;
	Fri, 10 Nov 2017 17:25:55 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Nov 2017 17:25:55 -0500
Message-Id: <1510352755-9293-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] wl18xx-target-scripts: replace /system/bin/sh with /bin/sh in one script
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
X-List-Received-Date: Fri, 10 Nov 2017 22:25:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...stat.sh-replace-system-bin-sh-with-bin-sh.patch | 23 ++++++++++++++++++++++
 .../wl18xx-target-scripts_8.7.1.bb                 |  8 ++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch

diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
new file mode 100644
index 0000000..c0719e3
--- /dev/null
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
@@ -0,0 +1,23 @@
+From ba1ac3862c8c3b2dbb615dc342b7fb1eaa96900f Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 17:02:39 -0500
+Subject: [PATCH] print_stat.sh: replace /system/bin/sh with /bin/sh
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ testing/print_stat.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testing/print_stat.sh b/testing/print_stat.sh
+index 681a063..0a519f6 100755
+--- a/testing/print_stat.sh
++++ b/testing/print_stat.sh
+@@ -1,4 +1,4 @@
+-#!/system/bin/sh
++#!/bin/sh
+ 
+ PHY=`ls /sys/class/ieee80211/`
+ mkdir -p /debug
+-- 
+2.7.4
+
diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
index 07a164b..49ac4c9 100644
--- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c
 # Tag: R8.7_SP1 (8.7.1)
 SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
 BRANCH = "sitara-scripts"
-SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
+file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
+"
+
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
@@ -14,7 +18,7 @@ FILES_${PN} += "${datadir}/wl18xx/"
 do_install() {
 	install -d ${D}${datadir}/wl18xx/
 
-	scripts=`find ./ -type f -name "*.*"`
+	scripts=`find ./* -type f -name "*.*"`
 	for s in $scripts
 	do
 		install -m 0755 $s ${D}${datadir}/wl18xx/
-- 
2.7.4


