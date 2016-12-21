Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD346E01065; Tue, 20 Dec 2016 19:04:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A198AE01063
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 19:04:44 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBL34hqM023576
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 21:04:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBL34gNU020017
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 21:04:43 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 21:04:42 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBL34gVb030203;	Tue, 20 Dec 2016 21:04:42 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 20 Dec 2016 22:04:40 -0500
Message-ID: <1482289480-58562-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] cmem: Update commit id for 4.13.00.00_eng
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
X-List-Received-Date: Wed, 21 Dec 2016 03:04:47 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb | 2 +-
 recipes-bsp/cmem/cmem.inc        | 2 +-
 recipes-bsp/cmem/cmem_git.bb     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index 1031e85..14c7edf 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 0d05bb3..af48891 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e27
 
 BRANCH = "lu-next"
 # This corresponds to version 4.13.00.00_eng
-SRCREV = "d6d3e84c84d0e84a9b96c3f6f789ac642d03afcb"
+SRCREV = "1b1e19754049446c20fba7c22b39b325eb0154ec"
 
 PV = "4.13.00.00+git${SRCPV}"
 
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index bab9238..b30029d 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -4,7 +4,7 @@ include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-PR = "r0"
+PR = "r1"
 
 PACKAGES =+ "${PN}-test"
 
-- 
1.9.1


