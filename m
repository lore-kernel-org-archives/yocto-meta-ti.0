Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78655E0052B; Thu, 16 Mar 2017 15:25:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09B62E003C1
	for <meta-ti@yoctoproject.org>; Thu, 16 Mar 2017 15:25:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 912AA20BAF;
	Thu, 16 Mar 2017 22:25:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9vH1wBlK4Hd1; Thu, 16 Mar 2017 22:25:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6901F208FB;
	Thu, 16 Mar 2017 22:25:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E2F351623AE;
	Thu, 16 Mar 2017 18:25:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 16 Mar 2017 18:25:20 -0400
Message-Id: <1489703120-59579-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kselftests: fix capabilities and sigaltstack packaging
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
X-List-Received-Date: Thu, 16 Mar 2017 22:25:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

1. capabilities requires cap-ng.h header file, otherwise skipping the build
2. sigaltstack was not using TEST_PROGS resulting in binary not being installed

Since the main package depends on all subpackages, in both cases it would lead
to a failure to install it into an image.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 3b1e43e..a7b4ba6 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -60,6 +60,7 @@ do_configure () {
 	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
 	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
 	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
+	sed "s|BINARIES|TEST_PROGS|g" -i ${S}/tools/testing/selftests/sigaltstack/Makefile
 }
 
 do_compile () {
@@ -138,6 +139,8 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
 FILES_${PN}-zram = "${bindir}/kselftests/zram"
 FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 
+ALLOW_EMPTY_${PN}-capabilities = "1"
+
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-memory-hotplug += "bash"
-- 
2.7.4


