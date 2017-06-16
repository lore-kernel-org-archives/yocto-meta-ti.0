Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33BB6E00A9C; Fri, 16 Jun 2017 14:15:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E873BE009A0
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 14:15:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A21020B7A;
	Fri, 16 Jun 2017 21:15:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pqkKls9qkOff; Fri, 16 Jun 2017 21:15:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6955F207A3;
	Fri, 16 Jun 2017 21:15:11 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DAAAA1624F9;
	Fri, 16 Jun 2017 17:15:10 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Jun 2017 17:15:10 -0400
Message-Id: <1497647710-97590-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] am437x-hs-evm: add OPTEE related configs
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
X-List-Received-Date: Fri, 16 Jun 2017 21:15:17 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-hs-evm.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 2f551b5..34c1016 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -12,3 +12,7 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
+
+OPTEEMACHINE = "ti"
+OPTEEFLAVOR = "am43xx"
+OPTEEOUTPUTMACHINE = "ti"
-- 
2.7.4


