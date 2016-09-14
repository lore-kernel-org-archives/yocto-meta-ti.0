Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84037E00894; Tue, 13 Sep 2016 18:29:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B539CE0081E
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 18:29:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8E1Te0E006365
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 20:29:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8E1TehS013408
	for <meta-ti@yoctoproject.org>; Tue, 13 Sep 2016 20:29:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 20:29:40 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8E1TVLf003993;	Tue, 13 Sep 2016 20:29:37 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Sep 2016 21:29:17 -0400
Message-ID: <1473816561-27507-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1473816561-27507-1-git-send-email-jsobota@ti.com>
References: <1473816561-27507-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 2/6] edma3-lld: Bump version
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
X-List-Received-Date: Wed, 14 Sep 2016 01:29:44 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 4de5987..ab84fe9 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_01_24"
-EDMA3_LLD_SRCREV = "e864a057032b070fc04628bac1345ecef01e2224"
+# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_01_25"
+EDMA3_LLD_SRCREV = "a8acce9efc2814bdb0b78a250efd470efd9dc0b8"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.01.24"
+PV = "2.12.01.25"
 INC_PR = "r0"
-- 
1.7.10.4


