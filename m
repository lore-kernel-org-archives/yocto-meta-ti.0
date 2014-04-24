Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02B53E006EC
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 05:44:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OCiv21000498;
	Thu, 24 Apr 2014 07:44:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OCivJg027884;
	Thu, 24 Apr 2014 07:44:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 07:44:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] am437x-evm: increase LEB count to fit full
	rootfs
Thread-Index: AQHPX1+Fq2XzOBbjXkKCKgUGpkJIDZsgtziQ
Date: Thu, 24 Apr 2014 12:44:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB218F@DLEE11.ent.ti.com>
References: <1398304157-4873-1-git-send-email-denis@denix.org>
In-Reply-To: <1398304157-4873-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] am437x-evm: increase LEB count to fit full rootfs
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
X-List-Received-Date: Thu, 24 Apr 2014 12:45:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, April 23, 2014 8:49 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] am437x-evm: increase LEB count to fit
>full rootfs
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> conf/machine/am437x-evm.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-
>evm.conf
>index 266f1fd..15e5f53 100644
>--- a/conf/machine/am437x-evm.conf
>+++ b/conf/machine/am437x-evm.conf
>@@ -24,7 +24,7 @@ SERIAL_CONSOLE =3D "115200 ttyO0"
> # UBI: logical eraseblock size:    253952 bytes
> # from ubiattach stdout:
> # UBI device number 0, total 994 LEBs
>-MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 994"
>+MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 1918"
>
> # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
> # from dmesg:
>--
>1.9.2
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

