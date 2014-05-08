Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C068E009A6; Thu,  8 May 2014 03:32:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.170 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 1021 seconds by postgrey-1.32 at yocto-www;
	Thu, 08 May 2014 03:32:19 PDT
Received: from mail-lb0-f170.google.com (unknown [209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D036AE006EF
	for <meta-ti@yoctoproject.org>; Thu,  8 May 2014 03:32:19 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id w7so3250359lbi.15
	for <meta-ti@yoctoproject.org>; Thu, 08 May 2014 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=N9386BRamjHoZbpWbf7CC+B8eLLbRtfkoYxLRv1CCgs=;
	b=YI21luV5t/nuQ3525NHVYVe0N12gSPdw574SoKaQnddftNqnpLAQ2KDkdXo/WVecRK
	ICgzLwnaHtZ0xa9OIDUsL7tuMer/u79rkbG3Sj7Ao3yC/KrBgzxct17ruIWlhHKFL5ID
	nODRWL7TtynYKy9Rof4Q/GhqFL/kJ3880S08Qlq2wzYF9Aq8l8BvaDF7rcXM3vXTigki
	cejX8ZWi3vvxwtDMfgn4W02MMDdcKLY9ZVi/J5+3JIQH13XzuVdDjemiVQTjLfd6Oq0w
	nK7AL8eL05IcnefxsKxtetArPY/mCNNXOwCnGo5jfNZRz8uKrOf3zlXQcIGGzgYJEUnv
	e4Fg==
MIME-Version: 1.0
X-Received: by 10.112.167.202 with SMTP id zq10mr820890lbb.76.1399544117094;
	Thu, 08 May 2014 03:15:17 -0700 (PDT)
Sender: deepakvijay2255@gmail.com
Received: by 10.112.47.70 with HTTP; Thu, 8 May 2014 03:15:16 -0700 (PDT)
Date: Thu, 8 May 2014 15:45:16 +0530
X-Google-Sender-Auth: -Gqfqx4MD8dFpXDWaNUiCGVOZFU
Message-ID: <CAAxuRXg9LxvzRzcu4V9awG8D0zmV4u1VkFQLpxebj90bHz+OfA@mail.gmail.com>
From: deepak vijay <deepakvijay2255@rediff.com>
To: meta-ti@yoctoproject.org
Subject: Booting failed
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
X-List-Received-Date: Thu, 08 May 2014 10:32:21 -0000
Content-Type: multipart/alternative; boundary=001a11c269c2f2e4b504f8e0c100

--001a11c269c2f2e4b504f8e0c100
Content-Type: text/plain; charset=UTF-8

Hi,
I have build omap3evm images by including mata-ti layer.
When I am trying to boot the omap3evm board it is stuck at "Uncompressing
Linux... done, booting the kernel" this comment.
Can any one help me to over come this issue.
The boot logs are given below.
U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12 (May 08 2014 - 15:01:46)

OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 EVM board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  512 MiB
MMC:   OMAP SD/MMC: 0
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Read back SMSC id 0x92200000
Die ID #706a00029ff80000016842c911024007
Net:   smc911x-0
Hit any key to stop autoboot:  0
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

3139340 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.37
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3139276 Bytes = 3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.


Regards,
Deepak Vijay

--001a11c269c2f2e4b504f8e0c100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I have build omap3evm images by including mata-ti =
layer.</div><div>When I am trying to boot the omap3evm board it is stuck at=
 &quot;Uncompressing Linux... done, booting the kernel&quot; this comment.<=
/div>
<div>Can any one help me to over come this issue.</div><div>The boot logs a=
re given below.</div><div><div>U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)<=
/div><div>Texas Instruments Revision detection unimplemented</div><div>
OMAP SD/MMC: 0</div><div>reading u-boot.img</div><div>reading u-boot.img</d=
iv><div><br></div><div><br></div><div>U-Boot 2011.12 (May 08 2014 - 15:01:4=
6)</div><div><br></div><div>OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Ma=
x CPU Clock 1 Ghz</div>
<div>OMAP3 EVM board + LPDDR/NAND</div><div>I2C: =C2=A0 ready</div><div>DRA=
M: =C2=A0256 MiB</div><div>NAND: =C2=A0512 MiB</div><div>MMC: =C2=A0 OMAP S=
D/MMC: 0</div><div>*** Warning - bad CRC, using default environment</div><d=
iv><br></div><div>
In: =C2=A0 =C2=A0serial</div><div>Out: =C2=A0 serial</div><div>Err: =C2=A0 =
serial</div><div>Read back SMSC id 0x92200000</div><div>Die ID #706a00029ff=
80000016842c911024007</div><div>Net: =C2=A0 smc911x-0</div><div>Hit any key=
 to stop autoboot: =C2=A00=C2=A0</div>
<div>reading boot.scr</div><div><br></div><div>** Unable to read &quot;boot=
.scr&quot; from mmc 0:1 **</div><div>reading uImage</div><div><br></div><di=
v>3139340 bytes read</div><div>Booting from mmc ...</div><div>## Booting ke=
rnel from Legacy Image at 82000000 ...</div>
<div>=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37</div><div>=C2=A0 =C2=A0Im=
age Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</div><div>=C2=A0 =C2=
=A0Data Size: =C2=A0 =C2=A03139276 Bytes =3D 3 MiB</div><div>=C2=A0 =C2=A0L=
oad Address: 80008000</div><div>=C2=A0 =C2=A0Entry Point: =C2=A080008000</d=
iv>
<div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><div>=C2=A0 =C2=A0Loading =
Kernel Image ... OK</div><div>OK</div><div><br></div><div>Starting kernel .=
..</div><div><br></div><div>Uncompressing Linux... done, booting the kernel=
.</div></div><div>
<br></div><div><br></div><div>Regards,</div><div>Deepak Vijay</div></div>

--001a11c269c2f2e4b504f8e0c100--
