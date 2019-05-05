Return-Path: <ashish.emailaddress@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE887E00BE2; Sun,  5 May 2019 07:42:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ashish.emailaddress[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.177 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AB90E00BAA;
	Sun,  5 May 2019 07:42:50 -0700 (PDT)
Received: by mail-it1-f177.google.com with SMTP id a190so16528685ite.4;
	Sun, 05 May 2019 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6Om4CpHgjnja2Wlx5zA38ypxcxPW3a+oPbgoRJA/HtI=;
	b=VL9NI6SiYK3I3nG8pHcN1upvmUXv7UW97lT5ArpTg+2/gLQqX4aCOVhl/NgFDmlxa/
	s9spa1QnJA2qCjv1YzTT3dUy1cH2awHh9hLPgXEdoMlHLfa0j9dYDzzI2e/p/aysGbwL
	kH4L6o1tP6lDKUWWVJF436BCK+480zkZaay+4rz11GiWTzvuJXIZO2HN31aNsp5GAeaQ
	pnZbQAox65hWrWzy06jTRlLPbo1q4pzA2aJGqZwkdrY90XzSDokPRYOS4bJmMHu1Q30g
	vJy7cVAOYhsPNO711sAudok7ovqEu/tcN4nf8a8hOxYAQtdVTyhOEqy2Cw1MgpGOYpK+
	1IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6Om4CpHgjnja2Wlx5zA38ypxcxPW3a+oPbgoRJA/HtI=;
	b=ZD2afy94Mt2SVDk8SVt2mgOJfAjh/3ipdhVcL+K/tv35PMxjBHuofLzsOQRm1fYyh1
	PnXBkRz1C8Ix6raDHRHcU+GnIAaTg/cwdKUCi4J9xsw/MQIXg56ikxBa239hBnuRGy2t
	dpr4UZ2qSXFLj4RFgoYzL4yuTYyKDTApqSPeAwlM9kfYPtFKxD1XbNtco19W8rZv9BY8
	JHhoudHuXT5CehuF13Btb4StDqMRI8c4kO0lto8pBSIsCUWBOIdvUO+ZcKc65/7eJd4+
	Zita8QjnRrFGO3tuFKNXCgBq3+3Ft9ORTj8+hDKA0colH8M7P4uz4dny1koqv9AY4IPc
	rKLg==
X-Gm-Message-State: APjAAAWcln94SUs/jldsfkLeVC3/lmoadRJKzJCsv3pUdONK6EvMSWVF
	YxvpuMo37A8nAruuLbohNPEPg0Y+6mR5TvRASbbZfWgI
X-Google-Smtp-Source: APXvYqw5+tfQaq0CBQDCq0kBIKm98sdp37ubYaxNw97KJJDXjCeyMjstg7s5riCS9gJbo8mC8en0ZE7sJ2ryLbBjMEI=
X-Received: by 2002:a05:6638:209:: with SMTP id
	e9mr9328199jaq.22.1557067370306; 
	Sun, 05 May 2019 07:42:50 -0700 (PDT)
MIME-Version: 1.0
From: AshishKumar Mishra <ashish.emailaddress@gmail.com>
Date: Sun, 5 May 2019 20:12:39 +0530
Message-ID: <CAOe0dAV0D78sfX7W_Ge-5be8oo+W47knZAWUoTbeojqa-ezTaQ@mail.gmail.com>
To: meta-ti@yoctoproject.org, linux-yocto@yoctoproject.org
Subject: Meta-yocto-bsp fails to boot with META-TI [ Yocto-2.6.1]
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
X-List-Received-Date: Sun, 05 May 2019 14:42:52 -0000
Content-Type: multipart/alternative; boundary="0000000000007fa0d7058824ff97"

--0000000000007fa0d7058824ff97
Content-Type: text/plain; charset="UTF-8"

Hi All ,
I am starting to learn Yocto & following the manual from the Yocto website

I have added meta-ti to yocto and create the images

Can team please provide some pointer to resolve the below error
or let me know if i am doing any thing wong.

When flashed the images on SD card , the uboot is struck with below
mentioned error


U-Boot#
U-Boot#
U-Boot#

U-Boot SPL 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)
reading args
spl_load_image_fat_os: error reading image args, err - -1
reading u-boot.img
reading u-boot.img


U-Boot 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)

I2C:   ready
DRAM:  512 MiB
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - readenv() failed, using default environment

Net:   <ethaddr> not set. Validating first E-fuse MAC
cpsw, usb_ether
Hit any key to stop autoboot:  0
gpio: pin 53 (gpio 53) value is 1
mmc0 is current device
gpio: pin 54 (gpio 54) value is 1
SD/MMC found on device 0
reading uEnv.txt
** Unable to read file uEnv.txt **
Checking if uenvcmd is set ...

uenvcmd was not defined in uEnv.txt ...
gpio: pin 56 (gpio 56) value is 0
gpio: pin 55 (gpio 55) value is 0
gpio: pin 54 (gpio 54) value is 0
mmc1(part 0) is current device
gpio: pin 54 (gpio 54) value is 1
SD/MMC found on device 1
reading uEnv.txt
1430 bytes read in 5 ms (279.3 KiB/s)
gpio: pin 55 (gpio 55) value is 1
Loaded environment from uEnv.txt
Importing environment from mmc ...
Checking if uenvcmd is set ...
gpio: pin 56 (gpio 56) value is 1
Running uenvcmd ...
reading zImage
3717760 bytes read in 205 ms (17.3 MiB/s)
reading initrd.img
2869068 bytes read in 160 ms (17.1 MiB/s)
reading /dtbs/am335x-boneblack.dtb
** Unable to read file /dtbs/am335x-boneblack.dtb **
Kernel image @ 0x82000000 [ 0x000000 - 0x38ba80 ]
ERROR: Did not find a cmdline Flattened Device Tree
Could not find a valid device tree

uenvcmd was not defined in uEnv.txt ...
Booting from nand ...

no devices available

no devices available
Kernel image @ 0x82000000 [ 0x000000 - 0x38ba80 ]
ERROR: Did not find a cmdline Flattened Device Tree
Could not find a valid device tree
U-Boot#
U-Boot#

--0000000000007fa0d7058824ff97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi All , <br></div><div>I am startin=
g to learn Yocto &amp; following the manual from the Yocto website</div><di=
v><br></div><div>I have added meta-ti to yocto and create the images <br></=
div><div><br></div>Can team please provide some pointer to resolve the belo=
w error <br><div>or let me know if i am doing any thing wong. <br></div><di=
v><br></div><div>When flashed the images on SD card , the uboot is struck w=
ith below mentioned error=C2=A0</div><div><br></div><div><br></div><div>U-B=
oot# <br>U-Boot# <br>U-Boot#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 <br>U-Boot SPL 2014.04-00014-g47880f5 (Apr 22 2014=
 - 13:23:54)<br>reading args<br>spl_load_image_fat_os: error reading image =
args, err - -1<br>reading u-boot.img<br>reading u-boot.img<br><br><br>U-Boo=
t 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)<br><br>I2C:=C2=A0=C2=A0 r=
eady<br>DRAM:=C2=A0 512 MiB<br>NAND:=C2=A0 0 MiB<br>MMC:=C2=A0=C2=A0 OMAP S=
D/MMC: 0, OMAP SD/MMC: 1<br>*** Warning - readenv() failed, using default e=
nvironment<br><br>Net:=C2=A0=C2=A0 &lt;ethaddr&gt; not set. Validating firs=
t E-fuse MAC<br>cpsw, usb_ether<br>Hit any key to stop autoboot:=C2=A0 0 <b=
r>gpio: pin 53 (gpio 53) value is 1<br>mmc0 is current device<br>gpio: pin =
54 (gpio 54) value is 1<br>SD/MMC found on device 0<br>reading uEnv.txt<br>=
** Unable to read file uEnv.txt **<br>Checking if uenvcmd is set ...<br><br=
>uenvcmd was not defined in uEnv.txt ...<br>gpio: pin 56 (gpio 56) value is=
 0<br>gpio: pin 55 (gpio 55) value is 0<br>gpio: pin 54 (gpio 54) value is =
0<br>mmc1(part 0) is current device<br>gpio: pin 54 (gpio 54) value is 1<br=
>SD/MMC found on device 1<br>reading uEnv.txt<br>1430 bytes read in 5 ms (2=
79.3 KiB/s)<br>gpio: pin 55 (gpio 55) value is 1<br>Loaded environment from=
 uEnv.txt<br>Importing environment from mmc ...<br>Checking if uenvcmd is s=
et ...<br>gpio: pin 56 (gpio 56) value is 1<br>Running uenvcmd ...<br>readi=
ng zImage<br>3717760 bytes read in 205 ms (17.3 MiB/s)<br>reading initrd.im=
g<br>2869068 bytes read in 160 ms (17.1 MiB/s)<br>reading /dtbs/am335x-bone=
black.dtb<br>** Unable to read file /dtbs/am335x-boneblack.dtb **<br>Kernel=
 image @ 0x82000000 [ 0x000000 - 0x38ba80 ]<br>ERROR: Did not find a cmdlin=
e Flattened Device Tree<br>Could not find a valid device tree<br><br>uenvcm=
d was not defined in uEnv.txt ...<br>Booting from nand ...<br><br>no device=
s available<br><br>no devices available<br>Kernel image @ 0x82000000 [ 0x00=
0000 - 0x38ba80 ]<br>ERROR: Did not find a cmdline Flattened Device Tree<br=
>Could not find a valid device tree<br>U-Boot# <br>U-Boot# <br></div><div><=
br></div><div><br></div><div><br></div><div><br></div><div><br></div></div>=
</div>

--0000000000007fa0d7058824ff97--
