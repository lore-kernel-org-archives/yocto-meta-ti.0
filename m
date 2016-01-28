Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFCA0E00B37; Thu, 28 Jan 2016 10:43:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A01BE00BAB
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id F2C6B52A94; Thu, 28 Jan 2016 18:43:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184353.F2C6B52A94@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : nwal-lld: Upgrade to version 02.01.00.09
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 144a78d3c8eb696e27fa65bba45bc5b0b140325f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=144a78d3c8eb696e27fa65bba45bc5b0b140325f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:06 2016 +0000

nwal-lld: Upgrade to version 02.01.00.09

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/nwal-lld/nwal-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 9a91a6f..d18f7d8 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -8,15 +8,15 @@ NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
 NWAL_LLD_GIT_PROTOCOL = "git"
 NWAL_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.08"
-NWAL_LLD_SRCREV = "e6df99e59a848c7afffe90fc9710b7dcb8067c31"
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.09"
+NWAL_LLD_SRCREV = "ac1d899e0dbd3709848fbf1d121374e8953a3695"
 
 BRANCH = "${NWAL_LLD_GIT_BRANCH}"
 SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${NWAL_LLD_SRCREV}"
 
-PV = "02.01.00.08"
-INC_PR = "r2"
+PV = "02.01.00.09"
+INC_PR = "r0"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"


