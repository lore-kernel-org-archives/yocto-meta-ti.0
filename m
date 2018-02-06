Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9CE1E00E0A; Mon,  5 Feb 2018 17:42:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E05A7E00E0A
	for <meta-ti@yoctoproject.org>; Mon,  5 Feb 2018 17:42:19 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1852820B5A;
	Tue,  6 Feb 2018 01:42:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kKkWitTGPG4S; Tue,  6 Feb 2018 01:42:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDB5820B0A;
	Tue,  6 Feb 2018 01:42:17 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5BE70163285;
	Mon,  5 Feb 2018 20:42:17 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon,  5 Feb 2018 20:42:14 -0500
Message-Id: <1517881334-28694-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517881334-28694-1-git-send-email-denys@ti.com>
References: <1517881334-28694-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 3/3] vlib-c66x: resolve host contamination warnings
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
X-List-Received-Date: Tue, 06 Feb 2018 01:42:20 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/vlib/vlib-c66x.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.inc
index ed35c7f..a539e4d 100644
--- a/recipes-ti/vlib/vlib-c66x.inc
+++ b/recipes-ti/vlib/vlib-c66x.inc
@@ -18,8 +18,9 @@ TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
 TI_BIN_UNPK_CMDS=""
 
 do_install() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${VLIB_C66_INSTALL_DIR_RECIPE}
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


