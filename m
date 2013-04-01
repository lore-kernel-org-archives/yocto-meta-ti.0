Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE270E0051D
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2013 14:07:15 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31L7Do4006841
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 16:07:14 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31L7Cwr008189
	for <meta-ti@yoctoproject.org>; Tue, 2 Apr 2013 02:37:13 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Apr 2013 02:37:12 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31L79pH006420;
	Tue, 2 Apr 2013 02:37:11 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 Apr 2013 16:07:08 -0500
Message-ID: <1364850428-22805-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] omap5-evm: update U-Boot machine to omap5 uevm
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
X-List-Received-Date: Mon, 01 Apr 2013 21:07:15 -0000
Content-Type: text/plain

* The U-Boot config to be used in the latest code has been updated
  to use omap5_uevm instead of omap5_evm.
* Update to the latest code to pickup this change and modify the
  machine file as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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
-- 
1.7.0.4


