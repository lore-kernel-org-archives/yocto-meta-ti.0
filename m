Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B731AE00C54; Fri,  7 Oct 2016 11:41:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C3D8E00C44
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 11:41:02 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6E763529A3; Fri,  7 Oct 2016 18:41:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161007184101.6E763529A3@arago-project.org>
Date: Fri,  7 Oct 2016 18:41:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : dsptop: bump SRCREV to version 1.4.0
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
X-List-Received-Date: Fri, 07 Oct 2016 18:41:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 666e6bd210ddd1cc636616c879a66974df964dfe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=666e6bd210ddd1cc636616c879a66974df964dfe

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Oct  7 20:30:18 2016 +0000

dsptop: bump SRCREV to version 1.4.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/dsptop.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
index 956dc31..2106ec8 100644
--- a/recipes-bsp/dsptop/dsptop.inc
+++ b/recipes-bsp/dsptop/dsptop.inc
@@ -1,6 +1,6 @@
-# This corresponds to version 1.3.0
-SRCREV = "4d92879b632ba70402b61fa65cc58f5373eb5217"
-PV = "1.3.0"
+# This corresponds to version 1.4.0
+SRCREV = "0aedcabdbbcbfc7558f70fc50afc95583302a087"
+PV = "1.4.0"
 INC_PR = "r0"
 
 SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"


