Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E239EE00992; Thu, 30 Mar 2017 09:38:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.51 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07C7FE00826
	for <meta-ti@yoctoproject.org>; Thu, 30 Mar 2017 09:38:49 -0700 (PDT)
Received: by mail-lf0-f51.google.com with SMTP id h125so31114787lfe.0
	for <meta-ti@yoctoproject.org>; Thu, 30 Mar 2017 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Lh+Gk3YN+MSOOYZ5paNGTMIrR60HbHWJyl1yJ9Kc4fY=;
	b=Zv8F0/AQl//Nbos3PjnP+k+AG9OhH2jRPBmmClrvSEGb/YSkxN/Ivrj/j3+e35Ffks
	k/MH2iaOZXbH7lxkoKU9D+KUhPpn+IdT6o45AatB8sNpHjSpjVZMa1h586wkaEy37GX/
	3lzX9DecPs7N7W6kmxupWjskUfZYIy101mSt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lh+Gk3YN+MSOOYZ5paNGTMIrR60HbHWJyl1yJ9Kc4fY=;
	b=uFT1CUM01q4YhQnU2YTlEMzznV0IK43Lru74bxOApb3jf0DbXjRnE/FYyuNWOeV1vP
	+8/ySYgJ1vYamCL09sMfcOZYph9oqoU3otBrM+j0CHWkVXZ7zAPU+eq/dbMgQE4nVYBC
	c5xlOItjqPAU+bkn9ndxqfiOoGf3yQVW7HN4lIREGwRayD9HzPZJkobBkeqLKHMiKYoV
	blmFtGRCdG206Cl0v5sbxihVWtrc+zdWwsjpxVnJXFBVmvyjAevxnUOjZSbZORXWL511
	eYZX74NCwzQTHI5wlgHHtDFWRcSpAURlvi2EJjpApYvKolYZe95siAbdP3c9eVk8edVf
	IS0w==
X-Gm-Message-State: AFeK/H3UV8/vQMQgnHWBl7QUaLpwKuUlISaRoGeolqP4dlXz2c5gMrNUTAqT5sWkAKyKVDqw
X-Received: by 10.46.76.2 with SMTP id z2mr246389lja.59.1490891928926;
	Thu, 30 Mar 2017 09:38:48 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id 34sm457710lfv.48.2017.03.30.09.38.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 09:38:48 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Thu, 30 Mar 2017 19:38:47 +0300
Message-Id: <20170330163847.15606-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] kselftests: add bc dependency to zram test
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
X-List-Received-Date: Thu, 30 Mar 2017 16:38:51 -0000

In the zram tests, zram01.sh script calls bc command.
Add bc to zram RDEPENDS.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index 9ae09a67..5642af7a 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -129,7 +129,7 @@ RDEPENDS_${PN}-futex += "bash ncurses"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash sudo"
-RDEPENDS_${PN}-zram += "bash"
+RDEPENDS_${PN}-zram += "bash bc"
 RDEPENDS_${PN} += "bash \
 	${PN}-bpf \
 	${PN}-capabilities \
-- 
2.11.0


