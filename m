Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA267E00BAB; Tue, 11 Jul 2017 12:12:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D753E00BA2
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 12:12:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6BJChRj028019
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 14:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499800363;
	bh=EC6IRLjZ00K2YlS3/p9y+Ab0DRqKB+hlILB8GFc9H7M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PmTBB3NsKhAtC/t+4XP1mV9ZG30rI0hEzDuv7Tn2x0qJ3ObsP9P8NkrJktHeBe6Wl
	jvdCUcjHD3qsy6OfZJ9jvMVV846GhK2U3Z0oz6EA99eIFU0+W6UDeF3z+K75UBnVRa
	6X4QvOa4OQO//3OBOHGgl/EXqj2Uyol8mkoCYWSw=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BJCc1N028457
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 14:12:38 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Tue, 11 Jul 2017 14:12:37 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] icss-emac-lld-rtos: Added rtos recipe for
	icss-emac-lld
Thread-Index: AQHS+nmozBU1Pb0O/Uy17AjzU/1Lyw==
Date: Tue, 11 Jul 2017 19:12:37 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D5475C@DLEE08.ent.ti.com>
References: <1499380944-60574-1-git-send-email-m-radhakrishnan2@ti.com>
	<2E957F12D11D904590FA9AF86D366BD926D53EE3@DLEE08.ent.ti.com>
	<20170710200228.GF14665@edge>
In-Reply-To: <20170710200228.GF14665@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] icss-emac-lld-rtos: Added rtos recipe for icss-emac-lld
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
X-List-Received-Date: Tue, 11 Jul 2017 19:12:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
=20
I just up-streamed the icss-emac-lld recipes for linux user space.

Machu, can you please modify the rtos recipe for icss-emac-lld accordingly =
and resubmit the patch?

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, July 10, 2017 4:02 PM
> To: Gou, Hongmei
> Cc: Radhakrishnan, Mahesh; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] icss-emac-lld-rtos: Added rtos recipe for =
icss-
> emac-lld
>=20
> Hongmei,
>=20
> Feel free to upstream icss-emac-lld recipes to meta-ti.
>=20
>=20
> On Mon, Jul 10, 2017 at 02:29:59PM +0000, Gou, Hongmei wrote:
> > As there are also recipes for Linux user space icss-emac-lld, can we
> > create icss-emac-lld.inc to include the common information such as
> > SRC_URI, SRCREV, and etc.?
> >
> > Linux user space icss-emac-lld recipes in meta-processor-sdk:
> > http://arago-project.org/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dt=
ree
> > ;f=3Drecipes-bsp/icss-emac-lld;h=3D0e6b07f5b436f6c32cb98f6f80cce1640f74=
9b6
> > d;hb=3Db90a8b708c29abe7e888118c269a4c8878d98b0d
> >
> > Thanks,
> > Hongmei
> >
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> > > Sent: Thursday, July 06, 2017 6:42 PM
> > > To: meta-ti@yoctoproject.org
> > > Subject: [meta-ti] [PATCH] icss-emac-lld-rtos: Added rtos recipe for
> > > icss- emac-lld
> > >
> > > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > > ---
> > >  .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 43
> > > ++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >  create mode 100644
> > > recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > >
> > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > > b/recipes- bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > > new file mode 100644
> > > index 0000000..53e6bf3
> > > --- /dev/null
> > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> > > @@ -0,0 +1,43 @@
> > > +inherit ti-pdk
> > > +
> > > +LICENSE =3D "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =3D
> > >
> "file://icss_emacDrv.h;beginline=3D1;endline=3D40;md5=3D88d270788c1d85165=
1
> > > 130
> > > 4f11a28586d"
> > > +
> > > +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"
> > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > +
> > > +ICSS_EMAC_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/icss-
> emac.git"
> > > +ICSS_EMAC_LLD_GIT_PROTOCOL =3D "git"
> > > +ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
> > > +ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
> > > +
> > > +# Below commit ID corresponds to "DEV.ICSS-EMAC_LLD.01.00.00.07C"
> > > +ICSS_EMAC_LLD_SRCREV =3D
> "08cb0540eeab7721fe82b603cb6285393f314117"
> > > +
> > > +BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
> > > +SRC_URI =3D
> > >
> "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_DESTSUFFI
> > > X};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> > > +
> > > +SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
> > > +PV =3D "01.00.00.07C"
> > > +PR =3D "r0"
> > > +
> > > +S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> > > +
> > > +DEPENDS_append =3D " osal-rtos \
> > > +                   pruss-lld-rtos \ "
> > > +DEPENDS_append_ti33x =3D " starterware-rtos \ "
> > > +DEPENDS_append_ti43x =3D " starterware-rtos \ "
> > > +
> > > +# Build with make instead of XDC
> > > +TI_PDK_XDCMAKE =3D "0"
> > > +
> > > +export PDK_ICSS_EMAC_ROOT_PATH =3D"${WORKDIR}/build"
> > > +export DEST_ROOT=3D"${S}"
> > > +
> > > +# HTML doc link params
> > > +PDK_COMP_LINK_TEXT =3D "ICSS-EMAC LLD"
> > > +
> > > +INSANE_SKIP_${PN} =3D "arch"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

