Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34090E008D3; Tue, 13 Sep 2016 18:29:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA1B5E0081E
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 18:29:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8E1Tj04021624
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 20:29:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8E1Ti88010641
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 20:29:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 20:29:43 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8E1TVLg003993;	Tue, 13 Sep 2016 20:29:41 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Sep 2016 21:29:18 -0400
Message-ID: <1473816561-27507-3-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1473816561-27507-1-git-send-email-jsobota@ti.com>
References: <1473816561-27507-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 3/6] pa-lld: Bump version
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
X-List-Received-Date: Wed, 14 Sep 2016 01:29:49 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/pa-lld/pa-lld.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 6c51560..c050044 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,16 +9,16 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.12"
-PA_LLD_SRCREV = "d3f3f5d93d3febc24099974bbc77e67c80a83b1e"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.00"
+PA_LLD_SRCREV = "dca2a281c0c57f3b3018a93fae5485825a33042c"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
             file://0001-makefile_armv7-fix-missing-separator-error.patch"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.01.12"
-INC_PR = "r2"
+PV = "03.00.02.00"
+INC_PR = "r0"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
-- 
1.7.10.4


