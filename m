Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2385EE007DA; Wed, 18 Nov 2015 15:17:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_DYNIP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  0.3 TO_NO_BRKTS_DYNIP To: lacks brackets and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 511BFE005BB
	for <meta-ti@yoctoproject.org>; Wed, 18 Nov 2015 15:17:09 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DE28152A77; Wed, 18 Nov 2015 23:17:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151118231708.DE28152A77@arago-project.org>
Date: Wed, 18 Nov 2015 23:17:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cm3-pm-firmware: update with the new git URL
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
X-List-Received-Date: Wed, 18 Nov 2015 23:17:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4f095b2a099be3a088db598ab8666023b65ab1f1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f095b2a099be3a088db598ab8666023b65ab1f1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Nov 18 05:37:15 2015 +0000

cm3-pm-firmware: update with the new git URL

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb |    4 ++--
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
index 7e636ee..338028f 100644
--- a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
@@ -4,13 +4,13 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.0"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRCREV = "d85e6a17da1025adac9ab7f97dd7aa2a58c517ce"
 BRANCH ?= "ti-v3.14.y"
 
-SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 80ca045..9344371 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -4,12 +4,12 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.1"
-PR = "r1"
+PR = "r2"
 
 SRCREV = "730f0695ca2dda65abcff5763e8f108517bc0d43"
 BRANCH ?= "ti-v4.1.y"
 
-SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 


