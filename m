Return-Path: <manishv.b@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC3A7E01482
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 04:21:03 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5SBL1bN021864
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 06:21:02 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5SBKxha016462
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 06:21:00 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Fri, 28 Jun 2013 19:20:59 +0800
From: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] gbm: Add TI staging tree
Thread-Index: AQHOc++TXPMHj+VXtUyV+YLPNQ1jMplK91MQgAADVpA=
Date: Fri, 28 Jun 2013 11:20:59 +0000
Message-ID: <A4887BF146CD57468F700B415D2F47015AAF78@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D543D2B9@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D543D2B9@DBDE04.ent.ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCH] gbm: Add TI staging tree
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
X-List-Received-Date: Fri, 28 Jun 2013 11:21:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 28, 2013 at 16:37:51, Hingolikar, Mrinmayee wrote:
>=20
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  recipes-graphics/gbm/libgbm.inc    |   15 +++++++++++++++
>  recipes-graphics/gbm/libgbm_git.bb |    7 +++++++

There is no commit message for this patch.

>  2 files changed, 22 insertions(+), 0 deletions(-)  create mode 100644 re=
cipes-graphics/gbm/libgbm.inc  create mode 100644 recipes-graphics/gbm/libg=
bm_git.bb
>=20
> diff --git a/recipes-graphics/gbm/libgbm.inc b/recipes-graphics/gbm/libgb=
m.inc new file mode 100644 index 0000000..07591e6
> --- /dev/null
> +++ b/recipes-graphics/gbm/libgbm.inc
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Userspace interface for the kernel GBM services."
> +DESCRIPTION =3D "This is the gbm frontend used by (for example) weston \=
=20
> +compositor to load the GLES stack, and retrieve the backing buffer \=20
> +objects behind an eglImage (created with EGL_WAYLAND_BUFFER_WL), etc.\=20
> +The frontend is really just a backend loader and shim. \ The backend=20
> +library must be provided by the GLES implementation."
> +HOMEPAGE =3D "http://git.ti.com"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://gbm.c;beginline=3D1;endline=3D26;md5=3Db871=
c7f2f477df29ee4c0ec437b187f7"
> +PROVIDES =3D "gbm"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES =3D+ "${PN}-dev"
> +FILES_${PN}-dev =3D "${libdir}/libgbm_*.so.*"
> diff --git a/recipes-graphics/gbm/libgbm_git.bb b/recipes-graphics/gbm/li=
bgbm_git.bb
> new file mode 100644
> index 0000000..d1fa38d
> --- /dev/null
> +++ b/recipes-graphics/gbm/libgbm_git.bb
> @@ -0,0 +1,7 @@
> +require libgbm.inc
> +
> +SRC_URI =3D "git://git.ti.com/glsdk/libgbm.git;protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV =3D "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20


Regards,=20
Manish

