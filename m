Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7465E0030F
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 03:00:40 -0800 (PST)
Received: by werb10 with SMTP id b10so324285wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 03:00:39 -0800 (PST)
Received: by 10.216.133.104 with SMTP id p82mr671872wei.6.1327575639257;
	Thu, 26 Jan 2012 03:00:39 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id t6sm4786976wid.1.2012.01.26.03.00.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 03:00:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 26 Jan 2012 12:00:32 +0100
Message-Id: <1327575633-10152-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] libgles-omap3: enable X11 windowing system when installing the X11 WS subpackage
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
X-List-Received-Date: Thu, 26 Jan 2012 11:00:41 -0000

The X11 WS is not installed by default, but currently won't work when being manually installed. This change has no effect existing X11-less installs/images/tasks.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 016b991..3f792b1 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r22"
+PR = "r23"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -363,6 +363,9 @@ rm -f ${sysconfdir}/powervr-esrev
 
 pkg_postinst_${PN}-x11wsegl() {
 rm -f ${sysconfdir}/powervr-esrev
+
+echo "[default]" > $D${sysconfdir}/powervr.ini
+echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
 }
 
 pkg_postinst_${PN}-driwsegl() {
-- 
1.7.2.5


