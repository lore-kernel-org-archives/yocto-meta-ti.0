Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F67DE00CD4; Tue, 12 Jul 2016 06:45:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBCDAE007B7
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 06:45:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6CDhQSG025723
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 08:43:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6CDjTap018654
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 08:45:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Jul 2016 08:45:28 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6CDjSho000411;	Tue, 12 Jul 2016 08:45:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 12 Jul 2016 09:44:52 -0400
Message-ID: <1468331092-25062-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netapi: Upgrade to version 1.1.0.7
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
X-List-Received-Date: Tue, 12 Jul 2016 13:45:34 -0000
Content-Type: text/plain

* update DT path to rxqueue

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/netapi/netapi.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index 7ce8f19..3490cb7 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -13,15 +13,15 @@ NETAPI_GIT_URI = "git://git.ti.com/keystone-rtos/netapi.git"
 NETAPI_GIT_PROTOCOL = "git"
 NETAPI_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
-NETAPI_SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
+# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.07"
+NETAPI_SRCREV = "50026020384737d253668c4be80745a3653106f8"
 
 BRANCH = "${NETAPI_GIT_BRANCH}"
 SRC_URI = "${NETAPI_GIT_URI};protocol=${NETAPI_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${NETAPI_SRCREV}"
 
-PV = "01.01.00.06"
-INC_PR = "r5"
+PV = "01.01.00.07"
+INC_PR = "r0"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-- 
2.7.4


