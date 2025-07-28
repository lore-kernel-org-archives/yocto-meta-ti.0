Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB19C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 20:21:29 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.91312.1753734083304243419
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 13:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G1/BlnMc;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e5e6ab7b8so41802807b3.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753734082; x=1754338882; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMWK0QC2RnfQFvo21JxOtq5dFjY2mr2s2CgBFQXiYk8=;
        b=G1/BlnMcQSAg7W8g/Pq4C/PnqKpRi+Jbcl+P7ZS/N/tjPwKa2P0uqR5UfXmdQTX9+I
         lV8eFg5YZvlvcuzPfxa/s2n1+BUg4bORay8AXRka5P07/RVAD7je8xyrrE/Eer9p8xNM
         2ry25zr75nTbRHlFo5hRnIu4gmA8cKYbYB0SdwSKKNvj9fpIxxwJzALX+O9xQ13li1QC
         s7BqhXYGx+hIjM5e0GAIUhYg7zKFO9wL4C3qXxNvFlID+nXLBicQPrD6kN2Rf+5z9dTb
         nAIg/qWfxDhtnVUbN+alDsKeh40SCvrjGDb7XjSO5WiA0SvX/Rr3RHsNmZxjHNJnQcVM
         6RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734082; x=1754338882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMWK0QC2RnfQFvo21JxOtq5dFjY2mr2s2CgBFQXiYk8=;
        b=DaLhaTsbr+cuXTiJjh0J3Uv1OL0amW7JaqAAqs0iOyRuv4tfB+JVblrTaJwnmaX1Mz
         32VuKZcnB+ADE6aYjJfeDQnrJXisQ6D7AH2giOjYzalGbVb+HwU2sFhr6wXwDSGVkXzh
         t+3XK7pPkq1FueqY2eerH12RR91QjkAbeNtAHhYz08s6ePqRf9uRJSZmsNx/dxsM/EhY
         NvGrq3wF/k+nKC85pSxQugVvWXibtnkw2o3ImMv0VXVuiSp0dQSdVLXnsDacvthCeIuG
         L3iD15gi4iy+4EE3sNVPVXw1EkEhv8jzloeE8+ClbGBLBRQ5OSlqSkMKdnTf3K4/eu8D
         dixg==
X-Forwarded-Encrypted: i=1; AJvYcCVBJQkiqGhbkKwwqJI/NyvPtx580xlZY5rRtsA2oBUR0AP9pfZp9OabBdO7bql5u5w2Obaab6YZ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxlk7MnQQuDI/blDThmrFX9RzLXx2KYiJ7DwVrqf1l6CFVkdOZ+
	R687zbZDanHffea1zN5oa2BBR7dHjAgWhjaTFM2Iu3ISzyEz749c3enV9mscalAytobsqp6j/b4
	2N1XNOVrsY/vRUQtp2KFpBhzFLokqw10=
X-Gm-Gg: ASbGncv6aLbRn3weGOLJTDKtWUoGMpZWTyawGohYFC3ErFGFp8xlDO+W07sSttNBvlW
	k+k6/Cns3qYa/rHFpHUs+3xxD9MJubOx88gQjzphvd3litQB8U1IoahOLjmmWDSpUxQ1NFvcKK8
	biolAJH7BravWRkpfFyM65ajypssXyUp01TtytsVXPMNA7SJcSkj52DSSCubDMo5m/O8Mnc+Ou0
	ril8XmDLcVxSe0JNtOvaJMQ96W/TKC2VjmZpqC6I3uUUg==
X-Google-Smtp-Source: AGHT+IGJoGPULxPiIDuWNuJoTCdkMrgfgU705EnnxVjQ73tXkYgSBgtGndO3ITb9niAz0nefF6IXFjYlTO6zshbrXxk=
X-Received: by 2002:a05:690c:7005:b0:71a:a2d:9d84 with SMTP id
 00721157ae682-71a0a2da0b5mr98302267b3.6.1753734082325; Mon, 28 Jul 2025
 13:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250728165437.571427-1-afd@ti.com> <20250728165437.571427-3-afd@ti.com>
 <20250728182531.GJ24899@denix.org> <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
 <20250728194528.GM24899@denix.org>
In-Reply-To: <20250728194528.GM24899@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 13:20:56 -0700
X-Gm-Features: Ac12FXxY5Ol-YoK45o-1QcXuqWC1gP5IWpml5HDVNQZ0XicI_FR-54s2K9lwfAo
Message-ID: <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
To: Denys Dmytriyenko <denis@denix.org>
Cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 20:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18848

On Mon, Jul 28, 2025 at 12:45=E2=80=AFPM Denys Dmytriyenko <denis@denix.org=
> wrote:
>
> On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
> > On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
> > lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote=
:
> > >
> > > On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.yoct=
oproject.org wrote:
> > > > For all our platforms booting with EFI there is only one option tod=
ay.
> > > > The timeout gives the user 3 seconds to choose a different option, =
but
> > > > as there is only one, this just causes a needless 3 second delay in
> > > > boot time. Remove this delay and boot the only option immediately.
> > > > If we ever have more than one option we can always add this back.
> > >
> > > Well, menu delay in grub is not only used for selecting among availab=
le
> > > predefined options, but also for interactively editing the command li=
ne
> > > on the fly before booting.
> > >
> >
> > for development, this sounds good, for production not so much.
>
> Sure. And we also disable e.g. U-boot boot prompt delay all the time for =
our
> customers during production hardening stage, among many other similar ite=
ms.
> But it is done for the final product - I don't think it should be done in=
 a
> generic BSP layer that many use for development.

Right, it could be documented somewhere in README or some such would help
the consumers of the layer.

>
>
> > > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > > ---
> > > >  meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp=
/wic/sdimage-2part-efi.wks.in
> > > > index 7252411c..c1089762 100644
> > > > --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > > > +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > > > @@ -3,6 +3,6 @@
> > > >  # supports EFI.  Boot files are located in the first vfat partitio=
n with extra
> > > >  # reserved space.  We cannot use a GPT here.
> > > >
> > > > -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
> > > > +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
> > > >  part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed-s=
ize 128M
> > > >  part / --source rootfs --fstype=3Dext4 --label root --align 1024 -=
-use-uuid
> > > > --
> > > > 2.39.2

