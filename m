Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB45CE01505
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 04:19:59 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55BJuAx024110
	for <meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 06:19:56 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55BJrcE023840
	for <meta-ti@yoctoproject.org>; Wed, 5 Jun 2013 06:19:54 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Wed, 5 Jun 2013 19:19:52 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary
	inclusion of folders into package
Thread-Index: AQHOXLHhbvJHXre9pE6tIgQM/8LozZkdDcpw//98BQCAAIfzIIAJ8ZSA
Date: Wed, 5 Jun 2013 11:19:52 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB3EED3@DBDE04.ent.ti.com>
References: <prabu@ti.com> <1368809879-27201-7-git-send-email-prabu@ti.com>
	<20130529211706.GL4526@edge>
	<321768C95D21724485BCE784F1BE98473EB26C20@DBDE04.ent.ti.com>
	<20130530032038.GO4526@edge>
	<321768C95D21724485BCE784F1BE98473EB26C57@DBDE04.ent.ti.com>
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB26C57@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 07/10] libgles-omap3: Remove unnecessary inclusion of folders into package
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2013 11:20:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Denys,

Any update on below ?


>> You should probably squash those patches then.

I can, with some rework. Please let me know your preference,

regards,
Prabu


-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Sundareson, Prabindh
Sent: Thursday, May 30, 2013 9:03 AM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary incl=
usion of folders into package

Hello Denys,

>> You should probably squash those patches then.

I can, with some rework. Please let me know your preference,


>> Have you tried passing -M to git-format-patch?

No. I read through the submission guidelines, and I did not see anything sp=
ecific there. How does this help ? Or did you mean this in the context of t=
he squashing ?

regards,
Prabu


-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, May 30, 2013 8:51 AM
To: Sundareson, Prabindh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary incl=
usion of folders into package

On Wed, May 29, 2013 at 11:18:36PM -0400, Sundareson, Prabindh wrote:
> Denys,
>=20
> Thanks for reviewing,
>=20
> It is a simple correction. I had mistakenly removed it in the first=20
> one, and reinstated in the next one after comparing with the original=20
> patch-set. Is there anything missing you observe ?

You should probably squash those patches then. Otherwise look fine - I just=
 need to diff the first patch in the series against the original. Have you =
tried passing -M to git-format-patch?

--
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, May 30, 2013 2:47 AM
> To: Sundareson, Prabindh
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary=20
> inclusion of folders into package
>=20
> On Fri, May 17, 2013 at 10:27:56PM +0530, Prabindh Sundareson wrote:
> > Inclusion of all .so files is not necessary for the package build.
> >=20
> > Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> > ---
> >  recipes-graphics/libgles/libgles-omap3-no-x.inc |    4 ----
> >  1 files changed, 0 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > index 8e5dad6..4521d59 100644
> > --- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > @@ -285,10 +285,6 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es6 =3D "ldflags"
> >  INSANE_SKIP_${PN}-linuxfbwsegl-es8 =3D "ldflags"
> >  INSANE_SKIP_${PN}-tests =3D "ldflags"
> > =20
> > -# Quality control is really poor on these SDKs, so hack around the lat=
est madness:
> > -FILES_${PN} +=3D "${libdir}/*.so "
> > -FILES_${PN}-dev =3D "${includedir}"
>=20
> I'm confused - you are removing these 2 lines in 7/10 and then immediatel=
y re-add them back in 8/10. Why?
>=20
>=20
> >  inherit update-rc.d
> > =20
> >  INITSCRIPT_NAME =3D "pvr-init"
> > --
> > 1.7.1
> >=20
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

