Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 976DCE00726; Wed, 15 Aug 2018 13:06:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C74B2E0049F
	for <meta-ti@yoctoproject.org>; Wed, 15 Aug 2018 13:06:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7FK6EuR017968
	for <meta-ti@yoctoproject.org>; Wed, 15 Aug 2018 15:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534363574;
	bh=qEafkylZb4q+Ss7NKgYi/WtJ4nmJkChXaFpkf8g1I90=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=W74VMfXuFVSYwMNyY719v87AeRVd+RRzvFl9biBe7BvPRqoez6lMmLTFqZ+DldKEo
	0D7yLFChD1KfY8LGb+kgWp5yidoAHbWiEi0IExQeZGrUu5QlNx5JyLpY/HIo3dPLi0
	K/ObIKWpmyfH390tpxqYw6DDhueCDQ+uMioyszE4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FK6Ewq004886
	for <meta-ti@yoctoproject.org>; Wed, 15 Aug 2018 15:06:14 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 15 Aug 2018 15:06:13 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Wed, 15 Aug 2018 15:06:13 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH v2] ti-ipc: Update to new version 3.50
Thread-Index: AQHUNMrmDjbykdBJcUmYQZuKV1GtBqTBPRIQ
Date: Wed, 15 Aug 2018 20:06:13 +0000
Message-ID: <2bdc294982cd45dab47510c173185772@ti.com>
References: <1534273168-15171-1-git-send-email-sam.nelson@ti.com>
	<20180815190412.GN2547@beryl>
In-Reply-To: <20180815190412.GN2547@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.135]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH v2] ti-ipc: Update to new version 3.50
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
X-List-Received-Date: Wed, 15 Aug 2018 20:06:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 15, 2018 3:04 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko][PATCH v2] ti-ipc: Update to new version 3.=
50
>=20
> On Tue, Aug 14, 2018 at 02:59:28PM -0400, Sam Nelson wrote:
> > Add AM65XX platform support
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Change from previous version of patch
> > - Update gcc toolchain to gcc-linaro-baremetal-aarch64
> > NOTE: This patch depends on gcc-linaro-baremetal-aarch64-native patch t=
o
> be checked in
> > ---
> > ---
> >  recipes-ti/ipc/ti-ipc-common.inc   |  3 ++-
> >  recipes-ti/ipc/ti-ipc-examples.inc |  2 +-
> >  recipes-ti/ipc/ti-ipc-rtos.inc     | 16 ++++++++++++----
> >  recipes-ti/ipc/ti-ipc-rtos_git.bb  |  8 ++++++++
> >  recipes-ti/ipc/ti-ipc.inc          |  6 +++---
> >  5 files changed, 26 insertions(+), 9 deletions(-)
> >
> > diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-
> common.inc
> > index 7f93842..6aea8e6 100644
> > --- a/recipes-ti/ipc/ti-ipc-common.inc
> > +++ b/recipes-ti/ipc/ti-ipc-common.inc
> > @@ -1,4 +1,4 @@
> > -PV =3D "3.47.02.00"
> > +PV =3D "3.50.01.00"
> >  INC_PR =3D "r0"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > @@ -13,6 +13,7 @@ PLATFORM_k2g =3D "66AK2G"
> >  PLATFORM_omapl138 =3D "OMAPL138"
> >  PLATFORM_c667x-evm =3D "C6678"
> >  PLATFORM_c665x-evm =3D "C6678"
> > +PLATFORM_am65xx-evm =3D "AM65XX"
> >
> >  ALT_PLATFORM_k2hk =3D "TCI6636"
> >  ALT_PLATFORM_am57xx-evm =3D "AM572X AM571X"
> > diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc=
-
> examples.inc
> > index cd2240c..022b13f 100644
> > --- a/recipes-ti/ipc/ti-ipc-examples.inc
> > +++ b/recipes-ti/ipc/ti-ipc-examples.inc
> > @@ -3,7 +3,7 @@ require ti-ipc-common.inc
> >  require ti-ipc-rtos.inc
> >
> >  LICENSE =3D "BSD"
> > -LIC_FILES_CHKSUM =3D "file://${S_ipc-
> examples}/src/makefile;beginline=3D1;endline=3D30;md5=3Dfb83580b16bce88e8=
ed
> 568a6005c8f02"
> > +LIC_FILES_CHKSUM =3D "file://${S_ipc-
> examples}/src/makefile;beginline=3D1;endline=3D30;md5=3Da52324bd5033bb49e=
a0
> 7bade1244ac9a"
>=20
> What is the change in the license?

Just the year update to -2018.

>=20
>=20
> >  INSANE_SKIP_${PN} +=3D "arch"
> >
> > diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rto=
s.inc
> > index 868743e..13b1914 100644
> > --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> > +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> > @@ -24,11 +24,11 @@ protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
> >  branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
> >  name=3D${TI_IPC_METADATA_NAME}"
> >
> > -# Corresponds to tag: 3.47.02.00
> > -SRCREV_ipc-metadata =3D "e8aff83111b8a0d64d7a77413b6f66d3106084d8"
> > +# Corresponds to tag: 3.50.01.00
> > +SRCREV_ipc-metadata =3D "19a8e70cf6ca4fe0984987e25d937c61a62c7658"
> >
> > -# Corresponds to tag: 3.47.02.00
> > -SRCREV_ipc-examples =3D "351e9a6d94c68f7ff64b2c002ee6750242ece6d9"
> > +# Corresponds to tag: 3.50.01.00
> > +SRCREV_ipc-examples =3D
> "1975687076426b587be8d2530df56c24425ca53a"
> >
> >  S_ipc-examples =3D "${WORKDIR}/git/ipc-examples"
> >  S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
> > @@ -50,6 +50,9 @@ DEPENDS_append_omapl138 =3D " ti-cgt6x-native \
> >  DEPENDS_append_c66x =3D " ti-cgt6x-native \
> >  "
> >
> > +DEPENDS_append_am65xx-evm =3D " ti-cgt-arm-native \
> > +                              gcc-linaro-baremetal-aarch64-native"
> > +
> >  IPC_TARGETS =3D ""
> >
> >  IPC_TARGETS_omap-a15 =3D "\
> > @@ -73,6 +76,11 @@ IPC_TARGETS_c66x =3D " \
> >
> ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c=
6x"
> \
> >  "
> >
> > +IPC_TARGETS_am65xx-evm =3D "\
> > +
> gnu.targets.arm.A53F=3D"${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}
> " \
> > +    ti.targets.arm.elf.R5F=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
> > +"
> > +
> >  EXTRA_OEMAKE =3D "\
> >      PLATFORM=3D${PLATFORM} \
> >      XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
> > diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-=
rtos_git.bb
> > index b292d67..b70935a 100644
> > --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > @@ -122,3 +122,11 @@ pkg_postinst_${PN}-fw_omapl138 () {
> >  pkg_postrm_${PN}-fw_omapl138 () {
> >    update-alternatives --remove rproc-dsp-fw
> ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
> >  }
> > +
> > +pkg_postinst_${PN}-fw_am65xx-evm () {
> > +  update-alternatives --install /lib/firmware/rproc-r5f-fw rproc-r5f-f=
w
> ipc/ti_platforms_cortexR_AM65X/messageq_single.xer5f
> ${ALTERNATIVE_PRIORITY}
> > +}
> > +
> > +pkg_postrm_${PN}-fw_am65xx-evm () {
> > +  update-alternatives --remove rproc-r5f-fw
> ipc/ti_platforms_cortexR_AM65X/messageq_single.xe674
> > +}
> > diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> > index e8038a5..07321cb 100644
> > --- a/recipes-ti/ipc/ti-ipc.inc
> > +++ b/recipes-ti/ipc/ti-ipc.inc
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9
> >
> >  TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
> >  TI_IPC_GIT_PROTOCOL =3D "git"
> > -TI_IPC_GIT_BRANCH =3D "3.47"
> > +TI_IPC_GIT_BRANCH =3D "3.50"
> >
> > -#Corresponds to 3.47.02.00
> > -TI_IPC_SRCREV =3D "24c36385d096613af123d1e1696fb2fee652ef36"
> > +#Corresponds to 3.50.01.00
> > +TI_IPC_SRCREV =3D "f0d0edaf3ce7ed8d81d8969eaaa98cec8b662424"
> >
> >  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
> >  SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};n
> ame=3Dipcdev"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

