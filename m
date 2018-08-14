Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F683E00566; Tue, 14 Aug 2018 07:38:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60185E0049F
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 07:38:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EEcb9r110420
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 09:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534257517;
	bh=FKQ8ci14+cYM/LfNqm8jjxiKc/OcVnYFzpPC3mIOAV0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=uTmdD50LwT2brqnW4lv9+dq1Q9lvB6dap2NwBXCOAKi07CNKG8ZE+PfqSqB7yXaJM
	M9x4pM7AqrqLyDSvVXShl7imgWZWy1LhapLwSY0sD1kFrXX3Y6ptakRNKi8Kvb1nG3
	8siTjoT8haLYcAkON6W5L1lH/zl+6CZawdlSLbw8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EEcbcH003405
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 09:38:37 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 09:38:37 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1466.003; Tue, 14 Aug 2018 09:38:37 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.00.12
Thread-Index: AQHUMLplCqeL+a2xhECjyFm+jHLoVKS+xhwAgACQnvA=
Date: Tue, 14 Aug 2018 14:38:37 +0000
Message-ID: <27df07c9ee9a45129d507e97e22c6c9c@ti.com>
References: <1533894889-29809-1-git-send-email-hzhang@ti.com>
	<20180814005812.GZ2547@beryl>
In-Reply-To: <20180814005812.GZ2547@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.179]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.00.12
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
X-List-Received-Date: Tue, 14 Aug 2018 14:38:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, August 13, 2018 8:58 PM
> To: Zhang, Hao
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.=
00.12
>=20
> On Fri, Aug 10, 2018 at 05:54:49AM -0400, hzhang@ti.com wrote:
> > From: Hao Zhang <hzhang@ti.com>
> >
> > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > ---
> >  recipes-ti/bios/ti-sysbios_6.73.00.12.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 recipes-ti/bios/ti-sysbios_6.73.00.12.bb
>=20
> Same question - do we need to keep around 6.52, 6.46 and 6.33 versions?
>=20

Please keep the old versions for now, we can remove them later.

>=20
> > diff --git a/recipes-ti/bios/ti-sysbios_6.73.00.12.bb b/recipes-ti/bios=
/ti-
> sysbios_6.73.00.12.bb
> > new file mode 100644
> > index 0000000..b727673
> > --- /dev/null
> > +++ b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
> > @@ -0,0 +1,15 @@
> > +require recipes-ti/bios/ti-sysbios.inc
> > +
> > +PV =3D "6_73_00_12"
> > +PR =3D "r0"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://manifest_bios_${PV}.html;md5=3D99771475f3621a6bf690df10327eaaa9
> "
> > +
> > +SRC_URI[sysbiosbin.md5sum] =3D "f8ff74bf0cfebdd5689fba843272ac61"
> > +SRC_URI[sysbiosbin.sha256sum] =3D
> "4fdf76696fb43984a9cae739fd2ee091ca9d031ad0277d2bb94dbb26eae63f43
> "
> > +
> > +TI_BIN_UNPK_CMDS =3D ""
> > +TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
> > +
> > +BINFILE =3D "bios_${PV}.run"
> > +SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/ex
> ports/${BINFILE};name=3Dsysbiosbin"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

