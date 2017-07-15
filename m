Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DCA5E00BC1; Sat, 15 Jul 2017 12:17:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout3.zoneedit.com (mailout3.zoneedit.com [64.68.198.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30B2FE00BAA
	for <meta-ti@yoctoproject.org>; Sat, 15 Jul 2017 12:17:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout3.zoneedit.com (Postfix) with ESMTP id 84BA540C2F;
	Sat, 15 Jul 2017 19:17:15 +0000 (UTC)
Received: from mailout3.zoneedit.com ([127.0.0.1])
	by localhost (zmo01-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ovGzPMwDAlR4; Sat, 15 Jul 2017 19:17:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout3.zoneedit.com (Postfix) with ESMTPSA id 68C85406EA;
	Sat, 15 Jul 2017 19:17:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1C40816200E;
	Sat, 15 Jul 2017 15:17:14 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sat, 15 Jul 2017 15:17:13 -0400
Message-Id: <1500146233-89402-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] am57xx-hs, dra7xx-hs: add setting for OPTEE pager config
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
X-List-Received-Date: Sat, 15 Jul 2017 19:17:18 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-hs-evm.conf | 1 +
 conf/machine/dra7xx-hs-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index cd03126..4d3eb00 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -16,3 +16,4 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
+OPTEEPAGER = "y"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index b6d5528..9b02985 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -16,3 +16,4 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"
+OPTEEPAGER = "y"
-- 
2.7.4


