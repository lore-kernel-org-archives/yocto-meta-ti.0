Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C6CAE00749
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:45 -0800 (PST)
Received: by wgbdr1 with SMTP id dr1so9641581wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:44 -0800 (PST)
Received: by 10.227.206.10 with SMTP id fs10mr12743898wbb.13.1324311344623;
	Mon, 19 Dec 2011 08:15:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ei9sm26439789wid.0.2011.12.19.08.15.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 08:15:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 19 Dec 2011 17:15:36 +0100
Message-Id: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/5] linux.inc: If the kernel has CONFIG_KERNEL_LZO=y, it may well attempt to use the 'lzop' utility to do the lzo compression, but we should not be relying on that utility being installed on the build machine.
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
X-List-Received-Date: Mon, 19 Dec 2011 16:15:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

This currently affects the linux-omap4 build for omap4430-panda.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux.inc |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 9650e68..e8a754f 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -264,3 +264,14 @@ pkg_postrm_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove devicetree devicetree-${KERNEL_VERSION} || true
 }
 
+# Automatically depend on lzop-native if CONFIG_KERNEL_LZO is enabled
+python () {
+    try:
+        defconfig = bb.fetch2.localpath('file://defconfig', d)
+    except bb.fetch2.FetchError:
+        pass
+    else:
+        if 'CONFIG_KERNEL_LZO=y\n' in open(defconfig).readlines():
+            depends = d.getVar('DEPENDS', False)
+            d.setVar('DEPENDS', depends + ' lzop-native')
+}
-- 
1.7.2.5


