Return-Path: <phani.gadupudi@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A869EE00C65; Thu, 14 Apr 2016 16:21:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (phani.gadupudi[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24DBBE007C5
	for <meta-ti@yoctoproject.org>; Thu, 14 Apr 2016 16:21:48 -0700 (PDT)
Received: by mail-lf0-f45.google.com with SMTP id g184so126726965lfb.3
	for <meta-ti@yoctoproject.org>; Thu, 14 Apr 2016 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=HaDwzDy87Ts62THUUSwiHRsQD6r+mGSHbdta2xUVEbs=;
	b=h2m0YBepBq5JsVEhRN8B8x2sjtXs9DprSaXC5FoRXJOJh98Lzd5jnY9/ly/FoNXe17
	rXySIvLoq3XeeVzcquc9T5zlSR7pljBNdpRXLhYnQFi9D8nNEMpPt6n7/cMtSWMBXc0m
	jOYhma8w0CZMp+Kxd0Yoqj6nXcJTdgbniLlCKOMcLn85a+ygG8swfcZv3ed/0qD94b6g
	qZl62P2ORVxUX0S9JtPqiuhgSDI0Uog+zGBJitWCnLqI0z4c3EdjGoKCwR0ZJTaWusEU
	CkTamDoh0lC3tFPA6rFDdbVZUO7+I5FRl2Py5VOvujJjd4eR9s2t63NdDh6Du6jLyaLQ
	Dl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=HaDwzDy87Ts62THUUSwiHRsQD6r+mGSHbdta2xUVEbs=;
	b=ahpXUvaTB14HF0Udm6v9bJ7EXK/cgIYKTlv0/GiKKvzMCWLuJZLWiRod+3bopTFZjp
	8hQqwqBVnNk5ujXDVv+WhGO5eH6IPaAPJpen1xEqutjKN1JQsBQiilhDZoqoMkj1mmpC
	Xb8eU+sJhmNVo9TxDlArqtpeQ2A0CslzcSBobSUE8TpN8m3RQyi3h7LyvIdE6+9NvT82
	mDaMj52jfe+0tB6kL18E1f1kULYdGjBygCPzujsXPFdcMdjmCV9BIzK8nczB+HbKYOss
	LEO0MNvUQPUgPh4rxa13T0rduabQ0bgowl9W/3JLrKETG1fpM+RM/GVIzLRnLrhl4/bV
	hOdw==
X-Gm-Message-State: AOPr4FVgsqzFyTfME/88HnaNycW3sDFsXak8/RjjDbEMhHYA0ss3A9d1q1KVPZM7qcWBQxIWGYWXZybWkvZNSQ==
X-Received: by 10.25.170.211 with SMTP id t202mr7295739lfe.7.1460676106888;
	Thu, 14 Apr 2016 16:21:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.32.135 with HTTP; Thu, 14 Apr 2016 16:21:07 -0700 (PDT)
From: Phani Gadupudi <phani.gadupudi@gmail.com>
Message-ID: <CAGL6b8676nuyUEf20D7nJPpb5sDUqB6_d+8iPrqoy106uCkJtw@mail.gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: Beaglebone sato image - Not booting from SD
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
Date: Thu, 14 Apr 2016 23:21:55 -0000
X-Original-Date: Thu, 14 Apr 2016 19:21:07 -0400
X-List-Received-Date: Thu, 14 Apr 2016 23:21:55 -0000
Content-Type: multipart/alternative; boundary=001a114113fe7baddb05307a288c

--001a114113fe7baddb05307a288c
Content-Type: text/plain; charset=UTF-8

I followed the instructions from
https://www.yoctoproject.org/downloads/bsps/jethro20/beaglebone and copied
sato-image to SD card. But the image won't boot.

The problem is not with my board/SD card. I tried on a different set..same
error pops.

*Version* : jethro

*A Note on how I partitioned my SD:*

sudo fdisk -lu /dev/sdb

Disk /dev/sdb: 15.5 GB, 15523119104 bytes
64 heads, 32 sectors/track, 14804 cylinders, total 30318592 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000d842d

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *        2048       67583       32768    c  W95 FAT32 (LBA)
/dev/sdb2           67584    30318591    15125504   83  Linux

I'm using PL2303 USB-TTL cable to debug.

*O/P on the serial console* :

U-Boot SPL 2016.01 (Feb 15 2016 - 19:53:09)
Trying to boot from MMC
reading args
spl_load_image_fat_os: error reading image args, err - -1
reading u-boot.img
reading u-boot.img

U-Boot 2016.01 (Feb 15 2016 - 19:53:09 -0500)
       Watchdog enabled
I2C:   ready
DRAM:  512 MiB
NAND:  0 MiB

MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1

*** Error - No Valid Environment Area found

*** Warning - bad CRC, using default environment

Net:   <ethaddr> not set. Validating first E-fuse MAC

cpsw, usb_ether

=>


Can some one please help me debug this? what are the possible reasons
for  'Error
- No Valid Environment Area found'?

Thank you

--001a114113fe7baddb05307a288c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8px">I followed the instruction=
s from=C2=A0<a href=3D"https://www.yoctoproject.org/downloads/bsps/jethro20=
/beaglebone" target=3D"_blank">https://www.yoctoproject.org/downloads/bsps/=
jethro20/beaglebone</a>=C2=A0and copied sato-image to SD card. But the imag=
e won&#39;t boot.=C2=A0</div><div style=3D"font-size:12.8px"><br></div><div=
 style=3D"font-size:12.8px"><div style=3D"font-size:12.8px">The problem is =
not with my board/SD card. I tried on a different set..same error pops.<br>=
</div><div><br></div></div><div style=3D"font-size:12.8px"><u>Version</u> :=
 jethro</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-s=
ize:12.8px"><u style=3D"font-size:12.8px">A Note on how I partitioned my SD=
:</u><br></div><div style=3D"font-size:12.8px"><br></div><div style=3D"font=
-size:12.8px"><div><font face=3D"courier new, monospace" color=3D"#0000ff">=
sudo fdisk -lu /dev/sdb</font></div><div><font face=3D"courier new, monospa=
ce" color=3D"#0000ff"><br></font></div><div><font face=3D"courier new, mono=
space" color=3D"#0000ff">Disk /dev/sdb: 15.5 GB, 15523119104 bytes</font></=
div><div><font face=3D"courier new, monospace" color=3D"#0000ff">64 heads, =
32 sectors/track, 14804 cylinders, total 30318592 sectors</font></div><div>=
<font face=3D"courier new, monospace" color=3D"#0000ff">Units =3D sectors o=
f 1 * 512 =3D 512 bytes</font></div><div><font face=3D"courier new, monospa=
ce" color=3D"#0000ff">Sector size (logical/physical): 512 bytes / 512 bytes=
</font></div><div><font face=3D"courier new, monospace" color=3D"#0000ff">I=
/O size (minimum/optimal): 512 bytes / 512 bytes</font></div><div><font fac=
e=3D"courier new, monospace" color=3D"#0000ff">Disk identifier: 0x000d842d<=
/font></div><div><font face=3D"courier new, monospace" color=3D"#0000ff"><b=
r></font></div><div><font face=3D"courier new, monospace" color=3D"#0000ff"=
>=C2=A0 =C2=A0Device Boot =C2=A0 =C2=A0 =C2=A0Start =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 End =C2=A0 =C2=A0 =C2=A0Blocks =C2=A0 Id =C2=A0System</font></div><d=
iv><font face=3D"courier new, monospace" color=3D"#0000ff">/dev/sdb1 =C2=A0=
 * =C2=A0 =C2=A0 =C2=A0 =C2=A02048 =C2=A0 =C2=A0 =C2=A0 67583 =C2=A0 =C2=A0=
 =C2=A0 32768 =C2=A0 =C2=A0c =C2=A0W95 FAT32 (LBA)</font></div><div><font f=
ace=3D"courier new, monospace" color=3D"#0000ff">/dev/sdb2 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 67584 =C2=A0 =C2=A030318591 =C2=A0 =C2=A015125504 =C2=
=A0 83 =C2=A0Linux</font></div></div><div style=3D"font-size:12.8px"><br></=
div><div style=3D"font-size:12.8px">I&#39;m using PL2303 USB-TTL cable to d=
ebug.</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-siz=
e:12.8px"><u>O/P on the serial console</u>=C2=A0:</div><div style=3D"font-s=
ize:12.8px"><br></div><div style=3D"font-size:12.8px"><div><font face=3D"co=
urier new, monospace" color=3D"#0000ff">U-Boot SPL 2016.01 (Feb 15 2016 -=
=C2=A0<span class=3D"" tabindex=3D"0" style=3D""><span class=3D"" style=3D"=
">19:53:09</span></span>)</font></div><div><font face=3D"courier new, monos=
pace" color=3D"#0000ff">Trying to boot from MMC</font></div><div><font face=
=3D"courier new, monospace" color=3D"#0000ff">reading args</font></div><div=
><font face=3D"courier new, monospace" color=3D"#0000ff">spl_load_image_fat=
_os: error reading image args, err - -1</font></div><div><font face=3D"cour=
ier new, monospace" color=3D"#0000ff">reading u-boot.img</font></div><div><=
font face=3D"courier new, monospace" color=3D"#0000ff">reading u-boot.img</=
font></div><div><font face=3D"courier new, monospace" color=3D"#0000ff"><br=
></font></div><div><span style=3D"color:rgb(0,0,255);font-family:&#39;couri=
er new&#39;,monospace">U-Boot 2016.01 (Feb 15 2016 - 19:53:09 -0500)</span>=
</div><div><font face=3D"courier new, monospace" color=3D"#0000ff">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Watchdog enabled</font></div><div><font face=3D"courier=
 new, monospace" color=3D"#0000ff">I2C: =C2=A0 ready</font></div><div><font=
 face=3D"courier new, monospace" color=3D"#0000ff">DRAM: =C2=A0512 MiB</fon=
t></div><div><font face=3D"courier new, monospace" color=3D"#0000ff">NAND: =
=C2=A00 MiB =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0</font></div><div><font face=3D"courier new, mon=
ospace" color=3D"#0000ff">MMC: =C2=A0 OMAP SD/MMC: 0, OMAP SD/MMC: 1 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</f=
ont></div><div><font face=3D"courier new, monospace" color=3D"#0000ff">*** =
Error - No Valid Environment Area found =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0</font></div><div><font face=3D"courier new, monospa=
ce" color=3D"#0000ff">*** Warning - bad CRC, using default environment =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</font></div><div><span style=3D"color:rg=
b(0,0,255);font-family:&#39;courier new&#39;,monospace;font-size:12.8px">Ne=
t: =C2=A0 &lt;ethaddr&gt; not set. Validating first E-fuse MAC =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=C2=A0</span></div><div><font face=3D"courier new, monospace" color=
=3D"#0000ff">cpsw, usb_ether =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</font></div><div><font face=3D"courie=
r new, monospace" color=3D"#0000ff">=3D&gt;=C2=A0</font></div></div><div st=
yle=3D"font-size:12.8px"><font face=3D"courier new, monospace"><br></font><=
/div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8=
px">Can some one please help me debug this? what are the possible reasons f=
or =C2=A0&#39;<span style=3D"color:rgb(0,0,255);font-family:&#39;courier ne=
w&#39;,monospace">Error - No Valid Environment Area found&#39;?=C2=A0</span=
></div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12=
.8px">Thank you</div></div>

--001a114113fe7baddb05307a288c--
