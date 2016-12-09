Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71F59E00D12; Fri,  9 Dec 2016 12:50:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 308D1E00CE5
	for <meta-ti@yoctoproject.org>; Fri,  9 Dec 2016 12:50:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E932209A4;
	Fri,  9 Dec 2016 20:50:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LxNbpK0395JH; Fri,  9 Dec 2016 20:50:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 20685207AF;
	Fri,  9 Dec 2016 20:50:00 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 645031621C7;
	Fri,  9 Dec 2016 15:49:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  9 Dec 2016 15:49:59 -0500
Message-Id: <1481316599-24065-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] am57xx-hs-evm, dra7xx-hs-evm: update OPTEEFLAVOR to match latest OPTEE code
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
X-List-Received-Date: Fri, 09 Dec 2016 20:50:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-hs-evm.conf | 2 +-
 conf/machine/dra7xx-hs-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index 906e6b0..cd03126 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "am57xx_evm"
+OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 8e8b566..b6d5528 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "dra7_evm dra72_evm_revc dra71_evm"
+OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"
-- 
2.7.4


