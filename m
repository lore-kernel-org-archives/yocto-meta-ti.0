Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0CC9E00C8D; Thu, 31 Mar 2016 08:47:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4BE3E00C8D
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:47:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D0EE452AD9; Thu, 31 Mar 2016 15:47:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160331154716.D0EE452AD9@arago-project.org>
Date: Thu, 31 Mar 2016 15:47:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : qmss-lld: Bump SRCREV for fix
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
X-List-Received-Date: Thu, 31 Mar 2016 15:47:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d484cf2f4a4958b9416aaebe48491b764a245b63
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d484cf2f4a4958b9416aaebe48491b764a245b63

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Mar 24 22:48:38 2016 +0000

qmss-lld: Bump SRCREV for fix

* Fix linker option for linux example and test binaries

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 2395a4d..ed560c8 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -9,15 +9,15 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.14
-QMSS_LLD_SRCREV = "4cc3a3f1bcddfc19e2e7d8dd4208ca215e7ecbae"
+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.14A
+QMSS_LLD_SRCREV = "8fc6a846e509d6ad8499e1de68abd912d7947069"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
 PV = "02.01.00.14"
-INC_PR = "r0"
+INC_PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"


