Return-Path: <sabiya.d@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7CEC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 09:52:37 +0000 (UTC)
Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web11.37432.1675072352379563576
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 01:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=B2dUvBV0;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sabiya.d@mistralsolutions.com)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72]) by mx-outbound40-103.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 30 Jan 2023 09:52:29 +0000
Received: by mail-pj1-f72.google.com with SMTP id jp14-20020a17090ae44e00b0022a03158ec6so4413671pjb.9
        for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 01:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaQFogghPuMBHKalLwyXioXnN7APlEZ3XBtZ56BfATo=;
        b=B2dUvBV0pSiVqvFtHX5uUoym9cvXAoBw+CgaKsV1yofW5r078o8t69YEtRmQU8kPfO
         cClQNuaKIYFlIyZASX/uyB8XVKeVmjNBrVI15KOcLYrlXDEZP9+6+MlE1zx2f/tXRqtH
         KTIURxbonUnaX0MU++0ZtRyUv+q5Ms3C3fVUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaQFogghPuMBHKalLwyXioXnN7APlEZ3XBtZ56BfATo=;
        b=zqw/WjrA6MT7/9nZvpqlDpQ6tF4IiX5s9BF88vLs7rKdCRBLEfaxT8nLyAG+kIopCV
         w73FD6DUP4sHyYEXbZ5SKKzJ6yZ5Ikjr/hcjPXfuUQ9IWrSDPozSlfPEEpRuNHz5qYZ8
         UIzbXTkxZc+/JjvLCZkMbnEtf5uIrq8n23ErbkBVKMSbfslgQGo8nOxIkqXDmt4hJ6yE
         H6kGOcg3h2hLHB85g7wzCMvg/mBuhz1QJlsFGmqPnETItSqA0tg4jK5zYBiZIRcbXIli
         IvQTxStBEYs7zEYiVm00gsgfD2AkxxJNRUrLeG7mQLxnJK29QVXoex6+B655IsrXLlGy
         dc+w==
X-Gm-Message-State: AFqh2koyhiC2/KlICxitRRcY9w1ZxA+qVbLbmAsGNlLzfk1QJ+DkicKX
	V8N1gimjhniLADbuoz5+vmcFtOMfj3oCTQZPFLGXiEJXYgdsPBleoH3cQ0jckUezlEtCzkztKm0
	wRlSmE3FLeKuxB2t19V/r7iFnnMe7KZWgp54u3lb+YFycbspXkPQFx75eO9tcZaeTH9hssZC8dr
	vbUx4=
X-Received: by 2002:a17:902:9a81:b0:191:3f75:b8ec with SMTP id w1-20020a1709029a8100b001913f75b8ecmr6134456plp.5.1675072348231;
        Mon, 30 Jan 2023 01:52:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs533CQNGSYqvm6zs2AYJMJi4E9QYG5tIvFVHpslEDD/oxVp3BXjVl/+YatzfkS8+RXtGBW9aCAn/pwMcl6Ars=
X-Received: by 2002:a17:902:9a81:b0:191:3f75:b8ec with SMTP id
 w1-20020a1709029a8100b001913f75b8ecmr6134447plp.5.1675072347902; Mon, 30 Jan
 2023 01:52:27 -0800 (PST)
MIME-Version: 1.0
References: <173DA23955EB1BF3.686@lists.yoctoproject.org>
In-Reply-To: <173DA23955EB1BF3.686@lists.yoctoproject.org>
From: Dasnavis Sabiya <sabiya.d@mistralsolutions.com>
Date: Mon, 30 Jan 2023 15:22:12 +0530
Message-ID: <CAAyKsAYWGaLQtjR3-netxteoU6uAwamPaxCOTzoCvx9MfuCbFQ@mail.gmail.com>
Subject: Re: [meta-ti] [dunfell] conf: machine: j784s4: Add AM69 SK specific
 dtb and dtbo to KERNEL_DEVICETREE
To: reatmon@ti.com
Cc: denys@ti.com, detheridge@ti.com, meta-ti@lists.yoctoproject.org, 
	Dasnavis Sabiya <sabiya.d@ti.com>, sabiya.d@mistralsolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1675072348-310343-5388-2356-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.216.72
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245802 [from 
	cloudscan19-166.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 09:52:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15697

Hi Ryan,

On Thu, Jan 26, 2023 at 12:26 AM sabiya.d via lists.yoctoproject.org
<sabiya.d=3Dmistralsolutions.com@lists.yoctoproject.org> wrote:
>
> From: Dasnavis Sabiya <sabiya.d@ti.com>
>
> AM69 Starter Kit is a single board designed based on TI's AM69 SOC
> providing advanced system integration in automotive ADAS applications,
> autonomous mobile robot and edge AI applications. Add support
> for the same to include the board dtb file into the root filesystem.
>
> Add DT overlays support for the following features on AM69 SK:
> * Add DTBO entry to support OV5640 camera
> * Add DTBO entry to support RPi(IMX219) camera
> * Add DTBO entry for the DDR memory carveout.
>
> [1]:https://www.ti.com/lit/zip/spruj52
>
Could you please share your review comments on this patch?
The commit ids of the corresponding kernel patches are:
297898231fc5d8d6147619f4bf24a50b3cb682a6
57538b947b75be5b4888057b9fad35ddea9cfb1b
53d5e1f9c3751b35017ea113cf6d371d352c2323
64e9808816e14c52120345ff0a8adbeda24c3f51

Regards,
Dasnavis Sabiya
> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> ---
>  conf/machine/j784s4-evm.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
> index 96acca13..24fa3356 100644
> --- a/conf/machine/j784s4-evm.conf
> +++ b/conf/machine/j784s4-evm.conf
> @@ -13,6 +13,10 @@ OPTEEMACHINE =3D "k3-j784s4"
>  OPTEE_K3_USART =3D "0x8"
>
>  KERNEL_DEVICETREE =3D " \
> +    ti/k3-am69-sk.dtb \
> +    ti/k3-am69-sk-csi2-ov5640.dtbo \
> +    ti/k3-am69-sk-ddr-mem-carveout.dtbo \
> +    ti/k3-am69-sk-rpi-cam-imx219.dtbo \
>      ti/k3-j784s4-evm.dtb \
>  "
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15655): https://linkprotect.cudasvc.com/url?a=3Dhttps=
%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2fmessage%2f15655&c=3DE,1,L6r=
hkXmGmIsai64tKyhPu6WijXuiMb2CQ3VQrciLUZRQjhfIPzzHslH8vKUomlIRvFxQykzcu_xZrp=
_yDoe5EyrBA2TNPpxcTZBakE4Bre_cXxLoh8EI&typo=3D1
> Mute This Topic: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fli=
sts.yoctoproject.org%2fmt%2f96527602%2f7432566&c=3DE,1,thzBvIyOl3fJ__vz9EAG=
aNAkIT0Wi1VddDYTNshkq89ZasS0oRdCiNTDA7G-dUFoeNrTpggo7NcvVnl76VFBAy9YYgs_vcB=
W2X5gQbxgBh4X&typo=3D1
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.=
yoctoproject.org%2fg%2fmeta-ti%2funsub&c=3DE,1,F42hsLcudQPDxHl1HkwSTpkDI7k3=
wBcNyq4AgXTcSi7hllgV9uozJzYB-8YHLZjDeafmE15PxlGzj7Y51mKXe6Q9TWREm4_aK4lQx12=
nNLPeIliDL39ojpbiNxw,&typo=3D1 [sabiya.d@mistralsolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

