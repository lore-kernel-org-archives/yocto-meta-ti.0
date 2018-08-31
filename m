Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DFCAE009AC; Fri, 31 Aug 2018 09:20:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EF74E005B1
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2018 09:20:41 -0700 (PDT)
Received: by mail-yb1-f195.google.com with SMTP id h22-v6so658779ybg.12
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2018 09:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k9Rh5vK4bLnn09hm/nIYFSVNFqRwVF+YjafBIKE27wo=;
	b=fIsCFxaCRqDEX2LoYB8WwJfuqYGRLQMFNEouAMddZmMC1hYWflmR13NaIjPlp35/J8
	YGOGdByJCmwKB575XJ7bRtGV2jc76qtrJIrzGj2q6rOmWNtaQL2Ngpo5mFD9mthIWkHS
	RZWUPW1gXETXtDaWiD0EyaP61Np9vIttGslw6fGWdhX2XUn5Ry4OGjWuVKb6XfAyqfI/
	CyFFI1L4lUiUjFsukUOADErYSQHK14SGhXolI5BZv7CNqUZg0zb4KK71+6CqGU2YiGEa
	9H70ncOn+4DdJG4h8f9LlCm29r5cf9EF9giVD3PlnzKsWkdyZt2uHY5KARbC07naWY0s
	+Tjg==
X-Gm-Message-State: APzg51C73Iju0QXQ1MvEIyRao3GSpjJddW1daJsRZgh8lWMP707SXh99
	KLCwgojpBMtX1zH1Zcs2Q1+0uRs=
X-Google-Smtp-Source: ANB0VdavaMSZC8ocMaadcK9Wjt2BsYWoPxfKjakjKiooOYdpjKphLyIZa3ZGOHlM3JKWwWUjXJ50/Q==
X-Received: by 2002:a25:cd08:: with SMTP id d8-v6mr9080784ybf.76.1535730878176;
	Fri, 31 Aug 2018 08:54:38 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	z7-v6sm9709693ywz.21.2018.08.31.08.54.37
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 08:54:37 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: meta-ti@yoctoproject.org
Date: Fri, 31 Aug 2018 11:54:34 -0400
Message-Id: <1535730874-14843-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] amx3-cm3: Fix building with poky-lsb
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
X-List-Received-Date: Fri, 31 Aug 2018 16:20:43 -0000

One of the features of poky-lsb is that it brings in the
security_flags.inc file that sets a number of security-related compile
time flags.  This includes changing some of the default GCC build
options.  However, for building the amx3-cm3 firmware we want to ensure
that none of this enabled as it's not useful in this particular
environment.  We must pass in ${SECURITY_NOPIE_CFLAGS} to disable PIE.
When security_flags.inc is not present this is an empty string so is
safe to do at all times.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
If acceptable I would appreciate this being applied to the rocko branch
as well.  Thanks!
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 5a2b08bbe985..1dcc021c0445 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 
 do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}"
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI} ${SECURITY_NOPIE_CFLAGS}"
 }
 
 do_install() {
-- 
2.7.4


