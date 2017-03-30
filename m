Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35250E009A0; Wed, 29 Mar 2017 19:42:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E932AE00985
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 19:42:15 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D12920B7A;
	Thu, 30 Mar 2017 02:42:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kN3DAHi8gNNP; Thu, 30 Mar 2017 02:42:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7431B208B3;
	Thu, 30 Mar 2017 02:42:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E9E3716245A;
	Wed, 29 Mar 2017 22:42:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 29 Mar 2017 22:41:53 -0400
Message-Id: <1490841713-11264-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] kselftests: gpio calls pkg-config, explicitly depend on pkgconfig-native
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
X-List-Received-Date: Thu, 30 Mar 2017 02:42:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index 9ae09a6..47f8007 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "libcap libcap-ng popt rsync-native util-linux \
+DEPENDS = "libcap libcap-ng popt rsync-native util-linux pkgconfig-native \
     ${@bb.utils.contains("TARGET_ARCH", "arm", "", "numactl", d)} \
 "
 
-- 
2.7.4


