Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.765.1588828972093150751
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 22:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EjJ0JxPE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nikhil.nd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0475MpMG034907;
	Thu, 7 May 2020 00:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588828971;
	bh=JVbAhqmcHqtW+jrwTgWs1OaP7EELfXEvsfXX3bAmhsI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EjJ0JxPEJqG1F8bgXX3epWwHvJ76WT6h694FIi0AgmxMj8lfs86n/Nigz+Sq56UpY
	 i6gloiXNKALBnxsvtS/2JS1gFEP1sU/PsCLkOQgnhzYzqSOQcgfuH7g5BRsT6D6fPX
	 8QuH/+vYFIw2k7ES6SAtykMpoOAybL87F/aw/240=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0475MpKC072230;
	Thu, 7 May 2020 00:22:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 May
 2020 00:22:50 -0500
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
 DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
 15.01.1979.003; Thu, 7 May 2020 00:22:50 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master PATCH v1] recipes-kernel: linux-ti-staging: Autoload kernel module rpmsg_kdrv_switch
Thread-Topic: [meta-ti][zeus/master PATCH v1] recipes-kernel:
 linux-ti-staging: Autoload kernel module rpmsg_kdrv_switch
Thread-Index: AQHWI7xXf+UhuOQs9kq0oHshhcAW7aibku8AgACEX7A=
Date: Thu, 7 May 2020 05:22:50 +0000
Message-ID: <d18ae6fb6b5f471e8ac281b3e56110e8@ti.com>
References: <20200506153803.11083-1-nikhil.nd@ti.com>
 <20200506162753.GQ2849@beryl>
In-Reply-To: <20200506162753.GQ2849@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.175.248]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I was expecting a merge to zeus as well.
What branches are we using for the coresdk release?

Regards,
Nikhil D

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, May 6, 2020 9:58 PM
To: Devshatwar, Nikhil
Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][zeus/master PATCH v1] recipes-kernel: linux-ti-stagi=
ng: Autoload kernel module rpmsg_kdrv_switch

Nikhil,

This has already been merged over a week ago:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3Dbaa7ddff0d03=
0f228f55483da76a4ad8d4a205c8

Denys


On Wed, May 06, 2020 at 09:08:03PM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>=20
> rpmsg_kdrv_switch kernel module is implicitly dependent on the
> for virtual ethernet driver. Ensure that the module is auto loaded
> by default foe j7-evm platfom.
>=20
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_5.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
> index ecf72af9..1ec2a2fd 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -74,6 +74,7 @@ SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT=
_PROTOCOL};branch=3D${BRANCH} \
> =20
>  FILES_${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb=
"
> =20
> +KERNEL_MODULE_AUTOLOAD_append_j7-evm =3D " rpmsg_kdrv_switch"
>  # Special configuration for remoteproc/rpmsg IPC modules
>  module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: vi=
rtio_rpmsg_bus"
> --=20
> 2.17.1
>=20
