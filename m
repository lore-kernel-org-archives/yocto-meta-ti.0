Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A69C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 06:16:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.32286.1698992164015576026
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 23:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B38A840C88;
	Fri,  3 Nov 2023 06:16:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0Hrct8Vu6J8; Fri,  3 Nov 2023 06:16:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2980040C61;
	Fri,  3 Nov 2023 06:15:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52758163D44; Fri,  3 Nov 2023 02:15:58 -0400 (EDT)
Date: Fri, 3 Nov 2023 02:15:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 8/8] recipes-bsp: Do not use
 MACHINE_ARCH when package is not machine specific
Message-ID: <20231103061558.GL2408@denix.org>
References: <20231025165630.2274889-1-afd@ti.com>
 <20231025165630.2274889-8-afd@ti.com>
 <20231026032740.GD2408@denix.org>
 <eed601f5-9a84-48c8-80a7-ac03bf48ed72@ti.com>
 <145580b2-dda0-4d36-b046-03f458929922@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <145580b2-dda0-4d36-b046-03f458929922@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 06:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17232

On Thu, Nov 02, 2023 at 09:57:11AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 10/26/2023 9:00 AM, Andrew Davis wrote:
> >On 10/25/23 10:27 PM, Denys Dmytriyenko wrote:
> >>On Wed, Oct 25, 2023 at 11:56:30AM -0500, Andrew Davis via
> >>lists.yoctoproject.org wrote:
> >>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>---
> >>>=A0 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb |=
 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=A0=A0=A0=A0=
=A0=A0=A0=A0 | 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb=A0=A0=
=A0=A0 | 1 -
> >>>=A0 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 | 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb=A0=A0=
 | 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb=A0=A0=A0=
=A0=A0=A0 | 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb=A0=A0=
 | 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb=A0=A0=
=A0=A0 | 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb |=
 2 --
> >>>=A0 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 | 1 -
> >>>=A0 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 1 -
> >>>=A0 11 files changed, 19 deletions(-)
> >>
> >>Overall I agree and fully support the first 7 patches in this series.
> >>
> >>But for this last one I wanted to open a discussion.
> >>
> >
> >I try to sort my series in least-to-most likely to be controversial, I=
 was
> >just wondering how far we would get down the list, glad we got to 8 :)
> >
> >>On one hand I understand the desire to make components as
> >>generic as possible
> >>and reduce the number of machine-specific components to a bare minimu=
m.
> >>
> >>But on another hand, marking the resulting package as
> >>machine-specific when it
> >>has a short list of compatible machines is a standard practice.
> >>The reason is
> >>that the list of compatible machines controls only compile time
> >>filtering, but
> >>doesn't have any effect on run time. And marking packages as
> >>machine specific
> >>helps with that. That closes the loophole of installing
> >>incompatible packages.
> >>
> >>For example, first recipe below specifies that Cadence MHDP firmware =
is
> >>compatible with 3 J7 platforms only (or their SoC families, to be exa=
ct).
> >>But w/o marking resulting binary package as machine-specific (therefo=
re
> >>producing separate packages for those platforms), there will be a sin=
gle
> >>generic Aarch64 package made. And there's no protection from installi=
ng
> >>this generic package on non-compatible platforms, like J7200 or AM65x=
x,
> >>either manullay or by pulling it into a rootfs for those incompatible
> >>platforms.
> >>
> >>And you normally want to prevent this for regular components. But I g=
uess
> >>this doesn't fully apply to FW images that are loaded by correspondin=
g
> >>drivers anyway. Moreover, there's no compilation involved, just packa=
ging
> >>the binary blob.
> >>
> >>In that case, should we also remove COMPATIBLE_MACHINE from
> >>these firmware
> >>recipes?
> >>
> >
> >That is exactly where I was going to go next. These firmware packages =
are
> >not technically incompatible with the other machines.
> >
> >We just use COMPATIBLE_MACHINE checks here to keep us from
> >accidentily bundling
> >them with images where they wouldn't add any value (which you did
> >with prusw-fw
> >which is what stated me thinking on all this). But since they don't br=
eak
> >anything either, forcing them to be machine specific seemed like
> >overkill also.
> >
> >Only place where we still need this is firmware recipes that only
> >ship some of
> >the firmware based on machine (see prueth-fw for instance). I'd like t=
o get
> >that cleaned up next. If we only want some of the firmware then we
> >should split
> >it into different packages (prueth-fw-am57xx, etc.) and only
> >install the one
> >we want for that platform.
>=20
> Denys, does Andrew's response address your concerns?

Well, I do believe we are generally in agreement here. But I'm not sure i=
f=20
that means we should merge patch #8 as is and address COMPATIBLE_MACHINE=20
changes later, or rework the patch to address that with MACHINE_ARCH toge=
ther?

--=20
Denys

