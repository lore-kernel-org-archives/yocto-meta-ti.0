Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA24C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:38:01 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web10.8982.1672828675570282026
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 02:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=VKBkR2Kz;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199]) by mx-outbound46-4.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 04 Jan 2023 10:37:52 +0000
Received: by mail-lj1-f199.google.com with SMTP id f6-20020a05651c02c600b0027ffbbfa9f5so1427591ljo.14
        for <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n80LLIZVwbi1pU36kzlZOoi3dsDzcLLmR7UCKcS5y7E=;
        b=VKBkR2KzOn8EllsYxW9ru0ALUMkygqEz2Lb+82Jj2aSqyjV3+cluPX0gDCYCYjglpm
         y8FiEgyJqn+5yOs37l29PoBBv0TijNSV4MPrHqIVoKRpiu51Bci7C2CBMqMlt4yrYIwx
         FNzf07cji9lWm/xy3RFWXsA06mc74iTRHiPfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n80LLIZVwbi1pU36kzlZOoi3dsDzcLLmR7UCKcS5y7E=;
        b=g+DBFXVykKVo2bbF8nZqxepuV0ofhxTtalddEzGrQz9ZzYHtInkO3+fCd4rXsRPgWK
         0F/hcwH+AOZ94h8XHT6dqQZxr+TlQS5A9dqnvO6DlFY/mTVeT5lX9wGr7KpgT7ZlMSVO
         IxK7RsgHUz9llYMEogPPYPa9/QBvV48ovFIDRLe18PDAseOzhmW53nU4ts5dSD8ajNCR
         0M+yEHpxwfjk6TlMmFM1MgdIUnStzbWOu8QKvdv8fC3F0r2XbmnU846lxhz048p8kDIP
         0RZbBoLp2+3V04QQnMsadCkwiMUu7bkKkTOy82kVr9KyUEeiJFgHTy0YHka3aZm4nbIJ
         DXkA==
X-Gm-Message-State: AFqh2koYPFjkjYFQNNn+eUhcVGfTn01k+T/uE61uLagOpnpuJPHrOqIs
	1iSaUfSYoWq2aDPF3JlX/vviPUFGPpjWCKLnCk6kK9gQ/rRbvrGPdVGPAwqYcPWSeXzbruzfq0v
	b8p5ohp2qsG/zKdyLQu3Bv5Bbas8AX2UR8tPrnfabpbq7cnPaECfxH6HxQ5tje+QhM7nXprpbfg
	suh6U=
X-Received: by 2002:a05:6512:360f:b0:4c8:817c:ef6d with SMTP id f15-20020a056512360f00b004c8817cef6dmr2505237lfs.183.1672828672553;
        Wed, 04 Jan 2023 02:37:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvYLxkIjm2ycS9E3wRJoc+5PaToN/HZuIjPc2hLjV+c/4ELPQ7MNcXYkyddaxjY8Qr9TAvTIUvNI/5DhwTbO/Q=
X-Received: by 2002:a05:6512:360f:b0:4c8:817c:ef6d with SMTP id
 f15-20020a056512360f00b004c8817cef6dmr2505232lfs.183.1672828672037; Wed, 04
 Jan 2023 02:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20221228112906.5301-1-sinthu.raja@ti.com>
In-Reply-To: <20221228112906.5301-1-sinthu.raja@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Wed, 4 Jan 2023 16:07:39 +0530
Message-ID: <CAEd-yTSVKxunupUz426Z_n3e3dLbJhoZAMyHFO8tbrZvdfPjjg@mail.gmail.com>
Subject: Re: [[meta-ti][master/dunfell][PATCH]] conf: machine: j721s2: Add
 AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
To: reatmon@ti.com, denys@ti.com, detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1672828672-311780-5558-11210-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.208.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245242 [from 
	cloudscan21-236.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 10:38:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15516

Hi Ryan,

On Wed, Dec 28, 2022 at 4:59 PM Sinthu Raja
<sinthu.raja@mistralsolutions.com> wrote:
>
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> AM68 Starter Kit is a low cost, small form factor board designed for
> TI's AM68/J721S2 SoC[1] which is optimized to provide best in class performance
> for industrial applications. Add DTB entry for the same.
>
> AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connectors.
> Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.
>
> [1]:http://www.ti.com/lit/zip/spruj28
>
Any comments on this patch? If not what is the next step to getting it
to merge? The corresponding kernel patches got merged.
Commit IDs:
1d32ced7a84e35463361e839157dd67063af9b89
3693f8e9adff20b11c4fa4c3f968747a83bf6175
a89f682b592bc958f276ef83f09d756b019a47c6
93a0e90a955bd9dded8732037c39818e97b679d2

> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  conf/machine/j721s2-evm.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 6377c459..abdd9e03 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
>  OPTEE_K3_USART = "0x8"
>
>  KERNEL_DEVICETREE = " \
> +    ti/k3-am68-sk-base-board.dtb \
> +    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
> +    ti/k3-am68-sk-rpi-cam-imx219.dtbo \
> +    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>      ti/k3-j721s2-common-proc-board.dtb \
>      ti/k3-j721s2-gesi-exp-board.dtbo \
>  "
> --
> 2.36.1
>


-- 
With Regards
Sinthu Raja

