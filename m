Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8CAE78D74
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 16:31:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51610.1770654704441635339
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 08:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R858cV1r;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: ivitro@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43590777e22so1951149f8f.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 08:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770654703; x=1771259503; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yUaivRdX1WLmDw37T+TcS0k2RVCpwdP4Ix4zlmXj1KE=;
        b=R858cV1r3T7Rqzf0lXVu63KFFjnh62y6ZYRmvGYLb+x9NlbBSNycfq+E8qsjAGUiOM
         tesTEr7esakGukC+q9LvVkRh+8ejzvJPaSg+p/g5NPgeKlsD74zipa+gFBNelcKeokNn
         whZHw0q9IY0B29HpqAOGjziWf5aIj66UeofIWosVlzYA0t0Ork8x8Cnnzr1bXFkyhPX/
         ZfhxOz8A8YcRqA/2jbJWIX6Bd4q0JZr9XBZnhgYGi2QGRBnlWciTiudxuPfUAUOOAQCw
         T64OMyWPuA6rkTS+ypOwIskzLDiPvnRHnn8hw7cRM+0clyTGV3JO6gorM2BGF9jPfBbd
         GCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770654703; x=1771259503;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUaivRdX1WLmDw37T+TcS0k2RVCpwdP4Ix4zlmXj1KE=;
        b=n/K0knIZ35j4qoh7wsSpL09tMvvoAtNbgtVKNNMiYWXok4qGAS+t/HTXS0HxXT13xK
         vtUMXIMoIbNmeBkWP1GG5WpFyOfz5uPHL3w0lgcEZuC56KkqRWv6SF8Jm5ODTdWd7Vtt
         EZyQYCeAIkszWYpTtyYBmGbXztRBp6euVRTmJGdN4/Lvs3d7ie5enanB2AaLL3jTEj01
         WT3PDq6BdBeAzD5VDhppdF94a/N2dB49bc82E7+b7wRsCU2Oxlv0LQSdgkjB6gvQU9kM
         aDQu3kY1zd1XruuQpXR5wHaBcFgWuXKTmR77RyFJ5pH/SR1iwP3q4PvBsMR2Cmj054oX
         7fYg==
X-Forwarded-Encrypted: i=1; AJvYcCXOuCvXz7/oEyzYCCwOxmjQTVmbt8b9JZipuGGlaW+KNuJE9uCLS6wIvOpQhH+pPax/eKTetR+g@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzvG9KVYd5kVwDzio2cKcKrQU1xidvdy8YPCgRYdYFR81wTbDlc
	gZ+SdikVa1WlSxoablnG+XZi5yDrQl2aNBqNQVvhg7iIpuaCVtNCFVAB
X-Gm-Gg: AZuq6aIQllpPgNNjjFzfwtSjVxHGI55YAyBwtdz0gdAzdVLudKw+jEH+S8KRNiETOem
	PDSz+SfTJq0BiVd9eLlStHuL6sKAB4W/FXGgsF03YB5a0Ig2g1YG6/1LEfMZSerPtIkUIf1QJhP
	5gyshgKhidmm5/vTMveS7Btg3nmAmJtKCBBj3J/8g9ktL1wkjY8kc0g3jcC52mQRRaCdlnetRr5
	sru6fGFQEe4GvgWXNAS+T9ZP6scFSYOCuhaljqZqN4wgFI7VX47KU2dRcLVMV3JppgRCrx7ebgX
	PtUs3yGN1TTUZdSW/Un1JL/9TQGzporLx9hqSH+qXNFztslvL1sBrwB3RevBIRqv/Fo3jkIhgvq
	ZVdYOJzrQwr/0FnpbzBS6QNA+d9tB/sYRGvO457TKvD07flixIXw6EauGqQcjhLyYNMhpzmJwd3
	mmWdmXBzAcQv+fp0pmGGLSqTfZI1/apHgdpA==
X-Received: by 2002:a05:6000:1ac5:b0:431:67d:53b3 with SMTP id ffacd0b85a97d-436293babaamr17458580f8f.43.1770654702523;
        Mon, 09 Feb 2026 08:31:42 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376b62b835sm14234561f8f.12.2026.02.09.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:31:42 -0800 (PST)
Message-ID: <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
From: Vitor Soares <ivitro@gmail.com>
To: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Cc: denys@konsulko.com, vitor.soares@toradex.com
Date: Mon, 09 Feb 2026 16:31:40 +0000
In-Reply-To: <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
	 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19475

On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
>=20
>=20
> On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrote:
> > Hi meta-ti maintainers,
> >=20
> > We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED_BSP=
 =3D
> > "mainline") also forces initramfs integration via ti-soc.inc (lines 32-=
49).
> > The
> > bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditionally s=
et
> > BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_FILES=
.
> >=20
> > This means we can't use bsp-mainline without also pulling in ti-core-
> > initramfs =E2=80=94
> > even when our images don't need it.
> >=20
> > Since we can't use bsp-mainline, we also lose the correct override cont=
ext
> > for
> > other components. For example, we end up having to manually override al=
l the
> > mesa-pvr.inc virtual providers in our machine config to use upstream me=
sa =E2=80=94
> > something that bsp-mainline would handle naturally.
> >=20
> > The root issue is that initramfs integration (an image-level concern) i=
s
> > tied to
> > BSP version selection (a machine-level concern) in ti-soc.inc.
> >=20
> > A possible fix would be to move the initramfs logic to an image class (=
e.g.
> > ti-
> > image.bbclass) that images explicitly opt into. This would be a breakin=
g
> > change
> > for images relying on the current automatic behavior, but it would prop=
erly
> > separate these concerns.
>=20
> I recognize what you are saying as an issue.
>=20
> We are in the process of moving to require an initramfs for all of our=
=20
> platforms as we transition to using modules for kernel features that the=
=20
> upstream kernel is unwilling to turn on by default (to keep the kernel=
=20
> small).=C2=A0 We have been turning these features on by default in our ve=
ndor=20
> kernel, and we moving away from that.
>=20
> So there is a need to balance our need to make sure that everything is=
=20
> in place at the BSP level, and the need for downstream customers in=20
> distro layers to build upon that initramfs and include their own changes.
>=20
> As I see it, we have two options.
>=20
> 1) Provide a mechanism to extend the ti-core-initramfs recipe to allow=
=20
> you to put more stuff in there.
>=20
> 2) Go the class route and make it so that your initramfs (using the=20
> class) would make sure to include ALL of the needed modules into your=20
> initramfs and still register your initramfs with the images.
>=20
> Can you point me at the recipe that your initramfs is using so that we=
=20
> can get an example of usage so we can plan for the best solution?
>=20
>=20

Thanks for the quick response.

For context: we don't plan to use initramfs (at least not currently) - our
images boot directly to rootfs. The issue is that selecting bsp-mainline fo=
rces
initramfs integration we don't need, and prevents us from benefiting from b=
sp-
mainline's other configurations.

Proposed solution:
Move initramfs logic from ti-soc.inc to classes/ti-image.bbclass, and image=
s
that need initramfs explicitly inherit ti-image. This separates machine-lev=
el
BSP selection from image-level features (standard Yocto pattern). Breaking
change: your reference images need inherit ti-image added.

Thoughts?


> > Would this approach be welcome? We're happy to contribute patches.
> >=20
> > Best regards,
> > Vitor Soares
> > Toradex
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#19472):
> > https://lists.yoctoproject.org/g/meta-ti/message/19472
> > Mute This Topic: https://lists.yoctoproject.org/mt/117717310/6551054
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=C2=A0[reatm=
on@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20


