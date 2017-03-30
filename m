Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2513E0098A; Wed, 29 Mar 2017 20:18:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 754DEE00970
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 20:18:04 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5A05720B7A;
	Thu, 30 Mar 2017 03:18:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3jsx1sfIo5K8; Thu, 30 Mar 2017 03:18:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BC9F7208B3;
	Thu, 30 Mar 2017 03:18:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4043D16244F;
	Wed, 29 Mar 2017 23:18:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 29 Mar 2017 23:17:59 -0400
Message-Id: <1490843879-36807-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] kselftests: allow net target to be empty when it can't link with numa on arm
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
X-List-Received-Date: Thu, 30 Mar 2017 03:18:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index 47f8007..6dbc527 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -123,6 +123,10 @@ FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 # make[1]: *** [test_verifier] Error 1
 ALLOW_EMPTY_${PN}-bpf = "1"
 
+# FIXME net target builds most of the binaries, but reuseport_bpf_numa depends on libnuma,
+# which is not availbale on ARM, failing entire test case
+ALLOW_EMPTY_${PN}-net = "1"
+
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-futex += "bash ncurses"
-- 
2.7.4


