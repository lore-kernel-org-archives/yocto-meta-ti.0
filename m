Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D01EE009CD; Mon, 31 Oct 2016 12:03:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DA7EE00997
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 12:03:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C7D72099C;
	Mon, 31 Oct 2016 19:03:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YNDbm-F6K10B; Mon, 31 Oct 2016 19:03:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25557208FD;
	Mon, 31 Oct 2016 19:03:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 78E0916217F;
	Mon, 31 Oct 2016 15:03:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 31 Oct 2016 15:03:40 -0400
Message-Id: <1477940620-17449-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] dra7xx-hs-evm: add DRA71x OPTEE flavor to the list
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
X-List-Received-Date: Mon, 31 Oct 2016 19:03:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/dra7xx-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 3a8ada2..db20aa2 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "dra7_evm dra72_evm_revc"
+OPTEEFLAVOR = "dra7_evm dra72_evm_revc dra71_evm"
 OPTEEOUTPUTMACHINE = "ti"
-- 
2.7.4


