Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BADEE00EBB; Fri,  2 Aug 2019 10:14:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB437E00DE4
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 10:14:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 06E4040BDC;
	Fri,  2 Aug 2019 17:14:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2yUCaGnTeDJo; Fri,  2 Aug 2019 17:14:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E006B40AB7;
	Fri,  2 Aug 2019 17:14:40 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0ADA6171DC6;
	Fri,  2 Aug 2019 13:14:40 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Aug 2019 13:14:39 -0400
Message-Id: <1564766079-20633-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] swtools: actually use defined CP_ARGS
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
X-List-Received-Date: Fri, 02 Aug 2019 17:14:43 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/swtools/swtools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
index 3e7105b..a482ea6 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -41,7 +41,7 @@ do_compile() {
 do_install() {
 	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 	install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
-	cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
+	cp ${CP_ARGS} ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
 }
 
 FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
-- 
2.7.4


