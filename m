Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E07AAE0094C; Tue, 14 Mar 2017 10:22:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6219BE00724
	for <meta-ti@yoctoproject.org>; Tue, 14 Mar 2017 10:22:53 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4C3D20BA7;
	Tue, 14 Mar 2017 17:22:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KH7CzMTnIafA; Tue, 14 Mar 2017 17:22:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BAE2A208A2;
	Tue, 14 Mar 2017 17:22:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3D1CD1623B7;
	Tue, 14 Mar 2017 13:22:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 14 Mar 2017 13:22:44 -0400
Message-Id: <1489512164-3576-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [master][PATCH] kselftests: add rsync build dependency
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
X-List-Received-Date: Tue, 14 Mar 2017 17:22:56 -0000

From: Fathi Boudra <fathi.boudra@linaro.org>

lib.mk is calling rsync:
| /bin/sh: 1: rsync: not found
| ../lib.mk:24: recipe for target 'install' failed

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.4.bb b/recipes-kernel/kselftests/kselftests_4.4.bb
index 3cdf4f1..eb560c9 100644
--- a/recipes-kernel/kselftests/kselftests_4.4.bb
+++ b/recipes-kernel/kselftests/kselftests_4.4.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "popt"
+DEPENDS = "popt rsync-native"
 
 inherit kernel-arch
 
-- 
2.7.4


