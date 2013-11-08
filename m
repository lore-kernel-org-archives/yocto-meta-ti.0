Return-Path: <richardfmemory@gmail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DE5FE01848
	for <meta-ti@yoctoproject.org>; Fri,  8 Nov 2013 07:08:14 -0800 (PST)
Received: by mail-ve0-f182.google.com with SMTP id jy13so1588732veb.27
	for <meta-ti@yoctoproject.org>; Fri, 08 Nov 2013 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GpWxPpK6uwAWYHvL1xta7yPFZ0l7+LBBeXc1l1MBTSk=;
	b=fS4dBjnkeCHjAz07ZkQoqti6XFX2pfSYyloU3eS4PD0KaDWUP0ag3ZbqKyWGVyQEOE
	166jYRRy3ktvMX8x/4NlX1abTi+nHw4t5PwtYDfMfHHB4R95DLYjvvHs0SFTlshaSvFg
	VoK9UvEOXJjH4v0Lq5ZOy35Ge2GBHKxgjMeYlsaOoK/q45eoC1AUiDkbMORknSD7Rf0Z
	HgLTcku1/2rhqZxP/nXQXVH97dexT5lYLoebfwIJC7sK366nljKYmO2wu2sjvYc89GJj
	gycTQpdHK4SayUap4hSqw78eeiggaygxcr+yZLCQNPsMEgWRj8QqcuREnCiNyOA8sojL
	1RlA==
MIME-Version: 1.0
X-Received: by 10.58.207.15 with SMTP id ls15mr12301910vec.17.1383923293316;
	Fri, 08 Nov 2013 07:08:13 -0800 (PST)
Received: by 10.52.161.36 with HTTP; Fri, 8 Nov 2013 07:08:13 -0800 (PST)
Date: Fri, 8 Nov 2013 08:08:13 -0700
Message-ID: <CAOEu_tgyTtu=tZzU+b_z4FeGE2yRSO8aiNS_Fq3=2QPOuA5KTQ@mail.gmail.com>
From: Richard Memory <richardfmemory@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Panda board build question
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
X-List-Received-Date: Fri, 08 Nov 2013 15:08:14 -0000
Content-Type: multipart/alternative; boundary=047d7b6dc6ee4b6beb04eaabc0b3

--047d7b6dc6ee4b6beb04eaabc0b3
Content-Type: text/plain; charset=ISO-8859-1

Hi meta-ti email thread:

I am not sure this is the correct forum to ask this question, if not,
possibly you could kindly redirect me to the correct forum? I browsed
through the archives and I didn't immediately see any answer to my question
(hopefully I didn't blatantly miss it).

I have a Panda Board ES. Using directions similar to those found at the
following webpage:

http://processors.wiki.ti.com/index.php/How_to_Make_3_Partition_SD_Card

I successfully formatted my SD card (my card has a partition for boot and a
partition for rootfs). I verified my SD card works with pandaboard images
built from a downstream Yocto/OE distribution. My goal is to be able to
boot my target with the official yocto from git.yotcoproject.org.

I am able to successfully build target images (MLO, U-boot, uImage, and
rootfs), but the kernel built from bitbake sources obtained from
git.yoctoproject.org fails to start.

I have tried the images a couple of times. I switch back and forth between
downstream images (which always seem to work) and the images built from
yoctoproject. In one case with the yoctoproject images, u-boot seemed to
attempt to start the kernel. That is, I could see u-boot doing its thing at
a serial terminal. But upon startup, the kernel just seems to die without
any message of why. The LEDs stop flashing, the ethernet power has no
power, etc. The images I built from the downstream yocto distrobution
always seem to work without problem.

Step 1) git clone git://git.yoctoproject.org/poky poky

Step 2) git clone git://git.yoctoproject.org/meta-ti meta-ti

Step 3) source oe-init-build-env mypandaboard_build_dir

Step 4) Modify local.conf to use machine ?= "pandaboard"

Step 5) Modify BBLAYERS in bblayers.conf so that it can find the meta-ti
layer.

Step 6) bitbake core-image-minimal

This produces the following images:

MLO-pandaboard-2011.12-r8, 32748 bytes
u-boot-pandaboard-2011.12-r8.img, 187676 bytes
uImage--3.4-r1a-pandaboard-20131107151820.bin, 4333856 bytes
core-image-minimal-pandaboard-20131107151820.rootfs.tar.gz, 2308175 bytes

I have tried both the the master and dylan branches with the same results
each time.

Any ideas what I might be doing wrong?

Thanks,
Richard

--047d7b6dc6ee4b6beb04eaabc0b3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi meta-ti email thread:<div><br></div><div>I am not sure =
this is the correct forum to ask this question, if not, possibly you could =
kindly redirect me to the correct forum? I browsed through the archives and=
 I didn&#39;t immediately see any answer to my question (hopefully I didn&#=
39;t blatantly miss it).</div>
<div><br></div><div>I have a Panda Board ES. Using directions similar to th=
ose found at the following webpage:</div><div><br></div><div><a href=3D"htt=
p://processors.wiki.ti.com/index.php/How_to_Make_3_Partition_SD_Card">http:=
//processors.wiki.ti.com/index.php/How_to_Make_3_Partition_SD_Card</a><br>
</div><div><br></div><div>I successfully formatted my SD card (my card has =
a partition for boot and a partition for rootfs). I verified my SD card wor=
ks with pandaboard images built from a downstream Yocto/OE distribution. My=
 goal is to be able to boot my target with the official yocto from <a href=
=3D"http://git.yotcoproject.org">git.yotcoproject.org</a>.=A0</div>
<div><br></div><div>I am able to successfully build target images (MLO, U-b=
oot, uImage, and rootfs), but the kernel built from bitbake sources obtaine=
d from <a href=3D"http://git.yoctoproject.org">git.yoctoproject.org</a> fai=
ls to start.=A0</div>
<div><br></div><div>I have tried the images a couple of times. I switch bac=
k and forth between downstream images (which always seem to work) and the i=
mages built from yoctoproject. In one case with the yoctoproject images, u-=
boot seemed to attempt to start the kernel. That is, I could see u-boot doi=
ng its thing at a serial terminal. But upon startup, the kernel just seems =
to die without any message of why. The LEDs stop flashing, the ethernet pow=
er has no power, etc. The images I built from the downstream yocto distrobu=
tion always seem to work without problem.</div>
<div><br></div><div>Step 1)=A0git clone git://<a href=3D"http://git.yoctopr=
oject.org/poky">git.yoctoproject.org/poky</a> poky</div><div><br></div><div=
>Step 2) git clone git://<a href=3D"http://git.yoctoproject.org/meta-ti">gi=
t.yoctoproject.org/meta-ti</a> meta-ti</div>
<div><br></div><div>Step 3) source=A0oe-init-build-env mypandaboard_build_d=
ir</div><div><br></div><div>Step 4) Modify local.conf to use machine ?=3D &=
quot;pandaboard&quot;</div><div><br></div><div>Step 5) Modify BBLAYERS in b=
blayers.conf so that it can find the meta-ti layer.</div>
<div><br></div><div>Step 6) bitbake core-image-minimal</div><div><br></div>=
<div>This produces the following images:</div><div><br></div><div><font><sp=
an style=3D"font-size:10pt">MLO-pandaboard-2011.12-r8, 32748 bytes<br>

u-boot-pandaboard-2011.12-r8.img, 187676 bytes<br>

uImage--3.4-r1a-pandaboard-20131107151820.bin, 4333856 bytes<br>

core-image-minimal-pandaboard-20131107151820.rootfs.tar.gz, 2308175 bytes</=
span></font><br></div><div><font><span style=3D"font-size:10pt"><br></span>=
</font></div><div><font><span style=3D"font-size:10pt">I have tried both th=
e the master and dylan branches with the same results each time.</span></fo=
nt></div>
<div><font><span style=3D"font-size:10pt"><br></span></font></div><div>Any =
ideas what I might be doing wrong?</div><div><br></div><div>Thanks,</div><d=
iv>Richard</div></div>

--047d7b6dc6ee4b6beb04eaabc0b3--
