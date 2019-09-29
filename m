Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A98B5E009AC; Sun, 29 Sep 2019 08:43:47 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B9E0E0098A
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 08:43:46 -0700 (PDT)
Received: by mail-pl1-f194.google.com with SMTP id d22so2870446pll.7
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MOTZUfvSY5tHiWEfl/uTDB2Z9yugCf2W9LHyY0viU10=;
	b=U+Crv2AKEKdJ7WFZzen0LJxECBHUH7rTe7fYzS3iiaHDoPZlnPPvvwi33OIN9By400
	wUzxfho+cQ0KtcLzAdWMExK8TpIujChNUTQWKe3PJgoieju9gWBA9PJc4M7mHsxJ2O1t
	YMJwowaegWtl2P6cR8FlxnRzMzRK6xpd+eTd0K5lLOOCNaw19pWqjt9CcJgsYDNXbSq0
	pZFmMwln2rtYD3rWj0MLCGOaRviZ5P0hNDHMcZYwUEjossfGqfSYjn6TCi68jXfdQyTJ
	DOjbB7It++yNn47vrD3t5iDRpeGaakTn5zcNOxbGaEIa+ZTZqYjQM4JWTfIpLQ8VjRXP
	v0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MOTZUfvSY5tHiWEfl/uTDB2Z9yugCf2W9LHyY0viU10=;
	b=Qa6FOFIu4Q/x2vpD2j7F/r62upY/F/ZDwhAOwbflNC5ilLhYt8ooXjVAI4yjOP68Hm
	BnrbiqlENyPbAw20jnliXsEhItnQnChbi/9aQVNPUtY4e3E8qkAF5gSw//P4Iaf+llx0
	qgI+enOLsc3e1KkJZOPYFShI4YIbYjfv2xwgvEXc5thJkEI11Gv6+XN2ErWdjp2UZJus
	Oo8lPvTI82tnEMbTAB15v7KRAXICqiIXN3AkpjHErRMbJ0wstlw9F5ZTi2CtcXhsxNNj
	NKKawjckXze+Dfvgmb2lfiBL5ROezeAzEz7s4zRxq8V3+z0A6V19gMDKgYGETPYj59NH
	ahPw==
X-Gm-Message-State: APjAAAUJuiQCVR1nSWQRoeQsbN9j/f3bmfUypTmpzZ5kxgnReZyvR7AU
	EQ1vGbQIq3FIMewr65lVgKNBsXmpl/8=
X-Google-Smtp-Source: APXvYqyTbqhyRi9I05Kw1HW5qV+jhHlhnZDQxh/ybKVru4eJyVX8AFB0xPp/RHhaY9JWjNNEIAEnRQ==
X-Received: by 2002:a17:902:b110:: with SMTP id
	q16mr15540858plr.262.1569771825749; 
	Sun, 29 Sep 2019 08:43:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	x20sm11059284pfp.120.2019.09.29.08.43.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 08:43:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Sep 2019 08:43:33 -0700
Message-Id: <20190929154335.2646732-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/3] u-boot-ti: Drop using COREBASE
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
X-List-Received-Date: Sun, 29 Sep 2019 15:43:47 -0000
Content-Transfer-Encoding: 8bit

COREBASE is hardcoding the path and moreover its obsolete the better way
is to use relative path which is automatically searched in BBPATH by
bitbake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index f1187e64..f7434712 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -13,7 +13,7 @@ UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
 
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require recipes-bsp/u-boot/u-boot.inc
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
 
-- 
2.23.0


