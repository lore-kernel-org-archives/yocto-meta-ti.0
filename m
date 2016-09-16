Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42772E00CAB; Fri, 16 Sep 2016 09:19:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22E89E00C97
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1F510529AA; Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161906.1F510529AA@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : common-csl-ip: Bump version
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f16d65902bf8a4b28e589bb0fe4d9b38951e7996
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f16d65902bf8a4b28e589bb0fe4d9b38951e7996

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Sep 14 07:29:16 2016 +0000

common-csl-ip: Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 77dfd1b..a6c3887 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 
-PV = "3.3.0.3C"
+PV = "03.03.00.04A"
 INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
@@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.03C"
-CSL_SRCREV = "ccd8dc29a5edce1a4d6409cb06b460bec6d3ecac"
+# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.04A"
+CSL_SRCREV = "64aba2b19c2f03ef0e5b1814489c910bb19ca2ee"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"


