Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03B6DE00A54; Mon, 26 Nov 2018 22:46:53 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.169 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01558E009B2
	for <meta-ti@yoctoproject.org>; Mon, 26 Nov 2018 22:46:51 -0800 (PST)
Received: by mail-pl1-f169.google.com with SMTP id gn14so15128091plb.10
	for <meta-ti@yoctoproject.org>; Mon, 26 Nov 2018 22:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xKIRTvhjdJ9Y+6BRPEmc9V+sYGIqcg3CIjT+6Dpi3pc=;
	b=o7g4XBo71njnk2ZkRul4DaezgGo8nOSxrriVV1JIztKRKH3nKHdLTiYvj9oOPm2ljt
	yBssae0ZSSVSIgSylTuD+Jc55q4uxvD3PyFXzA/Fc45sg/mJV2J8yAyCScGKMwj+JnB/
	qprmkMDu7gOjgCFDCE5EQh9vsMFQSekC8kCXCQ2kOhC9VuZmOnIsx19KMZwdVnpWpqIP
	9k/TDBbt1p71FnNMDuVO3+EJCKAzmUaRUeUCoXFg77AgNKyXP2/BIxCd/ryexES3mcQ3
	xXE91MlJvxPSxYCQ/G8/3008f9nPoW2AUgji+V1vwIHvdQwk19BZiI2bM7aHT6KpcL00
	ChYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xKIRTvhjdJ9Y+6BRPEmc9V+sYGIqcg3CIjT+6Dpi3pc=;
	b=Rzq+IbFmJKNzQ59vjT6hC6SU02Qt0UhaeCnfbGgatTaOaxOilO4sPb16f2qSEglmrb
	W4qL+En7tZiL9+TlPaRAiovR3H5pdHGYXg1Ejym9Q/kyhGpQn+DjokOgIZNAiXyCf1LL
	ZDyAYTHLaS2ndo1SCWYMTktPtUtYqyLJk2hVnP5TkNYQR2X4L115WgQ8ShBKGWYEVL2o
	60vjL+9lgcI3DEePenEv+01gzK8ryA8r9G1XNzeSWR/N9/w8XO4phbP9y0q7AOGhe8IM
	myvSaRJlSuMHouGccX4LolxJkl0cqvJ9yhlwxB19IfG06FY7w4fgSmypBhl1o5OwbGRF
	N14g==
X-Gm-Message-State: AA+aEWazpRRHcVBUPDtBv5kaCjMN+QeQUF6KTEbBPNX5agYhpKOOGVKy
	cxfJ0uucA8cTmeZCj8D6n2t+l+h725k=
X-Google-Smtp-Source: AFSGD/Vrg/a0tJ485rY8AVvAFGx5n59ubDEVQKjmPQ5M8EZ8sq8CeK/mPk+A7RZF4kl4Tzvdan9wLw==
X-Received: by 2002:a17:902:2a66:: with SMTP id
	i93mr30692156plb.113.1543301210793; 
	Mon, 26 Nov 2018 22:46:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	z191sm2858542pgd.74.2018.11.26.22.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 22:46:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 26 Nov 2018 22:46:35 -0800
Message-Id: <20181127064635.42008-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] uio-module-drv: Mark it to be ti SOC specific
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
X-List-Received-Date: Tue, 27 Nov 2018 06:46:53 -0000
Content-Transfer-Encoding: 8bit

Fails to compile with non TI kernels

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 99d908ee..f483010e 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -14,3 +14,6 @@ SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};bra
 SRCREV = "${UIO_MODULE_DRV_SRCREV}"
 
 S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
-- 
2.19.2


