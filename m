Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79F47E009F0; Wed, 27 May 2015 09:20:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C41FE009C6
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:20:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4RGKP7m001623
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 11:20:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RGKO7r029015
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 11:20:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 11:20:24 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4RGKKkD001523;	Wed, 27 May 2015 11:20:24 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 12:20:16 -0400
Message-ID: <1432743617-24000-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
References: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] edma3-lld: Update to version 2.12.01.21.
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
X-List-Received-Date: Wed, 27 May 2015 16:20:30 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index e6dd92b..28c49e3 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -3,8 +3,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
-# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
-SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
+SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git;protocol=git;branch=${BRANCH}"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_21_RC1
+SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
 
-PV = "2.11.13"
+PV = "2.12.01.21"
-- 
1.7.9.5


