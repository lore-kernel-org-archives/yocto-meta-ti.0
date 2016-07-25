Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82CFCE009BF; Mon, 25 Jul 2016 11:41:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63D7BE0086E
	for <meta-ti@yoctoproject.org>; Mon, 25 Jul 2016 11:41:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 77A64529BD; Mon, 25 Jul 2016 18:41:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160725184128.77A64529BD@arago-project.org>
Date: Mon, 25 Jul 2016 18:41:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ti-ccsv6-native: update to new version 6.1.3.00034
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
X-List-Received-Date: Mon, 25 Jul 2016 18:41:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: f12dde207901a81043f6e04b2cc0e072ef795f53
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f12dde207901a81043f6e04b2cc0e072ef795f53

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Jul 25 20:30:28 2016 +0000

ti-ccsv6-native: update to new version 6.1.3.00034

updated MD5/SHA256 checksum from the previous recipe

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...1.3.00033.bb => ti-ccsv6-native_6.1.3.00034.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
similarity index 90%
rename from recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
rename to recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
index ba0da7d..334c7df 100644
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00033.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
@@ -20,8 +20,8 @@ BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
-SRC_URI[ccsv6.md5sum] = "d95121970f8bcee944bf8b8e576bf3ec"
-SRC_URI[ccsv6.sha256sum] = "b785f040de8cccbc571923e34303fea92484677845df64a65abee2d3c248fa5b"
+SRC_URI[ccsv6.md5sum] = "ceaa5023c1a4b51bc637d3de1a15786b"
+SRC_URI[ccsv6.sha256sum] = "fb3205a21942da09684c871371513707c841c4fd8d88a62f6a7865b0a86cc492"
 
 do_install() {
     install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}


