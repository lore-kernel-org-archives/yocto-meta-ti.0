Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D476E00CD5; Mon, 19 Dec 2016 15:15:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52A93E00CD5
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7A9AB52AC9; Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231547.7A9AB52AC9@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : pa-lld: Upstream version 3.0.2.1
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
X-List-Received-Date: Mon, 19 Dec 2016 23:15:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: f34b7fa11d5de79b21e24bd1fa2f9aaff84b0d9a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f34b7fa11d5de79b21e24bd1fa2f9aaff84b0d9a

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:35 2016 +0000

pa-lld: Upstream version 3.0.2.1

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pa-lld/pa-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 345de61..62d539b 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,14 +9,14 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.00"
-PA_LLD_SRCREV = "dca2a281c0c57f3b3018a93fae5485825a33042c"
+# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.01"
+PA_LLD_SRCREV = "e95de49323678a55072c90fb213b94f96cf494b1"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.02.00"
+PV = "03.00.02.01"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"


