Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87314E00A6A; Mon, 25 Jul 2016 07:30:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CCC1E00A03
	for <meta-ti@yoctoproject.org>; Mon, 25 Jul 2016 07:30:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6PERMKw012702
	for <meta-ti@yoctoproject.org>; Mon, 25 Jul 2016 09:27:22 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6PEUVbk008148
	for <meta-ti@yoctoproject.org>; Mon, 25 Jul 2016 09:30:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 25 Jul 2016 09:30:31 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6PEUTUo014582;	Mon, 25 Jul 2016 09:30:30 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 25 Jul 2016 20:00:28 +0530
Message-ID: <1469457028-28343-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] ti-ccsv6-native: update to new version 6.1.3.00034
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
X-List-Received-Date: Mon, 25 Jul 2016 14:30:35 -0000
Content-Type: text/plain

updated MD5/SHA256 checksum from the previous recipe

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...{ti-ccsv6-native_6.1.3.00033.bb => ti-ccsv6-native_6.1.3.00034.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{ti-ccsv6-native_6.1.3.00033.bb => ti-ccsv6-native_6.1.3.00034.bb} (90%)

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
-- 
1.9.1


