Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2575.1617654641861924976
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Apr 2021 13:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BpYrlGoU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: g-tammana@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KUci1090763;
	Mon, 5 Apr 2021 15:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617654638;
	bh=SdBY4Fvv7HMiAA3DM0Z+cQMliifR5z/YUhJ7AlsqfjA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=BpYrlGoUT8kFzPaus2nkfI0AFII47bWvRN1SaYsNEtB/YBqAuzQ/eBi6QxxVDYIwb
	 8iWi+38FAd22HfgilmwGMAn42dhQ0M73xzxMFBpNW4ISUR6llA7zZAWTz2zfRj528b
	 Kk2SMpL0O80XC0xo7Mt2+3GgxWCTaNaEyx1tKq9k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KUcIe115308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:30:38 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 15:30:38 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.2176.009; Mon, 5 Apr 2021 15:30:38 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [master][PATCH 03/11] ti-img-rogue-driver: support OE toolchain alongside Poky one
Thread-Topic: [EXTERNAL] [master][PATCH 03/11] ti-img-rogue-driver: support OE
 toolchain alongside Poky one
Thread-Index: AQHXKB3EikPEP0z/3UKMD44DxVCYFaqmZLfg
Date: Mon, 5 Apr 2021 20:30:38 +0000
Message-ID: <ff21e80908ab4bc898d397927c6f38ce@ti.com>
References: <1617408603-2482-1-git-send-email-denis@denix.org>
 <1617408603-2482-4-git-send-email-denis@denix.org>
In-Reply-To: <1617408603-2482-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Friday, April 02, 2021 7:10 PM
>To: meta-ti@lists.yoctoproject.org
>Cc: Denys Dmytriyenko <denys@konsulko.com>; Tammana, Gowtham <g-
>tammana@ti.com>
>Subject: [EXTERNAL] [master][PATCH 03/11] ti-img-rogue-driver: support OE
>toolchain alongside Poky one
>
>From: Denys Dmytriyenko <denys@konsulko.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>Cc: Gowtham Tammana <g-tammana@ti.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> ...k-support-OE-toolchain-alongside-Poky-one.patch | 26
>++++++++++++++++++++++
> .../ti-img-rogue-driver_1.13.5776728.bb            |  4 +++-
> 2 files changed, 29 insertions(+), 1 deletion(-)
> create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-
>compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
>
>diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-
>compiler.mk-support-OE-toolchain-alongside-Poky-one.patch b/recipes-
>bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-
>toolchain-alongside-Poky-one.patch
>new file mode 100644
>index 0000000..abe48df
>--- /dev/null
>+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-
>support-OE-toolchain-alongside-Poky-one.patch
>@@ -0,0 +1,26 @@
>+From 0d291f91d86e59d87ce023b4e7b89f6b00aa4aab Mon Sep 17 00:00:00 2001
>+From: Denys Dmytriyenko <denis@denix.org>
>+Date: Sat, 27 Mar 2021 00:20:57 -0400
>+Subject: [PATCH] compiler.mk: support OE toolchain alongside Poky one
>+
>+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>+---
>+ build/linux/config/compiler.mk | 2 +-
>+ 1 file changed, 1 insertion(+), 1 deletion(-)
>+
>+diff --git a/build/linux/config/compiler.mk
>b/build/linux/config/compiler.mk
>+index 53a0bef..d45d438 100644
>+--- a/build/linux/config/compiler.mk
>++++ b/build/linux/config/compiler.mk
>+@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
>+    ifneq ($$(filter i386-% i486-% i586-% i686-
>%,$$($(1)_compiler_preferred_target)),)
>+     $(1)_compiler_preferred_target :=3D i386-linux-gnu
>+    endif
>+-   ifneq ($$(filter aarch64-poky-
>linux,$$($(1)_compiler_preferred_target)),)
>++   ifneq ($$(filter aarch64-poky-linux aarch64-oe-
>linux,$$($(1)_compiler_preferred_target)),)
>+     $(1)_compiler_preferred_target :=3D aarch64-linux-gnu
>+    endif
>+    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-
>gnueabi,$$($(1)_compiler_preferred_target)),)
>+--
>+2.7.4
>+
>diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-
>driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-
>driver_1.13.5776728.bb
>index db3901d..6b0e653 100644
>--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>@@ -19,7 +19,9 @@ PROVIDES =3D "virtual/gpudriver"
>
> BRANCH =3D "1.13-5776728/linux-k5.4"
>
>-SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-
>driver.git;branch=3D${BRANCH}"
>+SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-
>driver.git;branch=3D${BRANCH} \
>+    file://0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
>\
>+"
>
> S =3D "${WORKDIR}/git"
>
>--
>2.7.4

