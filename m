Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D84C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 23:02:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1055.1666738959940665552
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 16:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kph2AkSa;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29PN2c8L117286;
	Tue, 25 Oct 2022 18:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666738958;
	bh=w8ole8R8W6OYtpPuswHEGwpnF5mOtX11kOWft3Bd0sc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Kph2AkSa4/5P8ydpS2ePaHzPqTq/EQpp3Oc7WFm93X7+17wrDhfPaHsP5lBjJKpK3
	 zV3P3WD/PvYdsSjt0rKI4f7nM3GmqoacH7HA14116BbCeyKRXf4AYoE6umMIbpQ+wH
	 U/XvR9IcBCDKT3FaUQgq+Jg+QlD0ttO+nUwMzLYo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29PN2cWl050812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Oct 2022 18:02:38 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 25
 Oct 2022 18:02:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 25 Oct 2022 18:02:37 -0500
Received: from [10.250.37.187] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29PN2bTN009361;
	Tue, 25 Oct 2022 18:02:37 -0500
Message-ID: <1cfc86e9-dbb5-f275-1c5c-7ae8404183b7@ti.com>
Date: Tue, 25 Oct 2022 18:02:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [dunfell PATCH] cnm-wave-fw: update firmware name to
 wave521c_k3_codec_fw.bin
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20221025224919.17617-1-praneeth@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221025224919.17617-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Oct 2022 23:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15199



On 10/25/2022 17:49, Praneeth Bajjuri wrote:
> update firmware name to wave521c_k3_codec_fw.bin to align with
> linux-firmware main branch. the following patch is part of
> ti-linux-firmware thru mainline sync.
> 
> commit 48407ffd ("cnm: update chips&media wave521c firmware.")
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index b5ad3e31..75b8ce21 100644
> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -21,9 +21,9 @@ S = "${WORKDIR}/git"
>   TARGET_WAVE521C = "wave521c_codec_fw.bin"
>   
>   SOURCE_WAVE521C = "wave521c_codec_fw.bin"
> -SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
> -SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
> -SOURCE_WAVE521C_j784s4-evm = "wave521c_j721s2_codec_fw.bin"
> +SOURCE_WAVE521C_j721s2-evm = "wave521c_k3_codec_fw.bin"
> +SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_k3_codec_fw.bin"
> +SOURCE_WAVE521C_j784s4-evm = "wave521c_k3_codec_fw.bin"


I'm going to say No to this patch.  The only reason I set the file up 
the way I did was because of the name of the orig file: 
wave521c_j721s2_codec_fw.bin

If all of the platforms will now use the same file, then I would rather 
eliminate the machine overrides and just change the default setting for 
SOURCE_WAVE521C to be the "correct" value.

I'll put out an alternative patch here in a few minutes.



>   ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
>   ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

