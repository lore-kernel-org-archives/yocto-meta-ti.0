Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDC9E94619
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 11:21:14 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17518.1770722467243637266
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 03:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0W5HkUH;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: ivitro@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4377174e1ebso1317565f8f.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 10 Feb 2026 03:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770722466; x=1771327266; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ec3NknYAL1fMiuLBpb51cztsXJQPddtgN3zKQ49sLsI=;
        b=A0W5HkUHrAHpKjhibjRstxLOFY0JOMds9Oqp/NbbeHoZ6Mie2026vPqthMsoFSxhfS
         Oe+MtczVwsM+JcBT8rURM4Nuyb6Y4eDYHginXDNy3dglZEhVQ95RzP4aQZcYdJRNap8o
         6C4sdBqkGtfVDSuOLzjfqjudh8RTUJ8sJpQaa6bSalSatdAYtM9lAGzMVbZfL0Vt8SeP
         aZ7/e+FZNIOQaPoSFSw8F9eiMUJ0IIa3feo9JiaDx6LZErgj/xe8SBY8ims9n2WMvGu1
         wZcbAhIJusKYMT2PSwm6LOqPbvyF2nc/2omiXIpbzzfXW5hJZsFNyyoYKmJ8RyPLle1P
         2lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770722466; x=1771327266;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec3NknYAL1fMiuLBpb51cztsXJQPddtgN3zKQ49sLsI=;
        b=Oqnk0K5+kq1G3WwPOppePR+wMHiYMlQ5mu/A/e4mJq+teTTW78EbjicVzkaZFWJftt
         fdcX5G+uUhLWyIGmp6rm8KKw3t1jTOFb0bKjUi0EIxPcbqx3E3oGmyj90YZ9lElHm/AG
         wSKhmG5RwtgoEQfym+eyBVvYMq8NzUh0mbB3yluh0Rwm/6mhYP6GUkXyj5QiM59OeE3n
         n/F6z/BjxI8Xevt7tdggtufhLwTUCyrVNygjKXK+e7DsSjekoFam7nkhJXluSQojDsBD
         JgSdWLqnlDD7N2agnzFnUFC2Ng77j/5Ts+Zk5+EQtDxpw7PA/1N+GRm8H0uamxmzx4Ij
         /OOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4qrHnAtgG/IUDyBzN2a+AV1ieQwNuWDjEdc3/2ITZsk3sKO6YRLu4b0NZjY9FnDay5v/fA45F@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YytQ5Lx9nzhjXuav+d1+NPp8Ljp0Md86yQBerUPMroNJZeynIrN
	7HohqW7uPgBF1NSU4/DOi2bhTw58lXM814I04SFMJHC8u0ImnM1TkJuc
X-Gm-Gg: AZuq6aK4IFKDufNMK8NafOBGYml0iyDRMu9UsKc/PpbgPf4KWtHkvZhH9ZVCbc4UJnZ
	UAuY31jz61vJ70wmNSReKTcvIcrKVpSbPPAlCBAEAf8AHfuZAcv8cvUaofZm1Ik2d9zEajiWJSZ
	z7aLVhXSzxoQE1VJI2ejjtmnAvhCplqhKE9LR33TQ1KwPci+rUwW6E5D9DXzcJbsWrBoPFh6+++
	GoO70K359s3C8/hLgQZNDJMA6x9EMt78J45dR58+hMy52qkxpKa1LU5R5a1S9dTbDDuaVt4GDJR
	nOytltYtI0wt7mf7J46F7cZ6xDR+6yCdpp7xW6ZNFm83h3/LHo9XD9s/E4EdeXhcD3N3Qu7kNNg
	QEHVP60DkkfGwz14ZVlnkFfuHkp+RZN7MtGc72rV9G82oy5sCO/5qrabwTl8V6QgWMgrhD3f8MV
	Ulr9OVaS8mZexGg4EwgU3kWy65NjPKQf/GALjdR4B1C7LksQ==
X-Received: by 2002:a05:6000:400a:b0:435:729b:c390 with SMTP id ffacd0b85a97d-4362968a6c7mr22373937f8f.47.1770722465255;
        Tue, 10 Feb 2026 03:21:05 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376accfc58sm18642458f8f.16.2026.02.10.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:21:04 -0800 (PST)
Message-ID: <68b2ddb17a3ca143a686973b02debe201de6d246.camel@gmail.com>
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
From: Vitor Soares <ivitro@gmail.com>
To: Moteen Shah <m-shah@ti.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-ti@lists.yoctoproject.org
Cc: denys@konsulko.com, vitor.soares@toradex.com
Date: Tue, 10 Feb 2026 11:21:03 +0000
In-Reply-To: <4266855a-a162-4315-8536-2c5e47c079e7@ti.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
	 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
	 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
	 <4266855a-a162-4315-8536-2c5e47c079e7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Feb 2026 11:21:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19477

On Mon, 2026-02-09 at 23:40 +0530, Moteen Shah wrote:
> Hey Vitor,
>=20
> On 09/02/26 22:01, Vitor Soares via lists.yoctoproject.org wrote:
> > On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
> > >=20
> > > On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrote:
> > > > Hi meta-ti maintainers,
> > > >=20
> > > > We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED=
_BSP
> > > > =3D
> > > > "mainline") also forces initramfs integration via ti-soc.inc (lines=
 32-
> > > > 49).
> > > > The
> > > > bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditional=
ly
> > > > set
> > > > BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_F=
ILES.
> > > >=20
> > > > This means we can't use bsp-mainline without also pulling in ti-cor=
e-
> > > > initramfs =E2=80=94
> > > > even when our images don't need it.
> > > >=20
> > > > Since we can't use bsp-mainline, we also lose the correct override
> > > > context
> > > > for
> > > > other components. For example, we end up having to manually overrid=
e all
> > > > the
> > > > mesa-pvr.inc virtual providers in our machine config to use upstrea=
m
> > > > mesa =E2=80=94
> > > > something that bsp-mainline would handle naturally.
> > > >=20
> > > > The root issue is that initramfs integration (an image-level concer=
n) is
> > > > tied to
> > > > BSP version selection (a machine-level concern) in ti-soc.inc.
> > > >=20
> > > > A possible fix would be to move the initramfs logic to an image cla=
ss
> > > > (e.g.
> > > > ti-
> > > > image.bbclass) that images explicitly opt into. This would be a bre=
aking
> > > > change
> > > > for images relying on the current automatic behavior, but it would
> > > > properly
> > > > separate these concerns.
> > > I recognize what you are saying as an issue.
> > >=20
> > > We are in the process of moving to require an initramfs for all of ou=
r
> > > platforms as we transition to using modules for kernel features that =
the
> > > upstream kernel is unwilling to turn on by default (to keep the kerne=
l
> > > small).=C2=A0 We have been turning these features on by default in ou=
r vendor
> > > kernel, and we moving away from that.
> > >=20
> > > So there is a need to balance our need to make sure that everything i=
s
> > > in place at the BSP level, and the need for downstream customers in
> > > distro layers to build upon that initramfs and include their own chan=
ges.
> > >=20
> > > As I see it, we have two options.
> > >=20
> > > 1) Provide a mechanism to extend the ti-core-initramfs recipe to allo=
w
> > > you to put more stuff in there.
> > >=20
> > > 2) Go the class route and make it so that your initramfs (using the
> > > class) would make sure to include ALL of the needed modules into your
> > > initramfs and still register your initramfs with the images.
> > >=20
> > > Can you point me at the recipe that your initramfs is using so that w=
e
> > > can get an example of usage so we can plan for the best solution?
> > >=20
> > >=20
> > Thanks for the quick response.
> >=20
> > For context: we don't plan to use initramfs (at least not currently) - =
our
> > images boot directly to rootfs. The issue is that selecting bsp-mainlin=
e
> > forces
> > initramfs integration we don't need, and prevents us from benefiting fr=
om
> > bsp-
> > mainline's other configurations.
>=20
> Can you please explain more on the part of how initramfs integration is=
=20
> hampering other configs to get in. Also, what are those configurations.
>=20
>=20

The issue is with override precedence and future maintenanc.

In ti-bsp.inc, BSP selection controls kernel, bootloader, and GPU driver
versions through overrides like :bsp-mainline, :bsp-ti-6_12, etc.

For bsp-mainline and bsp-next, the GPU driver variables are intentionally l=
eft
empty because mesa-pvr doesn't support mainline kernels yet:

BSP_ROGUE_DRIVER_PROVIDER:bsp-mainline =3D ""
BSP_MESA_PVR_VERSION:bsp-mainline =3D ""

This falls back to software rendering, which is what we need.

Our problem is that we're running mainline-based kernels, so we should use
TI_PREFERRED_BSP =3D "mainline". However, we can't because bsp-mainline, bs=
p-next,
and bsp-ti_6_18 all force initramfs integration in ti-soc.inc.
Instead, we have to manually override mesa providers in our machine conf to
replicate what bsp-mainline already provides.

The real issue is future maintenance. When you add mesa-pvr support for mai=
nline
kernels and updates bsp-mainline accordingly, we won't automatically inheri=
t
those changes. We'll have to keep tracking and duplicating BSP updates manu=
ally.

The class approach actually works well for your modularization plan too. As=
 you
add modules to ti-core-initramfs, downstream users can extend it, create th=
eir
own, or skip it entirely. BSP selection stays at machine-level, initramfs a=
t
image-level.

Thoughts?


Best regards,
Vitor Soares

> Regards,
> Moteen
>=20
> > Proposed solution:
> > Move initramfs logic from ti-soc.inc to classes/ti-image.bbclass, and i=
mages
> > that need initramfs explicitly inherit ti-image. This separates machine=
-
> > level
> > BSP selection from image-level features (standard Yocto pattern). Break=
ing
> > change: your reference images need inherit ti-image added.
> >=20
> > Thoughts?
> >=20
> >=20
> > > > Would this approach be welcome? We're happy to contribute patches.
> > > >=20
> > > > Best regards,
> > > > Vitor Soares
> > > > Toradex
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#19475):
> > https://lists.yoctoproject.org/g/meta-ti/message/19475
> > Mute This Topic: https://lists.yoctoproject.org/mt/117717310/9997635
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=C2=A0[m-sha=
h@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


