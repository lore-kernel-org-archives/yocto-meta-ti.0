Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F820E00C49; Thu, 24 Mar 2016 09:48:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 595FCE00C3A
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 09:48:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2OGmknN025520
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2OGmkKC018782
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 24 Mar 2016 11:48:45 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2OGmhso013865;	Thu, 24 Mar 2016 11:48:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 24 Mar 2016 12:48:40 -0400
Message-ID: <1458838121-2846-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
References: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] nwal-lld: Bump SRCREV for fix
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

* Update Osal_cache_op_measure to take pointer to a double long to
  match with the hplib

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index eb220f8..81450ff 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -8,15 +8,15 @@ NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
 NWAL_LLD_GIT_PROTOCOL = "git"
 NWAL_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.10"
-NWAL_LLD_SRCREV = "fc14159765777305a234e732b6170d025394250a"
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.10A"
+NWAL_LLD_SRCREV = "e7ed8c5abc4b93b99a5f45699eef8f3b8ca51d1e"
 
 BRANCH = "${NWAL_LLD_GIT_BRANCH}"
 SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${NWAL_LLD_SRCREV}"
 
 PV = "02.01.00.10"
-INC_PR = "r0"
+INC_PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
-- 
1.9.1


