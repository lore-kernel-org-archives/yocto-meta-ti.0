Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15A0EE00CDC; Tue, 19 Jul 2016 18:42:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7C05E00CE5
	for <meta-ti@yoctoproject.org>; Tue, 19 Jul 2016 18:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DF8BB52AC4; Wed, 20 Jul 2016 01:42:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160720014224.DF8BB52AC4@arago-project.org>
Date: Wed, 20 Jul 2016 01:42:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : netapi: Upgrade to version 1.1.0.7
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
X-List-Received-Date: Wed, 20 Jul 2016 01:42:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 329a51849d4fb28968e45aac7c049dd0f05a8986
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=329a51849d4fb28968e45aac7c049dd0f05a8986

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Jul 12 19:44:52 2016 +0000

netapi: Upgrade to version 1.1.0.7

* update DT path to rxqueue

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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


