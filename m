Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F04CE00B0B; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECCC3E00AAA
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JliWs009102
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:44 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jli2M014884
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:44 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7D022118;	Tue, 3 Nov 2015 13:47:43 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:19 -0500
Message-ID: <1446580053-16935-14-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 13/27] mmap-lld-test: Only build binaries relevent to the machine
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:45 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb | 10 +++++-----
 recipes-bsp/mmap-lld/mmap-lld.inc         |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 0617376..5fdb646 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
 include mmap-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
-DEVICELIST = "k2h \
-              k2k \
-              k2e \
-"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2e-evm  = "k2e"
 
 CHOICELIST = " yes \
                no \
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index cde0fec..3dfc93c 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
@@ -17,6 +17,6 @@ SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${
 SRCREV = "${MMAP_LLD_SRCREV}"
 
 PV = "2.0.0.4"
-INC_PR = "r2"
+INC_PR = "r3"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
-- 
1.9.1


