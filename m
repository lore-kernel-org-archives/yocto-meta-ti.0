Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56FE9E009AC; Wed,  8 Aug 2018 21:34:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DA08E00875
	for <meta-ti@yoctoproject.org>; Wed,  8 Aug 2018 21:34:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50D9D20C59;
	Thu,  9 Aug 2018 04:34:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hPTmEcKuwHju; Thu,  9 Aug 2018 04:34:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B81920C4D;
	Thu,  9 Aug 2018 04:34:39 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A556B163578;
	Thu,  9 Aug 2018 00:34:38 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  9 Aug 2018 00:34:37 -0400
Message-Id: <1533789277-50892-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] linux-ti-staging: add RT defconfig for K3
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
X-List-Received-Date: Thu, 09 Aug 2018 04:34:42 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig

diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig
new file mode 100644
index 0000000..cc10bfd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.14/k3/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_arm64_rt_release
-- 
2.7.4


