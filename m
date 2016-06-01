Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DC79E008B8; Wed,  1 Jun 2016 12:47:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E77ECE0083D
	for <meta-ti@yoctoproject.org>; Wed,  1 Jun 2016 12:46:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 349135296F; Wed,  1 Jun 2016 19:46:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160601194657.349135296F@arago-project.org>
Date: Wed,  1 Jun 2016 19:46:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ming Wei : ti-ccsv6-native: update to new version 6.1.3.00033
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
X-List-Received-Date: Wed, 01 Jun 2016 19:47:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 213c02d6f3212ff68072012af50ef0728957c8e4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=213c02d6f3212ff68072012af50ef0728957c8e4

Author: Ming Wei <mwei@ti.com>
Date:   Tue May 24 00:54:17 2016 +0000

ti-ccsv6-native: update to new version 6.1.3.00033

updated ARM-CGT version and MD5/SHAR256 checksum

Signed-off-by: Ming Wei <mwei@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...1.2.00015.bb => ti-ccsv6-native_6.1.3.00033.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
old mode 100644
new mode 100755
similarity index 87%
rename from recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
rename to recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
index 270169d..ba0da7d
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
@@ -10,7 +10,7 @@ require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-paths.inc
 
-TI_CGT_ARM_VERSION = "5.2.5"
+TI_CGT_ARM_VERSION = "15.12.1.LTS"
 
 SRC_URI = "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=ccsv6"
 
@@ -20,8 +20,8 @@ BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[ccsv6.md5sum] = "cfe5a759068809df5b5926dfc9889683"
-SRC_URI[ccsv6.sha256sum] = "6c25c046898812dcc72f08af512321bb4c9833ab932e4792560e14c13fbc7dc5"
+SRC_URI[ccsv6.md5sum] = "d95121970f8bcee944bf8b8e576bf3ec"
+SRC_URI[ccsv6.sha256sum] = "b785f040de8cccbc571923e34303fea92484677845df64a65abee2d3c248fa5b"
 
 do_install() {
     install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}


