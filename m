Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.4362.1614155124529756582
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Feb 2021 00:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=cp5HLkKw;
 spf=none, err=permanent DNS error (domain: falconsigh.net, ip: 64.147.123.20, mailfrom: zan@falconsigh.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 544B6D9F
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Feb 2021 03:25:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 24 Feb 2021 03:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=caOSZbk4txKNEszHQ
	nV7YZgb3A9oM0LeNXHO/cjnrag=; b=cp5HLkKwGux2wn4Yxsxm8j64tjk5rJZrd
	QpMJdG/rGTwY4Qw2YF8GEDy9ytaDo7D3+f84dWTwQ4RJoaOCkFXBOpZ6otSnbLfP
	Rt8x6brUqgCckW5LmNBfjlLgFUtKvuYidfEf0xfuQg9HGBqXLfpkYIM+DXc8SqoP
	hv2NHreOOxPl+u1W21GsvmoFxGU8JnDShlymaOtPrx8sbfPHoD8Jlmtnfptd+Gvh
	xuQrmkNMLMiYUrTlDa6uCGkCchX3jK2vXsnQsi4uTxklTTukFYcJJmpKiS6USIh5
	yEkQKQmt07d1tOwr+Bc1QQft8Apv3fRXr1BjMZcaPPyLX8cKAyvKg==
X-ME-Sender: <xms:cg02YOmbX4BtgKIgRsHPHUgScT1DkIVFgMf7Q1gec4xD6DM1M_FUbQ>
    <xme:cg02YF3Uip9l2aE5iM_ld6XSoBtNRAmihXFOAeSp40WhQQs6qvuTcbJQ8rWxZsYeW
    9jPH5OQWxV8Zx8pbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeeigdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepkggrnhcuffhosggvrhhsvghkuceoiigrnhesfhgrlhgtohhnshhi
    ghhhrdhnvghtqeenucggtffrrghtthgvrhhnpeefheevudduvefguefgteekgeejvdetff
    euteffteeileejhfeuffelkeffvedvveenucfkphepleehrddujeeirdduhedtrddvvddv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiigrnh
    esfhgrlhgtohhnshhighhhrdhnvght
X-ME-Proxy: <xmx:cg02YMpRBAwSYLNJV2LtUM87qhVM7VVgtmIHdF13kM8I0wwwvUDWeQ>
    <xmx:cg02YCm7bdaqMw8X4o8dh0dQQKKxhNZmrpFpt9q-J3P02yJKUOUazQ>
    <xmx:cg02YM1K7zbYRQpI_DuQFsNlhrBNCmo3AIGzU3gMFlzACkIGvK2jGg>
    <xmx:cg02YH1P9joYylFPCelkbz6drx6-N4qU2PWDfhAphAvmIaZD_JWDrw>
Received: from localhost.localdomain (bsn-176-150-222.dynamic.siol.net [95.176.150.222])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5999A24005A
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Feb 2021 03:25:22 -0500 (EST)
From: zan@falconsigh.net
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
Date: Wed, 24 Feb 2021 09:25:09 +0100
Message-Id: <20210224082509.14163-1-zan@falconsigh.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The additional patch for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi prefix
to the arm-linux-gnueabihf preferred target. Same should be done for the
arm-poky-linux-gnueabi prefix.

Signed-off-by: Zan Dobersek <zan@falconsigh.net>
---
 ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
index 071ce0ca..15105eac 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
     $(1)_compiler_preferred_target := aarch64-linux-gnu
    endif
-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
 +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
 +  endif
    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
-- 
2.30.0

