Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50123E00AB9; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DA74E00A9C
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jlgfo014581
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:42 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jlgvc001546
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:42 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla77022118;	Tue, 3 Nov 2015 13:47:42 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:13 -0500
Message-ID: <1446580053-16935-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 07/27] hplib: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:44 -0000
Content-Type: text/plain

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hplib/hplib-test_git.bb |  2 ++
 recipes-bsp/hplib/hplib.inc         | 13 ++++++++++---
 recipes-bsp/hplib/hplib_git.bb      |  2 ++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-test_git.bb
index 574fa2a..4ba79db 100644
--- a/recipes-bsp/hplib/hplib-test_git.bb
+++ b/recipes-bsp/hplib/hplib-test_git.bb
@@ -6,6 +6,8 @@ DEPENDS = "common-csl-ip qmss-lld sa-lld pktlib hplib"
 
 include hplib.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 S = "${WORKDIR}/git/ti/runtime/hplib"
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index e4211ee..7ed47a5 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -2,9 +2,16 @@ COMPATIBLE_MACHINE = "keystone"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/hplib.git;protocol=git;branch=${BRANCH}"
+HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
+HPLIB_GIT_PROTOCOL = "git"
+HPLIB_GIT_BRANCH = "master"
 
 # Below Commit ID corresponds to "DEV.HPLIB.01.01.00.06"
-SRCREV = "1cbe6a41926c131d9cab63b40d43807c6e56e2fd"
+HPLIB_SRCREV = "1cbe6a41926c131d9cab63b40d43807c6e56e2fd"
+
+BRANCH = "${HPLIB_GIT_BRANCH}"
+SRC_URI = "${HPLIB_GIT_URI};protocol=${HPLIB_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${HPLIB_SRCREV}"
+
 PV = "01.01.00.06+git${SRCPV}"
+INC_PR = "r1"
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.bb
index da8853b..1423de5 100644
--- a/recipes-bsp/hplib/hplib_git.bb
+++ b/recipes-bsp/hplib/hplib_git.bb
@@ -7,6 +7,8 @@ RDEPENDS_${PN} = "hplib-mod"
 
 include hplib.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 S = "${WORKDIR}/git/ti/runtime/hplib"
-- 
1.9.1


