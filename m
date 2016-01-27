Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDD63E00B8C; Wed, 27 Jan 2016 12:55:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47A8FE00BB5
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2CCA152ABD; Wed, 27 Jan 2016 20:54:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205450.2CCA152ABD@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : cppi-lld: Upgrade version to 2.1.0.11
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
X-List-Received-Date: Wed, 27 Jan 2016 20:55:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c3c3278598d483e3db5b9f972d074da6f22776d0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c3c3278598d483e3db5b9f972d074da6f22776d0

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:48 2016 +0000

cppi-lld: Upgrade version to 2.1.0.11

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cppi-lld/cppi-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index 6182973..26d0e5c 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -9,15 +9,15 @@ CPPI_LLD_GIT_PROTOCOL = "git"
 CPPI_LLD_GIT_BRANCH = "master"
 CPPI_LLD_GIT_DESTSUFFIX = "git/ti/drv/cppi"
 
-# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.10"
-CPPI_LLD_SRCREV = "97c537fa544a78e83512db3499a49d0bd86fad32"
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.11"
+CPPI_LLD_SRCREV = "91047a01a6d64d7ffaf650c6ebb280de775af997"
 
 BRANCH = "${CPPI_LLD_GIT_BRANCH}"
 SRC_URI = "${CPPI_LLD_GIT_URI};destsuffix=${CPPI_LLD_GIT_DESTSUFFIX};protocol=${CPPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${CPPI_LLD_SRCREV}"
-PV = "02.01.00.10"
-INC_PR = "r3"
+PV = "02.01.00.11"
+INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"


