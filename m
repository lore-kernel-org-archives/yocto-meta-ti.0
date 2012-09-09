Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D64D6E00348
	for <meta-ti@yoctoproject.org>; Sun,  9 Sep 2012 10:09:00 -0700 (PDT)
Received: by pbbrq13 with SMTP id rq13so1844645pbb.35
	for <meta-ti@yoctoproject.org>; Sun, 09 Sep 2012 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WNJ89ZPPYPjLJP09pMvH9+HZtiF8VkvYweXBUYXYCvg=;
	b=SHqclmDzdTtZ1zO36XilLRck5PEgkMHIagZosUh1TSx7Aw0qEK9svvDy6IUtzFpast
	hQ/BOTZ689wHFaML3YKoK808zSQS64QqXzvk8FhArHAJRTnrJma444Ou+X4Z6r8xV5/A
	++7PzBfu9Ipextne7hfqLuYdFBTLFEsxCf5gCz5drx1ndvSB8O3AoBz78DfN4LfNnxKU
	HCxh5NXFMcjc97DHERYbnl5e87hKjruchEc2JuTJBATDtKkS1V6unjPait6QAefbAVEz
	JKTYnkcMgsAHeXeLCVWP11a5RfSG/y6/5UQhbU8qH9VBVzpOYoFVvdAx0cr5qCJxTSV6
	M4OA==
Received: by 10.66.87.138 with SMTP id ay10mr17141618pab.38.1347210526520;
	Sun, 09 Sep 2012 10:08:46 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qn3sm6517244pbc.6.2012.09.09.10.08.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Sep 2012 10:08:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun,  9 Sep 2012 10:07:47 -0700
Message-Id: <1347210467-19332-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] recipes: Use 'packagegroup' instead of 'task'
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
X-List-Received-Date: Sun, 09 Sep 2012 17:09:00 -0000

bring recipes in sync with OE-Core, task bbclass
is now replaced by packagegroup.

and task recipes are now called packagegroup_something

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kernel/linux/multi-kernel.inc              |    2 +-
 recipes-misc/images/cloud9-gfx-image.bb            |    2 +-
 recipes-misc/images/cloud9-gnome-image.bb          |    2 +-
 recipes-misc/images/cloud9-image.bb                |    2 +-
 recipes-misc/images/ti-hw-bringup-image.bb         |    2 +-
 .../packagegroup-ti-drivers.bb}                    |    2 +-
 .../packagegroup-ti-test.bb}                       |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename recipes-misc/{tasks/task-ti-drivers.bb => packagegroup/packagegroup-ti-drivers.bb} (96%)
 rename recipes-ti/{tasks/task-ti-test.bb => packagegroup/packagegroup-ti-test.bb} (92%)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 04bc987..96d6121 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -117,5 +117,5 @@ do_deploy_append () {
 
 }
 
-do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"
+do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 addtask compileconfigs after do_preparekernel before do_compile
diff --git a/recipes-misc/images/cloud9-gfx-image.bb b/recipes-misc/images/cloud9-gfx-image.bb
index 689a7c9..67423f6 100644
--- a/recipes-misc/images/cloud9-gfx-image.bb
+++ b/recipes-misc/images/cloud9-gfx-image.bb
@@ -3,7 +3,7 @@
 require cloud9-image.bb
 
 IMAGE_INSTALL += " \
-                  task-xserver \
+                  packagegroup-core-x11-xserver \
                   angstrom-gnome-icon-theme-enable gtk-engine-clearlooks gtk-theme-clearlooks angstrom-clearlooks-theme-enable \
                   e-wm-config-default e-wm-config-standard e-wm-config-illume2 \
                   xserver-nodm-init \
diff --git a/recipes-misc/images/cloud9-gnome-image.bb b/recipes-misc/images/cloud9-gnome-image.bb
index 13638d7..c183244 100644
--- a/recipes-misc/images/cloud9-gnome-image.bb
+++ b/recipes-misc/images/cloud9-gnome-image.bb
@@ -8,7 +8,7 @@ SOCSUPPORT_omap3 = "xbmc libgles-omap3-x11demos gstreamer-ti omapfbplay"
 SOCSUPPORT_ti33x = "xbmc libgles-omap3-x11demos gst-ffmpeg mplayer2 beaglebone-capes"
 
 IMAGE_INSTALL += " \
-                  angstrom-task-gnome gimp abiword gedit midori epiphany firefox matchbox-terminal \
+                  angstrom-packagegroup-gnome gimp abiword gedit midori epiphany firefox matchbox-terminal \
                   ${SOCSUPPORT} \
                   ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
                   xinput-calibrator \
diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index c29d1cb..519a8bb 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -9,7 +9,7 @@ ROOTFSTYPE_beaglebone = "ext4"
 IMAGE_INSTALL += " \
 	systemd-analyze \
 	cloud9 \
-	task-sdk-target \
+	packagegroup-sdk-target \
 	vim vim-vimrc \
 	procps \
 	beaglebone-tester \
diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 9490098..e8dd5ed 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -21,7 +21,7 @@ IMAGE_INSTALL += " \
 	rt-tests \
 	evtest \
 	bc \
-	task-ti-test \
+	packagegroup-ti-test \
 	kernel-modules \
 	timestamp-service \
 	${EXTRA_MACHINE_IMAGE_INSTALL} \
diff --git a/recipes-misc/tasks/task-ti-drivers.bb b/recipes-misc/packagegroup/packagegroup-ti-drivers.bb
similarity index 96%
rename from recipes-misc/tasks/task-ti-drivers.bb
rename to recipes-misc/packagegroup/packagegroup-ti-drivers.bb
index 532f273..e63d31b 100644
--- a/recipes-misc/tasks/task-ti-drivers.bb
+++ b/recipes-misc/packagegroup/packagegroup-ti-drivers.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task for extra drivers for Texas Instruments SoCs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-inherit task 
+inherit packagegroup 
 
 RDEPENDS_${PN} = "\
 	zd1211-firmware \
diff --git a/recipes-ti/tasks/task-ti-test.bb b/recipes-ti/packagegroup/packagegroup-ti-test.bb
similarity index 92%
rename from recipes-ti/tasks/task-ti-test.bb
rename to recipes-ti/packagegroup/packagegroup-ti-test.bb
index c11695c..fc19bc5 100644
--- a/recipes-ti/tasks/task-ti-test.bb
+++ b/recipes-ti/packagegroup/packagegroup-ti-test.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-inherit allarch task
+inherit allarch packagegroup
 
 TEST = "\
     bonnie++ \
-- 
1.7.9.5


