Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A24DE009B6; Fri, 10 Apr 2015 15:09:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8233E00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CF69C529AF; Fri, 10 Apr 2015 22:09:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220931.CF69C529AF@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : dfe-lld: Update to new version 1.0.0.4
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 79945047c74dc914073d0cd7f157a271259076e7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=79945047c74dc914073d0cd7f157a271259076e7

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 03:51:34 2015 +0000

dfe-lld: Update to new version 1.0.0.4

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dfe-lld/dfe-lld.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index 4979499..2053c74 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -3,10 +3,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1f4217b705bf98762a302fd720649dcc"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/dfe-lld.git;destsuffix=git/ti/drv/dfe;protocol=git;branch=${BRANCH}"
-# The following commit correspond to DEV.DFE_LLD.01.00.00.03C
-SRCREV = "ed20e87d3676e3e05ce2b78179b504a05083ad15"
+# The following commit correspond to DEV.DFE_LLD.01.00.00.04C
+SRCREV = "62da141c1cf6224d24161f0c020091043a3d7c82"
 
-PV = "1.0.0.3"
+PV = "1.0.0.4"
 
 COMPATIBLE_MACHINE = "k2l-evm"
 


