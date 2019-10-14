Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62B78E00B23; Mon, 14 Oct 2019 14:08:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	https://www.dnswl.org/, low *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2997E007AA
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 14:08:51 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CFBDE40BF4;
	Mon, 14 Oct 2019 21:08:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rleoEMLEh_E7; Mon, 14 Oct 2019 21:08:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7BD240BD4;
	Mon, 14 Oct 2019 21:08:49 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 004CF17427E;
	Mon, 14 Oct 2019 17:08:48 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Oct 2019 17:08:48 -0400
Message-Id: <1571087328-5916-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] am335x-hs-evm.conf: fix typo in machine description
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
X-List-Received-Date: Mon, 14 Oct 2019 21:08:53 -0000

There was a typo in machine description - AM435x instead of AM335x

Reported-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
index 5f78965..7caa5bf 100644
--- a/conf/machine/am335x-hs-evm.conf
+++ b/conf/machine/am335x-hs-evm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@NAME: AM335x HS EVM
-#@DESCRIPTION: Machine configuration for the TI AM435x HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM335x HS EVM
 
 require conf/machine/am335x-evm.conf
 
-- 
2.7.4


