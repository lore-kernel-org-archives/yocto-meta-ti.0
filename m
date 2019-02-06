Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2E66E00C06; Wed,  6 Feb 2019 08:42:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC51AE00C43
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2019 08:42:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8649D40B53;
	Wed,  6 Feb 2019 16:42:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8_4L_uvFS9g5; Wed,  6 Feb 2019 16:42:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F6D740B5A;
	Wed,  6 Feb 2019 16:42:10 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8AD5A16A900;
	Wed,  6 Feb 2019 11:42:08 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Feb 2019 11:42:05 -0500
Message-Id: <1549471325-47513-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549471325-47513-1-git-send-email-denys@ti.com>
References: <1549471325-47513-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 4/4] k2g-evm.conf: LCD specific DTB is not ready yet
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
X-List-Received-Date: Wed, 06 Feb 2019 16:42:13 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/k2g-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index a8ddc66..b89bf2a 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa"
 
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb \
                      ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "k2g_evm_config"
-- 
2.7.4


