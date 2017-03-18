Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DA7DE00970; Sat, 18 Mar 2017 01:39:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.43 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E1A6E003C1
	for <meta-ti@yoctoproject.org>; Sat, 18 Mar 2017 01:39:46 -0700 (PDT)
Received: by mail-lf0-f43.google.com with SMTP id a6so40713787lfa.0
	for <meta-ti@yoctoproject.org>; Sat, 18 Mar 2017 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ooZCeG1wCdYCbMDeQh+BXkUwQkAY/+qa8VUwnNYB01s=;
	b=bIq+ckhBJXVXr0dMzEnVf5dquoi34bQfFjOGKFwT0VMR2cZTvt+dldlj0rQsioFNuB
	DpcDdumhxuOdN+MNwkmDKk5asaToHGrSBeCYLRS9y3+fIrbUa+O9XclzGmk+TyU9L2V+
	sQ4THnLKDJqW+rTDArZBKnXlW8dqDwPOXmPmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ooZCeG1wCdYCbMDeQh+BXkUwQkAY/+qa8VUwnNYB01s=;
	b=VJfPFMVKM2ghclZgBacTDumgIJWOrabQ7jpSVC7JtPLEuLdOzU9hlFbx1eFH8qqvJr
	GookXUgyYTPVGtTwefHIN+5qF08m6tEeyXwLg+DU2drLjgDpWYalvijHSA71Zr7C3QGt
	qxiRP+W24K3xfNlF5s/u3BBWYTJun9xSdB/xrzuRmp7GhYuhV/OJds9KwygJOlrY1+JL
	oKuSFtKOwkv89rnSZgidZML27tSmi8DN5n7PzEFpUgnvBOXVmgJuM7IzC4AwdXUYvZsh
	zNE5lUz7NF2f4U4weZPc7Jy4VMVZzFKBIKfq//2C1Bary6swqx+lR7Ki84letCTbcMLN
	ODeA==
X-Gm-Message-State: AFeK/H1NRqf1wZeMFcOPjH2UF3yZQ53w+9MMEqJBj1Qz7h6dY5zGCu0/tq5+PKQqBju9tGSt
X-Received: by 10.46.83.85 with SMTP id t21mr1279585ljd.82.1489826385829;
	Sat, 18 Mar 2017 01:39:45 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id v2sm1891712lja.31.2017.03.18.01.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Mar 2017 01:39:44 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Sat, 18 Mar 2017 10:39:41 +0200
Message-Id: <20170318083941.21353-2-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170318083941.21353-1-fathi.boudra@linaro.org>
References: <20170318083941.21353-1-fathi.boudra@linaro.org>
Subject: [morty-next][PATCH] kselftests: fix futex functional tests build
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
X-List-Received-Date: Sat, 18 Mar 2017 08:39:48 -0000

Recursive makefile is broken because it's using the same TARGETS variable
as selftests topdir and prevent to build futex functional tests:
make[2]: Nothing to be done for `all'.

Rename the variable to F_TARGETS in the futex functional tests Makefile.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 6e8c2143..39188b01 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -59,6 +59,7 @@ do_configure () {
 	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/memfd/Makefile
 	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
 	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
+	sed "s|TARGETS|F_TARGETS|g" -i ${S}/tools/testing/selftests/futex/functional/Makefile
 	sed "s|^LDFLAGS += -lpthread|LDLIBS += -lpthread|g" -i ${S}/tools/testing/selftests/seccomp/Makefile
 	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
 	sed "s|BINARIES|TEST_PROGS|g" -i ${S}/tools/testing/selftests/sigaltstack/Makefile
-- 
2.11.0


