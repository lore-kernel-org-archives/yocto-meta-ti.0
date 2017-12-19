Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B20CE00D73; Mon, 18 Dec 2017 22:01:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC330E00D67
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 22:01:37 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8B2420B46;
	Tue, 19 Dec 2017 06:01:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LDVjr0PaK_KE; Tue, 19 Dec 2017 06:01:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ACEC220B37;
	Tue, 19 Dec 2017 06:01:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3593D1631FE;
	Tue, 19 Dec 2017 01:01:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 19 Dec 2017 01:01:31 -0500
Message-Id: <1513663292-22396-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513663292-22396-1-git-send-email-denis@denix.org>
References: <1513663292-22396-1-git-send-email-denis@denix.org>
Subject: [rocko/master][PATCH 3/4] openmp-rtos: depend on doxygen-native for documentation
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
X-List-Received-Date: Tue, 19 Dec 2017 06:01:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index f5bf476..df082ea 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -19,7 +19,7 @@ SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
+DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
 DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
-- 
2.7.4


