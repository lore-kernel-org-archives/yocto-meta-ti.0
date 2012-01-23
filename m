Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45BA1E0137F
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:50 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dy1so2539157wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.103.97 with SMTP id fv1mr13805609wib.17.1327328329979;
	Mon, 23 Jan 2012 06:18:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id hc10sm9982882wib.8.2012.01.23.06.18.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:18:49 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 23 Jan 2012 15:18:27 +0100
Message-Id: <1327328309-15956-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmsltWjmpLlw8ZNS5y/IPKdv6nXOZqO0kKnQFAblY1CZfXncLy0r3JBF+pBLxwO5F2enfc5
Subject: [PATCH 5/7] libgles-omap3: adjust packaging for all windowing systems to remove the magic esrev file
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
X-List-Received-Date: Mon, 23 Jan 2012 14:18:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   29 ++++++++++++++++++++++++++-
 1 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 289b7d5..722ac13 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r21"
+PR = "r22"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -325,6 +325,7 @@ INSANE_SKIP_${PN}-flipwsegl = "ldflags"
 INSANE_SKIP_${PN}-frontwsegl = "ldflags"
 INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
 INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
+INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
 INSANE_SKIP_${PN}-tests = "ldflags"
 INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
 
@@ -339,8 +340,32 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
 
 # Append to update-rc.d postinst
 pkg_postinst_${PN}_append() {
-rm -f /etc/powervr-esrev
+rm -f ${sysconfdir}/powervr-esrev
 
 ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0 
 ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
 }
+
+pkg_postinst_${PN}-blitwsegl() {
+rm -f ${sysconfdir}/powervr-esrev
+}
+
+pkg_postinst_${PN}-flipwsegl() {
+rm -f ${sysconfdir}/powervr-esrev
+}
+
+pkg_postinst_${PN}-frontwsegl() {
+rm -f ${sysconfdir}/powervr-esrev
+}
+pkg_postinst_${PN}-linuxfbwsegl() {
+rm -f ${sysconfdir}/powervr-esrev
+}
+
+pkg_postinst_${PN}-x11wsegl() {
+rm -f ${sysconfdir}/powervr-esrev
+}
+
+pkg_postinst_${PN}-driwsegl() {
+rm -f ${sysconfdir}/powervr-esrev
+}
+
-- 
1.7.2.5


