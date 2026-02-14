Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0B2EF5848
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 16:29:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8941.1771086580624372471
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 14 Feb 2026 08:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DDE140CB1;
	Sat, 14 Feb 2026 16:29:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7bItJsNdp20; Sat, 14 Feb 2026 16:29:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF28540BA8;
	Sat, 14 Feb 2026 16:29:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0A3B717882F; Sat, 14 Feb 2026 11:29:32 -0500 (EST)
Date: Sat, 14 Feb 2026 11:29:32 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Vitor Soares <ivitro@gmail.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com, denys@konsulko.com, vitor.soares@toradex.com,
	francesco.dolcini@toradex.com
Subject: Re: [meta-ti] [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
Message-ID: <20260214162932.GN11121@denix.org>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
 <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
 <bb0eb4c0bf8543175b3aa50f0d954aafce56d576.camel@gmail.com>
 <8a5487a0-824a-4f39-aa50-cf6466764574@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <8a5487a0-824a-4f39-aa50-cf6466764574@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Feb 2026 16:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19516

On Thu, Feb 12, 2026 at 04:03:34PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
> On 2/12/26 5:42 AM, Vitor Soares wrote:
> >On Wed, 2026-02-11 at 18:52 -0600, Andrew Davis wrote:
> >>On 2/11/26 11:15 AM, Vitor Soares via lists.yoctoproject.org wrote:
> >>>Hi,
> >>>While working on our Toradex Aquila AM69 SoM support, we noticed tha=
t k3.inc
> >>>defines:
> >>>SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
> >>>
> >>>This caused systemd to enable serial-getty@ttyS0.service=A0on our bo=
ard, where
> >>>ttyS0 maps to main_uart4 - a user-facing UART, not a debug/console U=
ART. The
> >>>getty continuously outputs a login prompt, interfering with the inte=
rface.
> >>>
> >>>This made us question whether SERIAL_CONSOLES belongs in SoC-level i=
nclude
> >>>files
> >>>at all. Our understanding is that the console getty is already handl=
ed
> >>>automatically by systemd-getty-generator from the console=3D kernel =
command
> >>>line argument, which makes SERIAL_CONSOLES potentially redundant for=
 the
> >>>console
> >>>UART. Any additional UARTs beyond the console are board-specific and
> >>>arguably
> >>>belong in each machine config rather than a shared SoC include.
> >>>
> >>>We are not 100% certain about this reasoning and would love to hear =
the
> >>>rationale behind the current approach. Are we missing something? Wou=
ld it
> >>>make
> >>>sense to either remove SERIAL_CONSOLES from the SoC includes or at m=
inimum
> >>>use
> >>> =A0 a weak assignment (?=3D) to allow boards to override cleanly?
> >>
> >>We simply noticed almost all our EVM boards used the same console UAR=
Ts and so
> >>refactored the definition into a more common place. But yes you are c=
orrect
> >>that a file like k3.inc seems like it should contain only items commo=
n to all
> >>users of the K3 SoC family, and not simply common to TI EVM boards. C=
hanging
> >>the assignment in k3.inc to a weak one seem reasonable (although I th=
ink you
> >>can still just override regular assignments after you include k3.conf=
 in
> >>your board conf)
> >>
> >
> >
> >You're right we can override it in our board configs, but I wanted to =
share why
> >we think this is worth reconsidering.
> >
> >The issue is that SERIAL_CONSOLES in k3.inc mixes SoC capabilities wit=
h board-
> >specific UART usage.
> >
> >The K3 SoC provides the UART peripherals, but doesn't determine which =
ones are
> >used for console, user interfaces, or other purposes - that's decided =
at the
> >board level.
> >
> >Different boards use UARTs differently. On TI EVMs, ttyS2 or ttyS0 mig=
ht be the
> >debug console. On our Aquila AM69, ttyS2 is the console but ttyS0 is a=
 user-
> >facing UART. Same SoC, different UART assignments.
> >
> >SERIAL_CONSOLES creates getty login prompts on listed UARTs, which is =
a
> >board/system integration concern.
> >
>=20
> I think the same could be said about `IMAGE_FSTYPES` which is also in `=
k3.inc`
> but really should depend on the type of media on a board.
>=20
> >If TI's EVM boards share the same UART configuration, would it make se=
nse to
> >have a ti-evm-common.inc instead of putting it in the SoC include?
> >
> >Happy to help with refactoring if you think this direction makes sense=
.
> >
>=20
> This directions makes sense to me, I'd have no issue with a ti-evm-comm=
on.inc.

This seems like an overkill for a single variable that can be easily reso=
lved=20
with a weak assignment. Moreover, this can quickly get out of hand with S=
Ks=20
and Beagles and how those sometimes have convoluted mixed ownership...


> Or even since it is just 1 or 2 lines that would need to be moved out, =
might
> be easier to just move those lines back out to the different board conf=
igs.
> If you want to send the patch then up to you.

Isn't it how it used to be originally?

The idea of a generic setting getting weakly assigned with a sane default=
=20
is specifically to make it easy for downstream layers to change, while ke=
ep=20
things maintainable upstream.

We've been slowly trying to unify, cleanup and consolidate such settings =
in=20
the past. To that extent, I keep reminding Ryan and others to avoid using=
=20
:append override, which is hard to undo downstream, as well as use weak +=
=3D=20
instead of =3D for assigning SoC and machine settings.

We've seen instances where a sane generic default works for most of the c=
ases,=20
but for a couple of cases need to be changed in more specific location. T=
hat's=20
why we have hierarchical include structure from most generic to most spec=
ific:

ti-soc.inc -> k3.inc -> j784s4.inc -> j784s4-evm.conf

On the other hand, specifying U-boot defconfig (UBOOT_MACHINE/UBOOT_CONFI=
G) is=20
almost always done in corresponding specific machine configs, simply beca=
sue=20
there's no generic default...

--=20
Denys

