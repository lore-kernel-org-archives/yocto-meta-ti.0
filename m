Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F7E8E00D6A; Tue, 25 Oct 2016 17:05:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 179ACE00CD8
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:05:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9Q05MTR014679
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 19:05:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9Q05MsC012681
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 19:05:22 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Tue, 25 Oct 2016 19:05:22 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] ti-sysbios: update version to 6.46.1.38
Thread-Index: AQHSLxptm/2hXnhuV0G4Uof4Pr2qG6C6K2KA//+uyKA=
Date: Wed, 26 Oct 2016 00:05:21 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A2F5AD24B@DLEE08.ent.ti.com>
References: <1477439360-19677-1-git-send-email-i-pang@ti.com>
	<20161025235246.GV12745@edge>
In-Reply-To: <20161025235246.GV12745@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sysbios: update version to 6.46.1.38
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
X-List-Received-Date: Wed, 26 Oct 2016 00:05:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok, will re-submit once more.

Ivan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, October 25, 2016 6:53 PM
To: Pang, Ivan
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] ti-sysbios: update version to 6.46.1.38

Please pass -M flag to git format-patch.

On Tue, Oct 25, 2016 at 06:49:19PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.45.01.29.bb | 12 ------------ =20
> recipes-ti/bios/ti-sysbios_6.46.01.38.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)  delete mode=20
> 100644 recipes-ti/bios/ti-sysbios_6.45.01.29.bb
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.46.01.38.bb
>=20
> diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb=20
> b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> deleted file mode 100644
> index 6ab4e27..0000000
> --- a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require recipes-ti/bios/ti-sysbios.inc
> -
> -PV =3D "6_45_01_29"
> -PR =3D "r0"
> -
> -LIC_FILES_CHKSUM =3D "file://manifest_bios_${PV}.html;md5=3Ddbcd89745f17=
45f24ace8171a96ed493"
> -
> -SRC_URI[sysbiosbin.md5sum] =3D "16cf6dc3c5cc9d2b877fa7d81dd12150"
> -SRC_URI[sysbiosbin.sha256sum] =3D "efaf5f1d725f3fd06e45476109b1124c74c16=
c39c870d12929e071047c3e5a22"
> -
> -TI_BIN_UNPK_CMDS=3D""
> -TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
> diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb=20
> b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> new file mode 100644
> index 0000000..407b3b4
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> @@ -0,0 +1,12 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV =3D "6_46_01_38"
> +PR =3D "r0"
> +
> +LIC_FILES_CHKSUM =3D "file://manifest_bios_${PV}.html;md5=3Dda86dca468e5=
dd80484dc83473ea32e3"
> +
> +SRC_URI[sysbiosbin.md5sum] =3D "5aee070f73eb6f3d9aab2ff9c483f396"
> +SRC_URI[sysbiosbin.sha256sum] =3D "3a04a584c3ee3221997b7d616ba45bbcc21ad=
241f4a4ab5c0f28c465d538af90"
> +
> +TI_BIN_UNPK_CMDS=3D""
> +TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

