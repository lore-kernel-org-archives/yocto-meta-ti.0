Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3553DE00CAE; Mon, 25 Apr 2016 06:08:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92801E00972
	for <meta-ti@yoctoproject.org>; Mon, 25 Apr 2016 06:08:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3PD8IOx023829
	for <meta-ti@yoctoproject.org>; Mon, 25 Apr 2016 08:08:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3PD8IEA017709
	for <meta-ti@yoctoproject.org>; Mon, 25 Apr 2016 08:08:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 25 Apr 2016 08:08:17 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3PD8HuH007306;	Mon, 25 Apr 2016 08:08:18 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 25 Apr 2016 09:08:16 -0400
Message-ID: <1461589696-22815-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] netapi: clean up recipes
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
X-List-Received-Date: Mon, 25 Apr 2016 13:08:21 -0000
Content-Type: text/plain

* Define variables to abstract GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/netapi/netapi.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index d710a22..7ce8f19 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -9,13 +9,19 @@ DEBIAN_NOAUTONAME_${PN}-dev = "1"
 DEBIAN_NOAUTONAME_${PN}-dbg = "1"
 DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
+NETAPI_GIT_URI = "git://git.ti.com/keystone-rtos/netapi.git"
+NETAPI_GIT_PROTOCOL = "git"
+NETAPI_GIT_BRANCH = "master"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
-SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
+NETAPI_SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
+
+BRANCH = "${NETAPI_GIT_BRANCH}"
+SRC_URI = "${NETAPI_GIT_URI};protocol=${NETAPI_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${NETAPI_SRCREV}"
+
 PV = "01.01.00.06"
-INC_PR = "r4"
+INC_PR = "r5"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-- 
1.9.1


