Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49108E009A0; Mon, 27 Jun 2016 08:06:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7488EE0043B
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 08:06:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RF5hi1015249
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 10:05:43 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RF6grT005804
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 10:06:44 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RF6dnZ032001
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 20:36:40 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0294.000; Mon, 27 Jun 2016 20:36:38 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] ti-sgx-ddk-um: update srcrev and bump PR
Thread-Index: AQHR0IELhyhdiUJTJ0umDb3f0irbNJ/9BwOAgABi7yA=
Date: Mon, 27 Jun 2016 15:06:38 +0000
Message-ID: <05CF4794C98B244ABDC620C10903762275BA6628@DBDE04.ent.ti.com>
References: <1467038074-1075-1-git-send-email-anandb@ti.com>
	<20160627144220.GY2177@edge>
In-Reply-To: <20160627144220.GY2177@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sgx-ddk-um: update srcrev and bump PR
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
X-List-Received-Date: Mon, 27 Jun 2016 15:06:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

I have submitted v2 of the patches with the update.=20

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, June 27, 2016 8:12 PM
To: Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] ti-sgx-ddk-um: update srcrev and bump PR

Anand,

Would be nice to briefly summarize the changes in this update, if possible.=
=20
Thanks.


On Mon, Jun 27, 2016 at 08:04:33PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb=20
> b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index e5c5de6..b8adde0 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  BRANCH =3D "ti-img-sgx/${PV}"
> =20
>  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "54ba970e33d3c13f726d7c035f3b5c3dcb74afdc"
> +SRCREV =3D "4cdbb6b192fc5cac53695faca3c3f8be16ca871d"
> =20
>  # There's only hardfp version available  python __anonymous() { @@=20
> -31,7 +31,7 @@ INITSCRIPT_PARAMS =3D "defaults 8"
> =20
>  inherit update-rc.d
> =20
> -PR =3D "r12"
> +PR =3D "r13"
>  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-d=
dk-um-linux"
> =20
>  DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

