Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9368E007E1; Mon, 19 Oct 2015 14:12:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 059A7E00843
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F178852AC6; Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211147.F178852AC6@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : srio-lld: Update to new version 2.0.0.13
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
X-List-Received-Date: Mon, 19 Oct 2015 21:12:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8417ec6e31128c123e7e96f704c2a7c9581c0e95
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8417ec6e31128c123e7e96f704c2a7c9581c0e95

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:34:57 2015 +0000

srio-lld: Update to new version 2.0.0.13

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index 75435d9..0f1ee2d 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;end
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/srio-lld.git;destsuffix=git/ti/drv/srio;protocol=git;branch=${BRANCH}"
 
-# commit ID corresponding to DEV.SRIO_LLD.02.00.00.12
-SRCREV = "fb1c484f781bab73e742e4e265c9f7469c8b3350"
-PV = "02.00.00.12"
+# commit ID corresponding to DEV.SRIO_LLD.02.00.00.13
+SRCREV = "dc49972265afd3ffd3b29ca235b8ca6daf790bd1"
+PV = "02.00.00.13"
 
 DEVICELIST = "k2h k2k"
 


