Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4ABDE002AA; Fri, 27 Jun 2014 12:03:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BBA6E00288
	for <meta-ti@yoctoproject.org>; Fri, 27 Jun 2014 12:03:10 -0700 (PDT)
Received: by mail-pd0-f171.google.com with SMTP id fp1so4730195pdb.30
	for <meta-ti@yoctoproject.org>; Fri, 27 Jun 2014 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CjLx0U3BZbXf5fFy8JiG/6Dfzv9IkFckh++d07VA+lU=;
	b=UN5eCOmLxlFr+qVkBFixS1xXgnLcoZjTdTgzf74r02HItrPWBLn+bvF+QPTsrFOklK
	ZOJSMflGTmMTUvp7dTG937TVSb2fKm94ArkLjfx1MWOKr8xVWwSCH755cNIhlMua80+d
	VA2nIZt/HTwgrDOQ/DerJaLuMosdeUAgXvTw4X84xCbsaVId4sygvr/JsgSZLQgVHrpx
	Xf/zCH5qASc/KzGbsQIFTFPtwgAyyLu89bKcO5KjGhaj8Wr5UXLYibT++YeUQTF3DAK5
	8a/GZWpDc/XmFCZjD5TMaEsmAkHedot+KgkACBUB5HlINnFwQriRCDKMMMpqzky66M3c
	GDWQ==
X-Received: by 10.68.162.34 with SMTP id xx2mr33100602pbb.120.1403895790350;
	Fri, 27 Jun 2014 12:03:10 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id qk8sm5133988pbb.24.2014.06.27.12.03.09
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Jun 2014 12:03:09 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>,
	meta-ti@yoctoproject.org
Date: Fri, 27 Jun 2014 12:03:01 -0700
Message-Id: <1403895781-20246-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <CAK8F28kbYkyvM6caRVb50M5CvvzmORWKmnW+MZ8kbBUuiWpHLw@mail.gmail.com>
References: <CAK8F28kbYkyvM6caRVb50M5CvvzmORWKmnW+MZ8kbBUuiWpHLw@mail.gmail.com>
Subject: [Patch v2] Conditionally set ${TOOLCHAIN_PATH} used by some recipes
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
X-List-Received-Date: Fri, 27 Jun 2014 19:03:24 -0000

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
Oops...neglected to email the mailing list first time around.
 recipes-ti/includes/ti-paths.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 511b5ae..4e6227e 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -1,5 +1,6 @@
 installdir = "${datadir}/ti"
 
+export TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
 # This is where do_install will put it
 export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
 export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"
-- 
1.8.3.2


