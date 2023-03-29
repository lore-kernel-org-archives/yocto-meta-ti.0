Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942B0C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 21:32:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9895.1680125536926966361
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 14:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DBCFD40C46;
	Wed, 29 Mar 2023 21:32:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9b27vPrPvfh; Wed, 29 Mar 2023 21:32:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0EA540A0B;
	Wed, 29 Mar 2023 21:32:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B46D71637E6; Wed, 29 Mar 2023 17:31:38 -0400 (EDT)
Date: Wed, 29 Mar 2023 17:31:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-ti@lists.yoctoproject.org,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [RFC][meta-ti][master][PATCH] meta-ti-bsp: Update mesa
 bbappend files for mesa-23
Message-ID: <20230329213138.GW18050@denix.org>
References: <20230327170809.2115712-1-theodore_roth@trimble.com>
 <20230328152532.GT18050@denix.org>
 <CAFMvBt2nEG5vbwU4rWBkccP4rsS1HgQQtHmzbWowHWXt7U5Tww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFMvBt2nEG5vbwU4rWBkccP4rsS1HgQQtHmzbWowHWXt7U5Tww@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Mar 2023 21:32:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16253

On Tue, Mar 28, 2023 at 12:59:31PM -0600, Theodore A. Roth wrote:
> On Tue, Mar 28, 2023 at 9:26=E2=80=AFAM Denys Dmytriyenko <denis@denix.=
org> wrote:
> >
> > Thanks for the patch!
> >
> > Has version 23 been tested with the PowerVR patches for HW accelerati=
on?
>=20
> We have not tested PowerVR stuff  as our product is headless.
> Our builds are currently broken since we are tracking master for all
> of the meta layer git repositories we use.
>=20
> My intention for the patch was to bring the breakage to the attention
> of meta-ti since master has
> been broken for more than a week with no comments on the mailing list
> (hence the RFC tag).
>=20
> Now that the discussion has been started, I'm more than happy to help
> out where I can to get this resolved.

So, master is currently going through the test cycle due to the recent=20
patchset, so may take a bit longer.

I'll try to do some testing with this change, but so far looks good to me=
:

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>



> > On Mon, Mar 27, 2023 at 11:08:09AM -0600, Theodore A. Roth wrote:
> > > From: "Theodore A. Roth" <troth@openavr.org>
> > >
> > > The mesa recipes in oe-core have been updated to mesa-23 causing th=
e
> > > following build error:
> > >
> > >     $ bitbake core-image-minimal
> > >     Loading cache: 100% |                                          =
     | ETA:  --:--:--
> > >     Loaded 0 entries from dependency cache.
> > >     Parsing recipes: 100% |########################################=
#####| Time: 0:00:20
> > >     Parsing of 2816 .bb files complete (0 cached, 2816 parsed). 447=
2 targets, 484 skipped, 0 masked, 0 errors.
> > >     ERROR: No recipes in default available for:
> > >       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-g=
l_22.%.bbappend
> > >       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_2=
2.%.bbappend
> > >
> > >     Summary: There was 1 ERROR message, returning a non-zero exit c=
ode.
> > >
> > > Signed-off-by: Theodore A. Roth <troth@openavr.org>
> > > Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> > > ---
> > >  .../mesa/{mesa-gl_22.%.bbappend =3D> mesa-gl_23.%.bbappend}       =
  | 0
> > >  .../mesa/{mesa_22.%.bbappend =3D> mesa_23.%.bbappend}             =
  | 0
> > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > >  rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend =3D=
> mesa-gl_23.%.bbappend} (100%)
> > >  rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend =3D> =
mesa_23.%.bbappend} (100%)
> > >
> > > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappen=
d b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> > > similarity index 100%
> > > rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> > > rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> > > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b=
/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> > > similarity index 100%
> > > rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> > > rename to meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend

