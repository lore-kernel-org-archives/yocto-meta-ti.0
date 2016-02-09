Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 413D5E00DB2; Tue,  9 Feb 2016 07:35:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08890E00CB1
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 07:35:31 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2A00K3NDYO8J30@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 09 Feb 2016 09:35:13 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=xm64Gfm1BVmEh1FHTg4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 537EB161E8B;	Tue,
	9 Feb 2016 10:35:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 09 Feb 2016 10:35:11 -0500
Message-id: <1455032111-32712-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] common-csl-ip: only rtos part is machine-specific, not main package
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
X-List-Received-Date: Tue, 09 Feb 2016 15:35:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 4 +++-
 recipes-bsp/common-csl-ip/common-csl-ip.inc         | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 6f7d3cc..41a0d43 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,7 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit ti-pdk
 
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index c81b0f1..e51dd7b 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -3,10 +3,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PV = "3.3.0.1B"
-INC_PR = "r0"
+INC_PR = "r1"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
 CSL_GIT_PROTOCOL ="git"
-- 
2.2.0


