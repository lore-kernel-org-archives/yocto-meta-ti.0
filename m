Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 824B8E00954; Tue, 28 Apr 2015 07:13:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3876E003A8
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 07:13:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3SEDP0f007672
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 09:13:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3SEDOu3004160
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 09:13:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 09:13:24 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3SEDNZk012557;	Tue, 28 Apr 2015 09:13:24 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 28 Apr 2015 10:13:22 -0400
Message-ID: <1430230402-9785-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] netapi: Update to new version 1.1.0.6
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
X-List-Received-Date: Tue, 28 Apr 2015 14:13:29 -0000
Content-Type: text/plain

- Fixes issues with parallel builds

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/netapi/netapi.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index eae436c..0ba4eeb 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f230
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.05C"
-SRCREV = "fc407a408e6c7e4cad6b5f0dd4367049abfd375f"
-PV = "01.01.00.05"
+# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
+SRCREV = "42eefef1b4bdc659fc8fc42e8f2bc74a4b155265"
+PV = "01.01.00.06"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
-- 
1.7.9.5


