Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36D34E0071E; Mon,  6 Feb 2017 07:42:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE379E00519
	for <meta-ti@yoctoproject.org>; Mon,  6 Feb 2017 07:41:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 987D0209B9;
	Mon,  6 Feb 2017 15:41:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9HQPU6j4ZqOQ; Mon,  6 Feb 2017 15:41:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77A1B20893;
	Mon,  6 Feb 2017 15:41:56 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id C7EFC1621BE;
	Mon,  6 Feb 2017 10:41:55 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon,  6 Feb 2017 10:41:55 -0500
Message-Id: <1486395715-5513-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH v2] am335x-hs-evm: update UBOOT_MACHINE var for latest u-boot version
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
X-List-Received-Date: Mon, 06 Feb 2017 15:42:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - s/defconfig/config/

 conf/machine/am335x-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
index 674a764..bb025b4 100644
--- a/conf/machine/am335x-hs-evm.conf
+++ b/conf/machine/am335x-hs-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/am335x-evm.conf
 
-UBOOT_MACHINE = "am335x_hs_evm_mmc_config"
+UBOOT_MACHINE = "am335x_hs_evm_config"
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"
-- 
2.7.4


