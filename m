Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.523.1639089604087468310
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 14:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MkWL3uNT;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id m25so6765143qtq.13
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Dec 2021 14:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rR60hxzKwZFou5W9ExQhVkWlWISsyS8xqsw7+/79IkA=;
        b=MkWL3uNTY0KXrT7PbwG5LaZU8xIR4xZxtoKUiapw2fS20fqKGk2wqMUtvcplvUJDKw
         TSBWjQgIG95zKx+mCsTJFnnGqd0x8ZF+tGxxB6whFIHVynUkHkA3HlNuJSahSZ+0JxVx
         wzzmIOFVAV35WQk/WnZQsRnUZB3DTuMDliH9DS9NccdfDmvoSRBK+X0wrt1EWykN53Tx
         Rm7+7tLJ2sMMLX7tufEl7tf/lYRSlgbgzXihZ0xRSkq6QWvUjAnFsCIX2nh78GbADuNw
         8HkhRt5VQfYbuWfJunN0ssYSu5JzafpDHEyvzU6rqfU6usTiqN7ndbn+s3EDKA04po35
         zWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rR60hxzKwZFou5W9ExQhVkWlWISsyS8xqsw7+/79IkA=;
        b=A49AwQScuN/EN6Rsn74EnAPFKeHsG0xaJs1SBp17GYJKiYKIwa/hnwv5f1exYBAI1Z
         5yIBAgmFLDNhtzxT+zLVQm7y4WvnKrPtO647ePtgnf1BXVlfbFeMdkdJrdpZzqP1Op2F
         0Z/r8HahqKWrZAn11AMJybwg1KkO9DgCmXSVmWyil9FRJ79rEWch/sRbe1kcisg7ckZc
         ypCED8d59WSFIQzLwoJGFIwdg94ygK3Ra5biRTMbZmNFU0hcjoONML0HmES4uLMZForx
         lpdCm5Dq383SiXXeMnQgY6bcxQb2rPF4sliYICmFXntjM9rPmxQus5S43q8DeZSybNED
         DdDA==
X-Gm-Message-State: AOAM532G1r6QBJv1GTyJJSOA9wILIpt/VNlzBnfVf7t/pENehq4s1nzp
	0RtXvqKEs2jbt3gB0QTAzEDjIDUEgAuD2GTNOgU=
X-Google-Smtp-Source: ABdhPJzvyqKSp2k8F1zPt2HdIjuFBMgM4jQbZQ0dNCzZytjsexZMmO2cZwDLH3/tpnnBHxrEaWAcnUbKfL+Q4YEEY20=
X-Received: by 2002:ac8:7f4d:: with SMTP id g13mr22097668qtk.215.1639089603076;
 Thu, 09 Dec 2021 14:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20211209184842.1863975-1-raj.khem@gmail.com> <20211209223432.GB18191@denix.org>
In-Reply-To: <20211209223432.GB18191@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 14:39:36 -0800
Message-ID: <CAMKF1sqXnbtpvNuqXYqTSJHbngRUGf5aNsF3N6HGUu39B4VgpA@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] ti-sgx-ddk-km: Fix build with kernel 5.10 and musl support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 2:34 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Dec 09, 2021 at 10:48:42AM -0800, Khem Raj wrote:
> > This adds a patch to fix runtime problems loading the kernel module with
> > kernel 5.10
> >
> > Adds support to build with musl targets
> >
> > Add yoe to recognised OE distributions
>
> Looks good to me. Should the patch have Upstream-Status? Not sure if it should
> be "Pending" or something else though...

Perhaps makes sense, I can spin a v2 with status 'Pending'

>
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Denys Dmytriyenko <denys@konsulko.com>
>
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
>
>
> > ---
> >  ...mbedded-hardfp-toolchain-w-o-gnueabi.patch | 18 ++++++++----
> >  ...02-Fix-driver-config-for-5.10-kernel.patch | 28 +++++++++++++++++++
> >  .../ti-sgx-ddk-km_1.17.4948957.bb             |  1 +
> >  3 files changed, 42 insertions(+), 5 deletions(-)
> >  create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> >
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > index 15105eac..d58764fe 100644
> > --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > @@ -1,23 +1,31 @@
> > -From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
> > +From a1c191a020f6eebc9a94b641be1fca7885fc9dd2 Mon Sep 17 00:00:00 2001
> >  From: Denys Dmytriyenko <denys@ti.com>
> >  Date: Mon, 9 Sep 2019 17:05:48 -0400
> > -Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
> > +Subject: [PATCH 1/2] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
> >   suffix
> >
> > +OE toolchains are not having armhf in its name but they still are armhf
> > +ABI, teach this to sgx module build system
> > +
> > +recognize musleabi in tuples as well
> > +
> > +Add yoe distro support
> > +
> >  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >  diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> > -index dead2f9..2ba3e5e 100644
> > +index dead2f9..1b5f090 100644
> >  --- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> >  +++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
> >  @@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
> >     ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> >      $(1)_compiler_preferred_target := aarch64-linux-gnu
> >     endif
> > -+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > ++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi arm-yoe-linux-gnueabi arm-oe-linux-musleabi arm-poky-linux-musleabi arm-yoe-linux-musleabi,$$($(1)_compiler_preferred_target)),)
> >  +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> >  +  endif
> >     ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > @@ -30,5 +38,5 @@ index dead2f9..2ba3e5e 100644
> >   endef
> >
> >  --
> > -2.7.4
> > +2.34.1
> >
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> > new file mode 100644
> > index 00000000..d9745703
> > --- /dev/null
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
> > @@ -0,0 +1,28 @@
> > +From 57c3aafacde126786077afa7bfc07ec261acffaf Mon Sep 17 00:00:00 2001
> > +From: Paul Barker <paul.barker@sancloud.com>
> > +Date: Wed, 27 Oct 2021 10:34:32 +0100
> > +Subject: [PATCH 2/2] Fix driver config for 5.10 kernel
> > +
> > +See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
> > +
> > +Ref: BSP-66
> > +Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> > +---
> > + eurasia_km/eurasiacon/build/linux2/config/core.mk | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/eurasia_km/eurasiacon/build/linux2/config/core.mk b/eurasia_km/eurasiacon/build/linux2/config/core.mk
> > +index 3f27926..18d515a 100644
> > +--- a/eurasia_km/eurasiacon/build/linux2/config/core.mk
> > ++++ b/eurasia_km/eurasiacon/build/linux2/config/core.mk
> > +@@ -590,6 +590,7 @@ ifneq ($(BUFFERCLASS_MODULE),)
> > + $(eval $(call BothConfigMake,BUFFERCLASS_MODULE,$(BUFFERCLASS_MODULE)))
> > + endif
> > +
> > ++PVR_LINUX_MEM_AREA_USE_VMAP = 1
> > + ifneq ($(strip $(KERNELDIR)),)
> > + PVR_LINUX_MEM_AREA_POOL_MAX_PAGES ?= 0
> > + ifneq ($(PVR_LINUX_MEM_AREA_POOL_MAX_PAGES),0)
> > +--
> > +2.34.1
> > +
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > index 3848e84e..e6247e08 100644
> > --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > @@ -22,6 +22,7 @@ BRANCH = "ti-img-sgx/${PV}/k5.10"
> >
> >  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
> >      file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
> > +    file://0002-Fix-driver-config-for-5.10-kernel.patch \
> >  "
> >
> >  S = "${WORKDIR}/git"
> > --
> > 2.34.1
> >
