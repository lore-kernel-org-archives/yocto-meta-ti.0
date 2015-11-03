Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58709E00AB9; Tue,  3 Nov 2015 11:47:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB3E8E00B2C
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:47 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jll6c014601
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JllQt001906
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:47 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7P022118;	Tue, 3 Nov 2015 13:47:47 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:31 -0500
Message-ID: <1446580053-16935-26-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 25/27] srio-lld: Only compatible with k2hk-evm
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:48 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/srio-lld/srio-lld-test_git.bb | 1 -
 recipes-bsp/srio-lld/srio-lld.inc         | 4 +++-
 recipes-bsp/srio-lld/srio-lld_git.bb      | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
index da3e357..6495a12 100644
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
-COMPATIBLE_MACHINE = "keystone"
 DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
 
 include srio-lld.inc
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index 6e51f79..2172a13 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -1,6 +1,8 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
 
+COMPATIBLE_MACHINE = "k2hk-evm"
+
 SRIO_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/srio-lld.git"
 SRIO_LLD_GIT_PROTOCOL = "git"
 SRIO_LLD_GIT_BRANCH = "master"
@@ -14,7 +16,7 @@ SRC_URI = "${SRIO_LLD_GIT_URI};destsuffix=${SRIO_LLD_GIT_DESTSUFFIX};protocol=${
 SRCREV = "${SRIO_LLD_SRCREV}"
 
 PV = "02.00.00.13"
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEVICELIST = "k2h k2k"
 
diff --git a/recipes-bsp/srio-lld/srio-lld_git.bb b/recipes-bsp/srio-lld/srio-lld_git.bb
index ba3cc24..48e7633 100644
--- a/recipes-bsp/srio-lld/srio-lld_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld_git.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "TI SRIO peripheral low level driver"
-COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS="common-csl-ip rm-lld cppi-lld"
 
-- 
1.9.1


