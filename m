Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C5C0E00AD5; Mon,  4 Feb 2019 20:16:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 461D7E00A1A
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2019 20:16:06 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5E9C40B5C;
	Tue,  5 Feb 2019 04:09:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 11b5q_eoZMrQ; Tue,  5 Feb 2019 04:09:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C998A40B53;
	Tue,  5 Feb 2019 04:09:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4A8BD16A755;
	Mon,  4 Feb 2019 23:09:14 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon,  4 Feb 2019 23:09:12 -0500
Message-Id: <1549339752-5045-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549339752-5045-1-git-send-email-denys@ti.com>
References: <1549339752-5045-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/3] ti33x.inc: PRUETH specific DTB is not ready yet
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
X-List-Received-Date: Tue, 05 Feb 2019 04:16:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/ti33x.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 487ceb4..8fc6b59 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -27,7 +27,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb \
-                    am335x-icev2.dtb am335x-icev2-prueth.dtb \
+                    am335x-icev2.dtb \
                     am335x-bone.dtb am335x-boneblue.dtb \
                     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
                     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb"
-- 
2.7.4


