Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55F1DE00AB5; Thu, 28 Jan 2016 06:41:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6674E00A92
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 06:41:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SEfGiX026724
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SEfGOl029340
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 08:41:16 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SEfDlI029208;	Thu, 28 Jan 2016 08:41:15 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jan 2016 09:41:09 -0500
Message-ID: <1453992071-23149-10-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
References: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] sa-lld: Upgrade to version 03.00.00.12
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
X-List-Received-Date: Thu, 28 Jan 2016 14:41:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/sa-lld/sa-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 47584b6..3746a1e 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -8,14 +8,14 @@ SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Following commit DEV.SA_LLD.03.00.00.11A
-SA_LLD_SRCREV = "bf5b097e868b20d23d386abc34a1902903d7d9ea"
+# Following commit DEV.SA_LLD.03.00.00.12
+SA_LLD_SRCREV = "b3bd2741126230b397ca827def5fcf6e6f019574"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
-PV = "03.00.00.11"
-INC_PR = "r1"
+PV = "03.00.00.12"
+INC_PR = "r0"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


