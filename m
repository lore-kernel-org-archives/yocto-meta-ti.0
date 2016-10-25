Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35704E00C45; Tue, 25 Oct 2016 15:54:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6C6BE00BF4
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:54:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PMsOlx026858
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:54:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PMsObH029496
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:54:24 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 25 Oct 2016 17:54:24 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] ti-sysbios: updated version to 6.46.1.38
Thread-Index: AQHSLw0iqTCKpNcXUEuh02//npdLPqC6GlqA//+sclA=
Date: Tue, 25 Oct 2016 22:54:23 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A2F5AC190@DLEE08.ent.ti.com>
References: <1477433645-16457-1-git-send-email-i-pang@ti.com>
	<20161025225127.GS12745@edge>
In-Reply-To: <20161025225127.GS12745@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sysbios: updated version to 6.46.1.38
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
X-List-Received-Date: Tue, 25 Oct 2016 22:54:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I want to update the version. I thought the convention is to create a new .=
bb recipe per version (as shown in the folder with multiple .bb files with =
different versions).

Ivan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, October 25, 2016 5:51 PM
To: Pang, Ivan
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] ti-sysbios: updated version to 6.46.1.38

On Tue, Oct 25, 2016 at 05:14:04PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.46.01.38.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.46.01.38.bb

Did you mean to update the version instead of adding a new one?


> diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb b/recipes-ti/bios/t=
i-sysbios_6.46.01.38.bb
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
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

