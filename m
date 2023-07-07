Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F90EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 21:16:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6284.1688764605111516454
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5054140C83;
	Fri,  7 Jul 2023 21:16:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DFUh908qxKK; Fri,  7 Jul 2023 21:16:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EF8540C30;
	Fri,  7 Jul 2023 21:16:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BBAE1163BF0; Fri,  7 Jul 2023 17:16:39 -0400 (EDT)
Date: Fri, 7 Jul 2023 17:16:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Ricardo Salveti <ricardo@foundries.io>, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5:
 allow customization by donwstream layers
Message-ID: <20230707211639.GI1518@denix.org>
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com>
 <20230130171811.GJ22689@denix.org>
 <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com>
 <CAAaKDhGj8oTZ-j-gnTfHs5Ra3d3qAYbgiSR+5YYzcvJ+wKiQXQ@mail.gmail.com>
 <CANPvuRnuzyKntNsVW_6xuLiSVdzuaHghKsqPUDMcyKajEu5O6g@mail.gmail.com>
 <20230706183939.GE1518@denix.org>
 <CANPvuRnkF+xit-M0wkwTcVtVAypbWfiuQGWhiADcUa3MAMtPXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRnkF+xit-M0wkwTcVtVAypbWfiuQGWhiADcUa3MAMtPXg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 21:16:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16834

On Fri, Jul 07, 2023 at 10:14:54AM +0100, Jose Quaresma wrote:
> Denys Dmytriyenko <denis@denix.org> escreveu no dia quinta, 6/07/2023 =E0=
(s)
> 19:39:
>=20
> > As you noted yourself in that thread, your patches were workarounds a=
nd
> > just
> > masking the actual issue w/o clearly articulating it. The actual race
> > issue
> > has been under investigation for quite some time and I've discussed i=
t
> > with
> > Richard before. Luckily he was finally able to root-cause and fix it!
> >
>=20
> I have reverted my hack to unshare the tmp directory in my distro when
> using the oe-core master branch
> after the recent spdx changes [1] and everything seems to be okay on my
> tests.
> The Richard bitbake multiconfig patch to fix the licence collision is f=
or

Couple comments:

1. This was not a mere "license collision", it could affect any deferred =
task=20
and there were tons of them when building lots of multiconfigs - you'd se=
e a=20
lot of corresponding Notices scrolling by[0]. I've hit it few times in th=
e=20
past and mentioned it to Richard.

[0] https://lists.openembedded.org/g/bitbake-devel/topic/99974646

2. We are not using SPDX class here. But from the description of the comm=
it=20
that you've linked I see a common generic issue of overlapping files caus=
ing=20
manifest errors. But normally you'd see them when trying to re-use temp d=
ir=20
and/or deploy dir between the builds for different machines...


> sure another help to use the shared tmp folder.
> However on kisstone I still use the tmp unshared between machines in
> multiconfig because the problems were many and
> I still don't feel safe to revert to the method used on meta-ti kirksto=
ne.
>=20
> [1]
> https://git.yoctoproject.org/poky/commit/meta/classes/create-spdx-2.2.b=
bclass?id=3D42071227f6f54055d8ac44126ab1d95f83f5b264
>=20
>=20
> > BTW, I'm working on a change that I'm about to submit here, which
> > indirectly
> > gives you separate TMPDIR for k3r5 - stay tuned.
> >
>=20
> I'm looking forward to it because the hack I'm using is really ugly and=
 I'd
> like to drop it also on the kirkstone branch.
>=20
> Cheers,
> Jose
>=20
>=20
> >
> >
> > On Wed, Jul 05, 2023 at 09:17:44AM +0100, Jose Quaresma wrote:
> > > Just for your information there are more complaints about that issu=
e [1]
> > of
> > > some bad side effects of sharing the TMP folder in multi configs.
> > >
> > > [1] https://lists.openembedded.org/g/bitbake-devel/message/14860
> > >
> > > Jose
> > >
> > > Ricardo Salveti <ricardo@foundries.io> escreveu no dia segunda,
> > 30/01/2023
> > > =E0(s) 18:27:
> > >
> > > > On Mon, Jan 30, 2023 at 2:57 PM Jose Quaresma <quaresma.jose@gmai=
l.com
> > >
> > > > wrote:
> > > > > Denys Dmytriyenko <denis@denix.org> escreveu no dia segunda,
> > 30/01/2023
> > > > =E0(s) 17:18:
> > > > >>
> > > > >> On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via
> > > > lists.yoctoproject.org wrote:
> > > > >> >
> > > > >> >
> > > > >> > On 1/30/2023 9:20, Jose Quaresma wrote:
> > > > >> > >This patch adds the possibility to change some bitbake vari=
able
> > > > >> > >that cannot be changed anywhere else, one of then is the TM=
PDIR.
> > > > >> > >
> > > > >> > >Using the same TMPDIR it is very sensitive and prone to sev=
eral
> > > > errors
> > > > >> > >when used in more complex situations.
> > > > >> > >This configuration forces that all native packages have to =
be the
> > > > same between all
> > > > >> > >machines and this requirement is very easy to break.
> > > > >> > >Suppose you use a macinhe override somewhere on a native re=
cipe
> > > > >>
> > > > >> Even w/o multiconfig, this will break for multi-machine builds=
.
> > Native
> > > > >> packages are for the build host and have no knowledge about th=
e
> > target.
> > > > >> You should probably look into cross packages instead of native=
 ones
> > for
> > > > >> this use case.
> > > > >>
> > > > >> Altering native packages between different targets will cause =
them
> > to
> > > > >> rebuild, which they shouldn't. Moreover, it will mess up your =
sstate
> > > > >> and lead to weird issues down the road when trying to re-use y=
our
> > > > >> sstate mirror/cache.
> > > > >
> > > > > Is that the issue of rebuilding some native packages that I am
> > trying to
> > > > avoid.
> > > > > But it is very hard to fix this in OE-core and everything else =
layers
> > > > what happens.
> > > > >
> > > > > For your information I have some other issues with multiconfig =
and
> > > > native packages
> > > > > that have the source files provided on the layer. this two reci=
pes
> > don't
> > > > work with the
> > > > > rm_work bbclass because the in one of the machines
> > > > > texinfo-dummy-native gettext-minimal-native
> > > > >
> > > > > Another issue is that sometimes one of the machines uses the
> > > > SOURCE_DATE_EPOCH_FALLBACK
> > > > > and the other uses  SOURCE_DATE_EPOCH and this also triggers a
> > rebuild
> > > > of one of the machines.
> > > > >
> > > > > Recently a new issue with the rm_work and the spdx
> > > > > comes in
> > > > https://lists.openembedded.org/g/openembedded-core/message/174276
> > > > > where I have the steps to reproduce.
> > > > >
> > > > > All of these issues can be solved easily with TMDIR for each ma=
chine,
> > > > > but because I understand it can be invasive I submit this patch=
 that
> > > > doesn't change anything
> > > > > in meta-ti but can add the possibility to use a different TMPDI=
R for
> > > > each machine.
> > > > >
> > > > > A different TMPDIR for each machine is also referenced in the
> > official
> > > > documentation
> > > > > "Minimally, each configuration file must define the machine and=
 the
> > > > temporary directory BitBake uses for the build. Suggested practic=
e
> > dictates
> > > > that you do not overlap the temporary directories used during the
> > builds."
> > > > >
> > > >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-use=
r-manual-intro.html#executing-a-multiple-configuration-build
> > > > >
> > > > >> > >and this requirement is no longer met.
> > > > >> > >Many of these anomalies can be verified with the use of the
> > rm_work
> > > > and
> > > > >> > >create-spdx bitbake classes.
> > > > >> > >
> > > > >> > >A previous attempt [1] had already been made but was refuse=
d
> > > > >> > >but this way it can be done without side effects for other =
users.
> > > > >> > >
> > > > >> > >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
> > > > >> >
> > > > >> >
> > > > >> > So the difference between this patch and the previous one, i=
s that
> > > > >> > you are now included a file that is not there normally so th=
at you
> > > > >> > can put the contents of the previous patch in the new includ=
e file
> > > > >> > to get around the issue in the archiver.
> > > > >
> > > > > The archiver issue is fixed but it will be very easy to break a=
gain.
> > > > > Myself recently broke it again so I added a test to help there
> > > > >
> > > >
> > https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c53=
2d97a44120346b5edd
> > > > >
> > > > >> >
> > > > >> > I'm not saying I'm opposed to this approach (yet), I'm just =
trying
> > > > >> > to understand the entire story.
> > > > >> >
> > > > >> > Did you find anything in looking at fixing the archiver to b=
etter
> > > > >> > support the multi-config issue?
> > > > >
> > > > > The issue now is different and is related with spdx and rm_work
> > > > > https://lists.openembedded.org/g/openembedded-core/message/1742=
76
> > > > >
> > > > > With this patch I can set a new TMPDIR folder for each machine =
and
> > > > > can build successfully.
> > > >
> > > > If you don't have spdx enabled then these sort of issues happen l=
ess
> > > > often, but after the above patch was merged in oe-core (and also
> > > > backported to kirkstone), we cannot build multiconfig targets fro=
m
> > > > meta-ti anymore with spdx enabled.
> > > >
> > > > This is special to spdx because of the way the task dependencies =
are
> > > > done, which requires it to be executed before rm_work. This is OK=
 when
> > > > a machine specific TMPDIR is used and explodes quite quickly (due
> > > > races) when sharing TMPDIR because of the parallel rm_work tasks =
that
> > > > end up removing stuff that is still required by other parallel ta=
sks.

