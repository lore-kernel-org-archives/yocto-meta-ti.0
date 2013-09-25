Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD271E01600
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 06:45:44 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PDjifT029289
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 08:45:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PDjift005466;
	Wed, 25 Sep 2013 08:45:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 25 Sep 2013 08:45:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Muddegowda, Deepak" <x0171695@ti.com>, "Srinivasan, Nageswari"
	<nageswari@ti.com>, "Heroor, Siddharth" <heroor@ti.com>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "Mankad,
	Maulik Ojas" <maulik@ti.com>, "epos_dev@list.ti.com - Internal mailing list
	for EPOS dev team (May contain non-TIers)" <epos_dev@list.ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti patch v3  1/3] am43xx : Added machine config for
	am437x EPOS machine
Thread-Index: AQHOuexWdI1uDOZqYUqXEnUaERVH0ZnWdi8QgABUmoD//6xNoA==
Date: Wed, 25 Sep 2013 13:45:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015974D69E@DLEE11.ent.ti.com>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-2-git-send-email-x0171695@ti.com>
	<7D46E86EC0A8354091174257B2FED1015974D5A7@DLEE11.ent.ti.com>
	<16D38216B6B8BA4B9AF9DBFC3760F38D3F14DDA6@DBDE04.ent.ti.com>
In-Reply-To: <16D38216B6B8BA4B9AF9DBFC3760F38D3F14DDA6@DBDE04.ent.ti.com>
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
X-List-Received-Date: Wed, 25 Sep 2013 13:45:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Muddegowda, Deepak
>Sent: Wednesday, September 25, 2013 8:45 AM
>To: Maupin, Chase; Srinivasan, Nageswari; Heroor, Siddharth;
>Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>epos_dev@list.ti.com - Internal mailing list for EPOS dev team
>(May contain non-TIers); meta-ti@yoctoproject.org
>Subject: RE: [meta-ti patch v3 1/3] am43xx : Added machine config
>for am437x EPOS machine
>
>
>
>> -----Original Message-----
>> From: Maupin, Chase
>> Sent: Wednesday, September 25, 2013 7:13 PM
>> To: Muddegowda, Deepak; Srinivasan, Nageswari; Heroor,
>Siddharth;
>> Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>> epos_dev@list.ti.com - Internal mailing list for EPOS dev team
>(May
>> contain non-TIers); meta-ti@yoctoproject.org
>> Subject: RE: [meta-ti patch v3 1/3] am43xx : Added machine
>config for
>> am437x EPOS machine
>>
>> >-----Original Message-----
>> >From: Muddegowda, Deepak
>> >Sent: Wednesday, September 25, 2013 7:40 AM
>> >To: Srinivasan, Nageswari; Maupin, Chase; Heroor, Siddharth;
>Cooper
>> >Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>Muddegowda,
>> >Deepak; epos_dev@list.ti.com - Internal mailing list for EPOS
>dev team
>> >(May contain non-TIers); meta- ti@yoctoproject.org
>> >Subject: [meta-ti patch v3 1/3] am43xx : Added machine config
>for
>> >am437x EPOS machine
>> >
>> >As this belongs to the ti43x SOC_FAMILY inluding the ti43x`s
>include.
>> >
>> >Signed-off-by: Deepak M <x0171695@ti.com>
>> >---
>> >v3 :
>> >1. Changed the machine name to am437x-epos-evm 2. Changed the
>> >UBOOT_MACHINE 3. Adding the meta-ti@yoctoproject.org list for
>review.
>> >
>> > conf/machine/am437x-epos-evm.conf | 38
>> >++++++++++++++++++++++++++++++++++++++
>> > 1 file changed, 38 insertions(+)
>> > create mode 100644 conf/machine/am437x-epos-evm.conf
>> >
>> >diff --git a/conf/machine/am437x-epos-evm.conf
>> >b/conf/machine/am437x-epos-evm.conf
>> >new file mode 100644
>> >index 0000000..a9adf7e
>> >--- /dev/null
>> >+++ b/conf/machine/am437x-epos-evm.conf
>> >@@ -0,0 +1,38 @@
>> >+#@TYPE: Machine
>> >+#@NAME: AM43xx EVM
>> >+#@DESCRIPTION: Machine configuration for the TI AM43xx EVM
>> >+
>> >+require conf/machine/include/ti43x.inc
>> >+
>> >+# Use built-in LCD by default
>> >+XSERVER +=3D "xf86-input-tslib"
>> >+GUI_MACHINE_CLASS =3D "smallscreen"
>> >+MACHINE_FEATURES +=3D "touchscreen"
>>
>> Denys, input on these lines above?
>>
>> >+
>> >+IMAGE_FSTYPES +=3D "ubi tar.gz"
>> >+
>> >+SERIAL_CONSOLE =3D "115200 ttyO0"
>> >+
>> >+# UBI information.  Note that this is board and kernel
>specific.
>> >Changes
>> >+# in your kernel port may require changes in these variables.
>> >For more
>> >+# details about this board please see
>> >+# http://processors.wiki.ti.com/index.php/UBIFS_Support
>> >+
>> >+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048 # From dmesg:
>> >+# UBI: smallest flash I/O unit:    2048
>> >+# UBI: logical eraseblock size:    126976 bytes
>> >+# from ubiattach stdout:
>> >+# UBI device number 0, total 1988 LEBs MKUBIFS_ARGS =3D "-F -m
>2048 -e
>> >+126976 -c 3836"
>> >+
>> >+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048 # from dmesg:
>> >+# UBI: smallest flash I/O unit:    2048
>> >+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
>> >+# UBI: sub-page size:              512
>> >+# UBI: VID header offset:          2048 (aligned 2048)
>> >+UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
>> >+
>> >+UBOOT_MACHINE =3D "am43xx_evm"
>>
>> Maybe a silly question but why the change in UBOOT_MACHINE?
>[Muddegowda, Deepak] Previously I was using haps config, so placed
>it with the am43xx_evm :)

I guess my question is why the default am43xx_evm_config setting in the inc=
lude file doesn't work.

>>
>> >+PPA_PROJ =3D "hyperseam"
>> >--
>> >1.8.1


