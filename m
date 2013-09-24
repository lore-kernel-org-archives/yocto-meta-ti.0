Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D48BDE0153B
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 06:52:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8ODq3Mr022372;
	Tue, 24 Sep 2013 08:52:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8ODq3ja014601;
	Tue, 24 Sep 2013 08:52:03 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 08:52:02 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/4] u-boot-ti-staging: update to the latest
	2013.10-rc2 and make it the default
Thread-Index: AQHOuM2/aj25gCuJb0qoOwHKhzMQJpnU6NxQ
Date: Tue, 24 Sep 2013 13:52:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159747534@DLEE11.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-2-git-send-email-denis@denix.org>
In-Reply-To: <1379989631-8098-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] u-boot-ti-staging: update to the latest 2013.10-rc2 and make it the default
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
X-List-Received-Date: Tue, 24 Sep 2013 13:52:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, September 23, 2013 9:27 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/4] u-boot-ti-staging: update to the
>latest 2013.10-rc2 and make it the default
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/u-boot/u-boot-ti-staging_git.bb | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>index 8d96aee..8c005b4 100644
>--- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>@@ -4,16 +4,14 @@ DESCRIPTION =3D "u-boot bootloader for TI devices"
>
> LIC_FILES_CHKSUM =3D
>"file://Licenses/README;md5=3D6bc50ecab884fce80cd3ef3da8852b08"
>
>-PV =3D "2013.07+2013.10-rc1"
>+PV =3D "2013.07+2013.10-rc2"
> PR =3D "r0+gitr${SRCPV}"
>
>-DEFAULT_PREFERENCE =3D "-1"
>-
> SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>
> BRANCH ?=3D "master"
>
>-SRCREV =3D "39bc12ddc36c9e30199471da0f3a929b178a04b2"
>+SRCREV =3D "fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c"
>
> SPL_BINARY =3D "MLO"
> SPL_UART_BINARY =3D "u-boot-spl.bin"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

