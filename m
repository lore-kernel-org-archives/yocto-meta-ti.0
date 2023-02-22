Return-Path: <danny@sizethreestudios.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385AAC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 21:24:15 +0000 (UTC)
Received: from a8-40.smtp-out.amazonses.com (a8-40.smtp-out.amazonses.com [54.240.8.40])
 by mx.groups.io with SMTP id smtpd.web11.373.1677101053294978613
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 13:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sizethreestudios.com header.s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu header.b=LNK+MDcZ;
 spf=pass (domain: amazonses.com, ip: 54.240.8.40, mailfrom: 010001867b0330a2-2d03d620-6141-4e39-82bd-63606225a89d-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu; d=sizethreestudios.com;
	t=1677101052;
	h=Subject:From:To:Date:Mime-Version:Content-Type:In-Reply-To:References:Message-Id;
	bh=qZlKwZ1y6epH3sh7O/ZijS2Pg/Yur35nJS5iaYIPZ7U=;
	b=LNK+MDcZW2luowcsHo5OZFob1eXYh6daUjzze2sVzKM6p+vwu8wRurH2dBS/kyHj
	IKC01lOuHI2HRefE/7FUtFs6OaNJrrR9kuy6Lq2ei4iGMJFK3GUMJyvfFThM3/mLTn7
	Z/aAnrAkHhwS7wuZAHCluom3hYNRE1T4UNS0s32dpzVbxblY8c7k82oPA/q91+JiqXW
	0k8c9MFEsspaN9utN8FvzIl9sJpX10yHWwVybjNVLAR4mMx/Ta0ZZ4v+w7q1pwVGeQf
	i2tVvSwT5MqdiX9G0lUdjYnm/hoALr6c6EWjZKIce4H4jPIEFDDrgY+rrs6u8GmeXyP
	L1NcAPP+dQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1677101052;
	h=Subject:From:To:Date:Mime-Version:Content-Type:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=qZlKwZ1y6epH3sh7O/ZijS2Pg/Yur35nJS5iaYIPZ7U=;
	b=MoJ5BNTaNJja/GoVO7CzMAEFMKh/7txMp53UD9xir7UWPMp/yJu59hgSFJCataiz
	I50XAwi+FSpw8Wcts5Bap60KEYZWWbfEOYyVDuJigY617dsa/XVLR3Yhu47UZDD6+bf
	M1e/BCizk9r8KZCECHAYaPN03o91DFbDUbsGeZgI=
Subject: RE: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
From: danny@sizethreestudios.com
To: =?UTF-8?Q?Danny_Hadley?= <dadleyy@gmail.com>, =?UTF-8?Q?meta-ti=40list?=
 =?UTF-8?Q?s=2Eyoctoproject=2Eorg?= <meta-ti@lists.yoctoproject.org>, 
 =?UTF-8?Q?Robert_Nelson?= <robertcnelson@gmail.com>
Date: Wed, 22 Feb 2023 21:24:12 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_XvEZnUim2weUeJZDyTJZL1ioFt5C0WGA0mB+0qQD0SnP0WBW"
In-Reply-To: 
 <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com>
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com> 
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com> 
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com> 
 <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com> 
 <mail.63f687fa.79f7.7900f96657dd023d@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRgK7xNw0mTd/TpKiWaRMV+PalQAVjWglAD/6r4M=
Thread-Topic: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
X-Wm-Sent-Timestamp: 1677101050
Message-ID: <010001867b0330a2-2d03d620-6141-4e39-82bd-63606225a89d-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.22-54.240.8.40
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 21:24:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15923

This is a multi-part message in MIME format. Your mail reader does not
understand MIME message format.
--=_XvEZnUim2weUeJZDyTJZL1ioFt5C0WGA0mB+0qQD0SnP0WBW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Following up on this - I was able to get a mirror set up and have been su=
ccessfully able to clone from that remote instead of `git.beagleboard.org=
` which solved my fetching problems. I'm not sure if it was necessary, bu=
t there were some hoops I had to jump through to checkout and publish the=
 commit rev `9b11aaf` to the mirror; after cloning, git was complaining i=
t was a bad object so I fetched it explicitly and checked out a branch us=
ing it as the rev, e.g (from memory, ymmv):

=C2=A0
```

git fetch 9b11aaf

git checkout -b 5.10-9b11aaf-explicit 9b11aaf

```=C2=A0

=C2=A0
for posterity's sake, my `linux-bb.org_%.bbappend` looks like:

=C2=A0
```

DEPENDS +=3D " lzop-native"
BB_FETCH_PREMIRRORONLY =3D "1"
BRANCH =3D "5.10-9b11aaf-explicit"
PREMIRRORS:prepend =3D " \
=C2=A0=C2=A0 =C2=A0git://git.beagleboard.org/.* git://....;protocol=3Dhtt=
ps \
"

```

=C2=A0
at the end of the day, the LCD cape is now rendering everything I'd expec=
t it to, so I'd consider this a success.

=C2=A0
Thank you very much.

-----Original message-----
From: Danny Hadley
Sent: Tuesday, February 21 2023, 7:59 pm
To: Robert Nelson
Cc: danny; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay (b=
eaglebone black, uboot, linux-ti-staging)
=C2=A0Hi Robert - Thank you for the response (and apologies for double em=
ailing)! I have tried swapping my kernel provider to use the bb.org recip=
e by setting:
=C2=A0```
PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
```
=C2=A0but after about ~5 attempts I still have not been able to successfu=
lly fetch the repo; I am a bit worried I might be trying to fetch too lar=
ge of an amount of data. I believe the relevant logs from my build system=
 are:

```
git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c core.pager=3D=
cat clone --bare --mirror https://git.beagleboard.org/beagleboard/linux.g=
it git.beagleboard.org.beagleboard.linux.git --progress failed with exit =
code 128, no output
```
=C2=A0yocto aside, trying to clone via

```
git clone https://git.beagleboard.org/beagleboard/linux.git
```
=C2=A0fails (somewhat expectedly, I think) with

```
error: 1610 bytes of body are still expected1.01 GiB | 5.65 MiB/s =C2=A0 =
=C2=A0
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output
```
=C2=A0I am able to clone with `--depth 1 --no-checkout`, which I had cons=
idered doing to make a personal mirror on github but I don't think thats =
the right direction to go, or if I should be looking into some bitbake co=
nfiguration to perform some shallow clone.
=C2=A0Is there a correct way to go about using the `git.beaglebone.org` s=
ervers as the source=3F
=C2=A0I did notice that you might be maintaining a mirror on github.com a=
t https://github.com/beagleboard/linux - is it safe to assume that will b=
e kept up to date with the sources at git.beagleboard.org=3F The commit r=
eferred to by the current kirkstone branch in meta-ti (https://git.yoctop=
roject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git=
=2Ebb=3Fh=3Dkirkstone) does not exist (9b11aaf2cdb1861ca74dc69d032a0f94cd=
d32bd6) in the github repo, i.e (https://github.com/beagleboard/linux/com=
mit/9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6).
=C2=A0What is interesting is that the parent of 9b11aaf does exist in bot=
h - 49ae123d2fee3f4ed30c5359fbb3e398e898f2a9. I tried overriding the `SRC=
_URI` of the linux-bb.org_git.bb recipe to be

```
SRC_URI =3D "git://github.com/beagleboard/linux.git;protocol=3Dhttps;bran=
ch=3D${BRANCH}"
SRCREV =3D "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"
```
=C2=A0which causes bitbake to fail with

```
Fetcher failure: Unable to find revision 49ae123d2fee3f4ed30c5359fbb3e398=
e898f2a9 in branch 5.10
```
I had also tried using a `.tar.gz` of the source itself from the download=
 url provided by gitlab but wasn't sure what needed to change for that to=
 be accepted as a `SRC_URI` by bitbake.
=C2=A0As a third option I noticed that the overlays themselves seem to be=
 kept up to date in https://git.beagleboard.org/beagleboard/BeagleBoard-D=
eviceTrees; this caught my eye because I was thinking that the existing r=
ecipe I set up to compile and place the overlays in my boot partition fro=
m the legacy https://github.com/beagleboard/bb.org-overlays repo works al=
most as-is with a `SRC_UI` pointing to that repo.
=C2=A0The thinking there is that I can still use `linux-ti-staging` and t=
he `git.ti.com` upstream kernel sources while using the `git.beaglebone.o=
rg` upstream as the source for my device tree overlays. Since the kernel =
sources might not include all of the patches from the `git.beaglebone.org=
` source, I'm skeptical if this would work, but I'm going to give it a tr=
y now and see what happens.
=C2=A0Thanks again for your help!
=C2=A0On Tue, Feb 21, 2023 at 9:42 AM Robert Nelson <robertcnelson@gmail.=
com> wrote:
=C2=A0=C2=A0On Sun, Feb 19, 2023 at 5:27 PM Danny Hadley via lists.yoctop=
roject.org <danny=3Dsizethreestudios.com@lists.yoctoproject.org> wrote:
Hello - I'd like to start by saying thanks gain to all for the continued =
work on this project!

=C2=A0
I'm reaching out again for help on my beaglebone + yocto project. I feel =
like I am really close to a functional implementation, but I am now stuck=
 on getting my LCD screen to render anything (for reference, I am using o=
ne of these - https://4dsystems.com.au/4dcape-43). My hunch is that I nee=
d to enable the device tree overlay for the cape.

=C2=A0
I've spend a few days poking around, and have a recipe in my yocto projec=
t that compiles the overlay files from this repo - https://github.com/bea=
gleboard/bb.org-overlays.=C2=A0 At this point, I have a bunch of compiled=
 `.dtbo` files both being written to the `DEPLOY_DIR_IMAGE` and the boot =
partition of my wic file which is exciting (my guess is I am specifically=
 interested in this one - https://github.com/beagleboard/bb.org-overlays/=
blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts).=C2=A0

=C2=A0The separate "bb.org-overlays" should not be used outside of anythi=
ng newer than v4.19.x based kernels. While it worked great for many years=
, just too many device-tree api changes over the years..
=C2=A0Our 5.10.x-ti branch has direct support for the=C2=A0BB-BONE-4D4C-0=
1-00A1.dts:=C2=A0https://git.beagleboard.org/beagleboard/linux/-/blob/5.1=
0/arch/arm/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts , thus it's already=
 built for this lcd.
=C2=A0The other trick, the Black defaults to built-in hdmi..=C2=A0 Anothe=
r board has shipped that's the Black without an HDMI.=C2=A0 "BeagleBone-G=
reen", so in u-boot force=C2=A0fdtfile=3Dam335x-bonegreen.dtb and apply t=
he=C2=A0BB-BONE-4D4C-01-00A1.dtbo overlay..
=C2=A0Regards,
=C2=A0--
Robert Nelson
https://rcn-ee.com/


=C2=A0
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

Links: You receive all messages sent to this group.

View/Reply Online (#15900): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15900

Mute This Topic: https://lists.yoctoproject.org/mt/97076057/7473053

Group Owner: meta-ti+owner@lists.yoctoproject.org

Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [danny@sizeth=
reestudios.com]

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-






--=_XvEZnUim2weUeJZDyTJZL1ioFt5C0WGA0mB+0qQD0SnP0WBW
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.1.1455.0">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>RE: [meta-ti] [kirkstone] trouble loading device tree overlay (bea=
glebone black, uboot, linux-ti-staging)</title>
</head>
<body>
<html><head></head><body><p style=3D"font-family: Arial, Tahoma, Helvetic=
a, sans-serif; font-size: small; margin: 0px;">Following up on this - I w=
as able to get a mirror set up and have been successfully able to clone f=
rom that remote instead of `git.beagleboard.org` which solved my fetching=
 problems. I'm not sure if it was necessary, but there were some hoops I =
had to jump through to checkout and publish the commit rev `9b11aaf` to t=
he mirror; after cloning, git was complaining it was a bad object so I fe=
tched it explicitly and checked out a branch using it as the rev, e.g (fr=
om memory, ymmv):</p><p style=3D"font-family: Arial, Tahoma, Helvetica, s=
ans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-fam=
ily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;=
">```</p><p style=3D"margin: 0px; font-family: Arial, Tahoma, Helvetica, =
sans-serif; font-size: small;"><font face=3D"Courier New, Courier, monosp=
ace">git fetch 9b11aaf</font></p><p style=3D"margin: 0px; font-family: Ar=
ial, Tahoma, Helvetica, sans-serif; font-size: small;"><font face=3D"Cour=
ier New, Courier, monospace">git checkout -b 5.10-9b11aaf-explicit 9b11aa=
f</font></p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif=
; font-size: small; margin: 0px;">```&nbsp;</p><p style=3D"font-family: A=
rial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">&nbs=
p;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font=
-size: small; margin: 0px;">for posterity's sake, my `linux-bb.org_%.bbap=
pend` looks like:</p><p style=3D"font-family: Arial, Tahoma, Helvetica, s=
ans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-fam=
ily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;=
">```</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; f=
ont-size: small; margin: 0px;"><font face=3D"Courier New, Courier, monosp=
ace">DEPENDS +=3D " lzop-native"<br>BB_FETCH_PREMIRRORONLY =3D "1"<br>BRA=
NCH =3D "5.10-9b11aaf-explicit"<br>PREMIRRORS:prepend =3D " \<br>&nbsp;&n=
bsp; &nbsp;git://git.beagleboard.org/.* git://....;protocol=3Dhttps \<br>=
"</font></p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif=
; font-size: small; margin: 0px;">```</p><p style=3D"font-family: Arial, =
Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">&nbsp;</p>=
<p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size:=
 small; margin: 0px;">at the end of the day, the LCD cape is now renderin=
g everything I'd expect it to, so I'd consider this a success.</p><p styl=
e=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;=
 margin: 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, Helvetic=
a, sans-serif; font-size: small; margin: 0px;">Thank you very much.</p><b=
lockquote style=3D"border-left: 2px solid rgb(176, 176, 183); margin-left=
: 5px; margin-right: 0px; padding-left: 5px;">-----Original message-----<=
br><strong>From:</strong> Danny Hadley<br><strong>Sent:</strong> Tuesday,=
 February 21 2023, 7:59 pm<br><strong>To:</strong> Robert Nelson<br><stro=
ng>Cc:</strong> danny; meta-ti@lists.yoctoproject.org<br><strong>Subject:=
</strong> Re: [meta-ti] [kirkstone] trouble loading device tree overlay (=
beaglebone black, uboot, linux-ti-staging)<br>&nbsp;<div dir=3D"ltr"><div=
 dir=3D"ltr"><div>Hi Robert - Thank you for the response (and apologies f=
or double emailing)! I have tried swapping my kernel provider to use the =
<a title=3D"This external link opens in a new window" href=3D"http://bb.o=
rg">bb.org</a> recipe by setting:</div><div>&nbsp;</div><div>```</div><di=
v><span style=3D"font-family: monospace;">PREFERRED_PROVIDER_virtual/kern=
el =3D "<a title=3D"This external link opens in a new window" href=3D"htt=
p://linux-bb.org">linux-bb.org</a>"</span></div><div>```</div><div>&nbsp;=
</div><div>but after about ~5 attempts I still have not been able to succ=
essfully fetch the repo; I am a bit worried I might be trying to fetch to=
o large of an amount of data. I believe the relevant logs from my build s=
ystem are:<br><br>```</div><div><span style=3D"font-family: monospace;">g=
it -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c core.pager=3D=
cat clone --bare --mirror <a title=3D"This external link opens in a new w=
indow" href=3D"https://git.beagleboard.org/beagleboard/linux.git">https:/=
/git.beagleboard.org/beagleboard/linux.git</a> git.beagleboard.org.beagle=
board.linux.git --progress failed with exit code 128, no output</span><br=
>```</div><div>&nbsp;</div><div>yocto aside, trying to clone via<br><br>`=
``</div><div><span style=3D"font-family: monospace;">git clone <a title=3D=
"This external link opens in a new window" href=3D"https://git.beagleboar=
d.org/beagleboard/linux.git">https://git.beagleboard.org/beagleboard/linu=
x.git</a></span></div><div>```</div><div>&nbsp;</div><div>fails (somewhat=
 expectedly, I think) with<br><br>```<br><span style=3D"font-family: mono=
space;">error: 1610 bytes of body are still expected1.01 GiB | 5.65 MiB/s=
 &nbsp; &nbsp;<br>fetch-pack: unexpected disconnect while reading sideban=
d packet<br>fatal: early EOF<br>fatal: fetch-pack: invalid index-pack out=
put</span></div><div>```</div><div>&nbsp;</div><div>I am able to clone wi=
th `--depth 1 --no-checkout`, which I had considered doing to make a pers=
onal mirror on github but I don't think thats the right direction to go, =
or if I should be looking into some bitbake configuration to perform some=
 shallow clone.</div><div>&nbsp;</div><div><div>Is there a correct way to=
 go about using the `<a title=3D"This external link opens in a new window=
" href=3D"http://git.beaglebone.org">git.beaglebone.org</a>` servers as t=
he source=3F</div></div><div>&nbsp;</div><div>I did notice that you <em>m=
ight</em> be maintaining a mirror on <a title=3D"This external link opens=
 in a new window" href=3D"http://github.com">github.com</a> at <a title=3D=
"This external link opens in a new window" href=3D"https://github.com/bea=
gleboard/linux">https://github.com/beagleboard/linux</a> - is it safe to =
assume that will be kept up to date with the sources at <a title=3D"This =
external link opens in a new window" href=3D"http://git.beagleboard.org">=
git.beagleboard.org</a>=3F The commit referred to by the current kirkston=
e branch in meta-ti (<a title=3D"This external link opens in a new window=
" href=3D"https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-k=
ernel/linux/linux-bb.org_git.bb=3Fh=3Dkirkstone">https://git.yoctoproject=
=2Eorg/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb=3F=
h=3Dkirkstone</a>) does not exist (9b11aaf2cdb1861ca74dc69d032a0f94cdd32b=
d6) in the github repo, i.e (<a title=3D"This external link opens in a ne=
w window" href=3D"https://github.com/beagleboard/linux/commit/9b11aaf2cdb=
1861ca74dc69d032a0f94cdd32bd6">https://github.com/beagleboard/linux/commi=
t/9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6</a>).<br>&nbsp;</div><div>What=
 is interesting is that the parent of 9b11aaf does exist in both - 49ae12=
3d2fee3f4ed30c5359fbb3e398e898f2a9. I tried overriding the `SRC_URI` of t=
he <a title=3D"This external link opens in a new window" href=3D"http://l=
inux-bb.org_git.bb">linux-bb.org_git.bb</a> recipe to be<br><br>```</div>=
SRC_URI =3D "git://<a title=3D"This external link opens in a new window" =
href=3D"http://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D=
${BRANCH}">github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH}</a>"<br>SRCREV =3D "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"<div>=
```</div><div>&nbsp;</div><div>which causes bitbake to fail with<br><br>`=
``</div><div>Fetcher failure: Unable to find revision 49ae123d2fee3f4ed30=
c5359fbb3e398e898f2a9 in branch 5.10</div><div>```</div><div>I had also t=
ried using a `.tar.gz` of the source itself from the download url provide=
d by gitlab but wasn't sure what needed to change for that to be accepted=
 as a `SRC_URI` by bitbake.</div><div>&nbsp;</div><div>As a third option =
I noticed that the overlays themselves seem to be kept up to date in <a t=
itle=3D"This external link opens in a new window" href=3D"https://git.bea=
gleboard.org/beagleboard/BeagleBoard-DeviceTrees">https://git.beagleboard=
=2Eorg/beagleboard/BeagleBoard-DeviceTrees</a>; this caught my eye becaus=
e I was thinking that the existing recipe I set up to compile and place t=
he overlays in my boot partition from the legacy <a title=3D"This externa=
l link opens in a new window" href=3D"https://github.com/beagleboard/bb.o=
rg-overlays">https://github.com/beagleboard/bb.org-overlays</a> repo work=
s almost as-is with a `SRC_UI` pointing to that repo.</div><div>&nbsp;</d=
iv><div>The thinking there is that I can still use `linux-ti-staging` and=
 the `<a title=3D"This external link opens in a new window" href=3D"http:=
//git.ti.com">git.ti.com</a>` upstream kernel sources while using the `<a=
 title=3D"This external link opens in a new window" href=3D"http://git.be=
aglebone.org">git.beaglebone.org</a>` upstream as the source for my devic=
e tree overlays. Since the kernel sources might not include all of the pa=
tches from the `<a title=3D"This external link opens in a new window" hre=
f=3D"http://git.beaglebone.org">git.beaglebone.org</a>` source, I'm skept=
ical if this would work, but I'm going to give it a try now and see what =
happens.</div><div>&nbsp;</div><div>Thanks again for your help!</div></di=
v>&nbsp;<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Feb 21, 2023 at 9:42 AM Robert Nelson &lt;<a title=3D"This extern=
al link opens in a new window" href=3D"mailto:robertcnelson@gmail.com">ro=
bertcnelson@gmail.com</a>&gt; wrote:</div><blockquote style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0px 0px 0px 0.8ex; padding-left:=
 1ex;" class=3D"gmail_quote"><div dir=3D"ltr"><div dir=3D"ltr">&nbsp;</di=
v>&nbsp;<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, Feb 19, 2023 at 5:27 PM Danny Hadley via <a title=3D"This externa=
l link opens in a new window" href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;danny=3D<a title=3D"This external link opens i=
n a new window" href=3D"mailto:sizethreestudios.com@lists.yoctoproject.or=
g">sizethreestudios.com@lists.yoctoproject.org</a>&gt; wrote:</div><block=
quote style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0px 0px=
 0px 0.8ex; padding-left: 1ex;" class=3D"gmail_quote"><div><div><p style=3D=
"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; mar=
gin: 0px;">Hello - I'd like to start by saying thanks gain to all for the=
 continued work on this project!</p><p style=3D"font-family: Arial, Tahom=
a, Helvetica, sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p st=
yle=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: smal=
l; margin: 0px;">I'm reaching out again for help on my beaglebone + yocto=
 project. I feel like I am really close to a functional implementation, b=
ut I am now stuck on getting my LCD screen to render anything (for refere=
nce, I am using one of these - <a title=3D"This external link opens in a =
new window" href=3D"https://4dsystems.com.au/4dcape-43">https://4dsystems=
=2Ecom.au/4dcape-43</a>). My hunch is that I need to enable the device tr=
ee overlay for the cape.</p><p style=3D"font-family: Arial, Tahoma, Helve=
tica, sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"f=
ont-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margi=
n: 0px;">I've spend a few days poking around, and have a recipe in my yoc=
to project that compiles the overlay files from this repo - <a title=3D"T=
his external link opens in a new window" href=3D"https://github.com/beagl=
eboard/bb.org-overlays.">https://github.com/beagleboard/bb.org-overlays.<=
/a>&nbsp; At this point, I have a bunch of compiled `.dtbo` files both be=
ing written to the `DEPLOY_DIR_IMAGE` and the boot partition of my wic fi=
le which is exciting (my guess is I am specifically interested in this on=
e - <a title=3D"This external link opens in a new window" href=3D"https:/=
/github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-=
01-00A1.dts).">https://github.com/beagleboard/bb.org-overlays/blob/master=
/src/arm/BB-BONE-4D4C-01-00A1.dts)</a>.&nbsp;</p></div></div></blockquote=
><div>&nbsp;</div><div>The separate "bb.org-overlays" should not be used =
outside of anything newer than v4.19.x based kernels. While it worked gre=
at for many years, just too many device-tree api changes over the years..=
</div><div>&nbsp;</div><div>Our 5.10.x-ti branch has direct support for t=
he&nbsp;BB-BONE-4D4C-01-00A1.dts:&nbsp;<a title=3D"This external link ope=
ns in a new window" href=3D"https://git.beagleboard.org/beagleboard/linux=
/-/blob/5.10/arch/arm/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts">https:/=
/git.beagleboard.org/beagleboard/linux/-/blob/5.10/arch/arm/boot/dts/over=
lays/BB-BONE-4D4C-01-00A1.dts</a> , thus it's already built for this lcd.=
</div><div>&nbsp;</div><div>The other trick, the Black defaults to built-=
in hdmi..&nbsp; Another board has shipped that's the Black without an HDM=
I.&nbsp; "BeagleBone-Green", so in u-boot force&nbsp;fdtfile=3Dam335x-bon=
egreen.dtb and apply the&nbsp;BB-BONE-4D4C-01-00A1.dtbo overlay..</div><d=
iv>&nbsp;</div><div>Regards,</div></div><div>&nbsp;</div>--<div dir=3D"lt=
r">Robert Nelson<br><a title=3D"This external link opens in a new window"=
 href=3D"https://rcn-ee.com/">https://rcn-ee.com/</a></div></div><br><br>=
&nbsp;</blockquote></div></div><pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Links: You receive all messages sent to this group.

View/Reply Online (#15900): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15900

Mute This Topic: https://lists.yoctoproject.org/mt/97076057/7473053

Group Owner: meta-ti+owner@lists.yoctoproject.org

Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [danny@sizeth=
reestudios.com]

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



</pre></blockquote></body></html>
</body>
</html>
--=_XvEZnUim2weUeJZDyTJZL1ioFt5C0WGA0mB+0qQD0SnP0WBW--

