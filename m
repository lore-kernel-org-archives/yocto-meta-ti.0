Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0425E00DE7; Fri, 29 Jul 2016 14:52:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E01D7E00DED
	for <meta-ti@yoctoproject.org>; Fri, 29 Jul 2016 14:52:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 31F0B52ACA; Fri, 29 Jul 2016 21:52:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160729215209.31F0B52ACA@arago-project.org>
Date: Fri, 29 Jul 2016 21:52:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : kselftests: update to 4.4, don' t need to depend on kernel
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
X-List-Received-Date: Fri, 29 Jul 2016 21:52:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 78b386ee501e00fe62c2d272b5824b1c740faef1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=78b386ee501e00fe62c2d272b5824b1c740faef1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jul 30 00:20:28 2016 +0000

kselftests: update to 4.4, don't need to depend on kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{kselftests_4.1.bb => kselftests_4.4.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.1.bb b/recipes-kernel/kselftests/kselftests_4.4.bb
similarity index 95%
rename from recipes-kernel/kselftests/kselftests_4.1.bb
rename to recipes-kernel/kselftests/kselftests_4.4.bb
index 2dced11..3cdf4f1 100644
--- a/recipes-kernel/kselftests/kselftests_4.1.bb
+++ b/recipes-kernel/kselftests/kselftests_4.4.bb
@@ -4,14 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
-SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
+SRC_URI[sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
 
 S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "virtual/kernel popt"
+DEPENDS = "popt"
 
 inherit kernel-arch
 


