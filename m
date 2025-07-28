Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90733C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 22:57:40 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.94665.1753743450716269977
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 15:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sre49k6M;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e5e6ab7b8so42817897b3.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753743450; x=1754348250; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYEoabNVw234EradD11PqnisVMNoRzOwf+DmwoCOuU0=;
        b=Sre49k6Mhpjgx/kBEXcwqhkQHjoVlmOU7uco3Jr2c+/dH8g2mEkMl9HZMcQ0R+aDVe
         wg4Fk37gK2wEJc5eomLeWRlc8FX7VI9NzSvixsqork/OVj5OW+mZ/KuEVgAo+EG/3j2m
         atLE7PcrIznHfSuFAvblhQ8HkxKWRBR+nN9Qj6vam0oFgKwIDJ96wOo5B64wOPsVrssz
         6rNfE1QpNvhMFS+pFQ0J597nF9T19D5iQ+NTpa0yWOGhiVbCLbQrRJEmD649GXEKJBlx
         Z6dTcmbga5AUx9UXf5vo8+93oWtSdyYYbwGymkubuI6OsdIOMEck9hlqBHyEKfM22t59
         U1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753743450; x=1754348250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYEoabNVw234EradD11PqnisVMNoRzOwf+DmwoCOuU0=;
        b=s1l5bofDU0mFrffsA6vGfw0/7Aw/2gAXnGH40wj5gfQe6s8vCyp3yjrKVPW5/iypot
         JHqiadG0SynIijZD/JNqD5ynLXpE+rhoUr4Cz8C3GEQeJXv5cxvc6BkkS/HBn2R/22j2
         Asv+4vSRSox7TWmAAI5dBz6LgC6ubCC8wOtfgaq/LEhAWQEEwZwQtjL5jqCJpn6fMfpV
         YYsoLsRKz+brvjGo27azJsZInoGq7bzwf6l+Gnl0c3wBpGOC55+848Bc3E1zJN2W93S2
         r4Okg9AR+UL3p5d7olkUMDe1YVv8WUii3hyHfgyb/CMEUQSKeLelpB3GX1zLYHteheun
         QRhw==
X-Forwarded-Encrypted: i=1; AJvYcCVXisQNOx2rWMwJZpQidFpceVGqJzk8aNDbE9QUojpmNk/VvrSc/5TzTPBNpk6Sgau+L6a0VCmi@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw9BG9yPxB8B0CY/eCc/2BHCaovcESfqfnLLgyR7iDyDfTbz8Gs
	x6wrUKLlbvm1wRKqdVqJXuiEDy6zclzFXyskI2hG/fEKfdVXcqzAT72GhYbkqUeVDhXdAXjj+Df
	uED79HHMNfWOtzfCj4CnmczncGmguD+s=
X-Gm-Gg: ASbGncvUpWPAK25aacK1ZMo7rY2+FyXESV0hth/61xmyNeDkOKh0h1FwuSQl/D/PyUa
	Yu4/v0wGKMp3xS8QQwNeq4eIFQa52E9hfgsykzNMmrjKPyDG9ku57C12PgH9VUa/BrasSfLGw6U
	JWs6JLTQ9S2lttd/wb2Ps6EOY63d8FHkGTvuZDt1Cp65aZcyGk7AlYl0apOP4QRCihrGjeDkXO6
	Vdla9rvYRba+epal+cGah8neKDOGtS8NeXj2NXk
X-Google-Smtp-Source: AGHT+IHb+N3Qk3/MQVgB4wuSUZg683QWSe1kDtxVWFZeS3AXje0+TtHR/CyCpfvi3mRHmxmZg93IqntSwIcn+HSvCwo=
X-Received: by 2002:a0d:d085:0:b0:719:fd6b:7cdd with SMTP id
 00721157ae682-719fd6b7eafmr68657437b3.5.1753743449664; Mon, 28 Jul 2025
 15:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250728165437.571427-1-afd@ti.com> <20250728165437.571427-3-afd@ti.com>
 <20250728182531.GJ24899@denix.org> <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
 <20250728194528.GM24899@denix.org> <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
 <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
In-Reply-To: <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 15:57:03 -0700
X-Gm-Features: Ac12FXydkub7M6ZEJyK_B2tqoD4G1BbmOst4giIWls3IT7n-q8qmMhrza93jgd0
Message-ID: <CAMKF1sobyMqQW-c+dnLJ9X7s3oNVCokCJhNWNdKBietiS=BxJg@mail.gmail.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
To: Ryan Eatmon <reatmon@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 22:57:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18850

On Mon, Jul 28, 2025 at 1:33=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 7/28/2025 3:20 PM, Khem Raj via lists.yoctoproject.org wrote:
> > On Mon, Jul 28, 2025 at 12:45=E2=80=AFPM Denys Dmytriyenko <denis@denix=
.org> wrote:
> >>
> >> On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
> >>> On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
> >>> lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wro=
te:
> >>>>
> >>>> On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.yoc=
toproject.org wrote:
> >>>>> For all our platforms booting with EFI there is only one option tod=
ay.
> >>>>> The timeout gives the user 3 seconds to choose a different option, =
but
> >>>>> as there is only one, this just causes a needless 3 second delay in
> >>>>> boot time. Remove this delay and boot the only option immediately.
> >>>>> If we ever have more than one option we can always add this back.
> >>>>
> >>>> Well, menu delay in grub is not only used for selecting among availa=
ble
> >>>> predefined options, but also for interactively editing the command l=
ine
> >>>> on the fly before booting.
> >>>>
> >>>
> >>> for development, this sounds good, for production not so much.
> >>
> >> Sure. And we also disable e.g. U-boot boot prompt delay all the time f=
or our
> >> customers during production hardening stage, among many other similar =
items.
> >> But it is done for the final product - I don't think it should be done=
 in a
> >> generic BSP layer that many use for development.
> >
> > Right, it could be documented somewhere in README or some such would he=
lp
> > the consumers of the layer.
>
> Is there already something in the system that we could use to drive a
> variable that we can stick into the file?  Like EXTRA_IMAGE_FEATURES?  I
> know there used to be a debug-tweaks that got broken out into multiple
> features.  Maybe create a new one?
>
> TI_WKS_TIMEOUT =3D '${@bb.utils.contains("IMAGE_FEATURES",
> "wks-debug-timeout", "3", "0 ",d)}'
>
> bootloader --timeout=3D${TI_WKS_TIMEOUT} --append=3D"rootfstype=3Dext4
> rootwait ${TI_WKS_BOOTLOADER_APPEND}"
>
>
> Would that work?

probably, it can make it easier for sure.

>
>
> >>
> >>
> >>>>> Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>> ---
> >>>>>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
> >>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp=
/wic/sdimage-2part-efi.wks.in
> >>>>> index 7252411c..c1089762 100644
> >>>>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> >>>>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> >>>>> @@ -3,6 +3,6 @@
> >>>>>   # supports EFI.  Boot files are located in the first vfat partiti=
on with extra
> >>>>>   # reserved space.  We cannot use a GPT here.
> >>>>>
> >>>>> -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
> >>>>> +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
> >>>>>   part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVID=
ER}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed-=
size 128M
> >>>>>   part / --source rootfs --fstype=3Dext4 --label root --align 1024 =
--use-uuid
> >>>>> --
> >>>>> 2.39.2
> >>>>>
> >>>>>
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>> Links: You receive all messages sent to this group.
> >>>>> View/Reply Online (#18848): https://lists.yoctoproject.org/g/meta-t=
i/message/18848
> >>>>> Mute This Topic: https://lists.yoctoproject.org/mt/114416911/655105=
4
> >>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
> >>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmo=
n@ti.com]
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

