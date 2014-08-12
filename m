Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 816CAE007A0; Tue, 12 Aug 2014 06:42:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56505E00799
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 06:42:54 -0700 (PDT)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 288913FC0C4
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 15:42:52 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Tue, 12 Aug 2014 15:42:51 +0200
Message-ID: <1447960.SoSg2UIySt@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
MIME-Version: 1.0
Subject: BeagleBone Black fails to boot with u-boot 2014.07, linux-yocto 3.14.5
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
X-List-Received-Date: Tue, 12 Aug 2014 13:42:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi all,

I'm having trouble booting BBB with current meta-ti=20
(f7b1140774e6c8c8aecde41388d40d9d407df6ff). The problem looks similar t=
o this=20
bug report:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6165

Console output is as follows:
Booting from mmc ...
## Booting kernel from Legacy Image at 80007fc0 ...
   Image Name:   Linux-3.14.5-yocto-standard
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    5098048 Bytes =3D 4.9 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   XIP Kernel Image ... OK
OK
   Using Device Tree in place at 80f80000, end 80f8a207

Starting kernel ...


The original issue with kernel overlapping fdt was fixed with this patc=
h to=20
OE-core:=20
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D2cae5f78ad2=
982c7ca0c22c085b71a1d2184a1b0=20
However, current meta-ti contains u-boot in version 2014.07, overriding=
=20
2013.07 from poky master. I'm assuming that the patch eventually made i=
t into=20
denx tree.

Another problem is that uImage contains the following info:
Image Name:   Linux-3.14.5-yocto-standard
Created:      Mon Aug 11 16:59:42 2014
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    5098048 Bytes =3D 4978.56 kB =3D 4.86 MB
Load Address: 80008000
Entry Point:  80008000

I'm not sure what is the order in which the addresses are applied. Is i=
t=20
kernel -> default env -> uEnv.txt?

Adding uEnv.txt with these contents fixes the problem:
loadaddr=3D0x82000000
kernel_addr_r=3D0x82000000
fdtaddr=3D0x88000000
fdt_addr_r=3D0x88000000
rdaddr=3D0x88080000
ramdisk_addr_r=3D0x88080000
bootm_size=3D0x10000000

Please advise how to fix it without falling back to uEnv.

--=20
Maciej Borz=C4=99cki=20
Senior Software Engineer Open-RnD Sp. z o.o.=20
www.open-rnd.pl, Facebook, Twitter=20
mobile: +48 telefon, fax: +48 42 657 9079=20

Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe z=
awiera=C4=87 chronione prawem lub=20
poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wi=
adomo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 =
zosta=C5=82a otrzymana przypadkowo=20
zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzec=
ich. W takim przypadku=20
uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poin=
formowanie=20
nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwro=
tnej. Dzi=C4=99kujemy.=20

This message, including any attachments hereto, may contain privileged =
or=20
confidential information and is sent solely for the attention and use o=
f the=20
intended addressee(s). If you are not an intended addressee, you may ne=
ither=20
use this message nor copy or deliver it to anyone. In such case, you sh=
ould=20
immediately destroy this message and kindly notify the sender by reply =
email.=20
Thank you. 

