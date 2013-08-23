Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E4F4E003D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 13:07:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NK7k7k005352;
	Fri, 23 Aug 2013 15:07:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NK7k7c031892;
	Fri, 23 Aug 2013 15:07:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:07:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 4/4] am437x-evm: add machine config for
	Sitara	AM437x EVM
Thread-Index: AQHOoDtCuCDd0mNNakuUQpwFOAgSl5mjOFgg
Date: Fri, 23 Aug 2013 20:07:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF066@DLEE11.ent.ti.com>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
	<1377287906-17115-4-git-send-email-denis@denix.org>
In-Reply-To: <1377287906-17115-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] am437x-evm: add machine config for Sitara	AM437x EVM
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
X-List-Received-Date: Fri, 23 Aug 2013 20:07:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 2:58 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 4/4] am437x-evm: add machine config for
>Sitara AM437x EVM
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> conf/machine/am437x-evm.conf | 35
>+++++++++++++++++++++++++++++++++++
> 1 file changed, 35 insertions(+)
> create mode 100644 conf/machine/am437x-evm.conf
>
>diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-
>evm.conf
>new file mode 100644
>index 0000000..901bfe8
>--- /dev/null
>+++ b/conf/machine/am437x-evm.conf
>@@ -0,0 +1,35 @@
>+#@TYPE: Machine
>+#@NAME: AM437x EVM
>+#@DESCRIPTION: Machine configuration for the TI AM437x EVM
>+
>+require conf/machine/include/ti43x.inc
>+
>+# Use built-in LCD by default
>+XSERVER +=3D "xf86-input-tslib"
>+GUI_MACHINE_CLASS =3D "smallscreen"
>+MACHINE_FEATURES +=3D "touchscreen"
>+
>+IMAGE_FSTYPES +=3D "ubi tar.gz"
>+
>+SERIAL_CONSOLE =3D "115200 ttyO0"
>+
>+# UBI information.  Note that this is board and kernel specific.
>Changes
>+# in your kernel port may require changes in these variables.
>For more
>+# details about this board please see
>+# http://processors.wiki.ti.com/index.php/UBIFS_Support
>+
>+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>+# From dmesg:
>+# UBI: smallest flash I/O unit:    2048
>+# UBI: logical eraseblock size:    126976 bytes
>+# from ubiattach stdout:
>+# UBI device number 0, total 1988 LEBs
>+MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 3836"
>+
>+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>+# from dmesg:
>+# UBI: smallest flash I/O unit:    2048
>+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
>+# UBI: sub-page size:              512
>+# UBI: VID header offset:          2048 (aligned 2048)
>+UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

