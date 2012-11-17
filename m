Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A353E003DA
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 19:52:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D047152A86; Sat, 17 Nov 2012 03:52:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121117035209.D047152A86@arago-project.org>
Date: Sat, 17 Nov 2012 03:52:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : libgles-omap3: Verify pvrsrvkm module was found
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
X-List-Received-Date: Sat, 17 Nov 2012 03:52:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e63ef280726af5f0d5d4a0bde825c9182897a94e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e63ef280726af5f0d5d4a0bde825c9182897a94e

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Fri Nov 16 13:19:42 2012 -0600

libgles-omap3: Verify pvrsrvkm module was found

* Check to see if the pvrsrvkm.ko module was found and that the insmod
  for that module was successful.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc    |    2 +-
 recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 599070d..cb96e4f 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r34"
+PR = "r35"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index 00cd994..e5a4cd1 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)
 sgxprepare () {
 	echo Starting PVR
 	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+    if [ "$?" != "0" ]
+    then
+        echo "Could not find pvrsrvkm driver"
+        exit 1
+    fi
+
 	modprobe omaplfb
 	modprobe bufferclass_ti
 


