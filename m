Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12A9EE00D38; Wed, 29 Jun 2016 11:53:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6639E00CFC
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 11:53:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TIqxUB003548
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 13:52:59 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TIqx9O004239
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 13:52:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 13:52:58 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5TIqwtG030005;	Wed, 29 Jun 2016 13:52:59 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 29 Jun 2016 14:52:53 -0400
Message-ID: <1467226373-14454-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [master/krogoth][PATCH] dfe-lld: Bump version
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
X-List-Received-Date: Wed, 29 Jun 2016 18:53:04 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/dfe-lld/dfe-lld.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index c1d8643..92c6034 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -7,14 +7,14 @@ DFE_LLD_GIT_PROTOCOL = "git"
 DFE_LLD_GIT_BRANCH = "master"
 DFE_LLD_GIT_DESTSUFFIX = "git/ti/drv/dfe"
 
-# The following commit correspond to DEV.DFE_LLD.01.00.00.07
-DFE_LLD_SRCREV = "7a85310ee5e406f50a4c118610e07aade7d3cee2"
+# Below commit ID corresponds to "DEV.DFE_LLD.01.00.00.08"
+DFE_LLD_SRCREV = "d51482ef18889bbbd8e9cdc207c6fe9e27b1ab03"
 
 BRANCH = "${DFE_LLD_GIT_BRANCH}"
 SRC_URI = "${DFE_LLD_GIT_URI};destsuffix=${DFE_LLD_GIT_DESTSUFFIX};protocol=${DFE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${DFE_LLD_SRCREV}"
 
-PV = "1.0.0.7"
+PV = "1.0.0.8"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l-evm"
-- 
1.7.10.4


