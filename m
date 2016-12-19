Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23D1EE00B8F; Mon, 19 Dec 2016 15:15:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74EC6E009E2
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4B45752AC9; Mon, 19 Dec 2016 23:15:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231542.4B45752AC9@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : sa-lld: Upstream version 3.0.0.16
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
X-List-Received-Date: Mon, 19 Dec 2016 23:15:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ff8dba2663923297a3f69cc2ca03f50103facfb3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ff8dba2663923297a3f69cc2ca03f50103facfb3

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:36 2016 +0000

sa-lld: Upstream version 3.0.0.16

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/sa-lld/sa-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 0eb2196..853abdd 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -8,14 +8,14 @@ SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Below commit ID corresponds to "DEV.SA_LLD.03.00.00.15"
-SA_LLD_SRCREV = "59dbcc8b1ed05d81161bc4c472bed8916a004728"
+# Below commit ID corresponds to "DEV.SA_LLD.03.00.00.16"
+SA_LLD_SRCREV = "eb1508714586f92e66bf5a8a4c212e8277f6b065"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
-PV = "03.00.00.15"
+PV = "03.00.00.16"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"


