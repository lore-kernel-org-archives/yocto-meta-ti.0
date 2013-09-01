Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B1ABE01405
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:13:23 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSF00IK3FLVRZC0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 31 Aug 2013 22:13:08 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 52A8D2004C; Sat,
	31 Aug 2013 23:13:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Aug 2013 23:12:58 -0400
Message-id: <1378005180-30928-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1378005180-30928-1-git-send-email-denis@denix.org>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/5] libgles-omap3-x11: do not fail if pvr-init is not yet installed
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
X-List-Received-Date: Sun, 01 Sep 2013 03:13:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
index 1c70cae..b7e6ce0 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
@@ -61,7 +61,7 @@ do_install_append() {
     cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
     cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
 
-    rm ${D}${sysconfdir}/init.d/pvr-init
+    rm -f ${D}${sysconfdir}/init.d/pvr-init
 
     if [ "$SUPPORT_XORG" = "1" ]; then
         cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
-- 
1.8.3.2


