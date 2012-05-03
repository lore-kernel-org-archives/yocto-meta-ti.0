Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9E6EE00723
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 21:36:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 20E2152AAB; Thu,  3 May 2012 04:36:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120503043614.20E2152AAB@arago-project.org>
Date: Thu,  3 May 2012 04:36:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : libgles-omap3: work around bug in opkg
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 04:36:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6014fc75c0663e13c1272d0f66ff1cd7caceba80
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6014fc75c0663e13c1272d0f66ff1cd7caceba80

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May  2 14:33:26 2012 +0200

libgles-omap3: work around bug in opkg

All the EGL_BADALLOC failures that user have been reporting turn out to be
a bug in opkg:
http://groups.google.com/group/opkg-devel/browse_thread/thread/741d18b0ef31435e#

Opkg decides to relink symlinks to the wrong files. As a workaround we check
the symlink during every bootup and fix it if needed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc    |    2 +-
 recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index c64a882..664a649 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r30"
+PR = "r31"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index 07efa66..00cd994 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -61,6 +61,12 @@ sgxprepare () {
 }
 
 sgxfinish () {
+	# Fix up a bug in opkg
+	if [ $(readlink /usr/lib/libsrv_um.so) != $(readlink /usr/lib/libsrv_um.so.1) ] ; then
+		cd /usr/lib
+		ln -sf $(readlink /usr/lib/libsrv_um.so.1) libsrv_um.so
+	fi
+
 	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
 		echo -n "Starting SGX fixup for"
 		echo " ES${ES_REVISION}.x"
@@ -68,6 +74,7 @@ sgxfinish () {
 		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin
 		echo "${ES_REVISION}" > /etc/powervr-esrev
 	fi
+
 	/usr/bin/pvrsrvinit
 }
 


