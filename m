Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8ECDE0070D
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 17 Dec 2011 08:04:11 -0800 (PST)
Received: by wibhq2 with SMTP id hq2so692056wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 17 Dec 2011 08:04:10 -0800 (PST)
Received: by 10.180.80.197 with SMTP id t5mr2586353wix.48.1324137850162;
	Sat, 17 Dec 2011 08:04:10 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fg15sm18781545wbb.7.2011.12.17.08.04.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Dec 2011 08:04:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sat, 17 Dec 2011 17:03:55 +0100
Message-Id: <1324137836-6696-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] linux.inc: If the kernel has CONFIG_KERNEL_LZO=y, it may well attempt to use the 'lzop' utility to do the lzo compression, but we should not be relying on that utility being installed on the build machine.
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
X-List-Received-Date: Sat, 17 Dec 2011 16:04:12 -0000

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


