Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8937EC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:42:37 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.44274.1676990548719573031
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 06:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBIlz/MF;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: robertcnelson@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id b20so4564980vsu.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 06:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QAlHtmzJuZXME57EVTt58xoOxOG8aIEn1AMQqlQXKXw=;
        b=kBIlz/MFeMzgZDwVsdR+wUQ86ofCCB6A13dxFF9MpoMFagMTmMRC/4mxN8+JYVdsOx
         x+SCGBUOwPtP+nK01ZgOasaYaHNV5RmbLJ8U4gfH9wTK54S4W2t8mjMXpxgrX9gNViul
         aACPppbMVTjC9Euehx3x+udAJ9PIXsJpAVs8J+eJQCIF5w571fDKSiLQ93I6qZl58EEe
         dD9IRcJtmlBjjtpgGdnHKBBsUpYRod4rY5c0UNlmnQvdmtJtoqp/sH3V66/nGfATbpKx
         S3BZMoLlFnHK67PWAq4AsLyvt9/amuziksOcv5zVooy/8fJeMc9yfDOolUHBqgxz1KrQ
         lBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAlHtmzJuZXME57EVTt58xoOxOG8aIEn1AMQqlQXKXw=;
        b=jzPMNWWHTfm7/KtXu8OQ/4fynZOAxR196gTFEYpACYY8OdGM8Oehyeb+aYDHidikNL
         oWVBgVqQ5HPFuAlWkBfm9MW2zhQ9L5qnA9/xA9tjCCs2ORDrXiBKBStcBGzlv+yrwpDg
         vNRBw5O8Xnb75M4LvcoBEDoY3tyGdA2v+6a54UQO/tkIp8iBQWAYM7yCN6tjyodUTPaZ
         yig0Ap2qgkZki4Eu4CYD3gg+NzhbGylAE99a1FX6NiSho2EIn3GFsRoRbBxm9d7cHQQ4
         Jc8h+wMZmMtpYEw6QL7RW0iaY0MkwXkURDC8MeDbn8SdGH2VqBw+sgYOB8oUDel0egO3
         GVpQ==
X-Gm-Message-State: AO0yUKWlrtZZViT2abX21rtQjhGjNkBWHVNo3mawz1x1h02beH1jtvuE
	f0f3p4RIGthJsJgTokWBrGak3zYKoIEJa5yn5lt0myDtmL8ssw==
X-Google-Smtp-Source: AK7set/EELGJCRgKyx5/R6pBK/rDTk3sO0YTZBLBCsyPpo8+C01Y5NBK8MpgfRWuj7QhZeVGiOsSN3IZGiGs/UHdGWw=
X-Received: by 2002:a05:6102:159e:b0:410:cdf2:13ae with SMTP id
 g30-20020a056102159e00b00410cdf213aemr2148431vsv.50.1676990547467; Tue, 21
 Feb 2023 06:42:27 -0800 (PST)
MIME-Version: 1.0
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com> <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
In-Reply-To: <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 21 Feb 2023 08:42:01 -0600
Message-ID: <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
To: danny@sizethreestudios.com
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000dfa23f05f536c994"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 14:42:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15894

--000000000000dfa23f05f536c994
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 19, 2023 at 5:27 PM Danny Hadley via lists.yoctoproject.org
<danny=sizethreestudios.com@lists.yoctoproject.org> wrote:

> Hello - I'd like to start by saying thanks gain to all for the continued
> work on this project!
>
>
>
> I'm reaching out again for help on my beaglebone + yocto project. I feel
> like I am really close to a functional implementation, but I am now stuck
> on getting my LCD screen to render anything (for reference, I am using one
> of these - https://4dsystems.com.au/4dcape-43). My hunch is that I need
> to enable the device tree overlay for the cape.
>
>
>
> I've spend a few days poking around, and have a recipe in my yocto project
> that compiles the overlay files from this repo -
> https://github.com/beagleboard/bb.org-overlays.  At this point, I have a
> bunch of compiled `.dtbo` files both being written to the
> `DEPLOY_DIR_IMAGE` and the boot partition of my wic file which is exciting
> (my guess is I am specifically interested in this one -
> https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts)
> <https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts).>
> .
>

The separate "bb.org-overlays" should not be used outside of anything newer
than v4.19.x based kernels. While it worked great for many years, just too
many device-tree api changes over the years..

Our 5.10.x-ti branch has direct support for the BB-BONE-4D4C-01-00A1.dts:
https://git.beagleboard.org/beagleboard/linux/-/blob/5.10/arch/arm/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts
, thus it's already built for this lcd.

The other trick, the Black defaults to built-in hdmi..  Another board has
shipped that's the Black without an HDMI.  "BeagleBone-Green", so in u-boot
force fdtfile=am335x-bonegreen.dtb and apply the BB-BONE-4D4C-01-00A1.dtbo
overlay..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

--000000000000dfa23f05f536c994
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 19, 2023 at 5:27 PM Danny=
 Hadley via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.or=
g</a> &lt;danny=3D<a href=3D"mailto:sizethreestudios.com@lists.yoctoproject=
.org">sizethreestudios.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><u></u>





<div>
<div><p style=3D"margin:0px;font-family:Arial,Tahoma,Helvetica,sans-serif;f=
ont-size:small">Hello - I&#39;d like to start by saying thanks gain to all =
for the continued work on this project!</p><p style=3D"margin:0px;font-fami=
ly:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=C2=A0</p><p style=3D=
"margin:0px;font-family:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=
I&#39;m reaching out again for help on my beaglebone + yocto project. I fee=
l like I am really close to a functional implementation, but I am now stuck=
 on getting my LCD screen to render anything (for reference, I am using one=
 of these - <a href=3D"https://4dsystems.com.au/4dcape-43" target=3D"_blank=
">https://4dsystems.com.au/4dcape-43</a>). My hunch is that I need to enabl=
e the device tree overlay for the cape.</p><p style=3D"margin:0px;font-fami=
ly:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=C2=A0</p><p style=3D=
"margin:0px;font-family:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=
I&#39;ve spend a few days poking around, and have a recipe in my yocto proj=
ect that compiles the overlay files from this repo - <a href=3D"https://git=
hub.com/beagleboard/bb.org-overlays." target=3D"_blank">https://github.com/=
beagleboard/bb.org-overlays.</a>=C2=A0 At this point, I have a bunch of com=
piled `.dtbo` files both being written to the `DEPLOY_DIR_IMAGE` and the bo=
ot partition of my wic file which is exciting (my guess is I am specificall=
y interested in this one - <a href=3D"https://github.com/beagleboard/bb.org=
-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts)." target=3D"_blank"=
>https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE=
-4D4C-01-00A1.dts)</a>.=C2=A0</p></div></div></blockquote><div><br></div><d=
iv>The separate &quot;bb.org-overlays&quot; should not be used outside of a=
nything newer than v4.19.x based kernels. While it worked great for many ye=
ars, just too many device-tree api changes over the years..</div><div><br><=
/div><div>Our 5.10.x-ti branch has direct support for the=C2=A0BB-BONE-4D4C=
-01-00A1.dts:=C2=A0<a href=3D"https://git.beagleboard.org/beagleboard/linux=
/-/blob/5.10/arch/arm/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts">https://g=
it.beagleboard.org/beagleboard/linux/-/blob/5.10/arch/arm/boot/dts/overlays=
/BB-BONE-4D4C-01-00A1.dts</a> , thus it&#39;s already built for this lcd.</=
div><div><br></div><div>The other trick, the Black defaults to built-in hdm=
i..=C2=A0 Another board has shipped that&#39;s the Black without an HDMI.=
=C2=A0 &quot;BeagleBone-Green&quot;, so in u-boot force=C2=A0fdtfile=3Dam33=
5x-bonegreen.dtb and apply the=C2=A0BB-BONE-4D4C-01-00A1.dtbo overlay..</di=
v><div><br></div><div>Regards,</div></div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature">Robert Nelson<br><a href=3D"https://rcn-ee.=
com/" target=3D"_blank">https://rcn-ee.com/</a></div></div>

--000000000000dfa23f05f536c994--

