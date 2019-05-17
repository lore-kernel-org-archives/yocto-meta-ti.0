Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9F20E00C93; Fri, 17 May 2019 13:38:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid *  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2DADE006D2
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2019 13:38:44 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4HKcinY087933
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2019 15:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558125524;
	bh=4FxLVl+D9RNZKRsM3UT1qIvvNRU7TqAKKPhKgz+xc6s=;
	h=From:To:CC:Subject:Date;
	b=hhvArJ95cr4kMp5ILK5kX9BcpTssZ8dODEqYRMgYQNOuZFDU/tVyf5AXYwfQsG0R8
	d5mdbUSgxuBo8o71xFNaQJFZU3xnM8o1FkoPxGl9xVmd6q73yl7B8y4eQKxsdAQwBY
	YtVJCKN38pWYZIfUFwEKtxzHQXTfgBXsKXZcixZk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4HKchwk096684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 17 May 2019 15:38:44 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 17 May 2019 15:38:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 17 May 2019 15:38:43 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4HKchgR081760;
	Fri, 17 May 2019 15:38:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 May 2019 20:27:21 +0000
Message-ID: <20190517202721.5455-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] kselftests: enable ptp/testptp target
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
X-List-Received-Date: Fri, 17 May 2019 20:38:45 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-selftests-add-ptp-to-TARGETS.patch   | 25 +++++++++++++++++++
 recipes-kernel/kselftests/kselftests_4.10.bb  |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch

diff --git a/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch b/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch
new file mode 100644
index 00000000..4c4a00e7
--- /dev/null
+++ b/recipes-kernel/kselftests/files/0001-selftests-add-ptp-to-TARGETS.patch
@@ -0,0 +1,25 @@
+From 9e1b0f0d7148524c226befdef90849f9e143ef66 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 17 May 2019 18:20:21 +0000
+Subject: [PATCH] selftests: add "ptp" to TARGETS
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tools/testing/selftests/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
+index 831022b1..6bd7cf81 100644
+--- a/tools/testing/selftests/Makefile
++++ b/tools/testing/selftests/Makefile
+@@ -20,6 +20,7 @@ TARGETS += net
+ TARGETS += nsfs
+ TARGETS += powerpc
+ TARGETS += pstore
++TARGETS += ptp
+ TARGETS += ptrace
+ TARGETS += seccomp
+ TARGETS += sigaltstack
+-- 
+2.17.1
+
diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index 7aa173f6..b28868f5 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
     file://0001-selftests-gpio-use-pkg-config.patch \
     file://0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch \
     file://0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch;apply=no \
+    file://0001-selftests-add-ptp-to-TARGETS.patch \
 "
 
 SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
@@ -64,6 +65,7 @@ PACKAGE_BEFORE_PN = " \
 	${PN}-nsfs \
 	${PN}-powerpc \
 	${PN}-pstore \
+	${PN}-ptp \
 	${PN}-ptrace \
 	${PN}-seccomp \
 	${PN}-sigaltstack \
@@ -100,6 +102,7 @@ FILES_${PN}-net = "${bindir}/kselftests/net"
 FILES_${PN}-nsfs = "${bindir}/kselftests/nsfs"
 FILES_${PN}-powerpc = "${bindir}/kselftests/powerpc"
 FILES_${PN}-pstore = "${bindir}/kselftests/pstore"
+FILES_${PN}-ptp = "${bindir}/kselftests/ptp"
 FILES_${PN}-ptrace = "${bindir}/kselftests/ptrace"
 FILES_${PN}-seccomp = "${bindir}/kselftests/seccomp"
 FILES_${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
-- 
2.17.1


