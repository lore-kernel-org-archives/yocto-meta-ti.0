Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC64AE0121B
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 17:45:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D6ED252A66; Wed, 13 Mar 2013 00:45:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130313004509.D6ED252A66@arago-project.org>
Date: Wed, 13 Mar 2013 00:45:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: unify all machines to produce tar. gz instead of tar.bz2 by default
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
X-List-Received-Date: Wed, 13 Mar 2013 00:45:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4f21d3b86badd88b99d19c225292a9bfa55fbaec
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f21d3b86badd88b99d19c225292a9bfa55fbaec

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar 12 17:48:57 2013 -0400

machines: unify all machines to produce tar.gz instead of tar.bz2 by default

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beaglebone.conf   |    2 +-
 conf/machine/keystone-evm.conf |    2 +-
 conf/machine/omap3evm.conf     |    2 +-
 conf/machine/pandaboard.conf   |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index dc77dd7..f4112f5 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -9,7 +9,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index a2c05f8..c878d52 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/keystone.inc
 
-IMAGE_FSTYPES += "ubi tar.bz2 cpio"
+IMAGE_FSTYPES += "ubi tar.gz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index a793798..584866c 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 GUI_MACHINE_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
-IMAGE_FSTYPES += "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index b3d0399..1707f80 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap4.inc
 
 GUI_MACHINE_CLASS = "bigscreen"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO2"
 


