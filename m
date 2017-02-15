Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B21FE009D4; Wed, 15 Feb 2017 13:28:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D131CE009D7
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 13:28:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 002C752A41; Wed, 15 Feb 2017 21:28:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170215212810.002C752A41@arago-project.org>
Date: Wed, 15 Feb 2017 21:28:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gowtham Tammana : ti-gc320-driver: move to k4.9
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
X-List-Received-Date: Wed, 15 Feb 2017 21:28:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4242f5ce8e1ac1d385373d3eca9bec80f6c87d39
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4242f5ce8e1ac1d385373d3eca9bec80f6c87d39

Author: Gowtham Tammana <g-tammana@ti.com>
Date:   Thu Feb 16 03:09:36 2017 +0000

ti-gc320-driver: move to k4.9

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 976904f..f292b10 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
-BRANCH = "ti-${PV}-k4.4"
+BRANCH = "ti-${PV}-k4.9"
 
-SRCREV = "7c0f4dc755dc2ecb95195ed42ef24fea16ef2667"
+SRCREV = "030df5ecf503ef3c83dca6e732e6d47d4a11cd4b"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"


