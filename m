Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.6157.1627412801614971376
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 12:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 07E6340C32;
	Tue, 27 Jul 2021 19:06:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIJrst28FJdv; Tue, 27 Jul 2021 19:06:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC42F40B66;
	Tue, 27 Jul 2021 19:06:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A0BB9174646; Tue, 27 Jul 2021 15:06:39 -0400 (EDT)
Date: Tue, 27 Jul 2021 15:06:39 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH] ti-img-rogue-driver: unify with dunfell and fix double-patching
Message-ID: <20210727190639.GH1528@denix.org>
References: <1692042B86EAB73A.9904@lists.yoctoproject.org>
 <20210726233658.GX1528@denix.org>
 <38392802-c9f5-688e-996b-95dc8c7e59b2@ti.com>
MIME-Version: 1.0
In-Reply-To: <38392802-c9f5-688e-996b-95dc8c7e59b2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 11:54:05AM -0500, Siraswar, Yogesh wrote:
> 
> 
> On 7/26/2021 6:36 PM, Denys Dmytriyenko wrote:
> >Ping.
> >
> >On Thu, Jul 15, 2021 at 12:36:35PM -0400, Denys Dmytriyenko wrote:
> >>From: Denys Dmytriyenko <denys@konsulko.com>
> >>
> >>There was a discrepancy between master and dunfell where 2 different versions
> >>of the same patch existed, so when syncing branches, it resulted in appying
> >>the same change twice. This cleans it up.
> >>
> >>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>---
> >>  ...k-support-OE-toolchain-alongside-Poky-one.patch | 26 ----------------------
> >>  .../ti-img-rogue-driver_1.13.5776728.bb            |  4 ++--
> >>  2 files changed, 2 insertions(+), 28 deletions(-)
> >>  delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
> >>
> >>diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
> >>deleted file mode 100644
> >>index abe48df..0000000
> >>--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
> >>+++ /dev/null
> >>@@ -1,26 +0,0 @@
> >>-From 0d291f91d86e59d87ce023b4e7b89f6b00aa4aab Mon Sep 17 00:00:00 2001
> >>-From: Denys Dmytriyenko <denis@denix.org>
> >>-Date: Sat, 27 Mar 2021 00:20:57 -0400
> >>-Subject: [PATCH] compiler.mk: support OE toolchain alongside Poky one
> >>-
> >>-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> >>----
> >>- build/linux/config/compiler.mk | 2 +-
> >>- 1 file changed, 1 insertion(+), 1 deletion(-)
> >>-
> >>-diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
> >>-index 53a0bef..d45d438 100644
> >>---- a/build/linux/config/compiler.mk
> >>-+++ b/build/linux/config/compiler.mk
> >>-@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
> >>-    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_preferred_target)),)
> >>-     $(1)_compiler_preferred_target := i386-linux-gnu
> >>-    endif
> >>--   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
> >>-+   ifneq ($$(filter aarch64-poky-linux aarch64-oe-linux,$$($(1)_compiler_preferred_target)),)
> >>-     $(1)_compiler_preferred_target := aarch64-linux-gnu
> >>-    endif
> >>-    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> >>---
> >>-2.7.4
> >>-
> >>diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> >>index 00f1d81..e6edebd 100644
> >>--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> >>+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> >>@@ -19,8 +19,8 @@ PROVIDES = "virtual/gpudriver"
> >>  BRANCH = "1.13-5776728/linux-k5.10"
> >>-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> >>-    file://0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch \
> >>+SRC_URI = " \
> >>+    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> >>      file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
> >>  "
> 
> Shouldn't we revert the patch by removing file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch?
> And also back-port the patch to dunfell to use patch
> 0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
> instead of
> /0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch

It doesn't matter which patch stays and which goes - they are almost 
identical. Since master was already broken in this aspect, I decided 
to fix it in master and keep dunfell unchanged.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
