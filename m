Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71948E00D70; Wed, 13 Dec 2017 12:48:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FFD1E00D6D
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 12:48:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 66591208CC;
	Wed, 13 Dec 2017 20:48:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6BY34VOioE0B; Wed, 13 Dec 2017 20:48:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 473F0207BA;
	Wed, 13 Dec 2017 20:48:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C5FC21627F9;
	Wed, 13 Dec 2017 15:48:34 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 13 Dec 2017 15:48:34 -0500
Message-Id: <1513198114-70360-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] srss-tc: pass proper CROSS_COMPILE and CFLAGS
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
X-List-Received-Date: Wed, 13 Dec 2017 20:48:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/srss-tc/srss-tc_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
index 3c90069..483bde0 100644
--- a/recipes-bsp/srss-tc/srss-tc_git.bb
+++ b/recipes-bsp/srss-tc/srss-tc_git.bb
@@ -20,6 +20,9 @@ INITSCRIPT_PARAMS = "defaults 10"
 
 inherit update-rc.d
 LDFLAGS += "-lrt"
+CFLAGS += "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_install() {
 	install -d ${D}${bindir}/
-- 
2.7.4


