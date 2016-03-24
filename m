Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6470AE00C3B; Thu, 24 Mar 2016 09:48:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5827CE00C39
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 09:48:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2OGmk6h025525
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2OGmkPB018785
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 24 Mar 2016 11:48:45 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2OGmhsp013865;	Thu, 24 Mar 2016 11:48:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 24 Mar 2016 12:48:41 -0400
Message-ID: <1458838121-2846-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
References: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] mmap-lld: Upgrade to 2.0.0.7
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
X-List-Received-Date: Thu, 24 Mar 2016 16:48:52 -0000
Content-Type: text/plain

* add k2l-evm and k2g-evm support

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb | 4 +++-
 recipes-bsp/mmap-lld/mmap-lld.inc         | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 5fdb646..b29df8b 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
 include mmap-lld.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,6 +10,8 @@ RDEPENDS_${PN}="uio-module-drv"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2g-evm  = "k2g"
 
 CHOICELIST = " yes \
                no \
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 37bd0bd..c65ceb3 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -9,14 +9,14 @@ MMAP_LLD_GIT_PROTOCOL = "git"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
-# Commit correspond to DEV.MMAP.02.00.00.06
-MMAP_LLD_SRCREV = "70c10fbce809a3ed1cd67c9da2e2a47d3de8f832"
+# Commit correspond to DEV.MMAP.02.00.00.07
+MMAP_LLD_SRCREV = "4426949ddfafdc8ea9408dbf5a642c3e840f4997"
 
 BRANCH="${MMAP_LLD_GIT_BRANCH}"
 SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${MMAP_LLD_SRCREV}"
 
-PV = "2.0.0.6"
+PV = "2.0.0.7"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
-- 
1.9.1


