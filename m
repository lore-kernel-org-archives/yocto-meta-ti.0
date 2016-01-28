Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 119E5E00B3D; Thu, 28 Jan 2016 10:44:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7086FE00BDA
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5D7FD52A4B; Thu, 28 Jan 2016 18:43:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184354.5D7FD52A4B@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : traceframework: Upgrade to version 01.01.01.08
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
X-List-Received-Date: Thu, 28 Jan 2016 18:44:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 3ac14c604ae774b6f23783f5ddbd779548e7d884
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3ac14c604ae774b6f23783f5ddbd779548e7d884

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:11 2016 +0000

traceframework: Upgrade to version 01.01.01.08

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 31818c6..298ead4 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -7,15 +7,15 @@ TRACEFRAMEWORK_GIT_PROTOCOL = "git"
 TRACEFRAMEWORK_GIT_BRANCH = "master"
 TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
 
-# Below commit ID corresponds to DEV.TFWK-01.01.01.07
-TRACEFRAMEWORK_SRCREV = "8d9c0e3a5bcb43aad98a794c31f42b652c6b3b53"
+# Below commit ID corresponds to DEV.TFWK-01.01.01.08
+TRACEFRAMEWORK_SRCREV = "4e84c37c456ca62188cc9560d4ebf22452dab01f"
 
 BRANCH="${TRACEFRAMEWORK_GIT_BRANCH}"
 SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
 
-PV = "01.01.01.07"
-PR = "r4"
+PV = "01.01.01.08"
+PR = "r0"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"


