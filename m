Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55980E00C46; Thu, 24 Mar 2016 09:48:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A975E00C3B
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 09:48:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2OGmjYr025513
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:45 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2OGmjvg018771
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 24 Mar 2016 11:48:45 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2OGmhsn013865;	Thu, 24 Mar 2016 11:48:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 24 Mar 2016 12:48:39 -0400
Message-ID: <1458838121-2846-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
References: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] sa-lld: Bump SRCREV for fix
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

* Fix linker option for linux example and test binaries

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/sa-lld/sa-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 3e3392b..3c698b6 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -8,14 +8,14 @@ SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Following commit DEV.SA_LLD.03.00.00.13
-SA_LLD_SRCREV = "ddde4d990482c8f727411a014512bc7959ab2c05"
+# Following commit DEV.SA_LLD.03.00.00.13A
+SA_LLD_SRCREV = "5918d9a519789c34368388c49869cb857d6255f7"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
 PV = "03.00.00.13"
-INC_PR = "r0"
+INC_PR = "r1"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


