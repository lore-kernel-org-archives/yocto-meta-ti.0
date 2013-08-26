Return-Path: <jeremiah@pelagicore.com>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E21A1E00282
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 00:36:02 -0700 (PDT)
Received: by mail-qe0-f43.google.com with SMTP id t7so1565330qeb.16
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 00:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=UCZceIsACjMp/h3Tvhlks5IcLZeoIXI0cWUumFuTCVc=;
	b=V28/VgH1UQpR/VewVCq1EVeocvU2QS2nG7vjQDRWvETzfn+4PXefwnlBW7OSfxJsDY
	F/c4ewcDG3GJDEpUhX/pa+b7I+TQHG8x12h98jZVZ2GZnJvFoI/nh/ZjpUyOWj4X3QZi
	vB7VkrBIDErZOf7UIVPMWgZsqSo1yd60Y3EEa70dYMjVEetmqt0gzqcJq9crcP1rvYzy
	5aeN2344IULmOfFDliKcboIqFBOQxke8hdPTQ2L+wUPwbKbRuLO/f+OcHZ07F2tBwZhY
	kuP/tBKP0mlIHc9RWJPrzj0M5dEGSR0kQrUk/pwxPGS/RHzARqELxX4tkRkBlb5/aSSI
	JHKw==
X-Gm-Message-State: ALoCoQkbZJI7BandPkt9Gb9yUUgT70QQXXteCbxO6dAdEsb18e2RYi4e25to/uW0wJzMnhWImqOh
MIME-Version: 1.0
X-Received: by 10.229.139.6 with SMTP id c6mr101988qcu.43.1377502561486; Mon,
	26 Aug 2013 00:36:01 -0700 (PDT)
Received: by 10.229.117.137 with HTTP; Mon, 26 Aug 2013 00:36:01 -0700 (PDT)
In-Reply-To: <CADVDRBjOPx_33Z8eZ2jFLzh021gT7GtRVu6v_XuYVXuP+YMmEw@mail.gmail.com>
References: <CADVDRBjOPx_33Z8eZ2jFLzh021gT7GtRVu6v_XuYVXuP+YMmEw@mail.gmail.com>
Date: Mon, 26 Aug 2013 09:36:01 +0200
Message-ID: <CADVDRBiq=8FFoyfXcDCQdNeW72DUpZbeapdgi1AJJ6wekoA1=A@mail.gmail.com>
From: Jeremiah Foster <jeremiah.foster@pelagicore.com>
To: meta-ti@yoctoproject.org
Subject: Kernel not found (hangs at boot) -- meta-ti and Pandaboard ES
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
X-List-Received-Date: Mon, 26 Aug 2013 07:36:03 -0000
Content-Type: multipart/alternative; boundary=e89a8f503632dae1b604e4d4ced6

--e89a8f503632dae1b604e4d4ced6
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm trying to build a system with the meta-ti and meta-ivi layers that runs
on the Pandaboard ES. Below you'll find the output of my current attempts,
which stops when it comes time to boot the kernel;

----

Board: OMAP4 Panda
I2C:   ready
DRAM:  1 GiB
WARNING: Caches not enabled
MMC:   OMAP SD/MMC: 0
Using default environment

In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0
reading uEnv.txt

** Unable to read "uEnv.txt" from mmc 0:1 **
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

6698608 bytes read
Booting from mmc0 ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-3.4.22
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    6698544 Bytes = 6.4 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

----

I wonder if I'm using the right kernel? Is there a different or specific
SHA hash I should use for the Pandaboard ES?

In the above output from my attempted boot, it looks as if I've got my MLO
correct at least since it can find the uImage and seems to attempt to boot
from that, i.e. Linux-3.4.22. So from that output I'm under the impression
that my MMC partition is correctly formatted and that the MLO binary is
functioning correctly, what needs to happen is I need to get a kernel that
boots.

I'll do some research into these issues on the web.

Many thanks for pointers from those on this list with more experience.

Regards,

Jeremiah

--e89a8f503632dae1b604e4d4ced6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div class=3D"gmail_quote"><div dir=3D"ltr"><div=
><br></div><div>I&#39;m trying to build a system with the meta-ti and meta-=
ivi layers that runs on the Pandaboard ES. Below you&#39;ll find the output=
 of my current attempts, which stops when it comes time to boot the kernel;=
</div>

<div><br></div><div>----</div><div><br clear=3D"all"><div><div>Board: OMAP4=
 Panda</div><div>I2C: =A0 ready</div><div>DRAM: =A01 GiB</div><div>WARNING:=
 Caches not enabled</div><div>MMC: =A0 OMAP SD/MMC: 0</div><div>Using defau=
lt environment</div>

<div>
<br></div><div>In: =A0 =A0serial</div><div>Out: =A0 serial</div><div>Err: =
=A0 serial</div><div>Net: =A0 No ethernet found.</div><div>Hit any key to s=
top autoboot: =A00=A0</div><div>reading uEnv.txt</div><div><br></div><div>*=
* Unable to read &quot;uEnv.txt&quot; from mmc 0:1 **</div>


<div>reading boot.scr</div><div><br></div><div>** Unable to read &quot;boot=
.scr&quot; from mmc 0:1 **</div><div>reading uImage</div><div><br></div><di=
v>6698608 bytes read</div><div>Booting from mmc0 ...</div><div>## Booting k=
ernel from Legacy Image at 82000000 ...</div>


<div>=A0 =A0Image Name: =A0 Linux-3.4.22</div><div>=A0 =A0Image Type: =A0 A=
RM Linux Kernel Image (uncompressed)</div><div>=A0 =A0Data Size: =A0 =A0669=
8544 Bytes =3D 6.4 MiB</div><div>=A0 =A0Load Address: 80008000</div><div>=
=A0 =A0Entry Point: =A080008000</div>


<div>=A0 =A0Verifying Checksum ... OK</div><div>=A0 =A0Loading Kernel Image=
 ... OK</div><div>OK</div><div><br></div><div>Starting kernel ...</div><div=
><br></div><div>Uncompressing Linux... done, booting the kernel.</div></div=
><div>

<br></div><div>----</div><div><br></div><div>I wonder if I&#39;m using the =
right kernel? Is there a different or specific SHA hash I should use for th=
e Pandaboard ES?</div><div><br></div><div>In the above output from my attem=
pted boot, it looks as if I&#39;ve got my MLO correct at least since it can=
 find the uImage and seems to attempt to boot from that, i.e. Linux-3.4.22.=
 So from that output I&#39;m under the impression that my MMC partition is =
correctly formatted and that the MLO binary is functioning correctly, what =
needs to happen is I need to get a kernel that boots.</div>

<div><br></div><div>I&#39;ll do some research into these issues on the web.=
</div><div><br></div><div>Many thanks for pointers from those on this list =
with more experience.</div><div><br></div><div>Regards,</div><div><br>
</div>
<div>Jeremiah</div><div><br></div></div></div></div></div>

--e89a8f503632dae1b604e4d4ced6--
