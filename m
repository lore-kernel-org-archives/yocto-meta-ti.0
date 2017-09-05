Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C645EE00C3A; Tue,  5 Sep 2017 07:59:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E20DE009F5
	for <meta-ti@yoctoproject.org>; Tue,  5 Sep 2017 07:59:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 70A4C208B0;
	Tue,  5 Sep 2017 14:59:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8YC24MEwXDBu; Tue,  5 Sep 2017 14:59:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4EB3A207BA;
	Tue,  5 Sep 2017 14:59:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BFA2E1625A8;
	Tue,  5 Sep 2017 10:59:56 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue,  5 Sep 2017 10:59:56 -0400
Message-Id: <1504623596-126910-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] kselftests: add ptp target for testptp binary
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
X-List-Received-Date: Tue, 05 Sep 2017 14:59:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 9d3f1d7..c7db19c 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -37,6 +37,7 @@ TARGETS = " \
 	nsfs \
 	${@bb.utils.contains_any("TARGET_ARCH", [ "powerpc", "powerpc64" ], "powerpc", "", d)} \
 	pstore \
+	ptp \
 	ptrace \
 	seccomp \
 	sigaltstack \
@@ -97,6 +98,7 @@ PACKAGE_BEFORE_PN = " \
 	${PN}-nsfs \
 	${PN}-powerpc \
 	${PN}-pstore \
+	${PN}-ptp \
 	${PN}-ptrace \
 	${PN}-seccomp \
 	${PN}-sigaltstack \
@@ -130,6 +132,7 @@ FILES_${PN}-net = "${bindir}/kselftests/net"
 FILES_${PN}-nsfs = "${bindir}/kselftests/nsfs"
 FILES_${PN}-powerpc = "${bindir}/kselftests/powerpc"
 FILES_${PN}-pstore = "${bindir}/kselftests/pstore"
+FILES_${PN}-ptp = "${bindir}/kselftests/ptp"
 FILES_${PN}-ptrace = "${bindir}/kselftests/ptrace"
 FILES_${PN}-seccomp = "${bindir}/kselftests/seccomp"
 FILES_${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
@@ -168,6 +171,7 @@ RDEPENDS_${PN} += "bash \
 	${PN}-net \
 	${PN}-nsfs \
 	${PN}-pstore \
+	${PN}-ptp \
 	${PN}-ptrace \
 	${PN}-seccomp \
 	${PN}-sigaltstack \
-- 
2.7.4


