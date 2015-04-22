Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67DABE00994; Wed, 22 Apr 2015 07:07:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD5EBE0097C
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 07:07:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ME79qo011072
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:07:09 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ME78bP030268
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:07:08 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 22 Apr 2015 09:07:08 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] ipc: Update to new version 3.35.1.7
Thread-Index: AQHQfK6+4v1LU2EPPUeF75mmR1WnTZ1ZX4kA//+x7HA=
Date: Wed, 22 Apr 2015 14:07:07 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905818DFE7@DLEE11.ent.ti.com>
References: <1429674314-15019-1-git-send-email-sam.nelson@ti.com>
	<20150422134506.GD25236@edge>
In-Reply-To: <20150422134506.GD25236@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] ipc: Update to new version 3.35.1.7
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
X-List-Received-Date: Wed, 22 Apr 2015 14:07:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch was introduced earlier to overcome an issue. But looks like that =
patch is not generic right now.
Discussion on right now to have a proper fix.
We may have an update later on with the newer version of IPC.
With regards,
Sam

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, April 22, 2015 9:45 AM
To: Nelson, Sam
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] ipc: Update to new version 3.35.1.7

On Tue, Apr 21, 2015 at 11:45:14PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Change from previous verison of patch
> - Removed patch file

What about the patch? Do you still need it? Was it included by mistake?


> ---
> ---
>  recipes-ti/ipc/ti-ipc_git.bb |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb=20
> b/recipes-ti/ipc/ti-ipc_git.bb index 6f46295..bb2c3c9 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -6,14 +6,14 @@ LIC_FILES_CHKSUM =3D=20
> "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9
> =20
>  DEPENDS +=3D "virtual/kernel"
> =20
> -PV =3D "3.35.00.05"
> +PV =3D "3.35.01.07"
> =20
>  BRANCH =3D "master"
>  SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D${B=
RANCH} \
>             file://tiipclad-daemon.sh \
>             "
> -# Commit corresponds to 3.35.00.05
> -SRCREV =3D "ce35c999f5c3368e387740a38aef3358290579b3"
> +# Commit corresponds to 3.35.01.07
> +SRCREV =3D "358d966c9f5973faf9ab71fb1d7dfe5d3e08a8dc"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

