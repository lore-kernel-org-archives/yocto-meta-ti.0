Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDDAC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 16:25:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.420.1660148738741961249
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 09:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t4Nj6R6V;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27AGPZb2006086;
	Wed, 10 Aug 2022 11:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660148735;
	bh=JSVMLeoDTngIUH7k8rYcGwX7hJC1cYlST31GSKMgrOQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=t4Nj6R6V4NIUN8dkR0SoQ1RsYUtcZmslcQJVZfrFf+5/0WzsHzLTwpgHJKjVIbiIx
	 r3IVz414S0XzB5R4Noz3uL3WmVsiWeUT0XdKiUNRqH5LwplHYqRK/198VSUMt6uRcw
	 0Bl1kj0RjzAMU2sgwB8UHBsQzKhaRpqN4kXJ73z4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27AGPZiK117104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Aug 2022 11:25:35 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 10
 Aug 2022 11:25:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 10 Aug 2022 11:25:35 -0500
Received: from [10.250.34.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27AGPYpA015182;
	Wed, 10 Aug 2022 11:25:34 -0500
Message-ID: <5db16498-fbc2-8056-50f5-f3cf44150f84@ti.com>
Date: Wed, 10 Aug 2022 11:25:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] ti-sci-fw: Allow build to continue
 without TI_SECURE_DEV_PKG set
Content-Language: en-US
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220810144708.14171-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220810144708.14171-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Aug 2022 16:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14946

Denys, Ryan,

I'm not really happy with this patch to be honest. Nor with how we handle
TI_SECURE_DEV_PKG in general.

So a little history (Denys correct me if my memory has faded any here). We
use TI_SECURE_DEV_PKG for legacy platforms as the SECDEV tools are NDA-only,
so they *had* to be feed into the SDK from an external location. This
carried over to the K3 machines.

But with K3 we don't have this NDA-only restriction. The K3 TI_SECURE_DEV_PKG
tools are fully open source and publicly available on git.ti.com. Now that
we are bringing HS to the board market with AM64x, it is time we fix things.

My idea is to treat TI_SECURE_DEV_PKG like the other toolchains. If we define
it in our environment then we use that version. If it is not defined then we
fetch it for the user. I've got a simple recipe to build a tik3secdev-native
package, and am working to use that everywhere we use TI_SECURE_DEV_PKG in
recipes today. Then we can use preferred providers to pick which SECDEV
to use, the legacy ones, or the K3 one.

The legacy tisecdev-native will require TI_SECURE_DEV_PKG_CAT/AUTO set
as required today, but the tik3secdev-native will download it for you
if not set.

So my questions are, does this sound like a reasonable approach, and if so
do you have any guidance on this? This will require me to dig down into
the deeper parts of the build system and I've not done that before. Any
pointers welcome.

I'm also thinking on making a dummy secdev package, that just copies
the images instead of signing them. That should be the default preferred
provider for the non-HS machines, then we can drop the various checks we
have based -hs-evm vs -evm. All machines take the same path, then based
on the secdev package provider they do the right thing.

Thanks,
Andrew

On 8/10/22 9:47 AM, Andrew Davis wrote:
> If we do not have TI_SECURE_DEV_PKG set then SYSFW generation will fail
> if we are building for the HS platform. When TI_SECURE_DEV_PKG is not
> set we assume the builder is only interested in the GP boards, so fake
> generating the HS SYSFW images. These will be non-functional on HS
> boards, but they would have been just as non-functional if built
> without TI_SECURE_DEV_PKG set.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 18652dd4..287e5a40 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -66,6 +66,11 @@ EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.
>   EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>   
>   do_compile() {
> +	if [ ! "${SYSFW_SUFFIX}" = "gp" ] && [ ! -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then
> +		echo "Warning: TI_SECURE_DEV_PKG not set, skipping HS SYSFW generation."
> +		touch ${WORKDIR}/imggen/${SYSFW_TIBOOT3}
> +		exit 0
> +	fi
>   	cd ${WORKDIR}/imggen/
>   	oe_runmake
>   }

