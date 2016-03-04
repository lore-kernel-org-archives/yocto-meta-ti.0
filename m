Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1262E00BA0; Fri,  4 Mar 2016 11:01:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CE28E00B37
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 11:01:17 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24J1HCM021786
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 13:01:17 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24J1Hx9023593
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 13:01:17 -0600
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 4 Mar 2016 13:01:16 -0600
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] ti-sysbios: Update to 6.45.01.29
Thread-Index: AQHRdcJRIo+HxXk8QUelzbpVGrZAC59JpEkQ
Date: Fri, 4 Mar 2016 19:01:16 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE13AF35766@DFLE12.ent.ti.com>
References: <1457048726-16687-1-git-send-email-jsobota@ti.com>
	<20160304030225.GT7505@edge>
In-Reply-To: <20160304030225.GT7505@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sysbios: Update to 6.45.01.29
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
X-List-Received-Date: Fri, 04 Mar 2016 19:01:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

The bios patch replaces version 6.42.02.29 and the xdc patch replaces versi=
on 3.31.02.38.

Justin

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 03, 2016 10:02 PM
To: Sobota, Justin
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] ti-sysbios: Update to 6.45.01.29

Justin,

Any reason these patches don't replace the version, but add a new one?

--=20
Denys


On Thu, Mar 03, 2016 at 06:45:25PM -0500, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.45.01.29.bb |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.45.01.29.bb
>=20
> diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/t=
i-sysbios_6.45.01.29.bb
> new file mode 100644
> index 0000000..6ab4e27
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> @@ -0,0 +1,12 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV =3D "6_45_01_29"
> +PR =3D "r0"
> +
> +LIC_FILES_CHKSUM =3D "file://manifest_bios_${PV}.html;md5=3Ddbcd89745f17=
45f24ace8171a96ed493"
> +
> +SRC_URI[sysbiosbin.md5sum] =3D "16cf6dc3c5cc9d2b877fa7d81dd12150"
> +SRC_URI[sysbiosbin.sha256sum] =3D "efaf5f1d725f3fd06e45476109b1124c74c16=
c39c870d12929e071047c3e5a22"
> +
> +TI_BIN_UNPK_CMDS=3D""
> +TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

