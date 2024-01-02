Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949CAC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:55:08 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.31929.1704210902393138379
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jan 2024 07:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=VBtcOLNd;
 spf=pass (domain: criticallink.com, ip: 209.85.208.170, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso6897201fa.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 02 Jan 2024 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1704210900; x=1704815700; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEjjUm6Oq5ArlQfCWmym1TSgbOoxZYoOgYGBruVpcTU=;
        b=VBtcOLNdICpkJhSDTF5nkMaQ8o3cULXz5lAAYPppKe/mXenMxgsccZcw+vc/YKRxXr
         SEvCJ2LybL4uHGnHcJ9EJy7VOeX41EUeWnq5UK97nREWFj316sw6JG2PiYWq3zLHnz8g
         uKHqKx+eFIb1uqFSwJ4wc6VX1CXBsuPyh+C4PNzNFe8yUx3lTopnXzHg4i15WXOKHndC
         4IPCkGM06k5gKErBbZPYBy0Fi123LN/C0GMmXgPe1BhQnfG4q+kj5foyTKSKXKvB9Cm3
         aob1YF+/Ec8JuILDly3b89i8ydXpH701iOuH7bhyykcvL63u7kTfSnereFi8L2puJzjd
         S/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210900; x=1704815700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEjjUm6Oq5ArlQfCWmym1TSgbOoxZYoOgYGBruVpcTU=;
        b=RcqrxALNGLjoCUQ33Uxsuu5XXhc0iy0ZgMeunY2ydRe5Efruy/PYXKB1FoTvVWW1xI
         nOlUOo/ujNgkGAs57LJz4X5rIXhZCesyBcFv42+wJLBCs7Y12gVD8NXmX/vRTucFXkfA
         Ro6pSfeTbMG/96uv4kJyxK+3GqvHR7Nc8OPUcKex9wxRAWKmH9DYSIFAaoumvhYpobej
         uV2UILdksXIuHTMvQ1ncU/DAxPHJcw9+LAMJk0dvjZaQf1DIkQl13OcfTbztffo4HqGq
         H6zMrNgeZSDlGfNyItjFsxYKPV5X1Jl8Zp0/eYv8vvXW+6sxiVDuaBxMCH9EWfInqkFb
         xvug==
X-Gm-Message-State: AOJu0YwnttMHPjy+328i9Oaf7mqGHQf/U71LjVOy0CEtCdSPp3Q9aw4z
	GjPFFAykFZMqhKHL3axXu47de78CrMoJIIvilIXjVfcAKuLC
X-Google-Smtp-Source: AGHT+IH0gsMTxTZYbjR3HI16cLjPoiK3fQlJcK0/xabkjO2nqCs+6PKo1ukCzoJTcayuVJcBspAqMApFuMi6EnD7B3k=
X-Received: by 2002:a05:651c:54c:b0:2cc:d490:28b9 with SMTP id
 q12-20020a05651c054c00b002ccd49028b9mr5163227ljp.5.1704210900293; Tue, 02 Jan
 2024 07:55:00 -0800 (PST)
MIME-Version: 1.0
References: <tcKd.1703779596370036081.fG9M@lists.yoctoproject.org>
In-Reply-To: <tcKd.1703779596370036081.fG9M@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 2 Jan 2024 10:54:49 -0500
Message-ID: <CADL8D3YkVLQ-6N3g38OUX4ykp6KY3VipT4m8=8ZbHr6Zz9WBag@mail.gmail.com>
Subject: Re: [meta-ti] Custom dts recipe
To: Lukasz Przenioslo <bremenpl@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jan 2024 15:55:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17374

When making any custom changes in Yocto, your always going to want to
create your own meta layer so that you can keep your changes separate
and so you can revision control your stuff.

This guide from Toradex seems to do a decent job explaining it all.
Though the names of different recipes will have to be adjusted for the
boneblack.

https://developer.toradex.com/linux-bsp/os-development/build-yocto/custom-m=
eta-layers-recipes-and-images-in-yocto-project-hello-world-examples/#custom=
ize-the-kernel

On Thu, Dec 28, 2023 at 11:06=E2=80=AFAM Lukasz Przenioslo <bremenpl@gmail.=
com> wrote:
>
> Hello,
> For a while now I am trying to create a custom device tree overlay for th=
e BBB/ BBG. It doesn't go so well. I started to think whether it would not =
be more feasible to have a custom base dts file instead (just like `am335x-=
bonegreen.dts` or `am335x-boneblack.dts`. Based on one of these 2 files I c=
ould create, say, `am335x-bonepink.dts`. Assuming this `am335x-bonepink.dts=
` would reside in some dir I have access to, what would be the preffered Po=
ky way of implementing it into the build? By that I mean that during bitbak=
e it would be compiled to a *.dtb and placed in the boot directory along wi=
th the other dtb files. Do I need to create a custom recipe/ layer for that=
 and add it to the build via `bitbake-layers add-layer`? If yes, how would =
the steps look like in practice (I am quite new to Yocto/ Poky)?
>
> I would appreciate all feedback!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17373): https://lists.yoctoproject.org/g/meta-ti/mess=
age/17373
> Mute This Topic: https://lists.yoctoproject.org/mt/103402787/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

