Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D4F4E00E15; Fri,  2 Aug 2019 14:40:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FB0EE00DB1
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 14:40:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8CB2E40BFC;
	Fri,  2 Aug 2019 21:40:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Je8qExJ125rD; Fri,  2 Aug 2019 21:40:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C0D440BDC;
	Fri,  2 Aug 2019 21:40:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 41258171EFB;
	Fri,  2 Aug 2019 17:39:59 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  2 Aug 2019 17:39:57 -0400
Message-Id: <1564781998-13828-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] udma: suppress texrel warning, set correct PV version
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
X-List-Received-Date: Fri, 02 Aug 2019 21:40:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/udma/udma_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/udma/udma_git.bb b/recipes-ti/udma/udma_git.bb
index 0374d37..c905fa5 100644
--- a/recipes-ti/udma/udma_git.bb
+++ b/recipes-ti/udma/udma_git.bb
@@ -10,11 +10,13 @@ S = "${WORKDIR}/git"
 # Commit corresponds to UDMA.01.00.00.00
 SRCREV = "53d09fb0bc98c41c5eb43623097e363c497d6fd8"
 
+PV = "01.00.00.00"
+
 PACKAGES =+ "${PN}-test"
 
 FILES_${PN}-test = "${bindir}/udma_test"
 
-do_install_append() {
+do_install() {
 	install -d ${D}${bindir}/
 	install -d ${D}${libdir}/
 	install -d ${D}${includedir}/
@@ -26,3 +28,5 @@ do_install_append() {
 	ln -sf libudma.so.1.0.0 libudma.so
 	install -c -m 755 ${S}/include/* ${D}${includedir}/
 }
+
+INSANE_SKIP_${PN} += "textrel"
-- 
2.7.4


