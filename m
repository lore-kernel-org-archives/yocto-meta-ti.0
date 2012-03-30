Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0502AE013A5
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 30 Mar 2012 11:58:34 -0700 (PDT)
Received: by mail-we0-f181.google.com with SMTP id m13so649240wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 30 Mar 2012 11:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=7hmHnxxXiWRdRblByisc+3JkjZC8Xxuq1pb8vVT/yIw=;
	b=Ven8VAqA0kVti8kAM9AGbUlDAgADxTH2pqz8bgMbkaeyeojnnQ4r0V9dsl7ASGZ2Wb
	3ueKwHDneyZfCEuhqzslVZsTPx/FNMBjJ9u9Ek9QGP0uWqAfG5aai9I5iVslRGbq5h7Q
	14tQMzk7DW9SjkJVpqWcwvgJnBTaXFh1gXMWrxRHeYsQYpEyMdqAPEkGe3AaNjG8618Q
	8QrEH0w6PfIBO3hENT+POEjfB/62N+e/X5ptetvYm/9YR5g+qcRD3Nfc4P7lEtZlqP4u
	Rb568AOX3IkPPAoD5FxJbuVA24+gQNUoGiqDitwBBFjL2i4CNuVj/0VRCB7AV3xyYTXe
	LoYQ==
MIME-Version: 1.0
Received: by 10.180.79.72 with SMTP id h8mr935437wix.1.1333133914551;
	Fri, 30 Mar 2012 11:58:34 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm13704948wib.7.2012.03.30.11.58.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 11:58:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 30 Mar 2012 20:58:24 +0200
Message-Id: <1333133904-14404-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333133904-14404-1-git-send-email-koen@dominion.thruhere.net>
References: <1333133904-14404-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl71q+3Cbm0zi8Edrr90pC0Xqp/ErFqnckbzoSAqde1dy047gcxNTw0lDVFqXrfjQ4zPL/M
Cc: denys@ti.com
Subject: [PATCH 3/3] linux-ti33x-psp 3.2: fix VGA cape partnumber
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 18:58:35 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

https://github.com/angstrom-distribution/meta-ti/tree/pull20123003

 ...add-more-beagleboardtoys-cape-partnumbers.patch |    2 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |    2 +-
 .../0026-beaglebone-add-gpio-keys-for-lcd.patch    |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
index 4c1fcfd..748386a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -24,7 +24,7 @@ index 36efca1..58a0e77 100644
 +		beaglebone_tsadcpins_free = 0;
 +	}
 +	
-+	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
++	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 +		pr_info("BeagleBone cape: initializing VGA cape\n");
 +		dvi_init(0,0);
 +	}
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
index f5da1ed..4d44ae0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -105,7 +105,7 @@ index 58a0e77..7a2b851 100644
 +		// gpio1_28 -> button
  	}
  	
- 	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 @@ -1898,11 +1971,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	
  	if (!strncmp("BB-BONE-BATT-01", cape_config.partnumber, 15)) {
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
index 2a36c19..2d8270e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
@@ -107,7 +107,7 @@ index ed2ff18..badee96 100644
 +		beaglebone_lcd3_keys_init(0,0);
  	}
  	
- 	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 -- 
 1.7.2.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index e6277ce..16c0dd4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


