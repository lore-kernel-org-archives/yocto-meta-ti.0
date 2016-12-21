Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF11DE00A4D; Wed, 21 Dec 2016 10:24:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B41BE00571
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2016 10:24:46 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D46B352AD7; Wed, 21 Dec 2016 18:24:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161221182445.D46B352AD7@arago-project.org>
Date: Wed, 21 Dec 2016 18:24:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cmem: Update commit id for 4.13.00.00_eng
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
X-List-Received-Date: Wed, 21 Dec 2016 18:24:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 636f0898319d32422d0721f9ac83687cb5579ed4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=636f0898319d32422d0721f9ac83687cb5579ed4

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Dec 21 09:04:40 2016 +0000

cmem: Update commit id for 4.13.00.00_eng

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cmem/cmem-mod_git.bb |    2 +-
 recipes-bsp/cmem/cmem.inc        |    2 +-
 recipes-bsp/cmem/cmem_git.bb     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index f1e1233..d36816b 100644
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
 


