Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E408E00D4A; Tue, 17 Sep 2019 11:01:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00, SUBJ_OBFU_PUNCT_FEW
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.7 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject:
	header
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 048BDE00C4F
	for <meta-ti@yoctoproject.org>; Tue, 17 Sep 2019 11:01:07 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA6AC40BE5;
	Tue, 17 Sep 2019 18:01:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id X3q31Lg9s2Ua; Tue, 17 Sep 2019 18:01:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C899640BC7;
	Tue, 17 Sep 2019 18:01:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 02C14172E07;
	Tue, 17 Sep 2019 14:01:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Sep 2019 14:01:03 -0400
Message-Id: <1568743263-3442-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] libion: update to fix musl builds by avoiding __BEGIN_DECL/__END_DECL
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
X-List-Received-Date: Tue, 17 Sep 2019 18:01:09 -0000

The fix from Khem Raj to use extern "C" instead of __BEGIN_DECL/__END_DECL macros

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 recipes-devtools/ion/libion_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
index 7c93ed3..8bfe19e 100644
--- a/recipes-devtools/ion/libion_git.bb
+++ b/recipes-devtools/ion/libion_git.bb
@@ -7,7 +7,7 @@ PV = "1.0.0"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
-SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
+SRCREV = "813bd63e2f2118e17cb1c5d38505a1e572a2381c"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


