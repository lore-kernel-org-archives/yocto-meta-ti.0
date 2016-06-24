Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87DE3E00D33; Fri, 24 Jun 2016 07:31:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39468E00D1F
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 07:31:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DE7B752AC6; Fri, 24 Jun 2016 14:31:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160624143127.DE7B752AC6@arago-project.org>
Date: Fri, 24 Jun 2016 14:31:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : dspdce-fw: Update SRCREV for adding new API
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
X-List-Received-Date: Fri, 24 Jun 2016 14:31:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 6e4d479296f703f26aca6086eeaa889cd462c5d3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6e4d479296f703f26aca6086eeaa889cd462c5d3

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Jun 23 18:48:04 2016 +0000

dspdce-fw: Update SRCREV for adding new API

This API will allow querying remote core information

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dspdce-fw/dspdce-fw_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 3979ce9..ee00833 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
-SRCREV = "88705fd4584edd1289e4bb50658def936de90433"
+SRCREV = "3b9cea492f23d7dabb9ffa0e69631b858ba8e90a"
 
 PV = "1.00.00.06"
 
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r2"
+PR = "r3"
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"


