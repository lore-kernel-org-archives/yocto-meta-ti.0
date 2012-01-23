Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C42CE0137F
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:48 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so660362wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:47 -0800 (PST)
Received: by 10.180.19.130 with SMTP id f2mr14654235wie.12.1327328327778;
	Mon, 23 Jan 2012 06:18:47 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm13230341wib.3.2012.01.23.06.18.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:18:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 23 Jan 2012 15:18:26 +0100
Message-Id: <1327328309-15956-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 4/7] libgles-omap3: install X11 windowing system for newer SDK releases as well
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
X-List-Received-Date: Mon, 23 Jan 2012 14:18:48 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 9bd801c..289b7d5 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r20"
+PR = "r21"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -136,6 +136,7 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib/*X11WS* ${D}${libdir} || true
 
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
-- 
1.7.2.5


