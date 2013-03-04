Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53F3AE014DB
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2013 08:36:35 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1539652A95; Mon,  4 Mar 2013 16:36:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130304163635.1539652A95@arago-project.org>
Date: Mon,  4 Mar 2013 16:36:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot 2012.10: add the latest SDK 05. 06 version from meta-arago
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
X-List-Received-Date: Mon, 04 Mar 2013 16:36:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: e7c7da790fdce3a0c3549121a8f0a484296a29c3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e7c7da790fdce3a0c3549121a8f0a484296a29c3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 28 16:52:53 2013 -0500

u-boot 2012.10: add the latest SDK 05.06 version from meta-arago

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2012.10.bb |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2012.10.bb b/recipes-bsp/u-boot/u-boot_2012.10.bb
new file mode 100644
index 0000000..89d646c
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2012.10.bb
@@ -0,0 +1,32 @@
+# Use the version of u-boot.inc in oe-core not the meta-ti version
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+# Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
+# This issue was fixed in oe-core master by removing the -02 statement.
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "ti33x|omap3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r7+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
+"
+
+BRANCH = "amsdk-05.06.00.00"
+
+SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"


