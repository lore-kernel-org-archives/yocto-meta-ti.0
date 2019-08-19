Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BF6EE00B65; Mon, 19 Aug 2019 15:18:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6E92E00B3E
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 15:18:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A89040BF0;
	Mon, 19 Aug 2019 22:18:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zAaGcvgAebEF; Mon, 19 Aug 2019 22:18:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B8E740BE7;
	Mon, 19 Aug 2019 22:18:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 09650172F5F;
	Mon, 19 Aug 2019 18:18:20 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 19 Aug 2019 18:18:19 -0400
Message-Id: <1566253099-50583-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566253099-50583-1-git-send-email-denys@ti.com>
References: <1566253099-50583-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] layer.conf: list additional packages in SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Mon, 19 Aug 2019 22:18:24 -0000

This helps with sstate re-use when MACHINE changes in the dependency tree.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 824443d..cc19429 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -17,6 +17,10 @@ LAYERDEPENDS_meta-ti = "core"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-sgx-ddk-km \
     ti-sgx-ddk-um \
+    ti-img-rogue-driver \
+    ti-img-rogue-umlibs \
+    ti-gc320-driver \
+    ti-gc320-libs \
     ti-ipc \
     ti-ipc-rtos \
     cmem-mod \
@@ -28,6 +32,10 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     cppi-lld \
     qmss-lld \
     multiprocmgr \
+    openmp-rtos \
+    common-csl-ip \
+    libulm \
+    linux-ti-staging \
 "
 
 HOSTTOOLS_NONFATAL += "truncate xxd comm"
-- 
2.7.4


