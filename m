Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC534E00D36; Tue, 26 Sep 2017 12:19:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A64B1E00C62
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:19:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QJJFbP007147
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 14:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506453555;
	bh=B9417pgf3Uj+OBMbnZDfpwbRkq5eVGmHtvmEVIsposk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Jtw5quEmJ3FtiL/xynEq5kckvOIWKME6sPFRGKhBVUP4CgRwWE+fF6NCgG5qeJJfA
	8EH4785uoYIb+XJwskq8CjBOQaGWmNcHqRovIc46xauF0rDF+h4M+lvoO4pjk4IeHU
	bTMaZvTI8YGTUfT+un3IBTeYCxxn4CPKUMkVnf+w=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QJJFpW010456
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 14:19:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Tue, 26 Sep 2017 14:19:15 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] nativesdk-dspcoreparse: added recipe for
	nativesdk-dspcoreparse
Thread-Index: AQHTInd+O7SMmqlBY0ihJFEDM5/c56LH8guA///Ab/A=
Date: Tue, 26 Sep 2017 19:19:15 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A40633881@DFLE08.ent.ti.com>
References: <1504129361-28557-1-git-send-email-i-pang@ti.com>
	<20170831163749.GY8304@edge> <20170926180212.GB26843@edge>
In-Reply-To: <20170926180212.GB26843@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] nativesdk-dspcoreparse: added recipe for nativesdk-dspcoreparse
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
X-List-Received-Date: Tue, 26 Sep 2017 19:19:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please decline/NAK on this patch.
I am not familiar enough with the recipe or component content. I will confe=
r with the actual component owner on resubmitting this patch.

Ivan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, September 26, 2017 1:02 PM
To: Pang, Ivan
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] nativesdk-dspcoreparse: added recipe for nat=
ivesdk-dspcoreparse

Ping. Any updates on this one?

On Thu, Aug 31, 2017 at 12:37:49PM -0400, Denys Dmytriyenko wrote:
> On Wed, Aug 30, 2017 at 04:42:41PM -0500, Ivan Pang wrote:
> > Signed-off-by: Ivan Pang <i-pang@ti.com>
> > ---
> >  .../multiprocmgr/nativesdk-dspcoreparse_git.bb     | 46 ++++++++++++++=
++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644=20
> > recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb
> >=20
> > diff --git a/recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb=20
> > b/recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb
> > new file mode 100644
> > index 0000000..63cf937
> > --- /dev/null
> > +++ b/recipes-ti/multiprocmgr/nativesdk-dspcoreparse_git.bb
> > @@ -0,0 +1,46 @@
> > +SUMMARY =3D "DSP coredump parse utility"
> > +DESCRIPTION =3D "The DSP coredump parse (dspcoreparse) utility is a=20
> > +part\ of the Multi-Proc Manager (MPM). This utility is used to=20
> > +provide\ information upon a DSP core crash or unexpected runtime termi=
nation."
> > +
> > +require recipes-ti/includes/ti-paths.inc include=20
> > +recipes-ti/multiprocmgr/multiprocmgr.inc
> > +
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://dspcoreparse.c;beginline=3D1;endline=3D31=
;md5=3D7c271e4a6bd961947bce20c7fe5f86fe"
> > +BRANCH =3D "master"
> > +
> > +SRC_URI =3D "git://git.ti.com/sdk-tools/dspcoreparse.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
> > +
> > +# Below commit ID corresponds to "DSPCOREPARSE.01.00.00.00A"
> > +SRCREV =3D "b692b85a33052a5c736cd538eedf178d45bd4e4e"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile () {
> > +  # Not building anything and using checked in binary file for now
> > +  echo "Nothing to compile"
> > +}
> > +
> > +do_install () {
> > +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downer=
ship"
> > +    install -d ${D}${MPM_INSTALL_DIR_RECIPE}/utils/dspcoreparse
> > +    cp ${CP_ARGS} ${S}/* -d=20
> > +${D}${MPM_INSTALL_DIR_RECIPE}/utils/dspcoreparse/
> > +}
> > +
> > +PACKAGES =3D+ "${PN}-src"
>=20
> ^^^ Nope
>=20
>=20
> > +FILES_${PN}-dev =3D "${MPM_INSTALL_DIR_RECIPE}/utils"
>=20
> Isn't it a binary? Why do you put it into ${PN}-dev?
>=20
>=20
> > +FILES_${PN}-src =3D "${S}/*"
>=20
> ^^^ Can't do that.
>=20
>=20
> > +FILES_${PN}-dbg =3D "${MPM_INSTALL_DIR_RECIPE}/utils/dspcoreparse/.deb=
ug"
> > +
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > +INHIBIT_SYSROOT_STRIP =3D "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > +
> > +INSANE_SKIP_${PN}-dev =3D "arch file-rdeps"
> > +INSANE_SKIP_${PN}-src =3D "arch file-rdeps"
> > +INSANE_SKIP_${PN} =3D "arch file-rdeps"
> > +INSANE_SKIP_${PN}-dbg =3D "arch file-rdeps"
> > +
> > +ALLOW_EMPTY_${PN} =3D "1"
> > --
> > 1.9.1
> >=20
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

