Return-Path: <denys@ti.com>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90745E01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 23:47:29 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAB005P6UUUSQUH@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 14 Sep 2012 01:47:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7D48520031; Fri,
	14 Sep 2012 02:47:18 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 14 Sep 2012 02:47:15 -0400
Message-id: <1347605235-12887-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.8.6
In-reply-to: <20120914064306.GC26968@edge>
References: <20120914064306.GC26968@edge>
Subject: [RFC: PATCH 2] systemd-image: overlay local copy to enable building ti-hw-bringup-image
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
X-List-Received-Date: Fri, 14 Sep 2012 06:47:29 -0000

Overlay systemd-image recipe locally in meta-ti to enable building at least
ti-hw-bringup-image w/o depending on meta-angstrom.

Couple caveats:
1. Local copy sacrifices timestamp-service that is only available in Angstrom
2. It uses generic packagegroup-boot instead of angstrom-packagegroup-boot,
   which results in sacrificing angstrom-version package

With the above minor tweaks it should be possible to build ti-hw-bringup-image
w/o depending on meta-angstrom layer, only requiring meta-oe/meta-systemd...
And for anyone w/o either meta-angstrom/meta-oe/meta-systemd, it will at least
parse and not break on ti-hw-bringup-image.

On the other hand, it is still possible to get the original behavior when
using the configuration with meta-angstrom, since its original copy of
systemd-image will override the copy in meta-ti, due to higher layer priority.

Unfortunately, cloud9* images depend on additional Angstrom-specific pieces...

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-images/angstrom/systemd-image.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes-images/angstrom/systemd-image.bb

diff --git a/recipes-images/angstrom/systemd-image.bb b/recipes-images/angstrom/systemd-image.bb
new file mode 100644
index 0000000..16da70e
--- /dev/null
+++ b/recipes-images/angstrom/systemd-image.bb
@@ -0,0 +1,28 @@
+#Angstrom-derived image to test systemd
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+IMAGE_PREPROCESS_COMMAND = "rootfs_update_timestamp"
+
+DISTRO_UPDATE_ALTERNATIVES ??= ""
+ROOTFS_PKGMANAGE_PKGS ?= '${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "${ROOTFS_PKGMANAGE} ${DISTRO_UPDATE_ALTERNATIVES}", d)}'
+
+CONMANPKGS ?= "connman connman-plugin-loopback connman-plugin-ethernet connman-plugin-wifi connman-systemd"
+CONMANPKGS_libc-uclibc = ""
+
+IMAGE_INSTALL += " \
+	packagegroup-boot \
+	packagegroup-basic \
+	${CONMANPKGS} \
+	${ROOTFS_PKGMANAGE_PKGS} \
+"
+
+IMAGE_DEV_MANAGER   = "udev"
+IMAGE_INIT_MANAGER  = "systemd"
+IMAGE_INITSCRIPTS   = " "
+IMAGE_LOGIN_MANAGER = "tinylogin shadow"
+
+export IMAGE_BASENAME = "systemd-image"
+
+inherit image
-- 
1.7.8.6


