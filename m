Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7680E00BE9; Mon, 28 Mar 2016 11:07:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61C1FE0079A
	for <meta-ti@yoctoproject.org>; Mon, 28 Mar 2016 11:07:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2SI7U3r010240
	for <meta-ti@yoctoproject.org>; Mon, 28 Mar 2016 13:07:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2SI7UnX022918
	for <meta-ti@yoctoproject.org>; Mon, 28 Mar 2016 13:07:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 28 Mar 2016 13:07:30 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2SI7TLu003146;	Mon, 28 Mar 2016 13:07:30 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 28 Mar 2016 14:07:28 -0400
Message-ID: <1459188448-12123-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] ti-ccsv6-native: Upgrade to version 6.1.2.00015
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
X-List-Received-Date: Mon, 28 Mar 2016 18:07:33 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 ...-ccsv6-native_6.1.1.00022.bb => ti-ccsv6-native_6.1.2.00015.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{ti-ccsv6-native_6.1.1.00022.bb => ti-ccsv6-native_6.1.2.00015.bb} (89%)

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
-- 
1.7.10.4


