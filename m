Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D94FEE014EF
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2013 08:43:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9529152A24; Mon,  4 Mar 2013 16:43:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130304164350.9529152A24@arago-project.org>
Date: Mon,  4 Mar 2013 16:43:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: add latest mainline release 2013.01.01
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
X-List-Received-Date: Mon, 04 Mar 2013 16:43:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e97da12725579312f2cca6b2d3924db097f8fa26
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e97da12725579312f2cca6b2d3924db097f8fa26

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb 25 23:15:26 2013 -0500

u-boot: add latest mainline release 2013.01.01

* This is a pure _mainline_ version w/o any patches on top.
* Should work reasonably well for most platforms and is provided as an
  alternative to specialized pre-integrated and patched versions.
* It is not enabled by default, since specialized versions usually have
  more features and better support, although maybe slightly older.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2013.01.01.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
new file mode 100644
index 0000000..4c460cc
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
@@ -0,0 +1,22 @@
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "Mainline u-boot bootloader"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r1"
+
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "u-boot-2013.01.y"
+
+SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+SPL_BINARY = "MLO"


