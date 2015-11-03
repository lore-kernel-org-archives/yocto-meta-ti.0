Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 027C3E00AF2; Tue,  3 Nov 2015 11:47:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6666BE00A9C
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jlh5M027128
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jlhid001712
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:43 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7C022118;	Tue, 3 Nov 2015 13:47:43 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:18 -0500
Message-ID: <1446580053-16935-13-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 12/27] mmap-lld: Clean up recipes
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

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb |  2 ++
 recipes-bsp/mmap-lld/mmap-lld.inc         | 15 +++++++++++----
 recipes-bsp/mmap-lld/mmap-lld_git.bb      |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 41e46f7..0617376 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
 include mmap-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index a5158d5..cde0fec 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -4,12 +4,19 @@ COMPATIBLE_MACHINE = "keystone"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
+MMAP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git"
+MMAP_LLD_GIT_PROTOCOL = "git"
+MMAP_LLD_GIT_BRANCH = "master"
+MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
+
 # Commit correspond to DEV.MMAP.02.00.00.04
-SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
+MMAP_LLD_SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
+
+BRANCH="${MMAP_LLD_GIT_BRANCH}"
+SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${MMAP_LLD_SRCREV}"
 
 PV = "2.0.0.4"
-PR = "r1"
+INC_PR = "r2"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
index 3a56a62..1cfc90f 100644
--- a/recipes-bsp/mmap-lld/mmap-lld_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "TI KEYSTONE mmap driver using Keystone MPAX Programming"
 include mmap-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS="common-csl-ip"
 
 do_compile () {
-- 
1.9.1


