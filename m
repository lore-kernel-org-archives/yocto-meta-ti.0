Return-Path: <katutxakurra@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD2E8E00D00; Thu,  2 Nov 2017 07:08:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AC_DIV_BONANZA,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (katutxakurra[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.175 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.0 AC_DIV_BONANZA RAW: Too many divs in a row... spammy template
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 341CAE00C9F
	for <meta-ti@yoctoproject.org>; Thu,  2 Nov 2017 07:08:13 -0700 (PDT)
Received: by mail-io0-f175.google.com with SMTP id i38so14250611iod.2
	for <meta-ti@yoctoproject.org>; Thu, 02 Nov 2017 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=l0H7Upc3XJutSoB7R8IjInKLsCK5awO653s+MG81M/A=;
	b=dBUZBkFr+jgGEKvAxTR5nURcyGNx+Q/NxVIdM6CpbAcUiWPk7guY+ZHla3RVnUutjO
	IRuLGFcpDPpe+sTerUqAbPC5IMnEUqYuvFoYNVWkaycap6UPp6NnCR1JP3pvxqjaXy1i
	NRMP+9vcf/U5l8k8/n1f7NI/kRWhL/8u7Sb5tH1bMpnhmM14LY90dXT+e7qUJfO7LkVI
	JVhZ85EY6T0s8kQ7+bmTY6FWoltE1S/b3NAvyxqsTn1+zwZ2iCFyGuA1o8cGNRJiTx7J
	TnKY9QWC0Z4lXr1yoD/iiZcbYO/wj7dsg7gsayZl687X3r9iJd5OdZBsE46IWa1PTIkb
	BCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=l0H7Upc3XJutSoB7R8IjInKLsCK5awO653s+MG81M/A=;
	b=KroTebgbZGFLyzEj1H7hjETCsx26qFVzU9+p/ihscVA/FXEi9bEvlU3otM4nXxsFAv
	zZq9vngsr2Gw5UtN1ODD/Ygc1PL0N9hNVTyPg1oKflh0SVGmmLe8rWdSBFqbcaII0Nag
	tQ7h7MMhJ7U6uh3EhZSb069mL2axbffkB+n7x2bBsQPj/iUp/esUz9pvv5ZXILSLgUxN
	wsWltN4eq1HTq7aK5wM7RVzGR2zl7eX5rpgbJbqH0jnjnjVoHCe5wFg28BqPpMsYGdtK
	a0zwSqE/SSZ+Dlfe+368KvaiOzSNw07myk8DFLLN9kcm//dMrz/IK7+p6Yb53KsKIKLR
	Lf2A==
X-Gm-Message-State: AMCzsaVwM2dof4W2hQXM9hmKZ4H+4w2ej37n9wpIoBTSdELg2nmZPb4z
	Hu415f5gsoU+3hZiSasjvygZ6HH8WKDleq9OLNxOyA==
X-Google-Smtp-Source: ABhQp+SLqu4/0vIptOiAQO6Mp052BcMPjgBV345pGZlPW7RlY4r4wadKjsQBjusBRKAHindmcwJarVjBdODQphNyGNs=
X-Received: by 10.36.185.94 with SMTP id k30mr2738402iti.2.1509631691801; Thu,
	02 Nov 2017 07:08:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.153.210 with HTTP; Thu, 2 Nov 2017 07:07:51 -0700 (PDT)
From: Katu Txakur <katutxakurra@gmail.com>
Date: Thu, 2 Nov 2017 14:07:51 +0000
Message-ID: <CAM1ZcoW-XS3Eijj5fpBSD3fggroU5fd2j2HjpzGm=AUA1J-Fvw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: u-boot-ti-staging am355x uEnv.txt support booting from eMMC
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
X-List-Received-Date: Thu, 02 Nov 2017 14:08:14 -0000
Content-Type: multipart/alternative; boundary="f403045d978abb4c02055d008494"

--f403045d978abb4c02055d008494
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using Yocto Pyro branch with meta-ti layer and beaglebone machine to
build u-boot-ti-staging 2017.01+gitAUTOINC+5861b3bd34-r7 package.

I create an SD card with a FAT partition labelled BOOT containing
MLO
u-boot.img
uEnv.txt
and an ext4 partition labeled ROOT with the root file system.

When I boot a BeagleBone Black with this card, the file uEnv.txt it's read
and used correctly.

When I follow the same logic to flash this image to the NAND flash of the
BeagleBone Black, the uEnv.txt file in the first partition it's not read.
Is there support for this in uEnv.txt?

This is the output of u-boot booting from eMMC:
###############################################
U-Boot 2017.01 (Nov 02 2017 - 13:23:03 +0000)

CPU  : AM335X-GP rev 2.1
I2C:   ready
DRAM:  512 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - bad CRC, using default environment

<ethaddr> not set. Validating first E-fuse MAC
Net:   cpsw, usb_ether
Press SPACE to abort autoboot in 2 seconds
Card did not respond to voltage select!
Card did not respond to voltage select!
Card did not respond to voltage select!
Card did not respond to voltage select!
Card did not respond to voltage select!
switch to partitions #0, OK
mmc1(part 0) is current device
Scanning mmc 1:1...
switch to partitions #0, OK
mmc1(part 0) is current device
SD/MMC found on device 1
4179616 bytes read in 364 ms (11 MiB/s)
37806 bytes read in 24 ms (1.5 MiB/s)
## Flattened Device Tree blob at 88000000
   Booting using the fdt blob at 0x88000000
   Loading Device Tree to 8fff3000, end 8ffff3ad ... OK

Starting kernel ...
###############################################


It doesn't seem to be looking for uEnv.txt.
The output booting from SD card is:

###############################################
...
SD/MMC found on device 0
reading boot.scr
** Unable to read file boot.scr **
reading uEnv.txt
969 bytes read in 7 ms (134.8 KiB/s)
Loaded env from uEnv.txt
Importing environment from mmc0 ...
Running uenvcmd ...
37784 bytes read in 61 ms (604.5 KiB/s)
...
###############################################

I've read a bit of the u-boot code and the "Scanning mmc" string in u-boot
output brings me to the file
include/config_distro_bootcmd.h
where there is no mention of uEnv.txt or the CONFIG_EXTRA_ENV_SETTINGS
defined in include/configs/am335x_evm.h that seem to give support for the
uEnv.txt file when the SD card is used.

Is this a known issue or am I doing something wrong?

Regards,
Katu

--f403045d978abb4c02055d008494
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div><div><di=
v><div>Hi,<br><br></div>I&#39;m using <span class=3D"" style=3D"" id=3D"gma=
il-:2dw.1" tabindex=3D"-1">Yocto</span> <span class=3D"" style=3D"" id=3D"g=
mail-:2dw.2" tabindex=3D"-1">Pyro</span> branch with meta-ti layer and <spa=
n class=3D"" style=3D"" id=3D"gmail-:2dw.3" tabindex=3D"-1">beaglebone</spa=
n> machine to build u-boot-ti-staging 2017.01+<span class=3D"" style=3D"" i=
d=3D"gmail-:2dw.4" tabindex=3D"-1">gitAUTOINC</span>+5861b3bd34-r7 package.=
<br><br></div>I create an SD card with a FAT partition labelled BOOT contai=
ning <br></div><span class=3D"" style=3D"" id=3D"gmail-:2dw.5" tabindex=3D"=
-1">MLO</span><br></div>u-boot.<span class=3D"" style=3D"" id=3D"gmail-:2dw=
.6" tabindex=3D"-1">img</span><br></div><span class=3D"" style=3D"" id=3D"g=
mail-:2dw.7" tabindex=3D"-1">uEnv</span>.<span class=3D"" style=3D"" id=3D"=
gmail-:2dw.8" tabindex=3D"-1">txt</span><br></div></div><div>and an ext4 pa=
rtition labeled ROOT with the root file system.</div><div><br></div>When I =
boot a <span class=3D"" style=3D"" id=3D"gmail-:2dw.9" tabindex=3D"-1">Beag=
leBone</span> Black with this card, the file <span class=3D"" style=3D"" id=
=3D"gmail-:2dw.10" tabindex=3D"-1">uEnv</span>.<span class=3D"" style=3D"" =
id=3D"gmail-:2dw.11" tabindex=3D"-1">txt</span> it&#39;s read and used corr=
ectly.<br><br></div>When I follow the same logic to flash this image to the=
 <span class=3D"" style=3D"" id=3D"gmail-:2dw.12" tabindex=3D"-1">NAND</spa=
n> flash of the <span class=3D"" style=3D"" id=3D"gmail-:2dw.13" tabindex=
=3D"-1">BeagleBone</span> Black, the <span class=3D"" style=3D"" id=3D"gmai=
l-:2dw.14" tabindex=3D"-1">uEnv</span>.<span class=3D"" style=3D"" id=3D"gm=
ail-:2dw.15" tabindex=3D"-1">txt</span> file in the first partition it&#39;=
s not read. Is there support for this in <span class=3D"" style=3D"" id=3D"=
gmail-:2dw.16" tabindex=3D"-1">uEnv</span>.<span class=3D"" style=3D"" id=
=3D"gmail-:2dw.17" tabindex=3D"-1">txt</span>?<br><br></div>This is the out=
put of u-boot booting from eMMC:</div><div>################################=
###############<br></div><div>U-Boot 2017.01 (Nov 02 2017 - 13:23:03 +0000)=
<br><br>CPU=C2=A0 : AM335X-GP rev 2.1<br>I2C:=C2=A0=C2=A0 ready<br>DRAM:=C2=
=A0 512 MiB<br>MMC:=C2=A0=C2=A0 OMAP SD/MMC: 0, OMAP SD/MMC: 1<br>*** Warni=
ng - bad CRC, using default environment<br><br>&lt;ethaddr&gt; not set. Val=
idating first E-fuse MAC<br>Net:=C2=A0=C2=A0 cpsw, usb_ether<br>Press SPACE=
 to abort autoboot in 2 seconds<br>Card did not respond to voltage select!<=
br>Card did not respond to voltage select!<br>Card did not respond to volta=
ge select!<br>Card did not respond to voltage select!<br>Card did not respo=
nd to voltage select!<br>switch to partitions #0, OK<br>mmc1(part 0) is cur=
rent device<br>Scanning mmc 1:1...<br>switch to partitions #0, OK<br>mmc1(p=
art 0) is current device<br>SD/MMC found on device 1<br>4179616 bytes read =
in 364 ms (11 MiB/s)<br>37806 bytes read in 24 ms (1.5 MiB/s)<br>## Flatten=
ed Device Tree blob at 88000000<br>=C2=A0=C2=A0 Booting using the fdt blob =
at 0x88000000<br>=C2=A0=C2=A0 Loading Device Tree to 8fff3000, end 8ffff3ad=
 ... OK<br><br>Starting kernel ...<br></div><div>##########################=
#####################</div><div><br></div><div><br></div>It doesn&#39;t see=
m to be looking for uEnv.txt. <br></div><div>The output booting from SD car=
d is:</div><div><br></div><div>############################################=
###</div><div>...<br></div><div>SD/MMC found on device 0<br>reading boot.sc=
r<br>** Unable to read file boot.scr **<br>reading uEnv.txt</div><div>969 b=
ytes read in 7 ms (134.8 KiB/s)<br>Loaded env from uEnv.txt<br>Importing en=
vironment from mmc0 ...<br>Running uenvcmd ...<br>37784 bytes read in 61 ms=
 (604.5 KiB/s)<br></div><div>...</div><div>################################=
###############</div><div><br></div><div>I&#39;ve read a bit of the u-boot =
code and the &quot;Scanning mmc&quot; string in u-boot output brings me to =
the file<br>include/<span class=3D"" style=3D"" id=3D"gmail-:2dw.18" tabind=
ex=3D"-1">config</span>_<span class=3D"" style=3D"" id=3D"gmail-:2dw.19" ta=
bindex=3D"-1">distro</span>_<span class=3D"" style=3D"" id=3D"gmail-:2dw.20=
" tabindex=3D"-1">bootcmd</span>.h<br></div>where there is no mention of <s=
pan class=3D"" style=3D"" id=3D"gmail-:2dw.21" tabindex=3D"-1">uEnv</span>.=
<span class=3D"" style=3D"" id=3D"gmail-:2dw.22" tabindex=3D"-1">txt</span>=
 or the <span class=3D"" style=3D"" id=3D"gmail-:2dw.23" tabindex=3D"-1">CO=
NFIG</span>_EXTRA_<span class=3D"" style=3D"" id=3D"gmail-:2dw.24" tabindex=
=3D"-1">ENV</span>_SETTINGS defined in include/<span class=3D"" style=3D"" =
id=3D"gmail-:2dw.25" tabindex=3D"-1">configs</span>/am335x_<span class=3D""=
 style=3D"" id=3D"gmail-:2dw.26" tabindex=3D"-1">evm</span>.h that seem to =
give support for the <span class=3D"" style=3D"" id=3D"gmail-:2dw.27" tabin=
dex=3D"-1">uEnv</span>.<span class=3D"" style=3D"" id=3D"gmail-:2dw.28" tab=
index=3D"-1">txt</span> file when the SD card is used.<br></div><div><br></=
div><div>Is this a known issue or am I doing something wrong?</div><div><br=
></div>Regards,<br></div>Katu<br><div><div><div><div><div><div><div><div><b=
r><br><div><div><div><div><div><div><div><br></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div>

--f403045d978abb4c02055d008494--
