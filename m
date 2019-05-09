Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD59DE00D2A; Wed,  8 May 2019 21:15:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 985ACE00CD5
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2019 21:14:59 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3602840024;
	Thu,  9 May 2019 04:14:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xA9l92O15CRf; Thu,  9 May 2019 04:14:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B6CC40BAD;
	Thu,  9 May 2019 04:14:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 97C3916EAF1;
	Thu,  9 May 2019 00:14:56 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  9 May 2019 00:14:55 -0400
Message-Id: <1557375295-41687-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375295-41687-1-git-send-email-denys@ti.com>
References: <1557375295-41687-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 3/3] arm-trusted-firmare: sign ATF image for am65xx HS
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
X-List-Received-Date: Thu, 09 May 2019 04:15:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
index 24aa3f4..64e4067 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.0.bb
@@ -46,6 +46,14 @@ do_compile() {
 	oe_runmake all
 }
 
+do_compile_append_am65xx-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
+
 do_install() {
 	install -d ${D}/boot
 	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${D}/boot/
-- 
2.7.4


