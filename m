Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A74E0E00BEF; Wed,  7 Jun 2017 14:04:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DFD2E00B3D
	for <meta-ti@yoctoproject.org>; Wed,  7 Jun 2017 14:04:48 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AF2120C08;
	Wed,  7 Jun 2017 21:04:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dVIKTS6xOmea; Wed,  7 Jun 2017 21:04:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2893220BF3;
	Wed,  7 Jun 2017 21:04:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A83991624E9;
	Wed,  7 Jun 2017 17:04:46 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  7 Jun 2017 17:04:38 -0400
Message-Id: <1496869478-36913-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496869478-36913-1-git-send-email-denys@ti.com>
References: <1496869478-36913-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] am335x-hs-evm: produce both mmc and uart configs
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
X-List-Received-Date: Wed, 07 Jun 2017 21:04:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-hs-evm.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
index bb025b4..5f78965 100644
--- a/conf/machine/am335x-hs-evm.conf
+++ b/conf/machine/am335x-hs-evm.conf
@@ -4,7 +4,11 @@
 
 require conf/machine/am335x-evm.conf
 
-UBOOT_MACHINE = "am335x_hs_evm_config"
+UBOOT_MACHINE = ""
+# Last config in the list is default
+UBOOT_CONFIG ??= "uart mmc"
+UBOOT_CONFIG[uart] = "am335x_hs_evm_uart_config"
+UBOOT_CONFIG[mmc] = "am335x_hs_evm_config"
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"
-- 
2.7.4


