Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1491E00DEB; Mon, 19 Dec 2016 15:15:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DB4BE00D1C
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C29C452ACE; Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231547.C29C452ACE@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : nwal-lld: Upstream version 2.1.0.11A
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
Commit: c971a8f601d6c7afca40844c49c3a9914b15f762
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c971a8f601d6c7afca40844c49c3a9914b15f762

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:38 2016 +0000

nwal-lld: Upstream version 2.1.0.11A

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/nwal-lld/nwal-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 53f7313..69e43d1 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -8,15 +8,15 @@ NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
 NWAL_LLD_GIT_PROTOCOL = "git"
 NWAL_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.10A"
-NWAL_LLD_SRCREV = "e7ed8c5abc4b93b99a5f45699eef8f3b8ca51d1e"
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.11A"
+NWAL_LLD_SRCREV = "a93303e3d682d7161030113b72c3e1adf755bf89"
 
 BRANCH = "${NWAL_LLD_GIT_BRANCH}"
 SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${NWAL_LLD_SRCREV}"
 
-PV = "02.01.00.10"
-INC_PR = "r1"
+PV = "02.01.00.11A"
+INC_PR = "r0"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"


