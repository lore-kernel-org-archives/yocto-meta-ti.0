Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8687E0086A; Mon, 19 Oct 2015 14:11:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAB79E0048C
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6C26052A5A; Mon, 19 Oct 2015 21:11:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211146.6C26052A5A@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : cppi-lld: Update to new version 2.1.0.10
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 52ea6a9efe388d551b0f2f16c7a811ae095cbb0f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=52ea6a9efe388d551b0f2f16c7a811ae095cbb0f

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:16:17 2015 +0000

cppi-lld: Update to new version 2.1.0.10

-Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cppi-lld/cppi-lld.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index 0a8ee55..21c8fe0 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acd
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git;destsuffix=git/ti/drv/cppi;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.08"
-SRCREV = "320af092dc382af52b9e68f14ca8acd5c1c467c1"
-PV = "02.01.00.09"
-PR = "r1"
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.01.00.10"
+SRCREV = "97c537fa544a78e83512db3499a49d0bd86fad32"
+PV = "02.01.00.10"
 
 DEVICELIST = "k2h k2k k2l k2e"
 


