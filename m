Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75290E00945; Tue, 10 Feb 2015 12:41:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B53BE00815
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:40:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7C30152A65; Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150210204056.7C30152A65@arago-project.org>
Date: Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : common-csl-ip: Update to version 2.1.0.6
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
X-List-Received-Date: Tue, 10 Feb 2015 20:41:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e19f8be96aa0b6d7ad67a3de2f487e5d151e7cba
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e19f8be96aa0b6d7ad67a3de2f487e5d151e7cba

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Feb  6 05:58:41 2015 +0000

common-csl-ip: Update to version 2.1.0.6

- Commit id updated

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
index a6f46db..b242482 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 COMPATIBLE_MACHINE = "keystone"
 ALLOW_EMPTY_${PN} = "1"
 
-PR = "r1"
+PR = "r2"
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
-# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.05A
-SRCREV = "80d18dda4a76ce1a22cf2b5156f111390d75bea4"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.06A
+SRCREV = "6e39222e13244c285929bda2f90f5224f9ea5144"
 
 S = "${WORKDIR}/git"
 


