Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9B90E009CE; Fri, 17 Mar 2017 11:10:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70E95E009CF
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:10:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E293120BAC;
	Fri, 17 Mar 2017 18:10:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rg_qkyHaCuiG; Fri, 17 Mar 2017 18:10:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A759920BB4;
	Fri, 17 Mar 2017 18:10:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3FBE11623EB;
	Fri, 17 Mar 2017 14:10:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 14:10:03 -0400
Message-Id: <1489774203-25523-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489774203-25523-1-git-send-email-denis@denix.org>
References: <1489774203-25523-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/4] kselftests: fix seccomp test build failure
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
X-List-Received-Date: Fri, 17 Mar 2017 18:10:32 -0000

From: Fathi Boudra <fathi.boudra@linaro.org>

Use the same fixup as used for timers test:
use LDLIBS to properly link against libpthread.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index dd94a65..3cd12ea 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -59,6 +59,7 @@ do_configure () {
 	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/memfd/Makefile
 	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
 	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
+	sed "s|^LDFLAGS += -lpthread|LDLIBS += -lpthread|g" -i ${S}/tools/testing/selftests/seccomp/Makefile
 	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
 	sed "s|BINARIES|TEST_PROGS|g" -i ${S}/tools/testing/selftests/sigaltstack/Makefile
 }
-- 
2.7.4


