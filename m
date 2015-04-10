Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBA38E009BD; Fri, 10 Apr 2015 15:09:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43B07E009AE
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8733E52A78; Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220932.8733E52A78@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : sa-lld: Update to new version 3.0.0.10
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 02ef026612446fe2019a840da561261803e3936e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=02ef026612446fe2019a840da561261803e3936e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 03:59:44 2015 +0000

sa-lld: Update to new version 3.0.0.10

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/sa-lld/sa-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index d4bdc95..6dc8566 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/sa-lld.git;destsuffix=git/ti/drv/sa;protocol=git;branch=${BRANCH}"
-# Following commit DEV.SA_LLD.03.00.00.08
-SRCREV = "4da032c600ded79ab226a2a0100c1d8178a9da39"
-PV = "03.00.00.08"
-PR = "r0"
+# Following commit DEV.SA_LLD.03.00.00.10
+SRCREV = "533aec7ef0e28c3faff4ee64a861c8935262dc33"
+PV = "03.00.00.10"
+PR = "r1"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/sa"


