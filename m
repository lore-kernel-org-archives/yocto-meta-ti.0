Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE33C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 12:11:13 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web10.71971.1674735072120946633
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 04:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=atOOFWYA;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72]) by mx-outbound47-9.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 26 Jan 2023 12:11:08 +0000
Received: by mail-lf1-f72.google.com with SMTP id w2-20020ac24422000000b004b567ec0ec1so787330lfl.15
        for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC89p3sVoWvfPVamiUtiaqIG4neJaUmT5haT71QjvfU=;
        b=atOOFWYA8B4Lnert2ZccQcmsCcpcy6h42Kz1J79b1noHmlskiexYP4YMX32iPO2XP2
         qK+CrGjIlXK+bUnq+N/exmgYl2N72xxiVVrj8stn3J7HbUvHaPnNbCm0icqacGvj2pRp
         jqax5LUGaqL6rfIFu3rq1M8Fh3dvpa7SruNs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zC89p3sVoWvfPVamiUtiaqIG4neJaUmT5haT71QjvfU=;
        b=B4+iXtjGj+SBSZMMkVy4EI6UGF8bmcZqxOZTb89gsDfhdLB2AKDOd+qccoctCvJFOz
         3TBb0yHMrwyy17N9A+NHlCBMz2IT4pW3CBYLoVfGYuU2qk0KvJT4DCAOQvrGV93y77oJ
         uvrzt+I1G/xclr6vzKbIlPEQKkgOSEeZiGkxhDCoiTNkKJuygp2wQz+zubmowN4lYsSE
         qfeZbo6a02GnC1ydp3UfgBvDaYk2+0t+gWFXh+gVpU6AxD/Z0kbPgWfxe1pxskudmPvb
         sRySnoFxtRVBTSr1Q7rc7BzBALcog1ByVPZW6vIg9sn9KbRVpRD/+CWr0OsiuIGJeDMX
         zEqw==
X-Gm-Message-State: AO0yUKXvI3l8NW868qLbuQUr/GYFC99RC4eYft0eO34uCZGM9io5Pr2H
	YO+VhrtZFZYkpu2NnJhncIwOmXC1NQFjB+kqlJSIESCiBD3BVHn4Q/ewqFlKT9bGb4ePrYWKvEp
	Rn6wfOLuHnhtV5Xl2NAjZTQ/Ig/nCXBDrUN59zB00kJuDRpvCAoCW8TRztGcO+9qOn/r94FIg3R
	qiMOI=
X-Received: by 2002:a05:651c:232:b0:28f:7d5c:4507 with SMTP id z18-20020a05651c023200b0028f7d5c4507mr50847ljn.162.1674735068148;
        Thu, 26 Jan 2023 04:11:08 -0800 (PST)
X-Google-Smtp-Source: AK7set+tScgIrawbS1k4zaMyBMKCED0JWqPqCGBoBrjMKTxRvW26Ivk4Qae7hLy8I9uzu6wWHWuZnUKrFswrbdTSASU=
X-Received: by 2002:a05:651c:232:b0:28f:7d5c:4507 with SMTP id
 z18-20020a05651c023200b0028f7d5c4507mr50843ljn.162.1674735067664; Thu, 26 Jan
 2023 04:11:07 -0800 (PST)
MIME-Version: 1.0
References: <173DCC2C732ECE96.21537@lists.yoctoproject.org>
In-Reply-To: <173DCC2C732ECE96.21537@lists.yoctoproject.org>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 26 Jan 2023 17:40:55 +0530
Message-ID: <CAEd-yTS3soTjRbgEzvC8+OE+E7YMy+38ezOmH5N_niFqxP6PUw@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add FPDLink
 overlays for am68-sk
To: sinthu.raja@mistralsolutions.com
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com, 
	meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1674735068-312041-5387-181-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.167.72
X-BESS-Outbound-Spam-Score: 0.90
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245719 [from 
	cloudscan19-233.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.50 BSF_SC0_SA_TO_FROM_ADDR_MATCH META: Sender Address Matches Recipient Address  
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.90 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_SC0_SA085b, BSF_SC0_SA_TO_FROM_ADDR_MATCH, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:11:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15675

On Thu, Jan 26, 2023 at 1:15 PM Sinthu Raja M via
lists.yoctoproject.org
<sinthu.raja=3Dmistralsolutions.com@lists.yoctoproject.org> wrote:
>
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> Add the overlay files, over AM68 SK, for the following:
>
>  1. Fusion board (For FPDLink-III cameras).
>  2. IMX390 FPDLink-III camera module which includes both the CM and
>     RCM type of modules.
>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---

Ryan,
This patch should be merged after the below patch is merged.
https://patchwork.yoctoproject.org/project/ti/patch/20230126120504.11845-1-=
sinthu.raja@ti.com/

>  conf/machine/j721s2-evm.conf | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 9fce4d59..7c120dcc 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -16,7 +16,24 @@ KERNEL_DEVICETREE =3D " \
>      ti/k3-am68-sk-base-board.dtb \
>      ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>      ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
> +    ti/k3-am68-sk-fpdlink-fusion.dtbo \
>      ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
> +    ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
>      ti/k3-j721s2-common-proc-board.dtb \
>      ti/k3-j721s2-gesi-exp-board.dtbo \
>  "
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15673): https://linkprotect.cudasvc.com/url?a=3Dhttps=
%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2fmessage%2f15673&c=3DE,1,LYo=
43TaUCeUzXFjwy_b7Y2nz1Wh0zGRrzlioPMfaQrB35Ujr1jxnN9-TyTA7ugd90wX0Iu4ULi2xbj=
RV6XL04_Y9THtRWBhuPFPtwAkrUdD95-l72e5pFHntgA,,&typo=3D1
> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fmt%2f96539292%2f6034914&c=3DE,1,X2VkS5IVCWczzxKQNAwJ=
-KoU7_5pIUEuYuE9ybWO27KH46L2u12PBhTUsBuA-SguZp9r_DPuwneApxGnb_c_szZe2d0S-e0=
7wG3iEno5-Iu3C8vgboMMLX8,&typo=3D1
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.=
yoctoproject.org%2fg%2fmeta-ti%2funsub&c=3DE,1,JAFJGqYygweBoPAc8kPXz-cV7mJ9=
Yf8-_7WkmjoeFu44_haT_20DwWbxYWyx_CdB97As2fJ2BOejmliBIc3wM9xfmYmkH9kH-Vxhw_M=
6i3p5Ag,,&typo=3D1 [sinthu.raja@mistralsolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
With Regards
Sinthu Raja

