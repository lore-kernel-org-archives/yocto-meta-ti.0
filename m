Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9688CE00888; Mon, 30 Nov 2015 15:08:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C81D8E007D5
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 15:08:13 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYN004X8HL6L9J0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Nov 2015 17:07:55 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=G4VQz6jJHUEinAe7WfYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D8421161D28;	Mon,
	30 Nov 2015 18:07:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 30 Nov 2015 18:07:54 -0500
Message-id: <1448924874-29951-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] pa-lld: set sane defaults when platform is not defined
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
X-List-Received-Date: Mon, 30 Nov 2015 23:08:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also fix this build error:
| makefile_armv7:27: *** missing separator.  Stop.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - fix build error passing device variable

 recipes-bsp/pa-lld/pa-lld.inc    | 4 +++-
 recipes-bsp/pa-lld/pa-lld_git.bb | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 082d59d..9326b85 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -17,14 +17,16 @@ SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_L
 SRCREV = "${PA_LLD_SRCREV}"
 
 PV = "03.00.01.05"
-INC_PR = "r2"
+INC_PR = "r3"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
+DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e-evm = "k2e"
 
+LIBPA = "libpa"
 LIBPA_k2hk-evm = "libpa"
 LIBPA_k2e-evm = "libpa2"
 LIBPA_k2l-evm = "libpa2"
diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
index 501ee2d..f6de5b1 100644
--- a/recipes-bsp/pa-lld/pa-lld_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld_git.bb
@@ -10,7 +10,7 @@ do_compile () {
 #   Now build the lld in the updated directory
     for device in ${DEVICELIST}
     do
-        make -f makefile_armv7 DEVICE=$device lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+        make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device"
     done
 }
 
-- 
2.2.0


