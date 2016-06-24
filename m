Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C5F0E00D33; Fri, 24 Jun 2016 07:31:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 365D5E00C10
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 07:31:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BA8E052AC3; Fri, 24 Jun 2016 14:31:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160624143127.BA8E052AC3@arago-project.org>
Date: Fri, 24 Jun 2016 14:31:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm: Update SRCREV for adding new API
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
X-List-Received-Date: Fri, 24 Jun 2016 14:31:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: f39872ef3fc710d69f21fdf5c983711ca7227aa8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f39872ef3fc710d69f21fdf5c983711ca7227aa8

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Jun 23 18:48:03 2016 +0000

ipumm: Update SRCREV for adding new API

This API will allow querying remote core information

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 32d51cb..331c25d 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "a55e6e7b3a8b6917155f3f7ed6c10ed6170df3e7"
+SRCREV = "1627fec802da688fe44c6b0cac43ff811b08f064"
 
 S = "${WORKDIR}/git"
 
@@ -66,4 +66,4 @@ ALTERNATIVE_PRIORITY = "20"
 
 FILES_${PN} += "${base_libdir}/firmware/*"
 
-PR = "r0"
+PR = "r1"


