Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF387C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:08:55 +0000 (UTC)
Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.3782.1675876125974198442
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 09:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=OyfOH7lE;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70]) by mx-outbound17-40.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 08 Feb 2023 17:08:43 +0000
Received: by mail-lf1-f70.google.com with SMTP id n6-20020a0565120ac600b004d5a68b0f94so7882516lfu.14
        for <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 09:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+7CyyYH2x18R5V+75yg02Wj1n72k5wDs0yffiTpwY/0=;
        b=OyfOH7lE4mFR+T+Qz3EuoF1kv+ZnM7l2/VqcH15cxF9IACwhETi83+EoCXYNKjcN6y
         h9KbQLdLkR5+ZMvvalnTcwZs6wihD95MSEow6PJJs5ABKbSZnPni7CXxIX048WDLqxsJ
         FdytrqkBgSAaKjraxVShOrqh80egJcRYz/BtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7CyyYH2x18R5V+75yg02Wj1n72k5wDs0yffiTpwY/0=;
        b=IKvpb2m+2WQj3NYFBDYq18XqXsVm0/puuaZoEi4GfWqvRq3i2xRDGCmoXokPs9Ohi9
         l127G9Ybfw4YNFVAvvHJv8UMxlKiGDESO31g00d/eezk1x9Rwx8DFhOAcgBzWWisFKxh
         EeTD8ARY1eGo/euULE9WlN5yHt+qaCoCO6dvYlUmpNzRiu1dihmRA01KFa3/iaV6fqlg
         pE9POxVVbe00X0dlYqLEyftB2+NzaEOaKWUO/GKrnbScgGlqdUwwxBAolOhQSM6BQHYu
         /unagBEafkGuakOeVvJjDa7t7DBeDQzrSytzkEr0AcMutrsZ82nrHgTdfI9kOeYLsiZ3
         w1nQ==
X-Gm-Message-State: AO0yUKXJzCrlQFvawPoXG9FISd6F2GTEZS0bijq/HzS9hKCYZrqBPUX5
	6m+FahstQoviDgvSRCtkDXDeu+y+a0kwnDSRkWSOp6r7z18AXRwMWOYr4khZmp/Wy0A4utYVnnm
	QhkPW34wNZsJnLYM++yiVf3oeUDZkcUiBlX6WBIpkuoL9AK8Gv6Sew6mvjhbXTaMlepZiaig/bQ
	VRmPE=
X-Received: by 2002:ac2:5d4f:0:b0:4d5:72fd:5348 with SMTP id w15-20020ac25d4f000000b004d572fd5348mr1298031lfd.88.1675876121457;
        Wed, 08 Feb 2023 09:08:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/bZZEnbVIwCP2D6YeagXq290GZc88FjS7BZuyVyeE0tcEt130IBkKbk1HLf34WQH+GiTy37ZfP9FICnFz/JwQ=
X-Received: by 2002:ac2:5d4f:0:b0:4d5:72fd:5348 with SMTP id
 w15-20020ac25d4f000000b004d572fd5348mr1298020lfd.88.1675876121002; Wed, 08
 Feb 2023 09:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20230207151300.3223-1-sinthu.raja@ti.com> <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
 <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
In-Reply-To: <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Wed, 8 Feb 2023 22:38:29 +0530
Message-ID: <CAEd-yTSg3gNDZSafhTYq6BEKXx3yOD7X7xgi-okq2SjDra+BCg@mail.gmail.com>
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: reatmon@ti.com, denys@ti.com, detheridge@ti.com, 
	meta-ti@lists.yoctoproject.org, Sinthu Raja <sinthu.raja@ti.com>, 
	"Kumar, Udit" <u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-BESS-ID: 1675876123-304392-5394-29117-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.167.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246007 [from 
	cloudscan12-162.eu-central-1a.ess.aws.cudaops.com]
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
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 17:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15752

On Wed, Feb 8, 2023 at 10:31 PM Bajjuri, Praneeth <praneeth@ti.com> wrote:
>
>
>
> On 2/8/2023 10:37 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> > On 2/7/2023 9:13, Sinthu Raja wrote:
> >> From: Sinthu Raja <sinthu.raja@ti.com>
> >>
> >> The AM68 SK has PWM output pins connected to its RPi headers. Add
> >> overlay file to enable PWM pins.
> >>
> >> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >> ---
> >>
> >> Changes in v2:
> >> ==============
> >> Address review comment:
> >>   - Remove extra space
> >>
> >> v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
> >>   conf/machine/j721s2-evm.conf | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> >> index 7c120dcc..f1127ed5 100644
> >> --- a/conf/machine/j721s2-evm.conf
> >> +++ b/conf/machine/j721s2-evm.conf
> >> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
> >>       ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
> >>       ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
> >>       ti/k3-am68-sk-fpdlink-fusion.dtbo \
> >> +    ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
> >>       ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
> >>       ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
> >>       ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
> >
> >
> > This file does not exists in the kernel (yet?).  I'm assuming that you
> > all have put in the patch for it and we are just playing a waiting game?
> >
> > If that is the case, then I would appreciate (in the future) not
> > submitting these patches to the meta-ti mailing list until the kernel
> > .dtb changes have been accepted into the kernel.  This is the second
> > patch in recent weeks that I'm having to sit on until the kernel catches
> > up...
> >
> > It makes it really hard to test these patches if the kernel part is not
> > there, and I do not have the bandwidth to keep checking daily if the
> > change has made it into the public/cicd branches.
> >
>
> Agreed here.
> Sinthu, Please post the associated meta-ti change only once the kernel
> dts change is merged to cicd build.
>
Agreed.

> from what i see, the kernel patch is still under review.
>
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15750): https://lists.yoctoproject.org/g/meta-ti/message/15750
> > Mute This Topic: https://lists.yoctoproject.org/mt/96808923/2167429
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695566/2167429/1935739249/xyzzy [praneeth@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With Regards
Sinthu Raja

