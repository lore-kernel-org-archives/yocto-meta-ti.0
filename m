Return-Path: <igeiser@devonit.com>
Received: from mx1.devonhealth.com (unknown [8.20.30.154])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A81F6E013DF
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 21:03:56 -0700 (PDT)
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Mon, 12 Aug 2013 00:01:43 -0400
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Mon, 12 Aug 2013 00:03:42 -0400
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	boddingtons.devonintlgroup.com ([10.0.2.7]) with mapi; Mon, 12 Aug 2013
	00:03:41 -0400
From: Ian Geiser <igeiser@devonit.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 12 Aug 2013 00:03:38 -0400
Thread-Topic: [meta-ti] [PATCH 1/2] Fix filespath for dylan
Thread-Index: Ac6XDDuLoWzpQHORSsOF8K0YrdbW2AABJ8lA
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BEAAD744@SOUTHSIDE.devonintlgroup.com>
References: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
	<20130812032959.GA29743@edge>
In-Reply-To: <20130812032959.GA29743@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7E1681142B8114410-01-01
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] Fix filespath for dylan
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
X-List-Received-Date: Mon, 12 Aug 2013 04:04:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I can fix and resubmit. I found it while porting our 8148 build to Dylan. T=
hanks!

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Sunday, August 11, 2013 11:30 PM
> To: Ian Geiser
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] Fix filespath for dylan
>=20
> On Sun, Aug 11, 2013 at 07:41:34PM -0400, igeiser@devonit.com wrote:
> > From: Ian Reinhart Geiser <igeiser@devonit.com>
> >
> > The old way of setting THISDIR in a bbappend clobbers THISDIR for
> > other layers.  This change makes it use the new way that is done in
> > dylan.
>=20
> Thanks! I've been meaning to fix those for quite some time, but there
> was always something more important... :)
>=20
>=20
> > Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
> > ---
> >  recipes-bsp/formfactor/formfactor_0.0.bbappend |    5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > index 4b8d0e6..491d403 100644
> > --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > @@ -1,3 +1,2 @@
> > -THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> > -FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> > -
> > +PRINC :=3D "${@int(PRINC) + 1}"
> > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> The above should be _append since that is what =3D. operand does and also
> since
> the colon is at the end.
>=20
> --
> Denys


