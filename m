Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B9B3E014E1
	for <meta-ti@yoctoproject.org>; Tue,  2 Apr 2013 12:43:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DB60852AA5; Tue,  2 Apr 2013 19:43:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130402194311.DB60852AA5@arago-project.org>
Date: Tue,  2 Apr 2013 19:43:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : omap5-evm: update U-Boot machine to omap5 uevm
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
X-List-Received-Date: Tue, 02 Apr 2013 19:43:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7c7ee62e42aebca8c91d9a07300b53d3d05b9301
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7c7ee62e42aebca8c91d9a07300b53d3d05b9301

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Apr  1 16:07:08 2013 -0500

omap5-evm: update U-Boot machine to omap5 uevm

* The U-Boot config to be used in the latest code has been updated
  to use omap5_uevm instead of omap5_evm.
* Update to the latest code to pickup this change and modify the
  machine file as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap5-evm.conf                        |    2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index 5fe3942..ba60e7c 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -29,7 +29,7 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
-UBOOT_MACHINE = "omap5_evm_config"
+UBOOT_MACHINE = "omap5_uevm_config"
 
 # Currently removing the sgx machine feature because there is no SGX package
 # available for omap5
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index 866cf14..f6cbeee 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -8,6 +8,6 @@ SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH
 
 BRANCH ?= "ti-u-boot-2013.01.01"
 
-SRCREV = "2309e3268c52c844f8924711b4fd7a9693f5b747"
+SRCREV = "24043d3b0b6d54b4f73263903499fd3e63980830"
 
 SPL_BINARY = "MLO"


