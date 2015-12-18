Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2519FE00B88; Thu, 17 Dec 2015 17:07:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F27AE00B5C
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:07:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7888152A71; Fri, 18 Dec 2015 01:07:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151218010723.7888152A71@arago-project.org>
Date: Fri, 18 Dec 2015 01:07:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : qmss-pdsp-fw, ti-sci-fw: update ti-linux-firmware. git branch to ti-linux-firmware-4.1.y
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
X-List-Received-Date: Fri, 18 Dec 2015 01:07:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4d90779f48fd774cda8e48abe8a4ebf61af07bd0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4d90779f48fd774cda8e48abe8a4ebf61af07bd0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Dec 18 06:09:20 2015 +0000

qmss-pdsp-fw, ti-sci-fw: update ti-linux-firmware.git branch to ti-linux-firmware-4.1.y

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>

---

 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb |    6 +++---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb       |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
index dfff22e..b8c49a7 100644
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
+++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
 PV = "1.0.0.9"
-PR = "r0"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
-BRANCH ?= "master"
+SRCREV = "778668c4bb5fe59870e549a4a2820b9f7f90e89e"
+BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 4294c6b..dff0712 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
 PV = "0.1.0.70"
-PR = "r0"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE = "k2g-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "a5b1c3d043fef5869eaa937276976c0e3e23b966"
-BRANCH ?= "master"
+SRCREV = "778668c4bb5fe59870e549a4a2820b9f7f90e89e"
+BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 


