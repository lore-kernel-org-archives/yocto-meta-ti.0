Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8053CE0059A
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 03:00:42 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so311860wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 03:00:41 -0800 (PST)
Received: by 10.180.101.161 with SMTP id fh1mr2616474wib.0.1327575641264;
	Thu, 26 Jan 2012 03:00:41 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm4737022wib.9.2012.01.26.03.00.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 03:00:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 26 Jan 2012 12:00:33 +0100
Message-Id: <1327575633-10152-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327575633-10152-1-git-send-email-koen@dominion.thruhere.net>
References: <1327575633-10152-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/2] libgles-omap3: make postinsts safe for offline-root usage (e.g. do_rootfs)
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
X-List-Received-Date: Thu, 26 Jan 2012 11:00:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 3f792b1..da3aeb8 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r23"
+PR = "r24"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -340,35 +340,35 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
 
 # Append to update-rc.d postinst
 pkg_postinst_${PN}_append() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 
 ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0 
 ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
 }
 
 pkg_postinst_${PN}-blitwsegl() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 }
 
 pkg_postinst_${PN}-flipwsegl() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 }
 
 pkg_postinst_${PN}-frontwsegl() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 }
 pkg_postinst_${PN}-linuxfbwsegl() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 }
 
 pkg_postinst_${PN}-x11wsegl() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 
 echo "[default]" > $D${sysconfdir}/powervr.ini
 echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
 }
 
 pkg_postinst_${PN}-driwsegl() {
-rm -f ${sysconfdir}/powervr-esrev
+rm -f $D${sysconfdir}/powervr-esrev
 }
 
-- 
1.7.2.5


