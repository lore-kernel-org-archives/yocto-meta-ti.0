Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFB49E01438
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 21:24:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9C34B52A04; Fri, 14 Sep 2012 04:24:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120914042419.9C34B52A04@arago-project.org>
Date: Fri, 14 Sep 2012 04:24:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Khem Raj : recipes: Use 'packagegroup' instead of 'task'
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
X-List-Received-Date: Fri, 14 Sep 2012 04:24:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 306bec90c470a0130714dca2b506ba2e8da86144
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=306bec90c470a0130714dca2b506ba2e8da86144

Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Sep  9 10:07:47 2012 -0700

recipes: Use 'packagegroup' instead of 'task'

bring recipes in sync with OE-Core, task bbclass
is now replaced by packagegroup.

and task recipes are now called packagegroup_something

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/cloud9-gfx-image.bb            |    2 +-
 recipes-misc/images/cloud9-gnome-image.bb          |    2 +-
 recipes-misc/images/cloud9-image.bb                |    2 +-
 recipes-misc/images/ti-hw-bringup-image.bb         |    2 +-
 .../packagegroup-ti-drivers.bb}                    |    2 +-
 .../packagegroup-ti-test.bb}                       |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

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
index 532f273..b391fac 100644
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


