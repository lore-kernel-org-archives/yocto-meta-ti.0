Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76D24E006D3
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 19:03:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BBCFA52A6A; Fri, 22 Nov 2013 03:03:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122030352.BBCFA52A6A@arago-project.org>
Date: Fri, 22 Nov 2013 03:03:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3: update cputype to support 3. 12 and AM43x device
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
X-List-Received-Date: Fri, 22 Nov 2013 03:03:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 5ae405999c4fde790e68379d1b744a2173645872
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5ae405999c4fde790e68379d1b744a2173645872

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov 21 21:03:16 2013 -0500

libgles-omap3: update cputype to support 3.12 and AM43x device

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3/cputype     |   18 +++++++++++++-----
 .../libgles/libgles-omap3_5.00.00.01.bb            |    2 +-
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3/cputype b/recipes-graphics/libgles/libgles-omap3/cputype
index 4448c30..35268a8 100755
--- a/recipes-graphics/libgles/libgles-omap3/cputype
+++ b/recipes-graphics/libgles/libgles-omap3/cputype
@@ -1,17 +1,25 @@
 #!/bin/sh
 
-machine_id() { # return the machine ID
+legacy_machine_id() { # return the machine ID
 	awk 'BEGIN { FS=": " } /Hardware/ \
 		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
 }
 
-if [ "$(machine_id)" = "ti8168evm" ] ; then
+machine_id() { # return the machine ID
+	cat /proc/cpuinfo | grep Hardware | awk -F" " '{ print $4 }'
+}
+
+if [ "$(machine_id)" = "ti8168evm" -o "$(legacy_machine_id)" = "ti8168evm" ] ; then
 	echo TI816x
-elif [ "$(machine_id)" = "am335xevm" ] ; then
-    echo TI33XX
+elif [ "$(machine_id)" = "AM33XX" -o "$(legacy_machine_id)" = "am335xevm" ] ; then
+	echo TI33XX
+elif [ "$(machine_id)" = "AM43" ] ; then
+	echo TI43XX
 else
 	devmem2 0x4800244c | \
 	grep 'Read at address' | \
 	sed -e 's/.*): //' | \
-	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e 's/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e 's/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e 's/0x00000CC0/OMAP3530/'
+	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' \
+		-e 's/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e 's/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' \
+		-e 's/0x00000CC0/OMAP3530/'
 fi
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
index be09ffa..7af67eb 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
 
 LICENSE = "TSPA"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 


