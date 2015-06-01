Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7604EE00A54; Mon,  1 Jun 2015 07:55:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CE01E00A7B
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:55:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3680352A47; Mon,  1 Jun 2015 14:55:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601145515.3680352A47@arago-project.org>
Date: Mon,  1 Jun 2015 14:55:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld: Update to version 2.12.01.21.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:55:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 7fe643539d4011a1919987ecb130f58e347fcd48
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7fe643539d4011a1919987ecb130f58e347fcd48

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 22:20:16 2015 +0000

edma3-lld: Update to version 2.12.01.21.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index e6dd92b..28c49e3 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -3,8 +3,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
-# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
-SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
+SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git;protocol=git;branch=${BRANCH}"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_12_01_21_RC1
+SRCREV = "562cba36ccd53e89e6979e99a58374513b543f93"
 
-PV = "2.11.13"
+PV = "2.12.01.21"


