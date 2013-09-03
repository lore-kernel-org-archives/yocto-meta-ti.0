Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8A19E00734
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:08:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 56AA252A6D; Tue,  3 Sep 2013 17:08:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130903170809.56AA252A6D@arago-project.org>
Date: Tue,  3 Sep 2013 17:08:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3-x11: do not fail if pvr-init is not yet installed
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
X-List-Received-Date: Tue, 03 Sep 2013 17:08:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2b3f2c2939e2abea1513df5218d31d9949011bca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2b3f2c2939e2abea1513df5218d31d9949011bca

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 31 22:03:57 2013 -0400

libgles-omap3-x11: do not fail if pvr-init is not yet installed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 .../libgles/libgles-omap3-x11_4.09.00.01.bb        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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


