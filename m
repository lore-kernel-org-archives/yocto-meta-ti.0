Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51667E00C61; Mon, 26 Mar 2018 16:19:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 112DBE00C4B
	for <meta-ti@yoctoproject.org>; Mon, 26 Mar 2018 16:19:05 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 20C0A20BA2;
	Mon, 26 Mar 2018 23:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Vj_1Wnyz4gDc; Mon, 26 Mar 2018 23:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F185920992;
	Mon, 26 Mar 2018 23:19:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 63A0A16337F;
	Mon, 26 Mar 2018 19:19:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 26 Mar 2018 19:19:02 -0400
Message-Id: <1522106342-4626-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] ti-codec-engine: fix host contamination warnings
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
X-List-Received-Date: Mon, 26 Mar 2018 23:19:07 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
index 06a7ce1..aa53841 100644
--- a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
+++ b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
@@ -19,10 +19,10 @@ S = "${WORKDIR}/codec_engine_${PV}"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
 
 do_install() {
-
+        CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
         # Install/Stage the Source Tree
         install -d ${D}${CE_INSTALL_DIR_RECIPE}
-        cp -pPrf ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
+        cp ${CP_ARGS} ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


