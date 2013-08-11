Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7331E013A7
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 12:03:14 -0700 (PDT)
Received: by mail-ie0-f176.google.com with SMTP id 9so6736845iec.7
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 12:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=syCFGTUFVx0+kigTxf5i8wzIZ4WH4Bi499GMUZ/wR8Y=;
	b=m/WGWE//VtZ8eB14zlXXP+iQN1EaN6Sjv0YHa4NaFEWqc6FfTCSEcsPsjnyO0dI44d
	G0ASAiFez49LnVsOtEd1QSQ4EfIsJ3cVTSLzTTRYKqlllKZDrjupCKnV/q2HEXbeWeiZ
	NrwqPvGwkElp8tvEPzMPMohythoFDbckZLiC+ubp3v2X2DJqb2feFukVrDmxf7Hi3bra
	I5lNK2epg1nddd1o/AS0BOGdzES/BxEYUy4IA/v/56WzY7GKLuV/2DIvYx2AqDvKlakl
	+Y5DCfIh+iLLR3MS7L6xI74rTN7NgJaJ0knr7kLOSVhdpdoZXyZ+kidYxg+kSHbiJYDx
	LeWA==
MIME-Version: 1.0
X-Received: by 10.50.47.46 with SMTP id a14mr6554406ign.46.1376247793583; Sun,
	11 Aug 2013 12:03:13 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Sun, 11 Aug 2013 12:03:13 -0700 (PDT)
Date: Mon, 12 Aug 2013 07:03:13 +1200
Message-ID: <CALEed8ZSPE+kmVK1bJbVZRCZ1TEPE8xLuxF38jqs+geFcz=8bg@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Trouble booting BeagleBone Black
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
X-List-Received-Date: Sun, 11 Aug 2013 19:03:18 -0000
Content-Type: multipart/alternative; boundary=089e013c699cdc3c4704e3b0a837

--089e013c699cdc3c4704e3b0a837
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I have just used Yocto with the meta-ti layer to build the minimal image,
placed all the files on an SD card and tried to boot ..
It gets a couple of seconds into the kernel and hangs on mmc pin setting,
copy of the boot --> http://pastebin.com/0asaJ9tf

Question: I built for MACHINE=beaglebone but I don't know if that is for
the while or black targets, or if there is a difference.
I suspect the issue is with the device-tree file .. the tool built a file
called  uImage-am335x-bone.dtb, but when the kernel tried to boot, it
wanted a file called am335x-boneblack.dtb, so I just re-named the produced
file to that and I got the above boot sequence ..

Maybe that is the wrong thing to do? Is there a way to get the build to
produce the am335x-boneblack.dtb file?

Thanks,
Bernie

--089e013c699cdc3c4704e3b0a837
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div style>I have just used Yocto wi=
th the meta-ti layer to build the minimal image, placed all the files on an=
 SD card and tried to boot ..</div><div style>It gets a couple of seconds i=
nto the kernel and hangs on mmc pin setting, copy of the boot --&gt;=A0<a h=
ref=3D"http://pastebin.com/0asaJ9tf">http://pastebin.com/0asaJ9tf</a></div>
<div style><br></div><div style>Question: I built for MACHINE=3Dbeaglebone =
but I don&#39;t know if that is for the while or black targets, or if there=
 is a difference.</div><div style>I suspect the issue is with the device-tr=
ee file .. the tool built a file called =A0uImage-am335x-bone.dtb, but when=
 the kernel tried to boot, it wanted a file called=A0am335x-boneblack.dtb, =
so I just re-named the produced file to that and I got the above boot seque=
nce ..</div>
<div style><br></div><div style>Maybe that is the wrong thing to do? Is the=
re a way to get the build to produce the=A0am335x-boneblack.dtb file?</div>=
<div style><br></div><div style>Thanks,</div><div style>Bernie</div></div>

--089e013c699cdc3c4704e3b0a837--
