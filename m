Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 486DAE014E9
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 13:51:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3QKpOi0010850;
	Fri, 26 Apr 2013 15:51:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3QKpOwf003815;
	Fri, 26 Apr 2013 15:51:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 26 Apr 2013 15:51:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] linux-ti-staging: update to ti2013.04.00
	release
Thread-Index: AQHOQrnavfCRVg9UwkC07cDM9DvJ95jo+h5Q
Date: Fri, 26 Apr 2013 20:51:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101595189E4@DLEE11.ent.ti.com>
References: <1367006879-12633-1-git-send-email-denis@denix.org>
In-Reply-To: <1367006879-12633-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux-ti-staging: update to ti2013.04.00	release
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
X-List-Received-Date: Fri, 26 Apr 2013 20:51:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ack

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, April 26, 2013 3:08 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/2] linux-ti-staging: update to
> ti2013.04.00 release
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Also, remove do_deploy_append() fix, as it's in oe-core now.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.8.bb | 20 +++-----------
> ------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> index 622fa3e..6fe52e2 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -6,21 +6,6 @@ KERNEL_IMAGETYPE =3D "uImage"
>=20
>  inherit kernel
>=20
> -# This function must be here BEFORE the require of linux-dtb.inc
> below.
> -# There is a "bug" in the base kernel.bbclass that after it's
> do_deploy
> -# step it does not return back to the ${S} directory but stays
> in the
> -# DEPLOY_DIR.  However, the do_deploy_append defined in linux-
> dtb.inc
> -# assumes that it is being run in the ${S} directory.  A patch
> is
> -# being submitted to fix this issue by either changing the
> do_deploy
> -# in the kernel.bbclass to do "cd -" as the last step or to add
> -# "cd ${S}" as the first line of do_deploy in linux-dtb.inc and
> this
> -# function can be removed once that change is available.
> -# If the function is not placed BEFORE the require then the
> change
> -# directory is not appended before the linux-dtb.inc changes.
> -do_deploy_append() {
> -    cd ${S}
> -}
> -
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
>=20
> @@ -40,11 +25,12 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.8.y"
>=20
> -SRCREV =3D "1de3616c36710b6949844738f9c63b96e307c49f"
> +# This commit corresponds to ti2013.04.00 release tag
> +SRCREV =3D "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
>  PV =3D "3.8.8"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> cause a rebuild
> -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> --
> 1.8.2.1
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

