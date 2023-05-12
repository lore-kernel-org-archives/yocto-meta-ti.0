Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FCBC77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 18:17:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.32122.1683915465698141842
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 May 2023 11:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eFFmTM9B;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34CIHcDF006381;
	Fri, 12 May 2023 13:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683915458;
	bh=XlPgwTCyTWr98jF6Ci3PJs/KpV9S67hKFWoGvZxCL/w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eFFmTM9Bxk/XmC+fv1T7u+T4dtxUCe2q1A67S5UVkJzF0SSop0ksB2OYcwBzEMrM7
	 sKPIso6dJ8ul7h44N6duvr+S3st+4/hzmFGGs3vfVJMqZBkM5S2zYp7jX+7XAU1QTe
	 pRtykrtGM6dSgJsuDhIdJ8ID0mpbpQBIqtBTddPE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34CIHcOp021472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 May 2023 13:17:38 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 May 2023 13:17:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 May 2023 13:17:38 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34CIHcwn028444;
	Fri, 12 May 2023 13:17:38 -0500
Message-ID: <c4eda7bb-d42d-e3e8-b936-306b2ce5e525@ti.com>
Date: Fri, 12 May 2023 13:17:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXTERNAL] [master/kirkstone][PATCH] mesa-pvr: convert bbappend
 into standalone alternative provider
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20230511184049.1074923-1-denis@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230511184049.1074923-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 May 2023 18:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16529

On 5/11/23 13:40, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> There are some unobvious issues with adding PVR support to Mesa
> via a bbappend:
> 
> 1. We need to mark mesa package as machine-specific, due to
> differences in builds between SGX, Rogue and software-rendering
> 
> 2. We also need to then mark mesa package as providing safe
> ABIs (EGL/GLES/GBM) in order for all generic dependent packages
> to not be treated as machine-specific, allowing their re-use
> across different machines of the same architecture
> 
> But doing the above alters the upstream mesa package and changes
> its signatures even when not building for TI platforms, which is
> a Yocto Project compliance violation.
> 
> In order to resolve this issue, convert Mesa bbappend, that adds
> PVR support, into its own standalone alternative provider, called
> mesa-pvr and allow selecting it with PREFERRED_PROVIDER settings.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/layer.conf                            |  2 +-
>   meta-ti-bsp/conf/machine/beagleplay.conf               |  1 +
>   meta-ti-bsp/conf/machine/include/am62xx.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/am65xx.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/j721e.inc             |  1 +
>   meta-ti-bsp/conf/machine/include/j721s2.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/j784s4.inc            |  1 +
>   meta-ti-bsp/conf/machine/include/mesa-pvr.inc          |  8 ++++++++
>   meta-ti-bsp/conf/machine/include/omap-a15.inc          |  1 +
>   meta-ti-bsp/conf/machine/include/ti33x.inc             |  1 +
>   meta-ti-bsp/conf/machine/include/ti43x.inc             |  1 +
>   .../recipes-graphics/mesa/mesa-gl_23.%.bbappend        |  1 -
>   .../mesa/{pvr-mesa.inc => mesa-pvr_22.3.5.bb}          | 10 ++++++----
>   meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend   |  1 -
>   14 files changed, 24 insertions(+), 7 deletions(-)
>   create mode 100644 meta-ti-bsp/conf/machine/include/mesa-pvr.inc
>   delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
>   rename meta-ti-bsp/recipes-graphics/mesa/{pvr-mesa.inc => mesa-pvr_22.3.5.bb} (88%)
>   delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 5520c7c2..bb286c2b 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -19,7 +19,7 @@ LAYERDEPENDS_meta-ti-bsp = " \
>   "
>   
>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> -    mesa \
> +    mesa-pvr \
>   "
>   
>   HOSTTOOLS_NONFATAL += "truncate xxd comm"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index e8d25cd9..c7b1414a 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -10,6 +10,7 @@ MACHINE_FEATURES += "screen gpu"
>   SERIAL_CONSOLES = "115200;ttyS2"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "lite"
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index 623d90eb..c4582c13 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":am62xx"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   # Default tiboot3.bin on AM62x is for HS-FS
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 9fe851f4..9cbce243 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":am65xx"
>   
>   MACHINE_FEATURES += "screen touchscreen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= ""
>   
>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 5e325ffe..f707cf26 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j721e"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 70569a16..98cc611f 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j721s2"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "generic"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index d03ee4a4..de207687 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -3,6 +3,7 @@ SOC_FAMILY:append = ":j784s4"
>   
>   MACHINE_FEATURES += "screen gpu"
>   
> +require conf/machine/include/mesa-pvr.inc
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   
>   TFA_BOARD = "j784s4"
> diff --git a/meta-ti-bsp/conf/machine/include/mesa-pvr.inc b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> new file mode 100644
> index 00000000..d5581315
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
> @@ -0,0 +1,8 @@
> +PREFERRED_PROVIDER_virtual/mesa ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/egl ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgbm ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libglx ?= "mesa-pvr"
> +PREFERRED_PROVIDER_virtual/libgl ?= "mesa-pvr"

[snip]

I'm concerned a potential version drift between mesa-native packages and 
mesa-target packages in this configuration, but otherwise this doesn't 
appear to cause any issues with target packages or dependency chains at 
the moment.

