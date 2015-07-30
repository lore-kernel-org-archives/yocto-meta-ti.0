Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56612E00A97; Wed, 29 Jul 2015 20:15:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CAD8E00A7E
	for <meta-ti@yoctoproject.org>; Wed, 29 Jul 2015 20:15:45 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSA00AXN6E7XLC0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 29 Jul 2015 22:15:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=rN3WQaUR8pGQNz_IY8sA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6E012161B1D;	Wed,
	29 Jul 2015 23:15:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 29 Jul 2015 23:15:41 -0400
Message-id: <1438226142-4379-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438226142-4379-1-git-send-email-denis@denix.org>
References: <1438226142-4379-1-git-send-email-denis@denix.org>
Subject: [fido/master][PATCH 2/3] amx3-cm3: add new PM firmware for 4.1 kernel
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
X-List-Received-Date: Thu, 30 Jul 2015 03:15:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cm3-pm-firmware/{am33x-cm3_git.bb => amx3-cm3_git.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 copy recipes-bsp/cm3-pm-firmware/{am33x-cm3_git.bb => amx3-cm3_git.bb} (89%)

diff --git a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
similarity index 89%
copy from recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
copy to recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 7e636ee..d322530 100644
--- a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -3,12 +3,11 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "1.9.0"
+PV = "1.9.1"
 PR = "r0"
-PE = "1"
 
-SRCREV = "d85e6a17da1025adac9ab7f97dd7aa2a58c517ce"
-BRANCH ?= "ti-v3.14.y"
+SRCREV = "277eef8611e260a5d73a9e3773fff8f767fe2b01"
+BRANCH ?= "next-upstream"
 
 SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
 
-- 
2.2.0


