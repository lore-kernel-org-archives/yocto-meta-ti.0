Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D98FEE00D7B; Wed, 25 May 2016 14:24:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [212.82.96.83 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (b.bimmermann[at]yahoo.de)
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm2-vm3.bullet.mail.ir2.yahoo.com
	(nm2-vm3.bullet.mail.ir2.yahoo.com [212.82.96.83])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C62BE00D74
	for <meta-ti@yoctoproject.org>; Wed, 25 May 2016 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1464211453; bh=ZeftdkjuPNQuozv/5uLQ1pL4ojCDorfynDM2LFPnug8=;
	h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
	b=SqucQQ6auO2MICE2jMZV3eCVriv2dFm8kbVqUNvMn1mAVTnYolUQLl9zId2RFeV+DWE7W4WrBGtPZXrkgYZtKcSFIMVRkYFVhdmtizMUqG3FUis+Lf3bz8A9fl0tXdC949EIlOM71Cj1IolIlrruYqwfdcIMOrJcLk2SKMB7jM2LjgILBbQpX/J9UeDdDr8ed/bOXlqUwJUwRoo6flzYqsjpdoVxGM3ho/2O9B3Z2vO2i28UQnzLQPDzmdgfDEh7eguStU6DzkT078QIgCtEU2EVc4YdaoM7KmxHSs04lIRcy8upgSFk7zxQwQBPUCJzGVlqFdtkkAg0pT5ozk6lTA==
Received: from [212.82.98.62] by nm2.bullet.mail.ir2.yahoo.com with NNFMP;
	25 May 2016 21:24:13 -0000
Received: from [212.82.98.108] by tm15.bullet.mail.ir2.yahoo.com with NNFMP;
	25 May 2016 21:24:12 -0000
Received: from [127.0.0.1] by omp1045.mail.ir2.yahoo.com with NNFMP;
	25 May 2016 21:24:12 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 923598.61148.bm@omp1045.mail.ir2.yahoo.com
X-YMail-OSG: FglFmVAVM1mIRP7PGPRGSCW1Os1VRlQIzaEhnsPpFzJCQlGQIVjq4vGsEA7.iIW
	2yYBnVW58z2UCe0EaJ1kb6l6gIdSjVF3awH7_MlG9RMDwu7cLWQRfA8TRiQWVw8ahgbYB7jbgYOx
	uMa1m9KVNwrnnWWg14BTnNVEGFmI45uFHPrwnfXfzBoWto7cKPOwsj_c6NDYmLHrmHNN3hL87Jri
	YTZba3AjmbOgdcSI3Rf8vpKFX8_BN67Eupw5VueBtRLYNu33uWKd0KhmXT9yWZsffnqfzk0BW6TX
	oLkTZQ1QCAov7K3AC6UUdkSF4UXRlspRD6njPe5D7leItodzTwdmIzWmIzxqQ.7GReXvMk0RWHQY
	712RaOomD2p4aUJLE._o7Tt9e9.sSO_Tq8yFHfyI_EgxD9u1OybCfv9fwxiVyOxySjE9QjM_ryWb
	ZlPiYG7mqngF6uJTnO8za9b1KZVOx_W2C9g2E.EXKmUeCkMfAwm2fd6y7GXX2aiRZGaKns1683ep
	ynPsiA3GrSl_sl1cpZcBj7g--
Received: from jws11142.mail.ir2.yahoo.com by sendmailws164.mail.ir2.yahoo.com;
	Wed, 25 May 2016 21:24:12 +0000; 1464211452.240
Date: Wed, 25 May 2016 21:24:11 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: Keith Kyzivat <kamaji@gmail.com>, Yocto Texas <meta-ti@yoctoproject.org>
Message-ID: <2022998705.1230242.1464211451910.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <CAH5ySacKTnMNFR+i3kfsSV0yuO5449o00q1dM0-QSjvn7TRYkA@mail.gmail.com>
References: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
	<CAH5ySaex5z7G1rKpkXgpnOMnPkFYkL3xQrTp3ZWOcg0jqU_0wQ@mail.gmail.com>
	<371273705.3403881.1464113612415.JavaMail.yahoo@mail.yahoo.com>
	<2143110260.3400902.1464114072189.JavaMail.yahoo@mail.yahoo.com>
	<CAH5ySacKTnMNFR+i3kfsSV0yuO5449o00q1dM0-QSjvn7TRYkA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Rename of omap5-sgx-ddk-um-linux to ti-sgx-ddk-um not complete?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2016 21:24:17 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_1230241_300168155.1464211451891"

------=_Part_1230241_300168155.1464211451891
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
first it is good to share informations so maybe the meta-ti devs can fix th=
is.
Now to you:
I think you are at a ponit where I was about 2 mounth ago. So I will help y=
ou if you share later a fix for the Qt5_CinematicExperience.
First:=20
I think you try to use:=20
http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/I think thi=
s is to old. You should more fokus and use:http://www.jumpnowtek.com/https:=
//github.com/jumpnow/meta-bbb

The Problem with the jumpnow layer is that they don't use the meta-ti layer=
. So they can not build very good and fast qt5 aps.
Second:
What you don't need I think : /home/vagrant/yocto/poky/meta-embarcados \ RD=
EPENDS_packagegroup-qt5-machine-related =3D "\ - ${@base_contains('MACHINE'=
, 'beaglebone', 'libgles-omap3 omap3-sgx-modules', '', d)} \ + ${@base_cont=
ains('MACHINE', 'beaglebone', 'omap5-sgx-ddk-um-linux', '', d)} \ "
---------------------------------------------------------------------------=
-

Third:

You must enable SGX in your system and overlay !!!

Four :

I have better experience with:beaglebone.conf:=C2=A0=C2=A0=C2=A0=C2=A0requi=
re conf/machine/include/ti33x.inc
=C2=A0=C2=A0=C2=A0=C2=A0require conf/machine/include/THE_arago-prefs.inc=C2=
=A0=C2=A0=C2=A0=C2=A0UBOOT_MACHINE =3D "am335x_boneblack_config"
=C2=A0=C2=A0=C2=A0=C2=A0MACHINE_FEATURES +=3D " serial usbhost sgx "=C2=A0=
=C2=A0=C2=A0 PREFERRED_PROVIDER* (like the last e-mail)
Image:IMAGE_INSTALL +=3D " \  =20
=C2=A0=C2=A0=C2=A0 ti-sgx-ddk-um \
    omapdrm-pvr \
   packagegroup-qt5-toolchain-target \
   qtmultimedia \
   qtmultimedia-dev \
   qtmultimedia-mkspecs \ "=C2=A0 local.conf:PACKAGECONFIG_GL_pn-qtbase =3D=
 "gles2"
PACKAGECONFIG_GL_append +=3D " accessibility examples gles2 libs tools"
PACKAGECONFIG_append_pn-qtmultimedia =3D " gstreamer"

DISTRO_FEATURES_append =3D " opengl usbhost sgx"
DISTRO_FEATURES_remove =3D " x11  "

RM_OLD_IMAGE =3D "1"

EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-debug ssh-server-openssh"
I hope I could help and maybe we find a solution for the problem and add th=
is to meta-ti.
Have a nice day.

=20

    Keith Kyzivat <kamaji@gmail.com> schrieb am 17:20 Mittwoch, 25.Mai 2016=
:
=20

=20

Hi Benjamin,
Thank you for your config details -- that's gotten me further -- with a wor=
king driver, and Qt5_CinematicExperience actually running, bringing up the =
initial display, cursor showing, and the opening "Curtains" display, but so=
unds like a similar experience to what you're describing -- driver starting=
, program starting, but dreadful performance to the point where it doesn't =
really get beyond the first frame, and emits many FIFO underflow messages.=
=C2=A0 DMA may be not enabled or is somehow failing?
In any case, I'm further, and will continue to research the issue and hack =
away.=C2=A0 I'll report any progress.Should I keep it off-list, or is it on=
-topic enough for this mailing list?
Anyone have any pointers to what the issue might be?
Qt5_CinematicExperience output log:=C2=A0https://gist.github.com/keithel/e4=
eaf0a44aaa5d060f0578345d05b9b3#file-qt5_cinematicexperience-output
You can also find my config in that gist.
~Keith
On Tue, May 24, 2016 at 2:21 PM Benjamin Bimmermann <b.bimmermann@yahoo.de>=
 wrote:

Hello,
I build with Krogoth a QT5.6 Image.I have Include in my Image:
IMAGE_INSTALL +=3D " \
    ti-sgx-ddk-um \
    omapdrm-pvr \
"

and the config :
PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"
PREFERRED_PROVIDER_virtual/egl_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/libgles1_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/libgles2_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/libgl_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/mesa_keystone =3D "mesa"
PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
PREFERRED_VERSION_linux-ti-staging =3D "4.4%"=20
PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_libgbm =3D "libgbm"
PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"


This Image works Ok. Not great. If you build things like :
https://github.com/scottellis/tspress
It works very well. If you try to build big things like:
https://github.com/rzr/qt5-cinematic-experience
The driver Starts but and the Programm try to start.
You see a mouse Courser and thats it. The Programm doesn't run ok.

If you have a solution for that or if we find together for that a solution =
it would be very nice.

Have a nice day.

=20

    Keith Kyzivat <kamaji@gmail.com> schrieb am 16:48 Dienstag, 24.Mai 2016=
:
=20

=20

Hi Denys,
I'm working with the Beaglebone Black Rev C board -- so AM335x-based.What i=
ncantation/recipe/package should I be specifying to get the userspace DRI d=
rivers for use with libGLESv2 built into my image? That's been my biggest s=
tumbling block.=C2=A0 Even moving back to Fido I was unable to build an ima=
ge that includes the userspace graphics support libraries.
Ultimately I want to pull in Qt 5.6 and be able to run QML-based apps with =
the 'eglfs' QPA platform plugin with hardware OpenGLES2 acceleration runnin=
g over HDMI.
Are there any good resources ((e)books, wikis, presentations, etc) =C2=A0yo=
u or anyone else can recommend to fully grasp Yocto/OpenEmbedded?=C2=A0 I'v=
e come across a number of presentations, wikis and blog posts that have exp=
lained some things, but no comprehensive walkthrough that performs a build =
and explains all the reasons for the changes.
~Keith
On Thu, May 19, 2016 at 7:41 PM Keith Kyzivat <kamaji@gmail.com> wrote:

Hi folks,
I've been trying to get a beagleboard krogoth build working with working Op=
enGLES2 DRI drivers in place, and have been failing.
I did find out that drivers changed name from libgles-omap3 to ti-sgx-ddk-u=
m - but specifying=C2=A0ti-sgx-ddk-um as my PREFERRED_PROVIDER_virtual/libg=
les2 fails hard --=C2=A0-- Nothing RPROVIDES 'ti-sgx-ddk-um'
Digging through commits, I found commit c70102c671 - renaming=C2=A0omap5-sg=
x-ddk-um-linux to=C2=A0ti-sgx-ddk-um.
The problem seems to be that these are renamed, but the package names have =
not changed --=C2=A0recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb =
includes:
PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-=
um-linux"

Shouldn't this be the following?PROVIDES +=3D "virtual/egl virtual/libgles1=
 virtual/libgles2 ti-sgx-ddk-um"
And also=C2=A0RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg pa=
ckages?
Apologies if I'm asking this wrong - I'm pretty new to Yocto/OE and still f=
iguring it all out.
~Keith Kyzivat

--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti





  

------=_Part_1230241_300168155.1464211451891
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:times new roman, new york, times, serif;font-size:16px"><div id=
=3D"yiv8876788157"><div id=3D"yui_3_16_0_ym19_1_1464209901528_6730"><div id=
=3D"yui_3_16_0_ym19_1_1464209901528_6729" style=3D"color:#000;background-co=
lor:#fff;font-family:times new roman, new york, times, serif;font-size:16px=
;">Hello,<div id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_3530"><br =
clear=3D"none"><span></span></div><div dir=3D"ltr" id=3D"yiv8876788157yui_3=
_16_0_ym19_1_1464209901528_3536"><span id=3D"yiv8876788157yui_3_16_0_ym19_1=
_1464209901528_4122">first it is good to share informations so maybe the me=
ta-ti devs can fix this.</span></div><div dir=3D"ltr" id=3D"yiv8876788157yu=
i_3_16_0_ym19_1_1464209901528_3992"><br clear=3D"none"><span></span></div><=
div dir=3D"ltr" id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_3993"><s=
pan id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4001">Now to you:<br=
 clear=3D"none">I think you are at a ponit where I was about 2 mounth ago. =
So I will help you if you share later a fix for the </span>Qt5_CinematicExp=
erience.</div><div dir=3D"ltr" id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209=
901528_4002"><br clear=3D"none"></div><div dir=3D"ltr" id=3D"yiv8876788157y=
ui_3_16_0_ym19_1_1464209901528_4123">First: <br clear=3D"none"></div><div d=
ir=3D"ltr" id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4124">I think=
 you try to use: <br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" id=
=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4125" target=3D"_blank" hr=
ef=3D"http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/">htt=
p://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/</a></div><div=
 dir=3D"ltr" id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4127">I thi=
nk this is to old. You should more fokus and use:</div><div dir=3D"ltr" id=
=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4334"><a rel=3D"nofollow" =
shape=3D"rect" id=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4335" tar=
get=3D"_blank" href=3D"http://www.jumpnowtek.com/">http://www.jumpnowtek.co=
m/</a></div><div dir=3D"ltr" id=3D"yiv8876788157yui_3_16_0_ym19_1_146420990=
1528_4388"><a rel=3D"nofollow" shape=3D"rect" id=3D"yiv8876788157yui_3_16_0=
_ym19_1_1464209901528_4245" target=3D"_blank" href=3D"https://github.com/ju=
mpnow/meta-bbb">https://github.com/jumpnow/meta-bbb</a><br clear=3D"none"><=
/div><div id=3D"yui_3_16_0_ym19_1_1464209901528_6749"><br clear=3D"none"></=
div><div id=3D"yui_3_16_0_ym19_1_1464209901528_6728"><div id=3D"yui_3_16_0_=
ym19_1_1464209901528_6802" dir=3D"ltr">The Problem with the jumpnow layer i=
s that they don't use the meta-ti layer. So they can not build very good an=
d fast qt5 aps.</div><div id=3D"yui_3_16_0_ym19_1_1464209901528_6897" dir=
=3D"ltr"><br></div><div id=3D"yui_3_16_0_ym19_1_1464209901528_7022" dir=3D"=
ltr">Second:</div><div id=3D"yui_3_16_0_ym19_1_1464209901528_7099" dir=3D"l=
tr"><br></div><div id=3D"yui_3_16_0_ym19_1_1464209901528_7098" dir=3D"ltr">=
What you don't need I think :</div><div id=3D"yui_3_16_0_ym19_1_14642099015=
28_7159" dir=3D"ltr">  /home/vagrant/yocto/poky/meta-embarcados \</div><div=
 id=3D"yui_3_16_0_ym19_1_1464209901528_7023" dir=3D"ltr"> RDEPENDS_packageg=
roup-qt5-machine-related =3D "\
     =20
     =20
       =20
        <span id=3D"yui_3_16_0_ym19_1_1464209901528_7067">-            ${@b=
ase_contains('MACHINE', 'beaglebone', 'libgles-omap3 omap3-sgx-modules', ''=
, d)} \</span>
     =20
     =20
       =20
        <span id=3D"yui_3_16_0_ym19_1_1464209901528_7072">+            ${@b=
ase_contains('MACHINE', 'beaglebone', 'omap5-sgx-ddk-um-linux', '', d)} \</=
span>
     =20
     =20
       =20
                     "</div></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_=
1464209901528_7024"><div id=3D"yui_3_16_0_ym19_1_1464209901528_7396"><br></=
div><div id=3D"yui_3_16_0_ym19_1_1464209901528_9112">----------------------=
------------------------------------------------------<br></div><div id=3D"=
yui_3_16_0_ym19_1_1464209901528_9179"><br></div><div id=3D"yui_3_16_0_ym19_=
1_1464209901528_9180">Third:<br></div><div id=3D"yui_3_16_0_ym19_1_14642099=
01528_9181"><br></div><div id=3D"yui_3_16_0_ym19_1_1464209901528_7925">You =
must enable SGX in your system and overlay !!!<br></div><div id=3D"yui_3_16=
_0_ym19_1_1464209901528_7988"><br></div><div id=3D"yui_3_16_0_ym19_1_146420=
9901528_9178">Four :<br></div><div><br clear=3D"none"></div><div id=3D"yui_=
3_16_0_ym19_1_1464209901528_7395">I have better experience with:</div><div =
dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1464209901528_7445">beaglebone.conf:</d=
iv><div id=3D"yui_3_16_0_ym19_1_1464209901528_7798" dir=3D"ltr">&nbsp;&nbsp=
;&nbsp;&nbsp;require conf/machine/include/ti33x.inc<br></div><div id=3D"yui=
_3_16_0_ym19_1_1464209901528_7989" dir=3D"ltr">&nbsp;&nbsp;&nbsp;&nbsp;requ=
ire conf/machine/include/THE_arago-prefs.inc<a href=3D"" id=3D"yui_3_16_0_y=
m19_1_1464209901528_7806" name=3D"beaglebone.conf-15"></a></div><div id=3D"=
yui_3_16_0_ym19_1_1464209901528_7821" dir=3D"ltr"><a href=3D"" id=3D"yui_3_=
16_0_ym19_1_1464209901528_7806" name=3D"beaglebone.conf-15">&nbsp;&nbsp;&nb=
sp;&nbsp;</a>UBOOT_MACHINE =3D "am335x_boneblack_config"<br></div><div id=
=3D"yui_3_16_0_ym19_1_1464209901528_7869" dir=3D"ltr">&nbsp;&nbsp;&nbsp;&nb=
sp;MACHINE_FEATURES +=3D " serial usbhost sgx "</div><div id=3D"yui_3_16_0_=
ym19_1_1464209901528_8051" dir=3D"ltr">&nbsp;&nbsp;&nbsp; <span id=3D"yui_3=
_16_0_ym19_1_1464209901528_8046">PREFERRED_PROVIDER* (like the last e-mail)=
</span></div><div id=3D"yui_3_16_0_ym19_1_1464209901528_8173" dir=3D"ltr"><=
br></div><div id=3D"yui_3_16_0_ym19_1_1464209901528_8386" dir=3D"ltr">Image=
:</div><pre id=3D"yui_3_16_0_ym19_1_1464209901528_8153"><span id=3D"yui_3_1=
6_0_ym19_1_1464209901528_8156">IMAGE_INSTALL</span> <span id=3D"yui_3_16_0_=
ym19_1_1464209901528_8159">+=3D</span> <span id=3D"yui_3_16_0_ym19_1_146420=
9901528_8177">" \</span><span id=3D"yui_3_16_0_ym19_1_1464209901528_8179"> =
  <br>&nbsp;&nbsp;&nbsp; ti-sgx-ddk-um \</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8182" name=3D"console-im=
age.bb-26"></a><span id=3D"yui_3_16_0_ym19_1_1464209901528_8289">    omapdr=
m-pvr \</span><br><span id=3D"yui_3_16_0_ym19_1_1464209901528_8292">   pack=
agegroup-qt5-toolchain-target \</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8301" name=3D"qt5-image.=
bb-47"></a><span id=3D"yui_3_16_0_ym19_1_1464209901528_8304">   qtmultimedi=
a \</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8307" name=3D"qt5-image.=
bb-48"></a><span id=3D"yui_3_16_0_ym19_1_1464209901528_8310">   qtmultimedi=
a-dev \</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8313" name=3D"qt5-image.=
bb-49"></a><span id=3D"yui_3_16_0_ym19_1_1464209901528_8316">   qtmultimedi=
a-mkspecs \</span> <a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8188"=
 name=3D"console-image.bb-27"></a><span id=3D"yui_3_16_0_ym19_1_14642099015=
28_8191">"</span></pre></div><div dir=3D"ltr" id=3D"yiv8876788157yui_3_16_0=
_ym19_1_1464209901528_4369"><div id=3D"yui_3_16_0_ym19_1_1464209901528_8381=
" dir=3D"ltr">&nbsp; local.conf:
</div><pre id=3D"yui_3_16_0_ym19_1_1464209901528_8779"><a href=3D"" id=3D"y=
ui_3_16_0_ym19_1_1464209901528_8782" name=3D"local.conf-32"></a>PACKAGECONF=
IG_GL_pn-qtbase =3D "gles2"
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8794" name=3D"local.conf=
-36"></a>PACKAGECONFIG_GL_append +=3D " accessibility examples gles2 libs t=
ools"
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8797" name=3D"local.conf=
-37"></a>PACKAGECONFIG_append_pn-qtmultimedia =3D " gstreamer"
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8800" name=3D"local.conf=
-38"></a>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8812" name=3D"local.conf=
-42"></a>DISTRO_FEATURES_append =3D " opengl usbhost sgx"
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8815" name=3D"local.conf=
-43"></a>DISTRO_FEATURES_remove =3D " x11  "

<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8833" name=3D"local.conf=
-49"></a>RM_OLD_IMAGE =3D "1"

<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464209901528_8851" name=3D"local.conf=
-55"></a>EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-debug ssh-server-open=
ssh"</pre><div id=3D"yui_3_16_0_ym19_1_1464209901528_8928" dir=3D"ltr"><br>=
</div><div id=3D"yui_3_16_0_ym19_1_1464209901528_8929" dir=3D"ltr">I hope I=
 could help and maybe we find a solution for the problem and add this to me=
ta-ti.</div><div id=3D"yui_3_16_0_ym19_1_1464209901528_9050" dir=3D"ltr"><b=
r></div><div dir=3D"ltr">Have a nice day.<br></div></div><div dir=3D"ltr" i=
d=3D"yiv8876788157yui_3_16_0_ym19_1_1464209901528_4131"><br clear=3D"none">=
</div> <div id=3D"yui_3_16_0_ym19_1_1464209901528_7447" class=3D"yiv8876788=
157qtdSeparateBR"><br clear=3D"none"><br clear=3D"none"></div></div></div><=
/div><div class=3D".yiv8876788157yahoo_quoted"> <div style=3D"font-family:t=
imes new roman, new york, times, serif;font-size:16px;"> <div style=3D"font=
-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, san=
s-serif;font-size:16px;"> <div dir=3D"ltr"><font face=3D"Arial" size=3D"2">=
 Keith Kyzivat &lt;kamaji@gmail.com&gt; schrieb am 17:20 Mittwoch, 25.Mai 2=
016:<br clear=3D"none"></font></div>  <br clear=3D"none"><br clear=3D"none"=
> <div class=3D"qtdSeparateBR"><br><br></div><div class=3D"yiv8876788157yqt=
2346549205" id=3D"yiv8876788157yqt07124"><div class=3D"yiv8876788157y_msg_c=
ontainer"><div id=3D"yiv8876788157"><div><div dir=3D"ltr">Hi Benjamin,<div>=
<br clear=3D"none"></div><div>Thank you for your config details -- that's g=
otten me further -- with a working driver, and Qt5_CinematicExperience actu=
ally running, bringing up the initial display, cursor showing, and the open=
ing "Curtains" display, but sounds like a similar experience to what you're=
 describing -- driver starting, program starting, but dreadful performance =
to the point where it doesn't really get beyond the first frame, and emits =
many FIFO underflow messages.&nbsp; DMA may be not enabled or is somehow fa=
iling?</div><div><br clear=3D"none"></div><div>In any case, I'm further, an=
d will continue to research the issue and hack away.&nbsp; I'll report any =
progress.</div><div>Should I keep it off-list, or is it on-topic enough for=
 this mailing list?</div><div><br clear=3D"none"></div><div>Anyone have any=
 pointers to what the issue might be?</div><div><br clear=3D"none"></div><d=
iv>Qt5_CinematicExperience output log:&nbsp;<a rel=3D"nofollow" shape=3D"re=
ct" target=3D"_blank" href=3D"https://gist.github.com/keithel/e4eaf0a44aaa5=
d060f0578345d05b9b3#file-qt5_cinematicexperience-output">https://gist.githu=
b.com/keithel/e4eaf0a44aaa5d060f0578345d05b9b3#file-qt5_cinematicexperience=
-output</a></div><div><br clear=3D"none"></div><div>You can also find my co=
nfig in that gist.</div><div><br clear=3D"none"></div><div>~Keith</div></di=
v><br clear=3D"none"><div class=3D"yiv8876788157yqt7143097960" id=3D"yiv887=
6788157yqt14340"><div class=3D"yiv8876788157gmail_quote"><div dir=3D"ltr">O=
n Tue, May 24, 2016 at 2:21 PM Benjamin Bimmermann &lt;<a rel=3D"nofollow" =
shape=3D"rect" ymailto=3D"mailto:b.bimmermann@yahoo.de" target=3D"_blank" h=
ref=3D"mailto:b.bimmermann@yahoo.de">b.bimmermann@yahoo.de</a>&gt; wrote:<b=
r clear=3D"none"></div><blockquote class=3D"yiv8876788157gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;"><div><d=
iv style=3D"color:#000;background-color:#fff;font-family:times new roman, n=
ew york, times, serif;font-size:16px;"><div><div><div dir=3D"ltr" style=3D"=
color:#000;background-color:#fff;font-family:times new roman, new york, tim=
es, serif;font-size:16px;"><div><span>Hello,</span></div><div><br clear=3D"=
none"><span></span></div><div dir=3D"ltr"><div dir=3D"ltr"><span>I build wi=
th </span>Krogoth a QT5.6 Image.</div><div dir=3D"ltr">I have Include in my=
 Image:<br clear=3D"none"></div></div><div dir=3D"ltr"></div><pre><span>IMA=
GE_INSTALL</span> <span>+=3D</span> <span>" </span><span>\</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
console-image.bb-25"></a><span>    ti-sgx-ddk-um \</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
console-image.bb-26"></a><span>    omapdrm-pvr \</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
console-image.bb-27"></a><span>"<br clear=3D"none"><br clear=3D"none">and t=
he config :<br clear=3D"none"></span><span>PREFERRED_PROVIDER_virtual</span=
><span>/</span><span>libgl</span> <span>=3D</span> <span>"mesa-gl"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-8"></a><span>PREFERRED_PROVIDER_virtual</span><span>/</=
span><span>mesa</span> <span>=3D</span> <span>"mesa-gl"<br clear=3D"none"><=
/span><span>PREFERRED_PROVIDER_virtual</span><span>/</span><span>egl_keysto=
ne</span> <span>=3D</span> <span>"mesa"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-22"></a><span>PREFERRED_PROVIDER_virtual</span><span>/<=
/span><span>libgles1_keystone</span> <span>=3D</span> <span>"mesa"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-23"></a><span>PREFERRED_PROVIDER_virtual</span><span>/<=
/span><span>libgles2_keystone</span> <span>=3D</span> <span>"mesa"<br clear=
=3D"none"></span><a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_144=
4571799623436890_THE_arago-prefs.inc-24"></a><span>PREFERRED_PROVIDER_virtu=
al</span><span>/</span><span>libgl_keystone</span> <span>=3D</span> <span>"=
mesa"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-25"></a><span>PREFERRED_PROVIDER_virtual</span><span>/<=
/span><span>mesa_keystone</span> <span>=3D</span> <span>"mesa"<br clear=3D"=
none"></span><span>PREFERRED_PROVIDER_virtual</span><span>/</span><span>ker=
nel</span> <span>=3D</span> <span>"linux-ti-staging"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-13"></a><span>PREFERRED_VERSION_linux</span><span>-</sp=
an><span>ti</span><span>-</span><span>staging</span> <span>=3D</span> <span=
>"4.4%"</span> <br clear=3D"none"><span>PREFERRED_PROVIDER_virtual</span><s=
pan>/</span><span>egl</span> <span>=3D</span> <span>"ti-sgx-ddk-um"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-2"></a><span>PREFERRED_PROVIDER_virtual</span><span>/</=
span><span>libgles1</span> <span>=3D</span> <span>"ti-sgx-ddk-um"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-3"></a><span>PREFERRED_PROVIDER_virtual</span><span>/</=
span><span>libgles2</span> <span>=3D</span> <span>"ti-sgx-ddk-um"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-4"></a><span>PREFERRED_PROVIDER_libgbm</span> <span>=3D=
</span> <span>"libgbm"</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_=
THE_arago-prefs.inc-5"></a><span>PREFERRED_PROVIDER_libgbm</span><span>-</s=
pan><span>dev</span> <span>=3D</span> <span>"libgbm-dev"<br clear=3D"none">=
<br clear=3D"none"><br clear=3D"none">This Image works Ok. Not great. If yo=
u build things like :<br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" =
target=3D"_blank" href=3D"https://github.com/scottellis/tspress">https://gi=
thub.com/scottellis/tspress</a></span><a href=3D"" rel=3D"nofollow" shape=
=3D"rect" name=3D"m_1444571799623436890_THE_arago-prefs.inc-26"></a><br cle=
ar=3D"none">It works very well. If you try to build big things like:<br cle=
ar=3D"none"><a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"ht=
tps://github.com/rzr/qt5-cinematic-experience">https://github.com/rzr/qt5-c=
inematic-experience</a><br clear=3D"none">The driver Starts but and the Pro=
gramm try to start.<br clear=3D"none">You see a mouse Courser and thats it.=
 The Programm doesn't run ok.<br clear=3D"none"><br clear=3D"none">If you h=
ave a solution for that or if we find together for that a solution it would=
 be very nice.<br clear=3D"none"><br clear=3D"none">Have a nice day.<br cle=
ar=3D"none"></pre><div><br clear=3D"none"></div> <div><br clear=3D"none"><b=
r clear=3D"none"></div></div></div></div><div> <div style=3D"font-family:ti=
mes new roman, new york, times, serif;font-size:16px;"> <div style=3D"font-=
family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans=
-serif;font-size:16px;"></div></div></div></div></div><div><div style=3D"co=
lor:#000;background-color:#fff;font-family:times new roman, new york, times=
, serif;font-size:16px;"><div><div style=3D"font-family:times new roman, ne=
w york, times, serif;font-size:16px;"><div style=3D"font-family:HelveticaNe=
ue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:1=
6px;"> <div dir=3D"ltr"><font face=3D"Arial" size=3D"2"> Keith Kyzivat &lt;=
<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:kamaji@gmail.com" targ=
et=3D"_blank" href=3D"mailto:kamaji@gmail.com">kamaji@gmail.com</a>&gt; sch=
rieb am 16:48 Dienstag, 24.Mai 2016:<br clear=3D"none"></font></div>  <br c=
lear=3D"none"><br clear=3D"none"> </div></div></div></div></div><div><div s=
tyle=3D"color:#000;background-color:#fff;font-family:times new roman, new y=
ork, times, serif;font-size:16px;"><div><div style=3D"font-family:times new=
 roman, new york, times, serif;font-size:16px;"><div style=3D"font-family:H=
elveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;f=
ont-size:16px;"><div><div><br clear=3D"none"><br clear=3D"none"></div><div>=
<div><div><div dir=3D"ltr">Hi Denys,<div><br clear=3D"none"></div><div>I'm =
working with the Beaglebone Black Rev C board -- so AM335x-based.</div><div=
>What incantation/recipe/package should I be specifying to get the userspac=
e DRI drivers for use with libGLESv2 built into my image? That's been my bi=
ggest stumbling block.&nbsp; Even moving back to Fido I was unable to build=
 an image that includes the userspace graphics support libraries.</div><div=
><br clear=3D"none"></div><div>Ultimately I want to pull in Qt 5.6 and be a=
ble to run QML-based apps with the 'eglfs' QPA platform plugin with hardwar=
e OpenGLES2 acceleration running over HDMI.</div><div><br clear=3D"none"></=
div><div>Are there any good resources ((e)books, wikis, presentations, etc)=
 &nbsp;you or anyone else can recommend to fully grasp Yocto/OpenEmbedded?&=
nbsp; I've come across a number of presentations, wikis and blog posts that=
 have explained some things, but no comprehensive walkthrough that performs=
 a build and explains all the reasons for the changes.</div><div><br clear=
=3D"none"></div><div>~Keith</div><div><div><br clear=3D"none"><div><div dir=
=3D"ltr">On Thu, May 19, 2016 at 7:41 PM Keith Kyzivat &lt;<a rel=3D"nofoll=
ow" shape=3D"rect" ymailto=3D"mailto:kamaji@gmail.com" target=3D"_blank" hr=
ef=3D"mailto:kamaji@gmail.com">kamaji@gmail.com</a>&gt; wrote:<br clear=3D"=
none"></div><blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex;"><div dir=3D"ltr">Hi folks,<div><br clear=3D"none"></d=
iv><div>I've been trying to get a beagleboard krogoth build working with wo=
rking OpenGLES2 DRI drivers in place, and have been failing.</div><div><br =
clear=3D"none"></div><div>I did find out that drivers changed name from lib=
gles-omap3 to ti-sgx-ddk-um - but specifying&nbsp;ti-sgx-ddk-um as my PREFE=
RRED_PROVIDER_virtual/libgles2 fails hard --</div><div>&nbsp;-- Nothing RPR=
OVIDES 'ti-sgx-ddk-um'</div><div><br clear=3D"none"></div><div>Digging thro=
ugh commits, I found commit c70102c671 - renaming&nbsp;omap5-sgx-ddk-um-lin=
ux to&nbsp;ti-sgx-ddk-um.</div><div><br clear=3D"none"></div><div>The probl=
em seems to be that these are renamed, but the package names have not chang=
ed --&nbsp;recipes-graphics/libgles/<a rel=3D"nofollow" shape=3D"rect" targ=
et=3D"_blank" href=3D"http://ti-sgx-ddk-um_1.14.3699939.bb/">ti-sgx-ddk-um_=
1.14.3699939.bb</a> includes:</div><div><br clear=3D"none"></div><div>PROVI=
DES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-li=
nux"<br clear=3D"none"></div><div><br clear=3D"none"></div><div>Shouldn't t=
his be the following?</div><div>PROVIDES +=3D "virtual/egl virtual/libgles1=
 virtual/libgles2 ti-sgx-ddk-um"</div><div><br clear=3D"none"></div><div>An=
d also&nbsp;RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg pack=
ages?</div><div><br clear=3D"none"></div><div>Apologies if I'm asking this =
wrong - I'm pretty new to Yocto/OE and still figuring it all out.</div></di=
v><div dir=3D"ltr"><div><br clear=3D"none"></div><div>~Keith Kyzivat</div><=
/div></blockquote></div></div></div></div></div></div></div><br clear=3D"no=
ne"></div></div></div></div></div></div><div><div style=3D"color:#000;backg=
round-color:#fff;font-family:times new roman, new york, times, serif;font-s=
ize:16px;"><div><div style=3D"font-family:times new roman, new york, times,=
 serif;font-size:16px;"><div style=3D"font-family:HelveticaNeue, Helvetica =
Neue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px;"><div><di=
v>-- <br clear=3D"none">_______________________________________________<br =
clear=3D"none">meta-ti mailing list<br clear=3D"none"><a rel=3D"nofollow" s=
hape=3D"rect" ymailto=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank"=
 href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br c=
lear=3D"none"><a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"=
https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject=
.org/listinfo/meta-ti</a><br clear=3D"none"></div><br clear=3D"none"><br cl=
ear=3D"none"></div></div></div></div></div></div></blockquote></div></div><=
/div></div><br clear=3D"none"><br clear=3D"none"></div></div>  </div> </div=
>  </div></div></body></html>

------=_Part_1230241_300168155.1464211451891--
