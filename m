Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79E34E00569
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 07:58:14 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJFwEJn021835
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 09:58:14 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJFwEFB020624
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 09:58:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 09:58:14 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJFw35B006410;
	Tue, 19 Nov 2013 09:58:12 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Nov 2013 10:59:11 -0600
Message-ID: <1384880351-6571-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1384880351-6571-1-git-send-email-fcooper@ti.com>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libgles-omap3: Update cputype to support 3.12 and new device.
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
X-List-Received-Date: Tue, 19 Nov 2013 15:58:15 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../libgles/libgles-omap3-x11_5.00.00.01.bb        |    2 +-
 recipes-graphics/libgles/libgles-omap3/cputype     |   25 ++++++++++++-------
 .../libgles/libgles-omap3_5.00.00.01.bb            |    2 +-
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
index df53306..0bcf08c 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3-x11.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes-graphics/libgles/libgles-omap3/cputype b/recipes-graphics/libgles/libgles-omap3/cputype
index 4448c30..de534a8 100755
--- a/recipes-graphics/libgles/libgles-omap3/cputype
+++ b/recipes-graphics/libgles/libgles-omap3/cputype
@@ -1,17 +1,24 @@
 #!/bin/sh
 
+
+legacy_machine_id() { # return the machine ID
+        awk 'BEGIN { FS=": " } /Hardware/ \
+                { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+}
+
 machine_id() { # return the machine ID
-	awk 'BEGIN { FS=": " } /Hardware/ \
-		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+        cat /proc/cpuinfo | grep Hardware | awk -F" " '{ print $4 }'
 }
 
-if [ "$(machine_id)" = "ti8168evm" ] ; then
-	echo TI816x
-elif [ "$(machine_id)" = "am335xevm" ] ; then
+if [ "$(machine_id)" = "ti8168evm" -o "$(legacy_machine_id)" = "ti8168evm" ] ; then
+        echo TI816x
+elif [ "$(machine_id)" = "AM33XX" -o "$(legacy_machine_id)" = "am335xevm" ] ; then
     echo TI33XX
+elif [ "$(machine_id)" = "AM43" ] ; then
+    echo TI43XX
 else
-	devmem2 0x4800244c | \
-	grep 'Read at address' | \
-	sed -e 's/.*): //' | \
-	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e 's/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e 's/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e 's/0x00000CC0/OMAP3530/'
+    devmem2 0x4800244c | \
+    grep 'Read at address' | \
+    sed -e 's/.*): //' | \
+    sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e 's/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e 's/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e 's/0x00000CC0/OMAP3530/'
 fi
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
index de6ba55..cb96ca7 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4


