Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E06AFE009E1; Fri, 10 Apr 2015 15:09:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57E4CE009B2
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DB15452AA5; Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220932.DB15452AA5@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : netapi: Update to new version 1.1.0.5
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d616b0ac65e4cffad2f9ca939db670a2a6a641f1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d616b0ac65e4cffad2f9ca939db670a2a6a641f1

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 04:02:45 2015 +0000

netapi: Update to new version 1.1.0.5

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index b8d481a..eae436c 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f230
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
-# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.04"
-SRCREV= "dc08af268200908d3d8a456ac852c65c53d2fd12"
-PV = "01.01.00.04"
+# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.05C"
+SRCREV = "fc407a408e6c7e4cad6b5f0dd4367049abfd375f"
+PV = "01.01.00.05"
 
 DEVICELIST = "k2h k2k k2l k2e"
 


