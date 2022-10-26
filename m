Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7640C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 00:33:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.1856.1666744426147274621
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 17:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JrgaVkE1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29Q0XivT006023;
	Tue, 25 Oct 2022 19:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666744424;
	bh=jZg6fbfIXFzjFLyhM+vV0XSm3KU5PmZt2Bv67iCA0eE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JrgaVkE1WO4X4mxqDSAk9ip/pr1F0T9freadLc/mExrUV3+QX+S6xl9XiyOjJSt1M
	 JfGX2HW/1kJjJizCsf/HmMb2JE7fIQiwpj3lPaOUhBPon7xYlfkLAjCOOVF/2Squd+
	 0hW7A40c4mMOjWni0y+qQYVU3f3v2Fd+go8K7k8Q=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29Q0XiXi022869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Oct 2022 19:33:44 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 25
 Oct 2022 19:33:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 25 Oct 2022 19:33:44 -0500
Received: from [10.247.29.70] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29Q0XiOE008334;
	Tue, 25 Oct 2022 19:33:44 -0500
Message-ID: <19b8d743-ba17-fb39-c2ea-97825d92c43a@ti.com>
Date: Tue, 25 Oct 2022 19:33:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti][dunfell][PATCH] cnm-wave-fw: update firmware name to
 wave521c_k3_codec_fw.bin
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221025231057.1913-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20221025231057.1913-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 00:33:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15202



On 10/25/2022 6:10 PM, Ryan Eatmon wrote:
> update firmware name to wave521c_k3_codec_fw.bin to align with
> linux-firmware main branch. the following patch is part of
> ti-linux-firmware thru mainline sync.
> 
> commit 48407ffd ("cnm: update chips&media wave521c firmware.")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index b5ad3e31..4c9c8d31 100644
> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -20,10 +20,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   S = "${WORKDIR}/git"
>   TARGET_WAVE521C = "wave521c_codec_fw.bin"
>   
> -SOURCE_WAVE521C = "wave521c_codec_fw.bin"
> -SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
> -SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
> -SOURCE_WAVE521C_j784s4-evm = "wave521c_j721s2_codec_fw.bin"
> +SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"

Looks good to me.


>   
>   ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
>   ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"

