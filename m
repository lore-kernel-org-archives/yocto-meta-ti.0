Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7EB6E01602
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 06:47:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PDlmWK014983
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 08:47:48 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PDlmGP007843;
	Wed, 25 Sep 2013 08:47:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 25 Sep 2013 08:47:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Muddegowda, Deepak" <x0171695@ti.com>, "Srinivasan, Nageswari"
	<nageswari@ti.com>, "Heroor, Siddharth" <heroor@ti.com>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "Mankad,
	Maulik Ojas" <maulik@ti.com>, "epos_dev@list.ti.com - Internal mailing list
	for EPOS dev team (May contain non-TIers)" <epos_dev@list.ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti patch v3  2/3] am43xx: Added the u-boot recipe
Thread-Index: AQHOuexVks3Mn1NgHUCZgBZXX98MhpnWdqfQgABUkoD//6xgAA==
Date: Wed, 25 Sep 2013 13:47:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015974D711@DLEE11.ent.ti.com>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-3-git-send-email-x0171695@ti.com>
	<7D46E86EC0A8354091174257B2FED1015974D61C@DLEE11.ent.ti.com>
	<16D38216B6B8BA4B9AF9DBFC3760F38D3F14DDC5@DBDE04.ent.ti.com>
In-Reply-To: <16D38216B6B8BA4B9AF9DBFC3760F38D3F14DDC5@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
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
X-List-Received-Date: Wed, 25 Sep 2013 13:47:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Muddegowda, Deepak
>Sent: Wednesday, September 25, 2013 8:46 AM
>To: Maupin, Chase; Srinivasan, Nageswari; Heroor, Siddharth;
>Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>epos_dev@list.ti.com - Internal mailing list for EPOS dev team
>(May contain non-TIers); meta-ti@yoctoproject.org
>Subject: RE: [meta-ti patch v3 2/3] am43xx: Added the u-boot
>recipe
>
>
>
>> -----Original Message-----
>> From: Maupin, Chase
>> Sent: Wednesday, September 25, 2013 7:14 PM
>> To: Muddegowda, Deepak; Srinivasan, Nageswari; Heroor,
>Siddharth;
>> Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
>> epos_dev@list.ti.com - Internal mailing list for EPOS dev team
>(May
>> contain non-TIers); meta-ti@yoctoproject.org
>> Subject: RE: [meta-ti patch v3 2/3] am43xx: Added the u-boot
>recipe
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
>> >Subject: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
>> >
>> >Added the LIC_FILES_CHKSUM in the recipe as the default
>checksum was
>> >pointing to the COPYING file which is moved to the
>Licenses/gpl-
>> 2.0.txt
>> >in the current source.
>> >
>> >Signed-off-by: Deepak M <x0171695@ti.com>
>> >---
>> >v3:
>> >1. Changed the u-boot recipe name from u-boot-aegis to u-boot-
>am43xx.
>> >2. Using externel source link.
>> >
>> > recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb | 20
>> >++++++++++++++++++++
>> > 1 file changed, 20 insertions(+)
>> > create mode 100644 recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
>> >
>> >diff --git a/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
>> >b/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
>>
>> My assumption is this is a temporary recipe correct?  Once the
>unified
>> u-boot recipe in is place you can then just append what you need
>on top
>> right?
>[Muddegowda, Deepak] Not exactly temporary, may change the SRC_URI
>in future that=92s it.

OK.  Now my question is why?  If you are given a base u-boot recipe that su=
pports am43xx devices why would you define your own instead of appending?

>>
>> >new file mode 100644
>> >index 0000000..58eb99a
>> >--- /dev/null
>> >+++ b/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
>> >@@ -0,0 +1,20 @@
>> >+require u-boot-ti.inc
>> >+
>> >+DESCRIPTION =3D "u-boot bootloader for ARM MPU devices"
>> >+LIC_FILES_CHKSUM =3D "file://Licenses/gpl-
>> >2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> >+COMPATIBLE_MACHINE =3D "am437x-epos-evm"
>> >+
>> >+DEFAULT_PREFERENCE =3D "-1"
>> >+
>> >+PV =3D "2013.10"
>> >+PR =3D "r0+gitr${SRCPV}"
>> >+
>> >+BRANCH =3D "v2013.10-rc2+"
>> >+
>> >+SRC_URI =3D "git://git.ti.com/~lokesh/ti-u-boot/u-boot-
>> >dev.git;protocol=3Dgit;branch=3D${BRANCH}"
>> >+
>> >+# Lock to the commit corresponding
>> >+SRCREV =3D "6514cf76a52ecce9b03ede098683a7eea97e2bce"
>> >+
>> >+# Set the name of the SPL that will built so that it is also
>> >packaged with u-boot.
>> >+SPL_BINARY =3D "MLO"
>> >--
>> >1.8.1


