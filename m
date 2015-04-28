Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFEC8E009A5; Tue, 28 Apr 2015 15:31:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24B63E009A5
	for <meta-ti@yoctoproject.org>; Tue, 28 Apr 2015 15:31:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3387052A8F; Tue, 28 Apr 2015 22:31:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150428223148.3387052A8F@arago-project.org>
Date: Tue, 28 Apr 2015 22:31:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : netapi: Update to new version 1.1.0.6
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
X-List-Received-Date: Tue, 28 Apr 2015 22:31:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: a9cac6d38ba194f2f56a3deddc6d4b2d8210e8e6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a9cac6d38ba194f2f56a3deddc6d4b2d8210e8e6

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Apr 28 20:12:20 2015 +0000

netapi: Update to new version 1.1.0.6

- Fixes issues with parallel builds

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index eae436c..0ba4eeb 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f230
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.05C"
-SRCREV = "fc407a408e6c7e4cad6b5f0dd4367049abfd375f"
-PV = "01.01.00.05"
+# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
+SRCREV = "42eefef1b4bdc659fc8fc42e8f2bc74a4b155265"
+PV = "01.01.00.06"
 
 DEVICELIST = "k2h k2k k2l k2e"
 


