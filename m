Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5842AE009FA; Fri, 12 Jul 2019 17:43:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.196 listed in list.dnswl.org]
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 583B3E009FA
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:35 -0700 (PDT)
Received: by mail-pl1-f196.google.com with SMTP id k8so5571747plt.3
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0JskdxGZWjj9DD2NTuShUDUxLBx6zYQn0nCN+8jBruM=;
	b=i42rtLiJF6eSqfrKtC8OjiekTGFrr5jZ0Q1M5JwW2Fh+T9NJjafYbjoqgXPr/Uo+1j
	Y3DHmKpp4pYHkC9EHiU0x6p8uETX54ZSSw+MZ8D7Rtg77i22BwizMDBY2DHag4DzuQ3H
	Wea9SbaAmu21ZxVpAuWJQu4zXw9EXSwcxetH4cA4AAH/xvNphGLsIw1SZDO5QMeoQXgA
	HXjfI+jord8kYqN0O1PjnBRGc4r8yJyG+qbiO2vJM2pbkT5i4pUTAv58a6PLYnoEKPzE
	Th1+3f7/m8Lss2uGqvFseKZXaGBND3xENGfjHRL9HF31dJV8UqyjYBzsKbZpIR1XjxlU
	rmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0JskdxGZWjj9DD2NTuShUDUxLBx6zYQn0nCN+8jBruM=;
	b=Ls8I2GRyjFyoD5gWcwZrMEClfPXC37dMIM6XDszrSsnQ2MglV3usf/StC0fTuHvsw4
	YKKxWaCYjw3Ii6O1BGI+yFCB7ryyafi7+hvU8wURdkhxpnOn0BAyCZom4XmIvzdkOGxS
	Cm8BzrE4BMxrPrXnWRXCmYXcNEhEYf+mNsT46L//kzA+uVfdgWc3xuLxRx9AFamAIxmI
	d8Gc/+K6PTz6EUOnw3mBIzEYUnkx2CQzXo20Bu0zfnbY/DgnNlgMU4zHTzouwctT3f4a
	dBCeo4T4FcYE4PR5C/KbZyp7rVh2OjY5MRn7/rmzznSs0mgknqaH7SxYuDNjCR070wCF
	YWmA==
X-Gm-Message-State: APjAAAVil2dXmvf66KlcqrzAQD6rO4LZ6u0EnP+wGdN34EtYzz/7thB4
	Eq6jUzJ8+xdfR8cqGYoA1kO+zml05Yk=
X-Google-Smtp-Source: APXvYqw7yjHIy797WWTR04HxJmaILl2SOn4bsN/94+T0KYbrAwM4dBXkiNvc3d+wc1+veEXztOpBPA==
X-Received: by 2002:a17:902:8a8a:: with SMTP id
	p10mr15362937plo.88.1562978614477; 
	Fri, 12 Jul 2019 17:43:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j19sm10547303pgn.19.2019.07.12.17.43.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 17:43:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Jul 2019 17:43:22 -0700
Message-Id: <20190713004324.12695-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713004324.12695-1-raj.khem@gmail.com>
References: <20190713004324.12695-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] jailhouse: Limit OE architectures to supported ones
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
X-List-Received-Date: Sat, 13 Jul 2019 00:43:36 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: cannot map 'mips' to a jailhouse supported architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kernel/jailhouse/jailhouse-arch.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-kernel/jailhouse/jailhouse-arch.inc b/recipes-kernel/jailhouse/jailhouse-arch.inc
index e06ec231..0546fa26 100644
--- a/recipes-kernel/jailhouse/jailhouse-arch.inc
+++ b/recipes-kernel/jailhouse/jailhouse-arch.inc
@@ -18,3 +18,6 @@ def map_jh_arch(a, d):
         bb.error("cannot map '%s' to a jailhouse supported architecture" % a)
 
 export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
-- 
2.22.0


