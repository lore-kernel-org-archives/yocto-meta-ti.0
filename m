Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A49DE00726; Mon, 20 Mar 2017 11:23:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B671E00349
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 11:23:30 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id a6so58847438lfa.0
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=hCVq4sldNb4XtMb/pkJoyDsIylZ7+Woz6m8kaZ4V9Ks=;
	b=EVOfIsWhf9/Jv05Xz3a7vHWegjpZ/gxDHc38pdJXbkZfrn7EGop7KGTwU7/ILM7/jt
	EXlof/ujG4iPpGjdkLWx/4j575s4ToBLXqkD7ngVeI+XssCp57qDayXKAG7wHLPzAXQe
	v8K9MWHSGx2qK6OsfBB/OPcHn0Z2X/Xo1iTBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hCVq4sldNb4XtMb/pkJoyDsIylZ7+Woz6m8kaZ4V9Ks=;
	b=AyrArWoqqzvEaNOO9I9KNwEbMosxGg1KypGKZ9TkRpVkbos671ovk3HRR/jb3v0x+o
	MDJF8b7EYD6Kahdea9zAYxOaCUXI853iF5VYy8wxJRy6BFh33gIxBetNuYpgyn7KXzu7
	Ik81F3ipmNKeIO390muWQJU9z7rM6I3gTbl3ZZTNyAo1QJdAv/ffZFgjb6+10QrnQzJw
	2ZJI1UYZezB0PqLBAqaSvMRpeZ25edx1CbysV4qvF1jP/yYY++W11daylWVedhJFA1Gz
	dzNctc7ghq4sRPOJvKy069pgJVL4kHYGYN1pBu97KKNcdyTGW4q3X3dOUpo1eHrzOgfr
	EPPw==
X-Gm-Message-State: AFeK/H2XTGYJ0STdC1LylvJEaz36vN3RTgYf85+Lfufy0WtjcgH2HkITlRPFCBkBD7YXXyOz
X-Received: by 10.46.7.68 with SMTP id i4mr10188909ljd.9.1490034209217;
	Mon, 20 Mar 2017 11:23:29 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	q76sm3110789lfb.65.2017.03.20.11.23.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 11:23:27 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Mar 2017 20:23:25 +0200
Message-Id: <20170320182325.1286-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [morty][PATCH] kselftests: fix up run_kselftest.sh due to spurious lines
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
X-List-Received-Date: Mon, 20 Mar 2017 18:23:32 -0000

run_kselftests.sh contains randomly spurious lines starting by "make[1]:".
The way the script is generated is most likely broken.
Until, we've got a proper fix, get rid of the lines after the generated
script is installed.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 39188b01..9d3f1d73 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -72,6 +72,8 @@ do_compile () {
 do_install () {
 	oe_runmake install
 	chown -R root:root ${D}
+	# fixup run_kselftest.sh due to spurious lines starting by "make[1]:"
+	sed -i '/^make/d' ${D}${bindir}/kselftests/run_kselftest.sh
 }
 
 PACKAGE_BEFORE_PN = " \
-- 
2.11.0


