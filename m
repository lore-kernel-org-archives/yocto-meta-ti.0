Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29FD8E00DBF; Wed, 29 Jun 2016 14:12:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB92AE00DBF
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:11:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E50C352AD4; Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160629211156.E50C352AD4@arago-project.org>
Date: Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : srio-lld: Bump version
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
X-List-Received-Date: Wed, 29 Jun 2016 21:12:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0c88837fc3126d949f0daa6b9b22f1c20f4d37c9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0c88837fc3126d949f0daa6b9b22f1c20f4d37c9

Author: Justin Sobota <jsobota@ti.com>
Date:   Tue Jun 28 00:31:08 2016 +0000

srio-lld: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index f8ff7b3..7ec2a35 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -8,15 +8,15 @@ SRIO_LLD_GIT_PROTOCOL = "git"
 SRIO_LLD_GIT_BRANCH = "master"
 SRIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/srio"
 
-# commit ID corresponding to DEV.SRIO_LLD.02.00.00.15
-SRIO_LLD_SRCREV = "b773a7d08225c30737abc45ebc92a186bac08797"
+# commit ID corresponding to "DEV.SRIO_LLD.02.00.00.16"
+SRIO_LLD_SRCREV = "70664382b7baf0fc52b3504cc58d6d0d720cc639"
 
 BRANCH = "${SRIO_LLD_GIT_BRANCH}"
 SRC_URI = "${SRIO_LLD_GIT_URI};destsuffix=${SRIO_LLD_GIT_DESTSUFFIX};protocol=${SRIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SRIO_LLD_SRCREV}"
 
-PV = "02.00.00.15"
-INC_PR = "r0"
+PV = "02.00.00.16"
+INC_PR = "r1"
 
 DEVICELIST = "k2h k2k"
 


