Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BDE8E00496
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 13:05:56 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NK5tHk005230;
	Fri, 23 Aug 2013 15:05:55 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NK5tW9029474;
	Fri, 23 Aug 2013 15:05:55 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:05:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/4] u-boot-ti-staging: add the latest
	integration tree in prep for 2013.10 release
Thread-Index: AQHOoDtRckG1qy/3702kYgptj9rHs5mjN5Ow
Date: Fri, 23 Aug 2013 20:05:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DEFAC@DLEE11.ent.ti.com>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
	<1377287906-17115-2-git-send-email-denis@denix.org>
In-Reply-To: <1377287906-17115-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] u-boot-ti-staging: add the latest integration tree in prep for 2013.10 release
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
X-List-Received-Date: Fri, 23 Aug 2013 20:05:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 2:58 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/4] u-boot-ti-staging: add the latest
>integration tree in prep for 2013.10 release
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/u-boot/u-boot-ti-staging_git.bb | 19
>+++++++++++++++++++
> 1 file changed, 19 insertions(+)
> create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>
>diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>new file mode 100644
>index 0000000..bd6188d
>--- /dev/null
>+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>@@ -0,0 +1,19 @@
>+require u-boot-ti.inc
>+
>+DESCRIPTION =3D "u-boot bootloader for TI devices"
>+
>+LIC_FILES_CHKSUM =3D
>"file://Licenses/README;md5=3D6bc50ecab884fce80cd3ef3da8852b08"
>+
>+PV =3D "2013.09+2013.10-rc1"

Shouldn't this be more 2013.07+2013.10-rc1?

Also, will you update the other machines like dra7xx-evm to use this tree?

>+PR =3D "r0+gitr${SRCPV}"
>+
>+DEFAULT_PREFERENCE =3D "-1"
>+
>+SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+BRANCH ?=3D "master"
>+
>+SRCREV =3D "39bc12ddc36c9e30199471da0f3a929b178a04b2"
>+
>+SPL_BINARY =3D "MLO"
>+SPL_UART_BINARY =3D "u-boot-spl.bin"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

