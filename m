Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90123E00B4C; Mon, 25 Jun 2018 15:05:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6797CE004F6
	for <meta-ti@yoctoproject.org>; Mon, 25 Jun 2018 15:05:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6870120BBE;
	Mon, 25 Jun 2018 22:05:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FbPzJWKDM9Yk; Mon, 25 Jun 2018 22:05:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 29B2920151;
	Mon, 25 Jun 2018 22:05:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8DD551634C7;
	Mon, 25 Jun 2018 18:05:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Jun 2018 18:05:15 -0400
Message-Id: <1529964315-21794-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] arm-trusted-firmware: also install and deploy ELF version
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
X-List-Received-Date: Mon, 25 Jun 2018 22:05:19 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
index 5a7fd21..ee5a6df 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
@@ -49,11 +49,13 @@ do_compile() {
 do_install() {
 	install -d ${D}/boot
 	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${D}/boot/
+	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31/bl31.elf ${D}/boot/
 }
 
 do_deploy() {
 	install -d ${DEPLOYDIR}
 	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${DEPLOYDIR}/
+	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31/bl31.elf ${DEPLOYDIR}/
 }
 addtask deploy before do_build after do_compile
 
-- 
2.7.4


