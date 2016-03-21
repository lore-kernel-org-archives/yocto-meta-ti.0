Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B42CE00CC3; Mon, 21 Mar 2016 08:44:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21443E00CC4
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:44:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E054852AE9; Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160321154434.E054852AE9@arago-project.org>
Date: Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : traceframework: Bump SRCREV for fix
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
X-List-Received-Date: Mon, 21 Mar 2016 15:44:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cf0e2c35a3771bc29616e304ae2f1392111147f1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cf0e2c35a3771bc29616e304ae2f1392111147f1

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Mar 21 20:51:12 2016 +0000

traceframework: Bump SRCREV for fix

* tf:cuiaTest:fixing linker options

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 298ead4..49a7e95 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -7,15 +7,15 @@ TRACEFRAMEWORK_GIT_PROTOCOL = "git"
 TRACEFRAMEWORK_GIT_BRANCH = "master"
 TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
 
-# Below commit ID corresponds to DEV.TFWK-01.01.01.08
-TRACEFRAMEWORK_SRCREV = "4e84c37c456ca62188cc9560d4ebf22452dab01f"
+# Below commit ID corresponds to DEV.TFWK-01.01.01.08B
+TRACEFRAMEWORK_SRCREV = "e7a60a71a385337425547e3cac6716998c6a3528"
 
 BRANCH="${TRACEFRAMEWORK_GIT_BRANCH}"
 SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
 
 PV = "01.01.01.08"
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"


