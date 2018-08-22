Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E347EE00546; Wed, 22 Aug 2018 16:12:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 251D3E00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 16:12:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MNCLYr042362
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 18:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534979541;
	bh=fJ8Ty1D6LzCKaRkmG33LaeYHBYNmSWQ8V3bx+AIDRCk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Quqm0H19EFCGNT9WCxres2ZUFtpdI5UiWHtr48z7kwu+cY5GQ50DvzEyyKk//XzIu
	GF4AK4REZtgrKxzaaWSDxChPwZiBam2ojCS3I+EAO+mVVN2EXqNRBidqoomlCDYNyu
	XeQGAIhyqpuSJugW6ZyL9Zyy3afPMH5JVO+WG6hY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MNCLID029037
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 18:12:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 18:12:21 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Wed, 22 Aug 2018 18:12:21 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH 4/4] sciclient: Add recipe for SCI
	client driver
Thread-Index: AQHUOmoa2e8CUksncEmK2Kfy6AxjcaTMZkZw
Date: Wed, 22 Aug 2018 23:12:21 +0000
Message-ID: <a4986a4ebf8649d7948c42f560675369@ti.com>
References: <1534974652-28676-1-git-send-email-sam.nelson@ti.com>
	<1534974652-28676-4-git-send-email-sam.nelson@ti.com>
	<20180822224633.GI29422@beryl>
In-Reply-To: <20180822224633.GI29422@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.191.59]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH 4/4] sciclient: Add recipe for SCI client driver
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
X-List-Received-Date: Wed, 22 Aug 2018 23:12:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 22, 2018 6:47 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko][PATCH 4/4] sciclient: Add recipe for SCI c=
lient
> driver
>=20
> On Wed, Aug 22, 2018 at 05:50:52PM -0400, Sam Nelson wrote:
> > Sci client provides API to communicate with the core running System
> > firmware
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 89
> +++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 recipes-bsp/sciclient/sciclient-rtos_git.bb
> >
> > diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-
> bsp/sciclient/sciclient-rtos_git.bb
> > new file mode 100644
> > index 0000000..6a6de40
> > --- /dev/null
> > +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > @@ -0,0 +1,89 @@
> > +SUMMARY =3D "TI RTOS low level driver for SCICLIENT"
> > +DESCRIPTION =3D "TI RTOS low level driver for SCICLIENT "
> > +
> > +inherit ti-pdk
> > +
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://sciclient.h;beginline=3D1;endline=3D31;md5=3D7224b2eeca1444815f17=
37bfc
> dfa892a"
> > +
> > +COMPATIBLE_MACHINE =3D "am65xx-evm"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +SCICLIENT_GIT_URI =3D "git://git@bitbucket.itg.ti.com/processor-
> sdk/sciclient.git"
>=20
> NAK!

Will fix.

>=20
>=20
> > +SCICLIENT_GIT_PROTOCOL =3D "ssh"
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
> > +LIMSOCS =3D "am65xx"
> > +LIMSOCS_am65xx-evm =3D "am65xx"
> > +
> > +LIMBOARDS =3D "am65xx_evm"
> > +LIMBOARDS_am65xx-evm =3D "am65xx_evm"
> > +
> > +BOARD_PACKAGE =3D ""
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

