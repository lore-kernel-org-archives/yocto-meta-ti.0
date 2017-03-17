Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FB25E009B9; Fri, 17 Mar 2017 09:37:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5D5EE009B9
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 09:36:59 -0700 (PDT)
Received: by mail-lf0-f45.google.com with SMTP id y193so35353252lfd.3
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tZrkbjZsD8f5ihkygPzOXpgpEbXXlrJENwIFyJBasns=;
	b=JaMAKfLhc7Xv/FZyzdfeI2DG2g4Fdf4wwhTYwImr9pGB3GYZcW87oZYrVslKXsRcLb
	+Qgno3exSmg6I9AwhRSRBh+GVwg4mqQchcJifek42qLQgNCEWhhPwgAx1NjK+jNMIB5u
	j5Qe4Yw/HecoXpQCrKY0Kr2xiIYyjVVSChT7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tZrkbjZsD8f5ihkygPzOXpgpEbXXlrJENwIFyJBasns=;
	b=cflb8SNPw0jcmGBEnyTWFOAl+LHhdbfpFqYB1XebaNUjGHutmcIzsHXmg0i3DMKasJ
	iMpwePy0/e6o39DbBCn2HCijCye3H8UEPW9bZ3/EhTONeKT5eeyMTGafyC5OFrMBCCHx
	ROEIFXWtDmVNU34TZHXjZZurp3YVUoBsAM8xY2o1Yh+Vhy8LThvHDX3I80ZzA2mgWiKc
	Nt3OMKE27s3llV3y8kpqqjb1tsg7ssgc7NlMIp/j3yIpI6Hw1mim+N3z7y9TTV4WJ/lN
	7fTgn5ZH4NEZFUd6ER0iq4A1ouD18ZD6EgT7pRYqEZPb1ve+9BQK3g7pfQVI5PlWFeq9
	phTQ==
X-Gm-Message-State: AFeK/H0Bl7vIVWtCygmIKHke/I3TWJlrwm/PdxO6XJDzuo+Z1W3QELjh/1ZkuLEG+d2r+Fn4
X-Received: by 10.25.89.135 with SMTP id n129mr4133179lfb.180.1489768617967;
	Fri, 17 Mar 2017 09:36:57 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	b75sm1549643lfh.36.2017.03.17.09.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Mar 2017 09:36:57 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 18:36:53 +0200
Message-Id: <20170317163653.13127-2-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170317163653.13127-1-fathi.boudra@linaro.org>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
Subject: [morty-next][PATCH 2/2] kselftests: fix seccomp test build failure
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
X-List-Received-Date: Fri, 17 Mar 2017 16:37:02 -0000

Use the same fixup as used for timers test:
use LDLIBS to properly link against libpthread.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index dd94a65b..3cd12ea6 100644
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
2.11.0


