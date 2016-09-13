Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C98AE00C0E; Mon, 12 Sep 2016 19:27:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D4A9E00C3E
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 19:27:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B7FD552AC3; Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160913022704.B7FD552AC3@arago-project.org>
Date: Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : amx3-cm3: update to 1.9.2 version
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
X-List-Received-Date: Tue, 13 Sep 2016 02:27:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c02651fe1466422c5781c3cc235a12932fb0cd58
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c02651fe1466422c5781c3cc235a12932fb0cd58

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 13 04:40:56 2016 +0000

amx3-cm3: update to 1.9.2 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 448a5d3..5a2b08b 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "1.9.1"
-PR = "r3"
+PV = "1.9.2"
+PR = "r0"
 
-SRCREV = "97c2c32d0bc8ca0254710dcb5df055aa9a569ae6"
+SRCREV = "7eb9c0856a9e8b3b42bf64f761da135852b8eea7"
 BRANCH ?= "ti-v4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"


