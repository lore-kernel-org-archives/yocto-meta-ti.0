Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 448C1E00B8C; Wed, 16 Mar 2016 11:41:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58B2EE00A27
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 11:40:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8DC2152A5F; Wed, 16 Mar 2016 18:40:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160316184058.8DC2152A5F@arago-project.org>
Date: Wed, 16 Mar 2016 18:40:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : dsptop: Upgrade to 1.3.0
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
X-List-Received-Date: Wed, 16 Mar 2016 18:41:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 1ae58a680d16c8850de68c03d569d786586b5473
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1ae58a680d16c8850de68c03d569d786586b5473

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Mar 15 01:09:47 2016 +0000

dsptop: Upgrade to 1.3.0

* This upgrade includes debugss support for AM57xx EVM PG2.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/dsptop.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
index 04bf060..956dc31 100644
--- a/recipes-bsp/dsptop/dsptop.inc
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -1,7 +1,7 @@
-# This corresponds to version 1.2.0
-SRCREV = "7dca008bec245e4292897e2eea7b2edb0c51cd2b"
-PV = "1.2.0"
-INC_PR = "r2"
+# This corresponds to version 1.3.0
+SRCREV = "4d92879b632ba70402b61fa65cc58f5373eb5217"
+PV = "1.3.0"
+INC_PR = "r0"
 
 SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
 


