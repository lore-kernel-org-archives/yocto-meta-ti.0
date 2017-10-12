Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48BE4E00CA2; Thu, 12 Oct 2017 14:14:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D152E00CC0
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 14:14:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17F5D20B0A;
	Thu, 12 Oct 2017 21:08:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id q7jDmSWEv16g; Thu, 12 Oct 2017 21:08:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D761B204B1;
	Thu, 12 Oct 2017 21:08:34 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 33A651626EC;
	Thu, 12 Oct 2017 17:08:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 12 Oct 2017 17:08:26 -0400
Message-Id: <1507842509-789-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507842509-789-1-git-send-email-denis@denix.org>
References: <1507842509-789-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/5] kselftests: bypass seccomp gcc7 build failure, gpio RDEPENDS on bash
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
X-List-Received-Date: Thu, 12 Oct 2017 21:14:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index e3fab0c..e4cd278 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -123,6 +123,9 @@ FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 # make[1]: *** [test_verifier] Error 1
 ALLOW_EMPTY_${PN}-bpf = "1"
 
+# gcc 7.x fails to build seccomp
+ALLOW_EMPTY_${PN}-seccomp = "1"
+
 # FIXME net target builds most of the binaries, but reuseport_bpf_numa depends on libnuma,
 # which is not availbale on ARM, failing entire test case
 ALLOW_EMPTY_${PN}-net = "1"
@@ -130,6 +133,7 @@ ALLOW_EMPTY_${PN}-net = "1"
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-futex += "bash ncurses"
+RDEPENDS_${PN}-gpio += "bash"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash sudo"
-- 
2.7.4


