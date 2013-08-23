Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65F14E003D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 13:07:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NK7Wpv016559;
	Fri, 23 Aug 2013 15:07:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NK7WCe031682;
	Fri, 23 Aug 2013 15:07:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:07:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/4] ti43x: add new SOC family for Sitara
	AM43xx Cortex-A9 processors
Thread-Index: AQHOoDtHhuSVh+7jk0aus+2wBLjXjpmjOEIg
Date: Fri, 23 Aug 2013 20:07:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DF041@DLEE11.ent.ti.com>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
	<1377287906-17115-3-git-send-email-denis@denix.org>
In-Reply-To: <1377287906-17115-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ti43x: add new SOC family for Sitara AM43xx Cortex-A9 processors
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
X-List-Received-Date: Fri, 23 Aug 2013 20:07:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 2:58 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 3/4] ti43x: add new SOC family for
>Sitara AM43xx Cortex-A9 processors
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> conf/machine/include/ti43x.inc | 37
>+++++++++++++++++++++++++++++++++++++
> 1 file changed, 37 insertions(+)
> create mode 100644 conf/machine/include/ti43x.inc
>
>diff --git a/conf/machine/include/ti43x.inc
>b/conf/machine/include/ti43x.inc
>new file mode 100644
>index 0000000..c9ce2bb
>--- /dev/null
>+++ b/conf/machine/include/ti43x.inc
>@@ -0,0 +1,37 @@
>+SOC_FAMILY =3D "ti43x"
>+require conf/machine/include/soc-family.inc
>+
>+require conf/machine/include/tune-cortexa9.inc
>+
>+PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
>+
>+# For built-in LCD, add xf86-input-tslib
>+XSERVER =3D "xserver-xorg \
>+           xf86-input-evdev \
>+           xf86-input-mouse \
>+           xf86-video-fbdev \
>+           xf86-input-keyboard"
>+
>+# Default to external video, change to smallscreen for built-in
>LCD
>+GUI_MACHINE_CLASS =3D "bigscreen"
>+
>+# Increase this everytime you change something in the kernel
>+MACHINE_KERNEL_PR =3D "r0"
>+
>+# Default providers, may need to override for specific machines
>+PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
>+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
>+PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>+
>+KERNEL_IMAGETYPE =3D "uImage"
>+
>+UBOOT_ARCH =3D "arm"
>+UBOOT_MACHINE =3D "am43xx_evm_config"
>+
>+UBOOT_ENTRYPOINT =3D "0x80008000"
>+UBOOT_LOADADDRESS =3D "0x80008000"
>+
>+EXTRA_IMAGEDEPENDS +=3D "u-boot"
>+
>+# List common SoC features, may need to add touchscreen for
>specific machines
>+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2
>screen alsa ethernet sgx"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

