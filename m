Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34629E00A28; Fri, 17 Mar 2017 11:10:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FA65E009CE
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:10:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9EA820AC4;
	Fri, 17 Mar 2017 18:10:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RzHLRjOuSrNl; Fri, 17 Mar 2017 18:10:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C25520BB3;
	Fri, 17 Mar 2017 18:10:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 33FFE1623EA;
	Fri, 17 Mar 2017 14:10:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 14:10:02 -0400
Message-Id: <1489774203-25523-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489774203-25523-1-git-send-email-denis@denix.org>
References: <1489774203-25523-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/4] kselftests: add libcap-ng dependency
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

libcap-ng is required to build capabilities tests.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 8850a31..dd94a65 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "libcap popt rsync-native"
+DEPENDS = "libcap libcap-ng popt rsync-native"
 
 inherit kernel-arch
 
-- 
2.7.4


