Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 369ADE00D30; Tue, 26 Sep 2017 10:38:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BD8BE00CC4
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 10:38:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QHcmm6022454
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506447528;
	bh=mfbgXH+rQfNTgPKJX9tUZP/5xCQkkDeH/Iuqz4C9z3Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=eckFzc7iRHN5w5bxRuqkzC/H6hOZLC8hvTx5S/iQFLCxtaX2MjlMI058R1MdRBxbW
	LHz40ih/z6BzTFJp5+99KGQbygqTWB4FGVO9guy1/dlFk77Zo2Z52Kq+Mdj8ia/JX8
	3xj4cH8fBZ3ZyjyPjoYZm6AGmm+X7JvPiC11ElMw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QHcmme005004
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:38:48 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 26 Sep 2017 12:38:48 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti]  [PATCH 1/2] uio-test-pruss: add support for k2g
Thread-Index: AQHTNuw2FiA3TuC9xEmiehb75i8Uf6LHbnzA
Date: Tue, 26 Sep 2017 17:38:48 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D843EE@DLEE08.ent.ti.com>
References: <1506363856-5930-1-git-send-email-a0271529@ti.com>
	<20170926172331.GZ26843@edge>
In-Reply-To: <20170926172331.GZ26843@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] uio-test-pruss: add support for k2g
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
X-List-Received-Date: Tue, 26 Sep 2017 17:38:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, September 26, 2017 1:24 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] uio-test-pruss: add support for k2g
>=20
> On Mon, Sep 25, 2017 at 02:24:15PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> > Note: the patch of "uio-test_pruss:   Update to new version 1.0.2.0"
> > needs to be applied first before applying this patch.
>=20
> uio-test_pruss was already in morty-next for few days, along with some
> other patches, blocked by waiting for the final release tag on morty...
>=20

Yes, this patch is on top of the version in morty-next to add the k2g suppo=
rt.

>=20
> >  recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-=
ti/uio-
> test-pruss/uio-test-pruss_git.bb
> > index 0fae726..cbae1b1 100644
> > --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> > +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> > @@ -21,7 +21,7 @@ SRCREV =3D "${UIO_TEST_PRUSS_SRCREV}"
> >
> >  PR =3D "r0"
> >
> > -COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x"
> > +COMPATIBLE_MACHINE =3D "omap-a15|ti33x|ti43x|k2g"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -29,6 +29,7 @@ DEVICE_NAME =3D ""
> >  DEVICE_NAME_append_am57xx-evm =3D "am57xx"
> >  DEVICE_NAME_append_ti33x =3D "am33xx"
> >  DEVICE_NAME_append_ti43x =3D "am43xx"
> > +DEVICE_NAME_append_k2g =3D "k2g"
> >
> >  EXTRA_OEMAKE =3D "CGT_PRU=3D${TI_CGT_PRU_INSTALL_DIR}
> DEVICE=3D${DEVICE_NAME}"
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

