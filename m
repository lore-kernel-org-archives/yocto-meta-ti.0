Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852AAE83848
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 23:50:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1467.1771285823467890089
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 15:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+4zEspY;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: ivitro@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so41156925e9.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Feb 2026 15:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771285822; x=1771890622; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LthLS0gxDuQRUX/nLox/vLPrCMxshG/P7Uopkr1a1XE=;
        b=C+4zEspYN6P7gS8kCqZRUJ2dcbspRJctF6/Sc5HA2nOHc+/zKNQCXTZ27iJX6eMZ8k
         L6Sqd3k0kMFVs2gzloHY6qpfeTUphSUy7Ga1zkN9dM+8qaSw5Uq9rTUMuXNts+JAcX6l
         CJsAbsUF4nYxBhWFWJ+y5c86HzcYSwgZMEHpVUp06kTeWJKSiqPAtaLOGa8WGRoec3IV
         15ZSWQXstc/Al8mAFQVuMFY0K6EN5DoYlnIDR9h++00RkzBXuQoaJQmX5qL7T/pnHD4E
         WfmAPBXM9WJEtUEh+SnDnJT9YoHAhF1icR7PYvP5p4u3yc2WvoXw/jz43KHjeqGILt5r
         loMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771285822; x=1771890622;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LthLS0gxDuQRUX/nLox/vLPrCMxshG/P7Uopkr1a1XE=;
        b=RlqsG8ZrVP7SUjTCC0c1zS+D47UvFd3dkpkNR33jzT+fw9c44eNcOO4mGT3jviXBLS
         uQO3+4g4xLT3pCzAnxG95v11ul5TjWbGXexU3wthyZhEQWbm9DzBQpDFLe4TDHaGJdQU
         ovipa3xhVzwHqJRzzsHrTZCjCVnbKgjjZaG2sDZiD3xigIkwGUe0kw+isC2UrSbKvohM
         lYwJFbSyz7L/tZ35Isvs7HdqmYTLH7yQMwFymVk9CIu3Em5c8X8WtLFuk1s8hQ5Y8R6X
         KcdsVAkBDyBjLUdo7KsHKaJ+P0y1BCo1xTlDgu/z0LR+JJxedRtRsLdvAmBTjmVGuQkR
         F+9w==
X-Gm-Message-State: AOJu0YwZ04f2v83eVu02D4Gt6MdqGHfN64iiV4fLad947lwdJI3s8hEe
	leiB3ee0Q0XKBEmzAnCZsTmhCMeOwUDTuyyvLxQj4+AWk+QaafNpjiuX
X-Gm-Gg: AZuq6aKTpFURSCVUFd0WQ+4PbgZivBTI/gd3MvnmBP11lgjMXSZCO1x1HRTa/ksnGz6
	uH/7+j/9vy2N+iC4ocvOKSq98MXcaAySzGjsvOlaY3tdCa8X5h2Kj9p7P5i3zdZvV5UVOTCJijz
	1DNB/t8589mMEhCXOQQmhtC5h4LBGbjGz1LImbxbSDwpwHdoUduxcYnfn27lGzrIwrdJKMWecpy
	smmyXjyAKyUwwVOWwmpIBL2pkANKCyCokhZC7tiYJwGmd9RFa7ZL0IUN3b4MFaEbJr2HH8m5KpU
	HIeO8+4L5UsitFgYOymxYVh5ki4RZmz3Z+q4fy6pIrqrVXcTHWkMQedDp5/9v/A1kA998BsRdp0
	XAHAYHDnCCE5aI+qweQ5bysIgH31qQ1x2iMNVC3RzM5og1/cqCWiX3WEjsm06lwtmbCacgEAJAZ
	s0AogdN7ur6rX04PTjh6IofZJXTTXrBD0RYRfDpF+HT+BkvQ==
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-48373a0f961mr183709835e9.14.1771285821408;
        Mon, 16 Feb 2026 15:50:21 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836cd7af87sm343052185e9.1.2026.02.16.15.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 15:50:20 -0800 (PST)
Message-ID: <a3d9320657dd150ce981741d56a85356d289d361.camel@gmail.com>
Subject: Re: [meta-ti] [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
From: Vitor Soares <ivitro@gmail.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com, 
	vitor.soares@toradex.com, francesco.dolcini@toradex.com
Date: Mon, 16 Feb 2026 23:50:19 +0000
In-Reply-To: <67b83eee-aeb9-4727-94bb-fe0015684675@ti.com>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
	 <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
	 <bb0eb4c0bf8543175b3aa50f0d954aafce56d576.camel@gmail.com>
	 <8a5487a0-824a-4f39-aa50-cf6466764574@ti.com>
	 <20260214162932.GN11121@denix.org>
	 <67b83eee-aeb9-4727-94bb-fe0015684675@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Feb 2026 23:50:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19520

On Mon, 2026-02-16 at 11:32 -0600, Andrew Davis wrote:
> On 2/14/26 10:29 AM, Denys Dmytriyenko wrote:
> > On Thu, Feb 12, 2026 at 04:03:34PM -0600, Andrew Davis via
> > lists.yoctoproject.org wrote:
> > > On 2/12/26 5:42 AM, Vitor Soares wrote:
> > > > On Wed, 2026-02-11 at 18:52 -0600, Andrew Davis wrote:
> > > > > On 2/11/26 11:15 AM, Vitor Soares via lists.yoctoproject.org wrot=
e:
> > > > > > Hi,
> > > > > > While working on our Toradex Aquila AM69 SoM support, we notice=
d
> > > > > > that k3.inc
> > > > > > defines:
> > > > > > SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
> > > > > >=20
> > > > > > This caused systemd to enable serial-getty@ttyS0.service=C2=A0o=
n our
> > > > > > board, where
> > > > > > ttyS0 maps to main_uart4 - a user-facing UART, not a debug/cons=
ole
> > > > > > UART. The
> > > > > > getty continuously outputs a login prompt, interfering with the
> > > > > > interface.
> > > > > >=20
> > > > > > This made us question whether SERIAL_CONSOLES belongs in SoC-le=
vel
> > > > > > include
> > > > > > files
> > > > > > at all. Our understanding is that the console getty is already
> > > > > > handled
> > > > > > automatically by systemd-getty-generator from the console=3D ke=
rnel
> > > > > > command
> > > > > > line argument, which makes SERIAL_CONSOLES potentially redundan=
t for
> > > > > > the
> > > > > > console
> > > > > > UART. Any additional UARTs beyond the console are board-specifi=
c and
> > > > > > arguably
> > > > > > belong in each machine config rather than a shared SoC include.
> > > > > >=20
> > > > > > We are not 100% certain about this reasoning and would love to =
hear
> > > > > > the
> > > > > > rationale behind the current approach. Are we missing something=
?
> > > > > > Would it
> > > > > > make
> > > > > > sense to either remove SERIAL_CONSOLES from the SoC includes or=
 at
> > > > > > minimum
> > > > > > use
> > > > > > =C2=A0=C2=A0 a weak assignment (?=3D) to allow boards to overri=
de cleanly?
> > > > >=20
> > > > > We simply noticed almost all our EVM boards used the same console
> > > > > UARTs and so
> > > > > refactored the definition into a more common place. But yes you a=
re
> > > > > correct
> > > > > that a file like k3.inc seems like it should contain only items c=
ommon
> > > > > to all
> > > > > users of the K3 SoC family, and not simply common to TI EVM board=
s.
> > > > > Changing
> > > > > the assignment in k3.inc to a weak one seem reasonable (although =
I
> > > > > think you
> > > > > can still just override regular assignments after you include k3.=
conf
> > > > > in
> > > > > your board conf)
> > > > >=20
> > > >=20
> > > >=20
> > > > You're right we can override it in our board configs, but I wanted =
to
> > > > share why
> > > > we think this is worth reconsidering.
> > > >=20
> > > > The issue is that SERIAL_CONSOLES in k3.inc mixes SoC capabilities =
with
> > > > board-
> > > > specific UART usage.
> > > >=20
> > > > The K3 SoC provides the UART peripherals, but doesn't determine whi=
ch
> > > > ones are
> > > > used for console, user interfaces, or other purposes - that's decid=
ed at
> > > > the
> > > > board level.
> > > >=20
> > > > Different boards use UARTs differently. On TI EVMs, ttyS2 or ttyS0 =
might
> > > > be the
> > > > debug console. On our Aquila AM69, ttyS2 is the console but ttyS0 i=
s a
> > > > user-
> > > > facing UART. Same SoC, different UART assignments.
> > > >=20
> > > > SERIAL_CONSOLES creates getty login prompts on listed UARTs, which =
is a
> > > > board/system integration concern.
> > > >=20
> > >=20
> > > I think the same could be said about `IMAGE_FSTYPES` which is also in
> > > `k3.inc`
> > > but really should depend on the type of media on a board.
> > >=20
> > > > If TI's EVM boards share the same UART configuration, would it make
> > > > sense to
> > > > have a ti-evm-common.inc instead of putting it in the SoC include?
> > > >=20
> > > > Happy to help with refactoring if you think this direction makes se=
nse.
> > > >=20
> > >=20
> > > This directions makes sense to me, I'd have no issue with a ti-evm-
> > > common.inc.
> >=20
> > This seems like an overkill for a single variable that can be easily
> > resolved
> > with a weak assignment. Moreover, this can quickly get out of hand with=
 SKs
> > and Beagles and how those sometimes have convoluted mixed ownership...
> >=20
> >=20
> > > Or even since it is just 1 or 2 lines that would need to be moved out=
,
> > > might
> > > be easier to just move those lines back out to the different board
> > > configs.
> > > If you want to send the patch then up to you.
> >=20
> > Isn't it how it used to be originally?
>=20
> Yes, I'm basically saying I'm okay with reverting my patch[0] that
> consolidated
> these[0].
>=20
> >=20
> > The idea of a generic setting getting weakly assigned with a sane defau=
lt
> > is specifically to make it easy for downstream layers to change, while =
keep
> > things maintainable upstream.
> >=20
> > We've been slowly trying to unify, cleanup and consolidate such setting=
s in
> > the past. To that extent, I keep reminding Ryan and others to avoid usi=
ng
> > :append override, which is hard to undo downstream, as well as use weak=
 +=3D
> > instead of =3D for assigning SoC and machine settings.
> >=20
>=20
> The patch that moved these to k3.inc used =3D, it should have used +=3D, =
so
> changing that to +=3D is also an option if we don't want to revert [0].
>=20
> Andrew
>=20
> [0]
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dbc894bf52eaa4359eaa64a6=
4e950accd099a81cb
>=20
> > We've seen instances where a sane generic default works for most of the
> > cases,
> > but for a couple of cases need to be changed in more specific location.
> > That's
> > why we have hierarchical include structure from most generic to most
> > specific:
> >=20
> > ti-soc.inc -> k3.inc -> j784s4.inc -> j784s4-evm.conf
> >=20
> > On the other hand, specifying U-boot defconfig (UBOOT_MACHINE/UBOOT_CON=
FIG)
> > is
> > almost always done in corresponding specific machine configs, simply be=
casue
> > there's no generic default...
> >=20
>=20

Thanks for looking into this.=20

From an integrator perspective, I wanted to share the challenge we faced: w=
hen=20
getty appeared on our user-facing UART, it wasn't immediately obvious this =
came
from an inherited k3.inc default rather than our board configuration.=20
We spent time investigating our device tree, systemd configs, and bootargs
before discovering it was set at the SoC level.

With systemd handling console getty automatically from console=3D, SERIAL_C=
ONSOLES
is mainly useful for additional serial ports with a login prompt, which are=
=20
inherently board-specific decisions.

Just wanted to share our experience as you consider the best approach.

Thanks,
Vitor

