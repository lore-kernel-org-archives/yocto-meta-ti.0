Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B429E00B9E; Thu, 31 Mar 2016 08:47:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  1.3 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A351E00C7E
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:47:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 45E9752ABE; Thu, 31 Mar 2016 15:47:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160331154716.45E9752ABE@arago-project.org>
Date: Thu, 31 Mar 2016 15:47:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-ccsv6-native: Upgrade to version 6.1.2.00015
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
X-List-Received-Date: Thu, 31 Mar 2016 15:47:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c39d0b9d81552b61e9b3800fab9b2a6506f90804
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c39d0b9d81552b61e9b3800fab9b2a6506f90804

Author: Justin Sobota <jsobota@ti.com>
Date:   Tue Mar 29 00:07:28 2016 +0000

ti-ccsv6-native: Upgrade to version 6.1.2.00015

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...1.1.00022.bb => ti-ccsv6-native_6.1.2.00015.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
similarity index 89%
rename from recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb
rename to recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
index c5a4f33..f533c0d 100644
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.1.00022.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
@@ -20,8 +20,8 @@ BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[ccsv6.md5sum] = "648d5f41e8a7a93c16d51cd34045ba15"
-SRC_URI[ccsv6.sha256sum] = "b82958a125d5c6bea07cfc12a6f2a77c45e1560217c1aac02194b6e3408c5105"
+SRC_URI[ccsv6.md5sum] = "cfe5a759068809df5b5926dfc9889683"
+SRC_URI[ccsv6.sha256sum] = "6c25c046898812dcc72f08af512321bb4c9833ab932e4792560e14c13fbc7dc5"
 
 do_install() {
     install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}


