Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B473EE0086D; Mon, 19 Oct 2015 14:11:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC48CE007AA
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 70A6152ABC; Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211147.70A6152ABC@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : qmss-lld: Update to new version 2.1.0.11
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 238c1a5411eb5fa197f33d0787dbb72db93a0a9e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=238c1a5411eb5fa197f33d0787dbb72db93a0a9e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:14:47 2015 +0000

qmss-lld: Update to new version 2.1.0.11

-Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index d2eb81b..29ef0ce 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acd
 BRANCH ="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git;destsuffix=git/ti/drv/qmss;protocol=git;branch=${BRANCH}"
 
-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.10
-SRCREV = "ffec14248f460b7cf4def4457f9c2335df62618d"
-PV = "02.01.00.10"
-PR = "r1"
+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.11
+SRCREV = "2024ab2d411c1a6dd3f5e768a3cb30c2a685f1e4"
+PV = "02.01.00.11"
 
 DEVICELIST = "k2h k2k k2l k2e"
 


