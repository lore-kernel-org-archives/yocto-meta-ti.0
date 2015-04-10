Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB5EAE009E2; Fri, 10 Apr 2015 15:09:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43E99E009B1
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6A96352A77; Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220932.6A96352A77@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : pa-lld: Update to new version 3.0.1.4
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 34a31a1b1cd918d4501c8d928b7d8c0ea37c97c9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=34a31a1b1cd918d4501c8d928b7d8c0ea37c97c9

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 03:58:18 2015 +0000

pa-lld: Update to new version 3.0.1.4

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/pa-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index e93ce15..7d922fb 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -6,10 +6,10 @@ COMPATIBLE_MACHINE = "keystone"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.01"
-SRCREV = "55207930b4491f33776f2c4c2c0707a73c69314c"
-PV = "03.00.01.01"
-PR = "r0"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.04"
+SRCREV = "92de8879be3712af684bd031ca0ed291c05d6050"
+PV = "03.00.01.04"
+PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/pa"


