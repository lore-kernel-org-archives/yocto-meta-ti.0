Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C069ECD6DA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 18:48:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26776.1770835700377986109
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 10:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0xbvgGN;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: ivitro@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-436e87589e8so3368677f8f.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 10:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835699; x=1771440499; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AFFYuqduAWuDaNq9E7dlk8opJe7LSAo6zyHnK347jTo=;
        b=h0xbvgGNafkGm7JYPVa/GwE3s9JZHHgMxmrS9ur+zsE4tDohzU081w6IFXVagAcV1M
         spLKdeLAVutb07BUMS/caLUk4lmwBkRsNTcz/77NmJuxnHmXhR/FBIzV05J3K4JJbh5h
         VOxAq0tLh9M3tlk/ER2brXcINaMweKA1VxBWZeirXS6LWOR69NZv9q3wKd56UbT1zR3T
         eIURpjARu4ESiuDV+SOYorYJperkv8zsjyx+fFM3hSBuJ6D6FxwWHtnawSISOyZJcwrf
         6sTIwIkvir4ZBvMDx7Slo/s9RBt4yo3ouJNiCLm+AGmNMepUZdkJ4gv1K0Dkw10vIED6
         LydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835699; x=1771440499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFFYuqduAWuDaNq9E7dlk8opJe7LSAo6zyHnK347jTo=;
        b=ETzshj6MTUpxFb2C2JGTYgE4cREbYeklpTKmnmOoMmeQ8tegNk5saVMxtbH32F9eqy
         iHr6JSmtl0GQFOPvdf+dKczFml+hmXu7qZdnTx1XNHmfg2WmIIdq2OGTNDPBmHv97xbV
         y//69uUA47pvvudt8lSCy7FMpb3cTxDfW3plevO1uhYxEi9VHvjAbQgtpAcG1TM4p32C
         0Y7Sq4Yfq89AQvNyQ1/vNiZesSuxgSainrcdnuHPI4aaDJTrqCrnRkw92TlRcclUoQOk
         A7+9rEJ6yABJDbWJggM230XpwIc24j4J66f6MpOS9DnoaIlDzkujLXBhqGFZwj1Ytj3t
         +ckw==
X-Forwarded-Encrypted: i=1; AJvYcCXFYt/jnE9QeTZCHBwdTKuADRlyd6grajmNvdhODdAQZTOJrMf+ID267I+fN9yRV8iU1HN7mWa4@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwbcaKDNZ+uoZYTu1oLtZPXjeAOUfD/JahcNzT+1hEnglbwXH4v
	eopVYOYPxhcVU1X2zIK24+SGhAmrW0uITXz1zZCPZfn3AQ+OKaA8Vy3/
X-Gm-Gg: AZuq6aJ79DujKL9L34vurB9q7f+K7K/WZSwtI9vnvlJZXLLjvw6vYi1HDKnRhtE9ZQr
	tmr/DyC58IBOn6hqT8ghMvfOllHt2kKwTZgTOId/VDPiHiLtZG1OvmxY9HuuDLN+zmyao115RCQ
	D40WdrmBaltpp0qh7CV+LFB7GA5xeGvtDaGAvluVdGRcKVF1ib6m+XVJO9q8oDMk1R2VSiTp4Vi
	eBR3dypKEIGMNKgAHWc+qDYRnJyLogEGiXpND2byuexcR+9ST0+u4DX2K5aAyjUNfEy97knzBLG
	T2SDWVMGCL5Z/a4cl/8lYhWvMozsDhF80jKXjrPQuBeFLfZy21qUizmlQGMb3iEawVLA8aZPGOV
	hneSH8U10AhCLp9YrRM0o1ACJ4fQj829uUY3uhDlNpxmWmjZLdOBDO8ByZVn61gand9jOy+aAXO
	Q5bp/PsfFbOST/SF1H72YEE6+OAQn8mWUnk9ZAeW3uNpvJ8g==
X-Received: by 2002:a05:6000:4008:b0:435:bcbe:d104 with SMTP id ffacd0b85a97d-4378ad959f3mr527727f8f.34.1770835698453;
        Wed, 11 Feb 2026 10:48:18 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfda66sm6603500f8f.22.2026.02.11.10.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:48:18 -0800 (PST)
Message-ID: <4b862070791c1b8fca67bf19a09a34d5c1180684.camel@gmail.com>
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
From: Vitor Soares <ivitro@gmail.com>
To: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Cc: denys@konsulko.com, vitor.soares@toradex.com
Date: Wed, 11 Feb 2026 18:48:16 +0000
In-Reply-To: <205a16be-e76e-4658-966a-f585eb84943e@ti.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
	 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
	 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
	 <205a16be-e76e-4658-966a-f585eb84943e@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 18:48:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19485

On Wed, 2026-02-11 at 11:50 -0600, Ryan Eatmon wrote:
>=20
>=20
> On 2/9/2026 10:31 AM, Vitor Soares via lists.yoctoproject.org wrote:
> > On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
> > >=20
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
> > >=20
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
> >=20
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
> >=20
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
>=20
> I'm not sure you are 100% understanding what I'm saying.
>=20
> Starting with 6.18 and forward (including mainline and next since they=
=20
> are always "forward"), we are requiring the initramfs for some of the=20
> platforms (am62a, j721e, j784s4).=C2=A0 Without the initramfs providing t=
he=20
> needed kernel modules you will not boot to the rootfs.=C2=A0 The board wi=
ll=20
> just not work.
>=20
> So even if right now you are not using an initramfs, then for those=20
> platforms you will need to start unless you take extra steps to force=20
> the required modules to be compiled into the kernel via config fragments.
>=20
> Those modules were previously turned on in our vendor kernel (and never=
=20
> for mainline/next), and we are no longer going to do that.
>=20
> That all being said, I will send a patch soon (need to test things=20
> first) that will do the following:
>=20
> 1) Limit creation/requirement for the ti-core-initramfs to just=20
> platforms that require it.
>=20
> 2) Allow you to disable the ti-core-initramfs completely by setting a=20
> variable.=C2=A0 BUT... you will be required to provide the needed modules=
 in=20
> some way to get your image to boot either by adding a config fragment in=
=20
> the kernel, or doing your own initramfs and including the needed modules=
=20
> (which you can use the variable from the machine conf files to get that=
=20
> list).
>=20
Thanks for the detailed explanation and apologies for not providing enough
context upfront.

We're Toradex, maintaining meta-toradex-ti BSP layer for our TI-based SoMs,
including Aquila AM69. We use our own kernel and bootloader recipes based o=
n
vanilla mainline with our own defconfigs.

Since we control our own kernel config, we can build needed drivers as buil=
t-in
if necessary. Currently we don't plan to use initramfs.

The issue we're trying to solve: we want to use `TI_PREFERRED_BSP =3D "main=
line"`
to get the BSP override context without being forced into the initramfs
workflow.

Your proposed opt-out variable would work for our immediate need. We'd disa=
ble
ti-core-initramfs and manage our own kernel configuration as needed.

That said, I still think the class-based approach is cleaner long-term
architecture - it properly separates BSP selection (machine-level) from
initramfs integration (image-level). If you're open to exploring that direc=
tion,
I'm happy to help.

Thanks for working on this.

Best regards,
Vitor Soares
Toradex

