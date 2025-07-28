Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30846C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 18:29:09 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.88613.1753727343427732919
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 11:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lgdwCulS;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7196cb401d4so45307047b3.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753727342; x=1754332142; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI9DnxD53afh1bGVJtkHUSGUSl+2DhjWZmpd46BC7PI=;
        b=lgdwCulSBVZzYIC6o65md2ERLqRytUjCmSR+k2wNjGzD/bmWAUEIlrdu75yzf0Ps+Z
         AjIpK3ErxUzeXav254wStXhxfWTUD4AM/t8QLrX8xz1834GQcf9a8wwQM6aY9P/KE2yZ
         B5dlI3NJCtL12s2pwfLSqQN6sbXoGNNCoYrr9hOPBqD67UH0lWLlTkZ7KbOBsWO7C6pp
         XaOjqzvF52Gw8XobGUHBAQGsr31HpxiAGtIkrpWlAWn2+xgsXZOKZxQrtLOHoy/yoRWT
         Vvm4L8hQ1aThfwaBz33IeE0/Ssw4GsTV1E3VEPiBfvj1xpymIDszmwJwy0lk7p1Z8ZrL
         YbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753727342; x=1754332142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI9DnxD53afh1bGVJtkHUSGUSl+2DhjWZmpd46BC7PI=;
        b=oU5jymLuPXg1Yzifm1ATZQwrWgvMw+ikm3PGwPV6u0IGzWdTDF0wvB83g0RvYWAjG0
         MIZAGjrQWPifzqB43T9t/BuAQ5Q/+7FEtMHtyJ26ekFvc2CeJ0mVjs9uxyaec6eKO7I1
         Tli7SV21ajBa4qEKJhBd1f2B7bSnShX4aHvRVAWcecg3aA8IAWH0+pmIh9wclHKQvSnj
         b9oze2bW0kN1IhWkRZ1nIdH5To4t3pTfSX5N8jg34gHKszKHxXftz/c/dfdZfb2bvAKN
         c3MzCc7eXMdi7GIwEUo204YRKH28pZFW4m+Mj+5C7afP8qDb+HBkrPWCHIXO721OkUiA
         2X1g==
X-Forwarded-Encrypted: i=1; AJvYcCWeUS9k/RomQ3V6SXxelE1VsfNNI5vMyPD1H/DQLQdeqBGMLv+RxcY36xclq1RQn80a4knJ8zdo@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywp2++lA7G8Z58BiwFT/ufZ10H/v1bwLPWneovEbQtFfl9q86BZ
	UeqBmMGy9mne5nqtdv94NlEMYY/BnRERImedfwFyTEJx4peyUktvUzf/vxpt+E3teIfKSsRDjJv
	CeOGSAbkrCSMpvoKk7N8vdRuU/4PqPf0=
X-Gm-Gg: ASbGncubutrLb7gZmrSXQxd+S2ppLnaVdqSGHlfOO5oqT3u/sF5vC0s7in4JMTPZfPC
	HyEFumrmuHIe2InTdT8ueEc1bLy61pcrty4te+fumBRnCXJz6CSX0woLBgf202mxY6r9m82laWm
	W1BuxXSPSjlOoim0mSQ74TuBuQv05Uus8JGtTMipCj3MSBkWt+brRT0tkwcUEXJj3GiGtW3+nBE
	yi4UG5BOclNKlBuA7OI8hJ4yAOTfPO4V7fzDGo2TRUKwA==
X-Google-Smtp-Source: AGHT+IGqzBjKLdTA+LKuYM0EPNqI2tXAp8cilep9C9Z0VslCYWI6+0nTN/+ED7/Z2Yt5Pcz51PgLOdoN23/xZ5uB+vU=
X-Received: by 2002:a05:690c:650f:b0:707:48a7:ea74 with SMTP id
 00721157ae682-719e39287e1mr142139347b3.22.1753727342340; Mon, 28 Jul 2025
 11:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250728165437.571427-1-afd@ti.com> <20250728165437.571427-3-afd@ti.com>
 <20250728182531.GJ24899@denix.org>
In-Reply-To: <20250728182531.GJ24899@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 11:28:36 -0700
X-Gm-Features: Ac12FXxAhHqDlLtf3HqNd-gatTbbcIVh7RXBGkCRtidZTdYHhv60MF2qzmlJjl8
Message-ID: <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
To: denis@denix.org
Cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 18:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18841

On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>
> On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.yoctopro=
ject.org wrote:
> > For all our platforms booting with EFI there is only one option today.
> > The timeout gives the user 3 seconds to choose a different option, but
> > as there is only one, this just causes a needless 3 second delay in
> > boot time. Remove this delay and boot the only option immediately.
> > If we ever have more than one option we can always add this back.
>
> Well, menu delay in grub is not only used for selecting among available
> predefined options, but also for interactively editing the command line
> on the fly before booting.
>

for development, this sounds good, for production not so much.

>
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > ---
> >  meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic=
/sdimage-2part-efi.wks.in
> > index 7252411c..c1089762 100644
> > --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > @@ -3,6 +3,6 @@
> >  # supports EFI.  Boot files are located in the first vfat partition wi=
th extra
> >  # reserved space.  We cannot use a GPT here.
> >
> > -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait ${TI_W=
KS_BOOTLOADER_APPEND}"
> > +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait ${TI_W=
KS_BOOTLOADER_APPEND}"
> >  part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER}" =
--fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed-size =
128M
> >  part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use=
-uuid
> > --
> > 2.39.2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18840): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18840
> Mute This Topic: https://lists.yoctoproject.org/mt/114416911/1997914
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [raj.khem@gma=
il.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

