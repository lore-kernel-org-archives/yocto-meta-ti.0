Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77D76E00BE9; Thu, 18 Dec 2014 15:55:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32DF9E00BC0
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 15:55:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 292CD52A6B; Thu, 18 Dec 2014 23:55:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141218235530.292CD52A6B@arago-project.org>
Date: Thu, 18 Dec 2014 23:55:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update to version 0x190
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
X-List-Received-Date: Thu, 18 Dec 2014 23:55:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6f6e5ef243f17f2dbaac3c2ea0b373fe249ab373
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6f6e5ef243f17f2dbaac3c2ea0b373fe249ab373

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Dec 19 05:07:37 2014 +0000

am33x-cm3: update to version 0x190

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/am33x-cm3/am33x-cm3_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index 81431e9..7e636ee 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "1.8.9"
-PR = "r1"
+PV = "1.9.0"
+PR = "r0"
 PE = "1"
 
-SRCREV = "4e219d5053ee41b8fa8f85b48b1529ae4c6feb48"
-BRANCH ?= "next"
+SRCREV = "d85e6a17da1025adac9ab7f97dd7aa2a58c517ce"
+BRANCH ?= "ti-v3.14.y"
 
 SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
 


