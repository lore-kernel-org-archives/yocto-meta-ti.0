Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E474CE0092C; Tue, 22 Mar 2016 12:14:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5120E00509
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 12:14:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CABD9529C7; Tue, 22 Mar 2016 19:14:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160322191436.CABD9529C7@arago-project.org>
Date: Tue, 22 Mar 2016 19:14:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : common-csl-ip: Bump SRCREV for fix
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
X-List-Received-Date: Tue, 22 Mar 2016 19:14:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 971e06dea5cdd4606189b4d7368040bc47407e50
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=971e06dea5cdd4606189b4d7368040bc47407e50

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Mar 21 22:44:19 2016 +0000

common-csl-ip: Bump SRCREV for fix

* Definition of PLLC registers in CSL: wrong offset for EMUCNT0/1

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 146cb3e..6243729 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 
-PV = "3.3.0.2A"
+PV = "3.3.0.2B"
 INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
@@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02A
-CSL_SRCREV = "e26dc44be132849d6bcf63b7e9eac744769577dc"
+# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02B
+CSL_SRCREV = "7fa7fa8a23189dd79921392fd4942a21610ea93c"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"


