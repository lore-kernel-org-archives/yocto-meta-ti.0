Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 752A3E016D6; Wed, 13 Jun 2018 13:58:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4BCCE00E54
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2018 13:58:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5DKwDTG002268
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2018 15:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528923493;
	bh=cLw7nufIB5rJNmk7anyzAYcVVpsNh2yZxFSbypqZxCs=;
	h=From:To:CC:Subject:Date;
	b=EQD6F17IRGAT1s0dNcO+yKn7F82xhSmXb1W/mNfA43UIQxnAmonAURSU6Kqr2vnj3
	Q0k5szelUiq//KpZdRxrsXGV2mWuobjt193BBeBQzt7yjR4KQdssF3zqPRziE1xKM7
	5WC5v1SKjxx6+F1Dl5zaFKqtlIouNyDZD6I7BDqg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DKwDHS009211
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2018 15:58:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 15:58:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 15:58:03 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DKw3nN012244;
	Wed, 13 Jun 2018 15:58:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Jun 2018 20:57:35 +0000
Message-ID: <20180613205735.28634-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH][master] omap3/omap4: replace outdated xf86-video-omap* with xf86-video-fbdev
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
X-List-Received-Date: Wed, 13 Jun 2018 20:58:16 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/omap3.inc | 2 +-
 conf/machine/include/omap4.inc | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 221c029a..9270cbb1 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-input-mouse \
-           xf86-video-omapfb \
+           xf86-video-fbdev \
            xf86-input-keyboard"
 
 # Default to external video, change to smallscreen for built-in LCD
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index 789199d9..d9706066 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -10,9 +10,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
-           xserver-xorg-module-exa \
            xf86-input-evdev \
-           xf86-video-omap"
+           xf86-video-fbdev"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r4"
-- 
2.17.1


