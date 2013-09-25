Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 024D9E01600
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 06:43:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PDhM29009208
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 08:43:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PDhLSx002313;
	Wed, 25 Sep 2013 08:43:21 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 25 Sep 2013 08:43:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Muddegowda, Deepak" <x0171695@ti.com>, "Srinivasan, Nageswari"
	<nageswari@ti.com>, "Heroor, Siddharth" <heroor@ti.com>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "Mankad,
	Maulik Ojas" <maulik@ti.com>, "epos_dev@list.ti.com - Internal mailing list
	for EPOS dev team (May contain non-TIers)" <epos_dev@list.ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti patch v3  1/3] am43xx : Added machine config for
	am437x EPOS machine
Thread-Index: AQHOuexWdI1uDOZqYUqXEnUaERVH0ZnWdi8Q
Date: Wed, 25 Sep 2013 13:43:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015974D5A7@DLEE11.ent.ti.com>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-2-git-send-email-x0171695@ti.com>
In-Reply-To: <1380112791-22545-2-git-send-email-x0171695@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [meta-ti patch v3 1/3] am43xx : Added machine config for am437x EPOS machine
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
X-List-Received-Date: Wed, 25 Sep 2013 13:43:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Muddegowda, Deepak
>Sent: Wednesday, September 25, 2013 7:40 AM
>To: Srinivasan, Nageswari; Maupin, Chase; Heroor, Siddharth;
>Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>Muddegowda, Deepak; epos_dev@list.ti.com - Internal mailing list
>for EPOS dev team (May contain non-TIers); meta-
>ti@yoctoproject.org
>Subject: [meta-ti patch v3 1/3] am43xx : Added machine config for
>am437x EPOS machine
>
>As this belongs to the ti43x SOC_FAMILY inluding the
>ti43x`s include.
>
>Signed-off-by: Deepak M <x0171695@ti.com>
>---
>v3 :
>1. Changed the machine name to am437x-epos-evm
>2. Changed the UBOOT_MACHINE
>3. Adding the meta-ti@yoctoproject.org list for review.
>
> conf/machine/am437x-epos-evm.conf | 38
>++++++++++++++++++++++++++++++++++++++
> 1 file changed, 38 insertions(+)
> create mode 100644 conf/machine/am437x-epos-evm.conf
>
>diff --git a/conf/machine/am437x-epos-evm.conf
>b/conf/machine/am437x-epos-evm.conf
>new file mode 100644
>index 0000000..a9adf7e
>--- /dev/null
>+++ b/conf/machine/am437x-epos-evm.conf
>@@ -0,0 +1,38 @@
>+#@TYPE: Machine
>+#@NAME: AM43xx EVM
>+#@DESCRIPTION: Machine configuration for the TI AM43xx EVM
>+
>+require conf/machine/include/ti43x.inc
>+
>+# Use built-in LCD by default
>+XSERVER +=3D "xf86-input-tslib"
>+GUI_MACHINE_CLASS =3D "smallscreen"
>+MACHINE_FEATURES +=3D "touchscreen"

Denys, input on these lines above?

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
>+
>+UBOOT_MACHINE =3D "am43xx_evm"

Maybe a silly question but why the change in UBOOT_MACHINE?

>+PPA_PROJ =3D "hyperseam"
>--
>1.8.1


