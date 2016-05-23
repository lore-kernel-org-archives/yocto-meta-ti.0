Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE312E004A0; Mon, 23 May 2016 10:04:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AED4AE003D9
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 10:04:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4NH4pML017127
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 12:04:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4NH4p46014290
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 12:04:51 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 23 May 2016 12:04:51 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] k2g-evm: add opencl feature
Thread-Index: AQHRtQ56//yAzoyPr0i1tZHRK6MF95/HEykA//+snbA=
Date: Mon, 23 May 2016 17:04:50 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581428DA8E@DFLE09.ent.ti.com>
References: <1464020188-22786-1-git-send-email-j-stiffler@ti.com>
	<20160523170119.GL3287@edge>
In-Reply-To: <20160523170119.GL3287@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] k2g-evm: add opencl feature
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
X-List-Received-Date: Mon, 23 May 2016 17:04:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, May 23, 2016 1:01 PM
> To: Stiffler, Jacob
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] k2g-evm: add opencl feature
>=20
> Jake,
>=20
> Is everything else ready for k2g? It wasn't enabled previously in our
> packagegroups, hence I didn't add machine feature for it here.
>

Yes, everything else is ready. Support for k2g came in very close to the 20=
15.03 release, so the packagegroup additions were not upstreamed at that ti=
me.=20

- Jake

> --
> Denys
>=20
>=20
> On Mon, May 23, 2016 at 12:16:28PM -0400, Jacob Stiffler wrote:
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  conf/machine/k2g-evm.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
> > index 125a949..860324c 100644
> > --- a/conf/machine/k2g-evm.conf
> > +++ b/conf/machine/k2g-evm.conf
> > @@ -4,7 +4,7 @@
> >
> >  require conf/machine/include/keystone.inc
> >
> > -MACHINE_FEATURES +=3D "alsa"
> > +MACHINE_FEATURES +=3D "alsa opencl"
> >
> >  UBOOT_MACHINE =3D "k2g_evm_config"
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

