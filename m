Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B805C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:34:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.42262.1680219265701351584
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 16:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 89E6F40C6C;
	Thu, 30 Mar 2023 23:34:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7VZnI-lERlQW; Thu, 30 Mar 2023 23:34:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5D2EB40ACD;
	Thu, 30 Mar 2023 23:34:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E287F1637E5; Thu, 30 Mar 2023 19:33:46 -0400 (EDT)
Date: Thu, 30 Mar 2023 19:33:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-ti@lists.yoctoproject.org,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [RFC][meta-ti][master][PATCH] meta-ti-bsp: Update mesa
 bbappend files for mesa-23
Message-ID: <20230330233346.GY18050@denix.org>
References: <20230327170809.2115712-1-theodore_roth@trimble.com>
 <20230328152532.GT18050@denix.org>
 <CAFMvBt2nEG5vbwU4rWBkccP4rsS1HgQQtHmzbWowHWXt7U5Tww@mail.gmail.com>
 <17510146708825FD.12651@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17510146708825FD.12651@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 23:34:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16267

On Wed, Mar 29, 2023 at 05:31:38PM -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 28, 2023 at 12:59:31PM -0600, Theodore A. Roth wrote:
> > On Tue, Mar 28, 2023 at 9:26=E2=80=AFAM Denys Dmytriyenko <denis@deni=
x.org> wrote:
> > >
> > > Thanks for the patch!
> > >
> > > Has version 23 been tested with the PowerVR patches for HW accelera=
tion?
> >=20
> > We have not tested PowerVR stuff  as our product is headless.
> > Our builds are currently broken since we are tracking master for all
> > of the meta layer git repositories we use.
> >=20
> > My intention for the patch was to bring the breakage to the attention
> > of meta-ti since master has
> > been broken for more than a week with no comments on the mailing list
> > (hence the RFC tag).
> >=20
> > Now that the discussion has been started, I'm more than happy to help
> > out where I can to get this resolved.
>=20
> So, master is currently going through the test cycle due to the recent=20
> patchset, so may take a bit longer.
>=20
> I'll try to do some testing with this change, but so far looks good to =
me:
>=20
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

Seems to be working fine with some minimal testing I've done locally, so=20
should be good to go. Thanks.


> > > On Mon, Mar 27, 2023 at 11:08:09AM -0600, Theodore A. Roth wrote:
> > > > From: "Theodore A. Roth" <troth@openavr.org>
> > > >
> > > > The mesa recipes in oe-core have been updated to mesa-23 causing =
the
> > > > following build error:
> > > >
> > > >     $ bitbake core-image-minimal
> > > >     Loading cache: 100% |                                        =
       | ETA:  --:--:--
> > > >     Loaded 0 entries from dependency cache.
> > > >     Parsing recipes: 100% |######################################=
#######| Time: 0:00:20
> > > >     Parsing of 2816 .bb files complete (0 cached, 2816 parsed). 4=
472 targets, 484 skipped, 0 masked, 0 errors.
> > > >     ERROR: No recipes in default available for:
> > > >       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa=
-gl_22.%.bbappend
> > > >       /build/../oe/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa=
_22.%.bbappend
> > > >
> > > >     Summary: There was 1 ERROR message, returning a non-zero exit=
 code.
> > > >
> > > > Signed-off-by: Theodore A. Roth <troth@openavr.org>
> > > > Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> > > > ---
> > > >  .../mesa/{mesa-gl_22.%.bbappend =3D> mesa-gl_23.%.bbappend}     =
    | 0
> > > >  .../mesa/{mesa_22.%.bbappend =3D> mesa_23.%.bbappend}           =
    | 0
> > > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > > >  rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend =
=3D> mesa-gl_23.%.bbappend} (100%)
> > > >  rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend =3D=
> mesa_23.%.bbappend} (100%)
> > > >
> > > > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbapp=
end b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> > > > similarity index 100%
> > > > rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappe=
nd
> > > > rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_23.%.bbappend
> > > > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend=
 b/meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend
> > > > similarity index 100%
> > > > rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> > > > rename to meta-ti-bsp/recipes-graphics/mesa/mesa_23.%.bbappend

