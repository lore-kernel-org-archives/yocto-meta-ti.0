Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CE85E00BB7; Wed, 20 Feb 2019 06:27:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0F20E00754
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 06:27:38 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1KERcKY022059
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 08:27:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550672858;
	bh=4O+tZUtMB7j47RwbhfyXAjgfGdtLWTEDIi7UsXNpjI0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=bvqpNjB7yllphJYVAB8nK7TMcco9qrTWx3XVFMRs2WATpwOB4AcQ6HYC3XbE+WLUB
	HiYx19UsX30WEO9OfHFj12XC/HYhvlU+QIobKN81PYoS8v1vySN4i67h6I45CHdp9a
	9rhHDXMsHCODum22xoVHSOIU0RYwSEV0Ia39s17U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1KERcg4025929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 08:27:38 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 20 Feb 2019 08:27:38 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1591.008; Wed, 20 Feb 2019 08:27:38 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [EXTERNAL] [rocko/master][PATCH] uart-lld-rtos:
	Updating checksum file & dependency for ti33x
Thread-Index: AQHUyShtVLTd2k9IQkm77C+Z2bx5iQ==
Date: Wed, 20 Feb 2019 14:27:37 +0000
Message-ID: <127601aa52204aaeaf0fbf3d7854778b@ti.com>
References: <1550163203-38002-1-git-send-email-m-radhakrishnan2@ti.com>
	<1550163203-38002-2-git-send-email-m-radhakrishnan2@ti.com>
	<5b07c8d6-ad6e-5d89-c130-9cd989581759@ti.com>
In-Reply-To: <5b07c8d6-ad6e-5d89-c130-9cd989581759@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [rocko/master][PATCH] uart-lld-rtos: Updating checksum file & dependency for ti33x
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
X-List-Received-Date: Wed, 20 Feb 2019 14:27:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> Sent: Thursday, February 14, 2019 12:54 PM
> To: Radhakrishnan, Mahesh; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [EXTERNAL] [rocko/master][PATCH] uart-lld-rtos:
> Updating checksum file & dependency for ti33x
>=20
> ACK
>=20
>=20
> Acked-by: Jacob Stiffler <j-stiffler@ti.com>
>=20
>=20
> On 2/14/2019 11:53 AM, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >   recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/ua=
rt-
> lld/uart-lld-rtos_git.bb
> > index 0dceecb..be1f8c8 100644
> > --- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> > +++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "TI RTOS low level driver for Universal
> Asynchronous Receiver/Tran
> >   inherit ti-pdk
> >
> >   LICENSE =3D "BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D
> "file://UART.h;beginline=3D1;endline=3D31;md5=3D8580f9c5c0de8d5d13518cf18=
a01
> 22b8"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;beginline=3D1;endline=3D31;md5=3D94b6a199da1caf777f67=
56c
> b70aca4a7"
> >
> >   COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-
> a15|keystone|omapl1|c66x|k3"
> >   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > @@ -14,19 +14,21 @@ UART_LLD_GIT_PROTOCOL =3D "git"
> >   UART_LLD_GIT_BRANCH =3D "master"
> >
> >   # Below commit ID corresponds to "DEV.UART_LLD.01.00.00.13"
> > -UART_LLD_SRCREV =3D "3af02f4c4e4d5fe126d49076d343f41ea3878106"
> > +UART_LLD_SRCREV =3D "f9298edb5a39bd72f256b53a0b63c6c019cdedce"
> >
> >   BRANCH =3D "${UART_LLD_GIT_BRANCH}"
> >   SRC_URI =3D
> "${UART_LLD_GIT_URI};protocol=3D${UART_LLD_GIT_PROTOCOL};branch=3D${BR
> ANCH}"
> >
> >   SRCREV =3D "${UART_LLD_SRCREV}"
> >   PV =3D "01.00.00.13"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >   DEPENDS_append =3D " edma3-lld-rtos \
> >                      osal-rtos \
> >   "
> > -DEPENDS_append_ti33x =3D " starterware-rtos"
> > +DEPENDS_append_ti33x =3D " starterware-rtos \
> > +                         pruss-lld-rtos \
> > +"
> >   DEPENDS_append_ti43x =3D " starterware-rtos"
> >
> >   DEPENDS_remove_k3 =3D "edma3-lld-rtos "
> > @@ -43,3 +45,5 @@ XDCPATH_append =3D
> ";${EDMA3_LLD_INSTALL_DIR}/packages"
> >
> >   # HTML doc link params
> >   PDK_COMP_LINK_TEXT =3D "UART LLD"
> > +
> > +INSANE_SKIP_${PN} =3D "arch"
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

