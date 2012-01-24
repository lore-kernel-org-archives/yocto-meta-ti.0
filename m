Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FBF8E01372
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 01:24:49 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dy1so3405404wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 01:24:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.86.105 with SMTP id o9mr12452030wiz.4.1327397089118;
	Tue, 24 Jan 2012 01:24:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id u12sm17573371wiv.10.2012.01.24.01.24.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 01:24:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 24 Jan 2012 10:24:32 +0100
Message-Id: <1327397074-15731-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327397074-15731-1-git-send-email-koen@dominion.thruhere.net>
References: <1327397074-15731-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk5MPWRmCuQuCJ86n4yOh/uW2Xdb7cNOhrRpAtjbzMLFmPrhNwaOFbZ7ZQMHkCbddPszyXT
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
X-List-Received-Date: Tue, 24 Jan 2012 09:24:49 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |   28 ++++++++++++++++++++++++++--
 1 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 3ee4124..722ac13 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r21"
+PR = "r22"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -340,8 +340,32 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
 
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


