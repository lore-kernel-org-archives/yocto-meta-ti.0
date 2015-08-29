Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 066BFE00CB4; Fri, 28 Aug 2015 17:42:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AB2AE00C93
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 17:41:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3506852A67; Sat, 29 Aug 2015 00:41:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150829004158.3506852A67@arago-project.org>
Date: Sat, 29 Aug 2015 00:41:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : u-boot-keystone: Update to new version 2013_01_15.07_01
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
X-List-Received-Date: Sat, 29 Aug 2015 00:42:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: d7556a4a23eb833fd363eba9dbd103bd14c6628d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d7556a4a23eb833fd363eba9dbd103bd14c6628d

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Aug 25 19:28:39 2015 +0000

u-boot-keystone: Update to new version 2013_01_15.07_01

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 80f4c34..e4387fc 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -4,11 +4,11 @@ DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PR = "r5"
+PR = "r6"
 PV_append = "+git${SRCPV}"
 
-# Tag "K2_UBOOT_2013_01_14.09"
-SRCREV = "f9bc365551ff8c685bf6134d795576713fec0917"
+# Tag "K2_UBOOT_2013_01_15.07_01"
+SRCREV = "5eaedcc4c2bca0ed971ee46694df7edc0cfa36cf"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"


