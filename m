Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E35BE00716; Fri, 16 May 2014 11:17:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDB11E006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 11:17:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIHJam028074
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 13:17:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIHJkp021130
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 13:17:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 13:17:18 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GIHJnv028858;	Fri, 16 May 2014 13:17:19 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 May 2014 14:17:14 -0400
Message-ID: <1400264234-24709-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] cmem: Update to new version of cmem 4.0.2.11
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
X-List-Received-Date: Fri, 16 May 2014 18:17:24 -0000
Content-Type: text/plain

- updated PR prefix to be common
- Updated license file checksum
- Updated SRCREV commit Id

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb |    2 +-
 recipes-bsp/cmem/cmem.inc        |    8 +++++---
 recipes-bsp/cmem/cmem_git.bb     |    2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index 2bdf9c0..f926fef 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "${CMEM_PR_PREFIX}+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 7927839..ef57bb5 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -1,11 +1,13 @@
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
+LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH ?= "master"
-# This corresponds to version 4.00.01.08
-SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
+# This corresponds to version 4.00.02.11
+SRCREV = "317792d2c18c1144401e2aee689aadebbd3a9b12"
+CMEM_PR_PREFIX = "b"
+PV="4.0.2.11"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index b633d74..2382451 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -4,7 +4,7 @@ include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-PR = "r0+gitr${SRCPV}"
+PR = "${CMEM_PR_PREFIX}+gitr${SRCPV}"
 
 PACKAGES =+ "${PN}-test"
 
-- 
1.7.9.5


