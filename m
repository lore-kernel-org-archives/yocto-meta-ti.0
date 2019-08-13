Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FEA1E00D8F; Tue, 13 Aug 2019 15:54:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08CB8E00C7D
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 15:54:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6650040BD4;
	Tue, 13 Aug 2019 22:54:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 03WU3JAL4Rot; Tue, 13 Aug 2019 22:54:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 506D840B66;
	Tue, 13 Aug 2019 22:54:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 11CA0172A53;
	Tue, 13 Aug 2019 18:54:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 13 Aug 2019 18:54:14 -0400
Message-Id: <1565736854-33881-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] am65xx-hs-evm: add DTB/DTBO load addresses and offset
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
X-List-Received-Date: Tue, 13 Aug 2019 22:54:17 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-hs-evm.conf | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index 97afd31..f989750 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -6,10 +6,13 @@ require conf/machine/am65xx-evm.conf
 
 UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
 
-UBOOT_ENTRYPOINT = "0x80080000"
-UBOOT_LOADADDRESS = "0x80080000"
-UBOOT_RD_LOADADDRESS = "0x84000000"
-UBOOT_RD_ENTRYPOINT = "0x84000000"
+UBOOT_ENTRYPOINT =       "0x80080000"
+UBOOT_LOADADDRESS =      "0x80080000"
+UBOOT_RD_LOADADDRESS =   "0x84000000"
+UBOOT_RD_ENTRYPOINT =    "0x84000000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
 SPL_BINARYNAME = "tispl.bin"
-- 
2.7.4


