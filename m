Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41B03E00D48; Sun,  3 Jul 2016 19:14:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 139F8E00D0C
	for <meta-ti@yoctoproject.org>; Sun,  3 Jul 2016 19:14:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 33606529BF; Mon,  4 Jul 2016 02:14:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160704021431.33606529BF@arago-project.org>
Date: Mon,  4 Jul 2016 02:14:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : edma3-lld: Bump version
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
X-List-Received-Date: Mon, 04 Jul 2016 02:14:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: e03eaff8efbe0c3838f04e02842ad40bf778a760
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e03eaff8efbe0c3838f04e02842ad40bf778a760

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Jun 30 05:28:30 2016 +0000

edma3-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index ff0ad47..4de5987 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-# The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_23A
-EDMA3_LLD_SRCREV = "84c84a82332b30ece3b00f7d769270466ae836e0"
+# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_01_24"
+EDMA3_LLD_SRCREV = "e864a057032b070fc04628bac1345ecef01e2224"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.01.23"
+PV = "2.12.01.24"
 INC_PR = "r0"


