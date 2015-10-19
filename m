Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67938E00343; Mon, 19 Oct 2015 11:41:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B12DE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 11:41:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9B38C52961; Mon, 19 Oct 2015 18:41:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019184136.9B38C52961@arago-project.org>
Date: Mon, 19 Oct 2015 18:41:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : common-csl-ip: Update new version for Keystone2 02.01.01.00
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
X-List-Received-Date: Mon, 19 Oct 2015 18:41:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 087573d0a20df6217c5a8fc6cfaa4f7882c6a988
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=087573d0a20df6217c5a8fc6cfaa4f7882c6a988

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Oct 19 23:48:17 2015 +0000

common-csl-ip: Update new version for Keystone2 02.01.01.00

- Removed extra line

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index cbf2c3c..6355165 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-
 BRANCH="master"
 BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
 
 SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
 
-# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
-SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.01.00A
+SRCREV = "17bb083f0d5ed4ad6f38c991210a6a8e9aaf9c56"
 
 # commit ID corresponds to PROCESSOR-SDK-ALPHA-1
 SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"


