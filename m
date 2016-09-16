Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E099EE00CA5; Fri, 16 Sep 2016 09:19:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B3D4E00C97
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 92FE152AA8; Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161910.92FE152AA8@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : qmss-lld: Bump version
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 5bee8bd4a7fca8ed2242925734ea2b87d467cdcc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5bee8bd4a7fca8ed2242925734ea2b87d467cdcc

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Sep 14 07:29:19 2016 +0000

qmss-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index ed560c8..65764b3 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -9,15 +9,15 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.14A
-QMSS_LLD_SRCREV = "8fc6a846e509d6ad8499e1de68abd912d7947069"
+# commit ID corresponding to "DEV.QMSS_LLD.02.01.00.14B"
+QMSS_LLD_SRCREV = "04095405680f4ec92eeef9312ba04f7808b1c813"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
-PV = "02.01.00.14"
-INC_PR = "r1"
+PV = "02.01.00.14B"
+INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"


