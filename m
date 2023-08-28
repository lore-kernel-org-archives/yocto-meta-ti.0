Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D34C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16253.1693234660129184747
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5FACD40C53;
	Mon, 28 Aug 2023 14:57:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNcgz_2Vgv4S; Mon, 28 Aug 2023 14:57:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F7DC40C3A;
	Mon, 28 Aug 2023 14:57:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C21BF163C82; Mon, 28 Aug 2023 10:57:34 -0400 (EDT)
Date: Mon, 28 Aug 2023 10:57:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, k-bhargav@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][kirkstone/master][PATCH] mesa-pvr: add dynamic-layer
 append for llvmpipe
Message-ID: <20230828145734.GN3359@denix.org>
References: <20230822011137.3183727-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822011137.3183727-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16894

On Mon, Aug 21, 2023 at 08:11:38PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Meta-clang provides a bbappend for mesa to use clang to accelerate it's
> rasterization with runtime code generation through the use of llvmpipe.
> With the addition of mesa-pvr we no longer get this for free with the
> blanket mesa bbappend on the devices that explicitly request mesa-pvr so
> lets add a dynamic layer to append the same args meta-clang does.
> 
> Though the number of devices that would select pvr-mesa and still want
> to use software rendering is small, it's not zero due to debug and
> testing purposes.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> Please let me know if I'm overlooking some specification like some reason bsp
> layers shouldn't have dynamic-layers or something like that. The
> yocto-check-layer didn't seem to care.

Well, normally you wouldn't want a pure BSP layer to depend on anything extra 
besides OE-Core. But compiler and toolchain dependencies are rather special 
and there were and still are such cases. Plus bigger plan for clang is to get 
into OE-Core eventually, similar to how Rust has been handled. So, a dynamic 
dependency for meta-clang is probably fine for now, just need to make sure it 
works both ways and gets validated with and w/o such dependency...


>  meta-ti-bsp/conf/layer.conf                        |  4 ++++
>  .../recipes-graphics/mesa/mesa-pvr_%.bbappend      | 14 ++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 26cbb4b5..56ca392b 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -18,6 +18,10 @@ LAYERDEPENDS_meta-ti-bsp = " \
>      meta-arm \
>  "
>  
> +BBFILES_DYNAMIC += " \
> +    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes*/*/*.bbappend \
> +"
> +
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>      mesa-pvr \
>  "
> diff --git a/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend b/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
> new file mode 100644
> index 00000000..7e5c36fd
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/clang-layer/recipes-graphics/mesa/mesa-pvr_%.bbappend
> @@ -0,0 +1,14 @@
> +# This is a copy of meta-clang/recipes-graphics/mesa/mesa_%.bbappend required
> +# for llvmpipe when using pvr-mesa since we aren't caught by that glob.
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +LDFLAGS:append:toolchain-clang = " -latomic -lm"
> +DEPENDS:append:toolchain-clang = " libatomic-ops"
> +
> +EXTRA_OEMASON:append:toolchain-clang:x86 = " -Dasm=false"
> +EXTRA_OEMASON:append:toolchain-clang:x86-64 = " -Dasm=false"
> +
> +export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
> +
> +PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true -Ddraw-use-llvm=true,-Dllvm=false,clang clang-native elfutils"
> -- 
> 2.41.0
> 

