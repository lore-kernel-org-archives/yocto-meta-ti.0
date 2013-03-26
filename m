Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EC6CE0140A
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A17F352A6F; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004223.A17F352A6F@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-am180x: modify am180x specific version to use new namespace feature
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1ab747c80d4937aa80fdb5ca8d773501f3787b2d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1ab747c80d4937aa80fdb5ca8d773501f3787b2d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:01:32 2013 -0400

u-boot-am180x: modify am180x specific version to use new namespace feature

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...hange-default-memory-to-not-limit-at-32MB.patch |    0
 ...03.21.00.04.sdk.bb => u-boot-am180x_2010.12.bb} |   15 ++++-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch b/recipes-bsp/u-boot/u-boot-am180x-2010.12/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
similarity index 100%
rename from recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
rename to recipes-bsp/u-boot/u-boot-am180x-2010.12/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
diff --git a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
similarity index 59%
rename from recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
rename to recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
index 7652521..b2852c4 100644
--- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
+++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
@@ -1,15 +1,10 @@
-# Use the version of u-boot.inc in oe-core not the meta-ti version
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
-DESCRIPTION = "u-boot bootloader for DaVinci devices"
-
-LICENSE = "GPLv2+"
+DESCRIPTION = "u-boot bootloader for AM180x devices"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
 
 COMPATIBLE_MACHINE = "am180x-evm"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r0"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=${BRANCH}"
@@ -21,9 +16,7 @@ SRC_URI_append_am180x-evm = " file://0001-da850evm-change-default-memory-to-not-
 
 BRANCH = "03.21.00.03"
 
-# Use literal tags in SRCREV, when available, instead of commit IDs
-SRCREV = "v2010.12_DAVINCIPSP_03.21.00.04"
-
-S = "${WORKDIR}/git"
+# v2010.12_DAVINCIPSP_03.21.00.04
+SRCREV = "1254a0b58d900b7035cfb36bf4e1b05dfbf09997"
 
 UBOOT_SUFFIX = "bin"


