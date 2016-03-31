Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51473E00C87; Thu, 31 Mar 2016 08:47:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6717E00C92
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:47:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1686A52AB9; Thu, 31 Mar 2016 15:47:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160331154716.1686A52AB9@arago-project.org>
Date: Thu, 31 Mar 2016 15:47:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : nwal-lld: Bump SRCREV for fix
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
X-List-Received-Date: Thu, 31 Mar 2016 15:47:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 07a53bb22f00bcb72d69541829cd28bd84cc2e69
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=07a53bb22f00bcb72d69541829cd28bd84cc2e69

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Mar 24 22:48:40 2016 +0000

nwal-lld: Bump SRCREV for fix

* Update Osal_cache_op_measure to take pointer to a double long to
  match with the hplib

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/nwal-lld/nwal-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index eb220f8..81450ff 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -8,15 +8,15 @@ NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
 NWAL_LLD_GIT_PROTOCOL = "git"
 NWAL_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.10"
-NWAL_LLD_SRCREV = "fc14159765777305a234e732b6170d025394250a"
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.10A"
+NWAL_LLD_SRCREV = "e7ed8c5abc4b93b99a5f45699eef8f3b8ca51d1e"
 
 BRANCH = "${NWAL_LLD_GIT_BRANCH}"
 SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${NWAL_LLD_SRCREV}"
 
 PV = "02.01.00.10"
-INC_PR = "r0"
+INC_PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"


