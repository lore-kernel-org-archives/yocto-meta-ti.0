Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1324.1614198191638925914
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Feb 2021 12:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B93B740C2B;
	Wed, 24 Feb 2021 20:23:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVt6v174JXuR; Wed, 24 Feb 2021 20:23:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FEF540BE6;
	Wed, 24 Feb 2021 20:23:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D8F25174521; Wed, 24 Feb 2021 15:23:07 -0500 (EST)
Date: Wed, 24 Feb 2021 15:23:07 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: g-tammana@ti.com
Cc: Zan Dobersek <zan@falconsigh.net>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
Message-ID: <20210224202307.GB4892@denix.org>
References: <20210224082509.14163-1-zan@falconsigh.net>
 <3c3a7b165e474569a0ce474f2c5e7635@ti.com>
MIME-Version: 1.0
In-Reply-To: <3c3a7b165e474569a0ce474f2c5e7635@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 24, 2021 at 06:57:57PM +0000, Gowtham Tammana via lists.yoctoproject.org wrote:
> 
> 
> >-----Original Message-----
> >From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On
> >Behalf Of Zan Dobersek
> >Sent: Wednesday, February 24, 2021 2:25 AM
> >To: meta-ti@lists.yoctoproject.org
> >Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-
> >poky-linux-gnueabi compiler prefix
> >
> >The additional patch for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi
> >prefix
> >to the arm-linux-gnueabihf preferred target. Same should be done for the
> >arm-poky-linux-gnueabi prefix.
> 
> This looks ok. Btw what layer is being used when using this toolchain.

Gowtham,

This toolchain is built by Poky, which is the reference distribution of the 
Yocto Project.

-- 
Denys


> >Signed-off-by: Zan Dobersek <zan@falconsigh.net>
> >---
> > ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-
> >drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-
> >gnueabi.patch
> >index 071ce0ca..15105eac 100644
> >--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> >+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> >@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
> >    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> >     $(1)_compiler_preferred_target := aarch64-linux-gnu
> >    endif
> >-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-
> >gnueabi,$$($(1)_compiler_preferred_target)),)
> >++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-
> >gnueabi,$$($(1)_compiler_preferred_target)),)
> > +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> > +  endif
> >    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-
> >redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> >--
> >2.30.0
