Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEF47E00874; Tue,  2 Aug 2016 10:17:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74F4EE0074B
	for <meta-ti@yoctoproject.org>; Tue,  2 Aug 2016 10:17:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u72HDQo3009683
	for <meta-ti@yoctoproject.org>; Tue, 2 Aug 2016 12:13:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u72HHO0r008431
	for <meta-ti@yoctoproject.org>; Tue, 2 Aug 2016 12:17:25 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Tue, 2 Aug 2016 12:17:24 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-ipc-rtos: Cleanup scripts for srcipk
	generation after compile
Thread-Index: AQHR7NJt21bmMi37zEGTnd8r+imD1aA2J70A///B/UA=
Date: Tue, 2 Aug 2016 17:17:23 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490584492E0@DLEE11.ent.ti.com>
References: <1470151667-35399-1-git-send-email-sam.nelson@ti.com>
	<20160802155900.GL3677@edge>
In-Reply-To: <20160802155900.GL3677@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-ipc-rtos: Cleanup scripts for srcipk generation after compile
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
X-List-Received-Date: Tue, 02 Aug 2016 17:17:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Agreed.
You can remove the compile append.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 02, 2016 11:59 AM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti-ipc-rtos: Cleanup scripts for srcipk
> generation after compile
>=20
> NO, it shouldn't have been here in the first place! How did I miss it? I'=
m going
> to remove that compile_append() below.
>=20
>=20
> On Tue, Aug 02, 2016 at 11:27:47AM -0400, Sam Nelson wrote:
> > This avoid issues with double srcipk generation.
> > Resolves issues with empty srcipk package, with some latest updates in
> > meta-arago.
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/ipc/ti-ipc-rtos_git.bb | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-
> rtos_git.bb
> > index c9c4714..0213782 100644
> > --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > @@ -35,7 +35,7 @@ SRCREV_ipc-metadata =3D
> "b6dd82a450d75b9483a7cc9b619a30cf3cc25ae6"
> >  S_ipc-examples =3D "${WORKDIR}/git/ipc-examples"
> >  S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
> >
> > -PR =3D "${INC_PR}.1"
> > +PR =3D "${INC_PR}.2"
> >
> >  DEPENDS =3D "ti-xdctools ti-sysbios doxygen-native zip-native"
> >  DEPENDS_append_keystone =3D " ti-cgt6x-native \
> > @@ -82,6 +82,9 @@ RELEASE_SUFFIX =3D ""
> >
> >  IPC_PACKAGE_DIR =3D "${S}/ipc-package"
> >
> > +deltask do_create_srcipk
> > +addtask create_srcipk after do_compile before do_install
> > +
> >  do_compile() {
> >    oe_runmake -f ipc-bios.mak clean
> >    oe_runmake -f ipc-bios.mak release
> > @@ -123,10 +126,6 @@ do_compile() {
> >    fi
> >  }
> >
> > -do_compile_append() {
> > -  sourceipk_do_create_srcipk
> > -}
> > -
> >  do_install() {
> >    IPC_VERSION=3D`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
> >    # Copy docs and other meta files
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

