Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A499EE013D9
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 22:57:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D130152A9D; Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330055709.D130152A9D@arago-project.org>
Date: Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : ti814x.inc: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 30 Mar 2012 05:57:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1081734754ec74f55e1e310427c20d56f3357f34
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1081734754ec74f55e1e310427c20d56f3357f34

Author: Tom Rini <trini@ti.com>
Date:   Thu Mar 29 10:18:16 2012 -0700

ti814x.inc: Use '+=' not '?=' in IMAGE_FSTYPES

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti814x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
index c53557f..475a212 100644
--- a/conf/machine/include/ti814x.inc
+++ b/conf/machine/include/ti814x.inc
@@ -20,7 +20,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # Ship all kernel modules
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
 SERIAL_CONSOLE = "115200 ttyO0"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"


