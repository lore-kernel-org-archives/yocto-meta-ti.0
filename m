Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A6BBE0074B; Fri, 24 Aug 2018 14:13:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAE1AE0043F
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 14:13:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OLDccR090332
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 16:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535145218;
	bh=Ylu8uij+QTzMmnq7wiI9l2MocVYNktu+5mUhHKq1Puo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=QY9iMeGFAoeb6nK0iecOIH4JkClahSIGsEP2j/nZw7ydvpdY6GgFsmdbUOp57q7h4
	tWt236EoC0dpNG8LOOBxwzQTiNyOAXmIMAyoD1tUHhVVwgx0RGevqz1pzofn8RIykq
	JBvjY9XILnoeEMIZWIbGohKIpMe3d5DnB5Y2r2Qo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OLDcNQ003986
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 16:13:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 16:13:38 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Fri, 24 Aug 2018 16:13:37 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH v4 4/4] sciclient: Add recipe for SCI
	client driver
Thread-Index: AQHUO+fndYmi7Sr7IU+zsfzzUThFD6TPZrzw
Date: Fri, 24 Aug 2018 21:13:37 +0000
Message-ID: <8b3ef95b6721442782371c6abb59385b@ti.com>
References: <1535048889-3938-1-git-send-email-sam.nelson@ti.com>
	<20180824201936.GB9228@beryl>
In-Reply-To: <20180824201936.GB9228@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.154.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH v4 4/4] sciclient: Add recipe for SCI client driver
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
X-List-Received-Date: Fri, 24 Aug 2018 21:13:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, August 24, 2018 4:20 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko][PATCH v4 4/4] sciclient: Add recipe for SC=
I
> client driver
>=20
> On Thu, Aug 23, 2018 at 02:28:09PM -0400, Sam Nelson wrote:
> > Sci client provides API to communicate with the core running System
> > firmware
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Change from previous version of patch
> > - Remove redundant description
> > - remove redudant defines
>=20
> Sam,
>=20
> Can you please make these 2 changes as a separate patch? I wanted to star=
t
> testing all the other updates right away and didn't wait for your v4, but
> instead went with v3, as the changes are rather cosmetical. Thanks.

No problem. I have sent a separate patch. Thanks.

>=20
>=20
> > ---
> > ---
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 83
> +++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb
> >
> > diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-
> bsp/sciclient/sciclient-rtos_git.bb
> > new file mode 100644
> > index 0000000..e059f4b
> > --- /dev/null
> > +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > @@ -0,0 +1,83 @@
> > +SUMMARY =3D "TI RTOS low level driver for SCICLIENT"
> > +
> > +inherit ti-pdk
> > +
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://sciclient.h;beginline=3D1;endline=3D31;md5=3D7224b2eeca1444815f17=
37bfc
> dfa892a"
> > +
> > +COMPATIBLE_MACHINE =3D "k3"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +SCICLIENT_GIT_URI =3D "git://git.ti.com/keystone-rtos/sciclient.git"
> > +SCICLIENT_GIT_PROTOCOL =3D "git"
> > +SCICLIENT_GIT_BRANCH =3D "master"
> > +
> > +# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
> > +SCICLIENT_SRCREV =3D "4ac052a70764c5fcf9dd18d521fe3b631bfcd875"
> > +
> > +BRANCH =3D "${SCICLIENT_GIT_BRANCH}"
> > +SRC_URI =3D
> "${SCICLIENT_GIT_URI};protocol=3D${SCICLIENT_GIT_PROTOCOL};branch=3D${BRA
> NCH}"
> > +
> > +SRCREV =3D "${SCICLIENT_SRCREV}"
> > +PV =3D "01.00.00.00"
> > +PR =3D "r0"
> > +
> > +DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
> > +
> > +# Build with make instead of XDC
> > +TI_PDK_XDCMAKE =3D "0"
> > +
> > +SCICLIENT_PACKAGE_BASE   =3D "${S}/../sciclient_base"
> > +SCICLIENT_ROOTPATH =3D
> "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/sciclient"
> > +
> > +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"
> > +export PDK_SCICLIENT_ROOT_PATH =3D
> "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
> > +
> > +#export PDK_SCICLIENT_ROOT_PATH =3D"${WORKDIR}/build"
> > +#export DEST_ROOT=3D"${S}"
> > +
> > +LIMSOCS_am65xx-evm =3D "am65xx"
> > +LIMBOARDS_am65xx-evm =3D "am65xx_evm"
> > +BOARD_PACKAGE_am65xx-evm =3D "am65xx_evm"
> > +
> > +# HTML doc link params
> > +PDK_COMP_LINK_TEXT =3D "SCICLIENT"
> > +
> > +do_configure() {
> > +
> > +    rm -rf ${SCICLIENT_PACKAGE_BASE}
> > +    cd ${S}
> > +
> > +    # remove any previous package
> > +    rm -f ${SCICLIENT_PACKAGE_BASE}
> > +
> > +    # make the release package before building it
> > +    make package BOARD=3D${BOARD_PACKAGE}
> DEST_ROOT=3D${SCICLIENT_PACKAGE_BASE} PDK_SCICLIENT_COMP_PATH=3D${S}
> > +
> > +   # This is to ensure the make package completed successfully
> > +    cat  ${SCICLIENT_ROOTPATH}/makefile
> > +}
> > +
> > +do_compile() {
> > +
> > +    cd ${SCICLIENT_ROOTPATH}
> > +
> > +    # Clean
> > +    # make clean LIMIT_SOCS=3D"${LIMSOCS}"
> LIMIT_BOARDS=3D"${LIMBOARDS}"
> > +
> > +    # Build am65xx libraries
> > +    make lib xdc_meta doxygen LIMIT_SOCS=3D"${LIMSOCS}"
> LIMIT_BOARDS=3D"${LIMBOARDS}"
> > +
> > +    #archive
> > +    tar -cf sciclient.tar --exclude=3D'*.tar' ./*
> > +}
> > +
> > +do_install() {
> > +    cd ${SCICLIENT_ROOTPATH}
> > +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
> > +    find -name "*.tar" -exec tar xf {} --no-same-owner -C
> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient \;
> > +}
> > +
> > +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"
> > +
> > +INSANE_SKIP_${PN} =3D "arch ldflags file-rdeps"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

