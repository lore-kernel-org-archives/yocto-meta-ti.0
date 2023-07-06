Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB29CEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 18:39:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.32556.1688668786363843133
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 11:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CEAA340C16;
	Thu,  6 Jul 2023 18:39:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEOqxjfCYl5q; Thu,  6 Jul 2023 18:39:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9026240A2F;
	Thu,  6 Jul 2023 18:39:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AD230163BEE; Thu,  6 Jul 2023 14:39:39 -0400 (EDT)
Date: Thu, 6 Jul 2023 14:39:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Ricardo Salveti <ricardo@foundries.io>, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5:
 allow customization by donwstream layers
Message-ID: <20230706183939.GE1518@denix.org>
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com>
 <20230130171811.GJ22689@denix.org>
 <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com>
 <CAAaKDhGj8oTZ-j-gnTfHs5Ra3d3qAYbgiSR+5YYzcvJ+wKiQXQ@mail.gmail.com>
 <CANPvuRnuzyKntNsVW_6xuLiSVdzuaHghKsqPUDMcyKajEu5O6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRnuzyKntNsVW_6xuLiSVdzuaHghKsqPUDMcyKajEu5O6g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Jul 2023 18:39:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16820

As you noted yourself in that thread, your patches were workarounds and j=
ust=20
masking the actual issue w/o clearly articulating it. The actual race iss=
ue=20
has been under investigation for quite some time and I've discussed it wi=
th=20
Richard before. Luckily he was finally able to root-cause and fix it!

BTW, I'm working on a change that I'm about to submit here, which indirec=
tly=20
gives you separate TMPDIR for k3r5 - stay tuned.


On Wed, Jul 05, 2023 at 09:17:44AM +0100, Jose Quaresma wrote:
> Just for your information there are more complaints about that issue [1=
] of
> some bad side effects of sharing the TMP folder in multi configs.
>=20
> [1] https://lists.openembedded.org/g/bitbake-devel/message/14860
>=20
> Jose
>=20
> Ricardo Salveti <ricardo@foundries.io> escreveu no dia segunda, 30/01/2=
023
> =E0(s) 18:27:
>=20
> > On Mon, Jan 30, 2023 at 2:57 PM Jose Quaresma <quaresma.jose@gmail.co=
m>
> > wrote:
> > > Denys Dmytriyenko <denis@denix.org> escreveu no dia segunda, 30/01/=
2023
> > =E0(s) 17:18:
> > >>
> > >> On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via
> > lists.yoctoproject.org wrote:
> > >> >
> > >> >
> > >> > On 1/30/2023 9:20, Jose Quaresma wrote:
> > >> > >This patch adds the possibility to change some bitbake variable
> > >> > >that cannot be changed anywhere else, one of then is the TMPDIR=
.
> > >> > >
> > >> > >Using the same TMPDIR it is very sensitive and prone to several
> > errors
> > >> > >when used in more complex situations.
> > >> > >This configuration forces that all native packages have to be t=
he
> > same between all
> > >> > >machines and this requirement is very easy to break.
> > >> > >Suppose you use a macinhe override somewhere on a native recipe
> > >>
> > >> Even w/o multiconfig, this will break for multi-machine builds. Na=
tive
> > >> packages are for the build host and have no knowledge about the ta=
rget.
> > >> You should probably look into cross packages instead of native one=
s for
> > >> this use case.
> > >>
> > >> Altering native packages between different targets will cause them=
 to
> > >> rebuild, which they shouldn't. Moreover, it will mess up your ssta=
te
> > >> and lead to weird issues down the road when trying to re-use your
> > >> sstate mirror/cache.
> > >
> > > Is that the issue of rebuilding some native packages that I am tryi=
ng to
> > avoid.
> > > But it is very hard to fix this in OE-core and everything else laye=
rs
> > what happens.
> > >
> > > For your information I have some other issues with multiconfig and
> > native packages
> > > that have the source files provided on the layer. this two recipes =
don't
> > work with the
> > > rm_work bbclass because the in one of the machines
> > > texinfo-dummy-native gettext-minimal-native
> > >
> > > Another issue is that sometimes one of the machines uses the
> > SOURCE_DATE_EPOCH_FALLBACK
> > > and the other uses  SOURCE_DATE_EPOCH and this also triggers a rebu=
ild
> > of one of the machines.
> > >
> > > Recently a new issue with the rm_work and the spdx
> > > comes in
> > https://lists.openembedded.org/g/openembedded-core/message/174276
> > > where I have the steps to reproduce.
> > >
> > > All of these issues can be solved easily with TMDIR for each machin=
e,
> > > but because I understand it can be invasive I submit this patch tha=
t
> > doesn't change anything
> > > in meta-ti but can add the possibility to use a different TMPDIR fo=
r
> > each machine.
> > >
> > > A different TMPDIR for each machine is also referenced in the offic=
ial
> > documentation
> > > "Minimally, each configuration file must define the machine and the
> > temporary directory BitBake uses for the build. Suggested practice di=
ctates
> > that you do not overlap the temporary directories used during the bui=
lds."
> > >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-use=
r-manual-intro.html#executing-a-multiple-configuration-build
> > >
> > >> > >and this requirement is no longer met.
> > >> > >Many of these anomalies can be verified with the use of the rm_=
work
> > and
> > >> > >create-spdx bitbake classes.
> > >> > >
> > >> > >A previous attempt [1] had already been made but was refused
> > >> > >but this way it can be done without side effects for other user=
s.
> > >> > >
> > >> > >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
> > >> >
> > >> >
> > >> > So the difference between this patch and the previous one, is th=
at
> > >> > you are now included a file that is not there normally so that y=
ou
> > >> > can put the contents of the previous patch in the new include fi=
le
> > >> > to get around the issue in the archiver.
> > >
> > > The archiver issue is fixed but it will be very easy to break again=
.
> > > Myself recently broke it again so I added a test to help there
> > >
> > https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c53=
2d97a44120346b5edd
> > >
> > >> >
> > >> > I'm not saying I'm opposed to this approach (yet), I'm just tryi=
ng
> > >> > to understand the entire story.
> > >> >
> > >> > Did you find anything in looking at fixing the archiver to bette=
r
> > >> > support the multi-config issue?
> > >
> > > The issue now is different and is related with spdx and rm_work
> > > https://lists.openembedded.org/g/openembedded-core/message/174276
> > >
> > > With this patch I can set a new TMPDIR folder for each machine and
> > > can build successfully.
> >
> > If you don't have spdx enabled then these sort of issues happen less
> > often, but after the above patch was merged in oe-core (and also
> > backported to kirkstone), we cannot build multiconfig targets from
> > meta-ti anymore with spdx enabled.
> >
> > This is special to spdx because of the way the task dependencies are
> > done, which requires it to be executed before rm_work. This is OK whe=
n
> > a machine specific TMPDIR is used and explodes quite quickly (due
> > races) when sharing TMPDIR because of the parallel rm_work tasks that
> > end up removing stuff that is still required by other parallel tasks.

