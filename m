Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 648B6E00D04; Mon, 25 Feb 2019 17:43:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3B81E00D01
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2019 17:43:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4E7F40B7B;
	Tue, 26 Feb 2019 01:43:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id I219YuNVMKmD; Tue, 26 Feb 2019 01:43:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C66DC40B7A;
	Tue, 26 Feb 2019 01:43:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7392116BA4B;
	Mon, 25 Feb 2019 20:43:52 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Feb 2019 20:43:49 -0500
Message-Id: <1551145431-1139-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551145431-1139-1-git-send-email-denys@ti.com>
References: <1551145431-1139-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/5] k2g-evm.conf: re-enable LCD specific DTB
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
X-List-Received-Date: Tue, 26 Feb 2019 01:43:57 -0000

This reverts commit 2f28749040692b2267cb72303365bf3d2a391fef.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/k2g-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index b89bf2a..a8ddc66 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa"
 
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb \
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
                      ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "k2g_evm_config"
-- 
2.7.4


