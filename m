Return-Path: <paul.barker.commagility@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8FDEE00AAF; Tue, 19 Jan 2016 07:51:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39F8FE00912
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 07:51:40 -0800 (PST)
Received: by mail-wm0-f68.google.com with SMTP id l65so24158926wmf.3
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 07:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=22WfY4MfuMkrP8JVj0vozAAr0eX+Ty+ClR9GUPDtj7g=;
	b=emFrK/EpzMC7bZB0a3tgdqcHyNGm4cwPAgYC7LlX9ZmA3xDsSRcJst5j59J9qVEwDI
	LgLIOoLiKZisAci1OUqgqFvRt+OT6tlqB1v6He3F8PnDUxpCXuPuh858bvDC2HoAdTnH
	QbZGSm2Hf7SHFiixRclKxcs6kkq0wcy/LNi9Okj5c5OsgNgAk1F4xu8qb+WxW6SwBUec
	EURvQU8NfPLnf5ADZC2Svb50ue6Yr9bF6Rkz1Cc0dX2HOTQSQnR6DAAIXwV380cgyWa7
	pMLdntdt9iBIPzDS2yM7ghjoLZrWT6d6Cc7w0WWUuXEOY06sP1LQYUjwNaEncerxaFKf
	CZ/w==
X-Gm-Message-State: AG10YOQpSww9kRRHsNSGb729YKcdj+WxQ83sQgGP1VAjaUKssbSiQIRXZ0zPr7fbPOdiVw==
X-Received: by 10.28.211.136 with SMTP id k130mr20628710wmg.84.1453218699986; 
	Tue, 19 Jan 2016 07:51:39 -0800 (PST)
Received: from localhost.localdomain (inno-commagility-ownrouter.lut.ac.uk.
	[131.231.60.35]) by smtp.gmail.com with ESMTPSA id
	c185sm21002079wma.5.2016.01.19.07.51.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 07:51:39 -0800 (PST)
From: Paul Barker <paul.barker@commagility.com>
To: meta-ti@yoctoproject.org
Date: Tue, 19 Jan 2016 15:51:27 +0000
Message-Id: <1453218687-30012-1-git-send-email-paul.barker@commagility.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ti-softhsmv2: Use target includes for zlib and openssl
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
X-List-Received-Date: Tue, 19 Jan 2016 15:51:44 -0000

ti-softhsmv2 needs to look at the target include directories instead of the host
include directories for zlib and openssl header files.

Signed-off-by: Paul Barker <paul.barker@commagility.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index c1e1654..dd51309 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -21,7 +21,10 @@ S = "${WORKDIR}/git"
 CFLAGS += " -mno-unaligned-access"
 CPPFLAGS += " -mno-unaligned-access"
 
-EXTRA_OECONF += "--with-zlib=${STAGING_DIR_HOST}/usr"
+EXTRA_OECONF += " \
+    --with-zlib=${STAGING_DIR_TARGET}/usr \
+    --with-openssl=${STAGING_DIR_TARGET}/usr \
+    "
 
 INITSCRIPT_NAME = "softhsm-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
-- 
1.9.1


