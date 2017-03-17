Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19F1EE009CF; Fri, 17 Mar 2017 09:37:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.42 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BF82E00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 09:36:57 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id z15so35465548lfd.1
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=a1YKuPJsEVUzdM3+fMpNyCSmcBXvK4X0IsU3pD8jn3Q=;
	b=kTJ8Lh9tZ7U9sWLGhOjlyTZuH1VNZGGkPdey42TzKSCaaoeVnk/aNVRfyEB1a7YG/q
	HEVr+GhSxO79+bgmAw17stsM0acxGzC8I/ZVlrlmLd0uGCd8aaHRhLzNQwD+GsUlM7zv
	Vob/geNMXmuq/XSSB1NYJC0xT5TTV+kh0XySQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a1YKuPJsEVUzdM3+fMpNyCSmcBXvK4X0IsU3pD8jn3Q=;
	b=lkHJ2HHTn8sMMaO9BqXRff54tF9eVvibCQMAMtmulxjq/ipiftakzUSHDj9f2xAWoY
	E22w2VkPfOVFhWxXjgtr5dDzJBtcj/EAnFjgPEn8vCrUo2jNZwziuzesrndAuiNfIvD5
	i0VoeKfkceQw7sPNrRlPSe+8d46M1J1MMxQDXYi8G7o8uZCfWF6ky3LwQH43zQvCAZun
	kQtowFwR2Plwj3zCHEbG5+VOEjjJm+s3gWvdLe6MSYZhnLaUB7Mj3T29tfs6CS8ER7Xh
	w2ScWUfONegy6dd7L3nLiBq/NWk00VTcjPywSKSQ4UTeOhVvBRLsxS9QPK8R+oS/hna+
	u8Yw==
X-Gm-Message-State: AFeK/H274EWPMGQLQtOFlAYxzW2bIqHwo9q2ZHI7nqs07i0fknuIL0k5SLkORsbu0+OSFg/O
X-Received: by 10.25.34.87 with SMTP id i84mr4637340lfi.140.1489768616688;
	Fri, 17 Mar 2017 09:36:56 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	b75sm1549643lfh.36.2017.03.17.09.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Mar 2017 09:36:55 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 18:36:52 +0200
Message-Id: <20170317163653.13127-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [morty-next][PATCH 1/2] kselftests: add libpcap-ng dependency
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
X-List-Received-Date: Fri, 17 Mar 2017 16:37:01 -0000

libpcap-ng is required to build capabilities tests.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index a7b4ba67..dd94a65b 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "libcap popt rsync-native"
+DEPENDS = "libcap libcap-ng popt rsync-native"
 
 inherit kernel-arch
 
@@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
 FILES_${PN}-zram = "${bindir}/kselftests/zram"
 FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 
-ALLOW_EMPTY_${PN}-capabilities = "1"
-
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-memory-hotplug += "bash"
-- 
2.11.0


