Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833C0C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 05:46:01 +0000 (UTC)
Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web10.67711.1674711956635794498
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 21:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=FJ0/007r;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197]) by mx-outbound15-185.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 26 Jan 2023 05:45:53 +0000
Received: by mail-lj1-f197.google.com with SMTP id l1-20020a2e9081000000b0028b97d2c493so76919ljg.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 21:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDweOSTsyDx6OzCc+PD696U25Co/hHewKl8mQPeGtzs=;
        b=FJ0/007r7quUPcnopkLiJChWqT8NkhnmdDTEecaF5hoOQrDFrHRCCkZzslSw7MCVVZ
         zUFT+IpOUJndtRMQQaR6e6PrJi2aj600LTD6KnJM9Oi2pKh6qJSL23LU0zH6X+XzGm6H
         beyKHrs6M5I1B5Bw4tDbN+gDhKYmB4XipS+VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDweOSTsyDx6OzCc+PD696U25Co/hHewKl8mQPeGtzs=;
        b=fBpXZ4yaB+px8Y/d4u2n2zuXBvGkuKd9t8DCKiwblTUoKqgsx3YWHJnAOM1ddg81lQ
         dXAgbsQpnSYmpR6jY3W95ZtRrUFWwRy6xrUSG61as3D8W5VPg6ZtG2vHrsX4c1OddfeS
         tXaHPhVtb/5DYOb5NaJsUBKeWWXufHt4AipvxJTvt736Wfb/g1uwRARqjVsO4Qr+++Fp
         k1ukJGNbT3szun9hTd28oBYICErLXMRyYLwIo+X6XlwZ7BD1/26dtp4RIhg7I0VCfXWI
         JfChP/ogpgH7jQIjxKvAWsvZ7KqFZlckdtsHmLdbebrVf/KA4gkkXMrUNCpBFHUUtZnh
         eSZw==
X-Gm-Message-State: AFqh2kqNZkE02diZQNPCZl97fhVywZmNhiWSYidC/03TfoEdP/AXWjJ5
	SUZC1xVekqA8IwV9D4rM5sgRR/OYwG+l/TawvRin4zMGLKezXQLafGmU8+eFMNm0KsKVIkuVlV0
	zF2l2cCSaZuKCovWI73jTQNAdQMnbVVrgwDAhXpL4i7WjKv6UPRQ8VAgkTE0lMCSZnBdMMVBBL1
	lvrkI=
X-Received: by 2002:a05:6512:a82:b0:4d4:73e9:89a3 with SMTP id m2-20020a0565120a8200b004d473e989a3mr2320434lfu.183.1674711953202;
        Wed, 25 Jan 2023 21:45:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsv2a9yOg6iM1gmIqWi3nYJUPsBnTwzVyPeR4UX7C7R1lOxVg9kHCuQCpEJCniZ4tyhBHfSuwbg8GsYBTirG6o=
X-Received: by 2002:a05:6512:a82:b0:4d4:73e9:89a3 with SMTP id
 m2-20020a0565120a8200b004d473e989a3mr2320431lfu.183.1674711952793; Wed, 25
 Jan 2023 21:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20230125080136.8308-1-sinthu.raja@ti.com> <20230125231824.GA22689@denix.org>
In-Reply-To: <20230125231824.GA22689@denix.org>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 26 Jan 2023 11:15:40 +0530
Message-ID: <CAEd-yTT5z=h8H-bNWnysBoDghibX4ubngMHQcdspJ2EqxXcMFg@mail.gmail.com>
Subject: Re: [meta-ti][master/dunfell][PATCH] conf: machine: j721s2: Fix DTB
 overlay extension for OV5640
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com, 
	meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1674711953-304025-5398-22909-1
X-BESS-VER: 2019.1_20221214.2106
X-BESS-Apparent-Source-IP: 209.85.208.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.245713 [from 
	cloudscan23-148.eu-central-1b.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 05:46:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15672

On Thu, Jan 26, 2023 at 4:48 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> The only minor issue is that this only applies to dunfell and won't apply=
 to
> master due to the layer restructure. Otherwise looks fine to me.

I will send out a separate patch for the master branch. Do I need to
send another version with the subject change.

>
>
> On Wed, Jan 25, 2023 at 01:31:36PM +0530, Sinthu Raja M via https://linkp=
rotect.cudasvc.com/url?a=3Dhttps%3a%2f%2flists.yoctoproject.org&c=3DE,1,Xoe=
Nd_k-NnR7e3sL9mgqs-1sBdpiQC_hgK0kbjqFH89ByeUNIYTa2JmcBHcgFGhAHBsUccnR5iW-EV=
LPrb7ko7KufCB8i29ZwW9tN1Cp&typo=3D1 wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> >
> > The extension for the OV5640 overlay is incorrect. Therefore, update th=
e
> > correct extension to build the overlay as .dtbo
> >
> > Fixes: f67e9805 ("conf: machine: j721s2: Add AM68 SK specific dtb and d=
tbo to KERNEL_DEVICETREE")
> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> >  conf/machine/j721s2-evm.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.con=
f
> > index 8d3f8db8..488a1140 100644
> > --- a/conf/machine/j721s2-evm.conf
> > +++ b/conf/machine/j721s2-evm.conf
> > @@ -14,7 +14,7 @@ OPTEE_K3_USART =3D "0x8"
> >
> >  KERNEL_DEVICETREE =3D " \
> >      ti/k3-am68-sk-base-board.dtb \
> > -    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
> > +    ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
> >      ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
> >      ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
> >      ti/k3-j721s2-common-proc-board.dtb \
> > --
> > 2.36.1



--
With Regards
Sinthu Raja

