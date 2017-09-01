Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 523C6E00CCD; Fri,  1 Sep 2017 08:48:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B68FE007EF
	for <meta-ti@yoctoproject.org>; Fri,  1 Sep 2017 08:48:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81Fm18E013942
	for <meta-ti@yoctoproject.org>; Fri, 1 Sep 2017 10:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504280881;
	bh=tTybnKo76rGk5Iyp7SuuMH9spwt5gKPS6YDeQ6Ju8ow=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=F8VH/uFf3Zy512IUfjjb5tyfL4p9XdmssXBfCrVG62Y0GB6nZNp03RAm9t3inYwEp
	WU+b0lrec+IUmyL33VMgk1KBwbZL5fEwuAgAPYY77UnrzGmLxRxT+jnYErMeQ/Tb7x
	BEr0RpiQqKjPo6nl90kym4xuJEKDdIJmx+Q8RnBU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Fm1md032481
	for <meta-ti@yoctoproject.org>; Fri, 1 Sep 2017 10:48:01 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 10:48:01 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] starterware: add starterware for linux which
	installs header files only
Thread-Index: AQHTIrDTpB9KYV6exUWNrGTNZJhSd6KgLeag
Date: Fri, 1 Sep 2017 15:48:00 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D7492A@DLEE08.ent.ti.com>
References: <1504133410-14907-1-git-send-email-a0271529@ti.com>
	<20170831232814.GD8304@edge>
In-Reply-To: <20170831232814.GD8304@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] starterware: add starterware for linux which installs header files only
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
X-List-Received-Date: Fri, 01 Sep 2017 15:48:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys. The v2 patch has been submitted.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, August 31, 2017 7:28 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] starterware: add starterware for linux whi=
ch
> installs header files only
>=20
> On Wed, Aug 30, 2017 at 06:50:10PM -0400, Hongmei Gou wrote:
> > * starterware.inc is created to host the common information
> >
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  recipes-bsp/starterware/starterware-rtos_git.bb | 22 ++---------------=
-----
> >  recipes-bsp/starterware/starterware.inc         | 21
> +++++++++++++++++++++
> >  recipes-bsp/starterware/starterware_git.bb      | 16 ++++++++++++++++
> >  3 files changed, 39 insertions(+), 20 deletions(-)  create mode
> > 100644 recipes-bsp/starterware/starterware.inc
> >  create mode 100644 recipes-bsp/starterware/starterware_git.bb
> >
> > diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb
> > b/recipes-bsp/starterware/starterware-rtos_git.bb
> > index 5584cb2..88176bb 100644
> > --- a/recipes-bsp/starterware/starterware-rtos_git.bb
> > +++ b/recipes-bsp/starterware/starterware-rtos_git.bb
> > @@ -1,28 +1,10 @@
> > -LICENSE =3D "BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D
> "file://Makefile;beginline=3D1;endline=3D35;md5=3D286cbb5dce3e348294b6b02=
5cff
> 969b3"
> > +require starterware.inc
> >
> > -COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> >  DEPENDS =3D "gcc-arm-none-eabi-native"
> >
> >  require recipes-ti/includes/ti-paths.inc
> >
> > -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > -
> > -STARTERWARE_GIT_URI =3D "git://git.ti.com/keystone-rtos/starterware.gi=
t"
> > -STARTERWARE_GIT_PROTOCOL =3D "git"
> > -STARTERWARE_GIT_BRANCH =3D "master"
> > -
> > -# Below commit ID corresponds to
> "DEV.STARTERWARE.PROCSDK.02.01.01.03A"
> > -STARTERWARE_SRCREV =3D "08f65ae3d5ccd19fbaf36040a99de971b685d144"
> > -
> > -BRANCH =3D "${STARTERWARE_GIT_BRANCH}"
> > -SRC_URI =3D
> "${STARTERWARE_GIT_URI};protocol=3D${STARTERWARE_GIT_PROTOCOL};bra
> nch=3D${BRANCH}"
> > -
> > -SRCREV =3D "${STARTERWARE_SRCREV}"
> > -PV =3D "02.01.01.03A"
> > -PR =3D "r0"
> > -
> > -S =3D "${WORKDIR}/git"
> > +PR =3D "${INC_PR}.0"
> >
> >  PARTNO_ti33x =3D "am335x"
> >  PARTNO_ti43x =3D "am437x"
> > diff --git a/recipes-bsp/starterware/starterware.inc
> > b/recipes-bsp/starterware/starterware.inc
> > new file mode 100644
> > index 0000000..c5d7655
> > --- /dev/null
> > +++ b/recipes-bsp/starterware/starterware.inc
> > @@ -0,0 +1,21 @@
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://Makefile;beginline=3D1;endline=3D35;md5=3D286cbb5dce3e348294b6b02=
5cff
> 969b3"
> > +
> > +COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +STARTERWARE_GIT_URI =3D "git://git.ti.com/keystone-
> rtos/starterware.git"
> > +STARTERWARE_GIT_PROTOCOL =3D "git"
> > +STARTERWARE_GIT_BRANCH =3D "master"
> > +
> > +# Below commit ID corresponds to
> "DEV.STARTERWARE.PROCSDK.02.01.01.03A"
> > +STARTERWARE_SRCREV =3D "08f65ae3d5ccd19fbaf36040a99de971b685d144"
> > +
> > +BRANCH =3D "${STARTERWARE_GIT_BRANCH}"
> > +SRC_URI =3D
> "${STARTERWARE_GIT_URI};protocol=3D${STARTERWARE_GIT_PROTOCOL};bra
> nch=3D${BRANCH}"
> > +
> > +SRCREV =3D "${STARTERWARE_SRCREV}"
> > +PV =3D "02.01.01.03A"
> > +INC_PR =3D "r0"
> > +
> > +S =3D "${WORKDIR}/git"
> > diff --git a/recipes-bsp/starterware/starterware_git.bb
> > b/recipes-bsp/starterware/starterware_git.bb
> > new file mode 100644
> > index 0000000..d0c4396
> > --- /dev/null
> > +++ b/recipes-bsp/starterware/starterware_git.bb
> > @@ -0,0 +1,16 @@
> > +require starterware.inc
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +ALLOW_EMPTY_${PN} =3D "1"
> > +
> > +CLEANBROKEN =3D "1"
> > +
> > +do_compile() {
> > +    :
> > +}
> > +
> > +do_install () {
> > +    install -d ${D}${includedir}/ti/starterware
> > +    find . -name "*.h" -type f | xargs -I {} cp --parents {}
> > +${D}${includedir}/ti/starterware
>=20
> Please pass --no-preserve=3Downership to avoid host contamination warning=
s.
>=20
>=20
> > +}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

