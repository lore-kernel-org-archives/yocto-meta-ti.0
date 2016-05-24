Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B81B2E004A0; Tue, 24 May 2016 11:21:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.96.50 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm26.bullet.mail.ir2.yahoo.com (nm26.bullet.mail.ir2.yahoo.com
	[212.82.96.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81B28E003D9
	for <meta-ti@yoctoproject.org>; Tue, 24 May 2016 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1464114100; bh=cRHliwnnRBkMniGuzCo1D0tACFKc1Du4uExi5sYlYIA=;
	h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
	b=Ku3K80o6B2ZMWA8bgvjJyRYFkeRTfWjOvqLpjpTO2xMl6eKf7I9KwksA8cDxUJbI3WpBubWXviSov0iG49fGoCMvs3GBCuXhhAiOn32E+m+G9OpjiFmAjKDM7uRB42iUn387WwRJS+wC0I54BI4N392tKZGj8CgUEKB/bnwxWvVCeM91HSoeTaoLB93vL9bo1CqpQ60Cg3uSD7h85isCdH92/DTz2bipJavExxaNHqer7SB4pJ/QVWiID8HpbUM6m7ghVIbrVWuKc4/ujJj6sXWcQs/P5t+SRVsmWekxR5H0M17hDjq7cbomqdgoVbexL9QmWoYRzih0J57clxRUww==
Received: from [212.82.98.52] by nm26.bullet.mail.ir2.yahoo.com with NNFMP;
	24 May 2016 18:21:40 -0000
Received: from [212.82.98.92] by tm5.bullet.mail.ir2.yahoo.com with NNFMP;
	24 May 2016 18:21:13 -0000
Received: from [127.0.0.1] by omp1029.mail.ir2.yahoo.com with NNFMP;
	24 May 2016 18:21:13 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 162826.46393.bm@omp1029.mail.ir2.yahoo.com
X-YMail-OSG: pDNwkfQVM1nfMRSYiSFnanOHE_eifsHxybkLRq327HSWrIVcGbIjxYvxYAb7It0
	PnQNG1wnANV_yIVGpsY_v8MUzhx7kg2UH1LCq9ZX99M.Hcr4eqEXHRQXJvxOyzDmOnH8CvSzjmB9
	gYCdwhngx_8_R_XMU1SlH7Ci_t2eaa3hFuY7D3woTnhiWre8erWkp6EbnpLh4BzXhR835OJ2MVHN
	_llDUMswTh.q8GXd5x37DkQuOnqd7tgVmndHw2WfN3gMaLLVzbr4dWp9_pCbFEthV4VEpJHFlHlk
	KVQcn4WBmwdlPICb5xKsSeyml5BiomaTwTL82hhMOejbXYGlYKKVyLNf.k_qWxMJ8jUL8uPRJEcI
	Jh8nL.qL2bvYV_bCScnqhd7kBdWvhgjmXMC_rH.APU.6TXrNjIYGyv_s7hH7rfztH1MPZ4o5P.eI
	IWgpG4p57JoOKzW08ZCAsq5_2omL4614FwB1FGSmBXzgMyq7xE7I9wNee21rwIBTquwnVl3o3bhn
	u_gR_b.fsRQL0ttSSFo_qBsjol8jh.kbYebe1AKBZmGUS
Received: from jws11151.mail.ir2.yahoo.com by sendmailws106.mail.ir2.yahoo.com;
	Tue, 24 May 2016 18:21:12 +0000; 1464114072.665
Date: Tue, 24 May 2016 18:21:12 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: Keith Kyzivat <kamaji@gmail.com>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <2143110260.3400902.1464114072189.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <371273705.3403881.1464113612415.JavaMail.yahoo@mail.yahoo.com>
References: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
	<CAH5ySaex5z7G1rKpkXgpnOMnPkFYkL3xQrTp3ZWOcg0jqU_0wQ@mail.gmail.com>
	<371273705.3403881.1464113612415.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Subject: Re: Rename of omap5-sgx-ddk-um-linux to ti-sgx-ddk-um not	complete?
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
X-List-Received-Date: Tue, 24 May 2016 18:21:51 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_3400901_1401510162.1464114072176"

------=_Part_3400901_1401510162.1464114072176
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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


  

------=_Part_3400901_1401510162.1464114072176
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:times new roman, new york, times, serif;font-size:16px"><div id=
=3D"yiv0831342702"><div id=3D"yui_3_16_0_ym19_1_1464113387516_7120"><div di=
r=3D"ltr" id=3D"yui_3_16_0_ym19_1_1464113387516_7119" style=3D"color:#000;b=
ackground-color:#fff;font-family:times new roman, new york, times, serif;fo=
nt-size:16px;"><div id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113387516_3551=
"><span>Hello,</span></div><div id=3D"yiv0831342702yui_3_16_0_ym19_1_146411=
3387516_3582"><br clear=3D"none"><span></span></div><div dir=3D"ltr" id=3D"=
yiv0831342702yui_3_16_0_ym19_1_1464113387516_3583"><div id=3D"yui_3_16_0_ym=
19_1_1464113387516_7343" dir=3D"ltr"><span id=3D"yui_3_16_0_ym19_1_14641133=
87516_7291">I build with </span>Krogoth a QT5.6 Image.</div><div id=3D"yui_=
3_16_0_ym19_1_1464113387516_7319" dir=3D"ltr">I have Include in my Image:<b=
r></div></div><div dir=3D"ltr" id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113=
387516_3640"></div><pre id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113387516_=
3643"><span id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113387516_3646">IMAGE_=
INSTALL</span> <span id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113387516_364=
9">+=3D</span> <span id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113387516_370=
2">" </span><span id=3D"yiv0831342702yui_3_16_0_ym19_1_1464113387516_3705">=
\</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" id=3D"yiv0831342702yui_3_16_0_=
ym19_1_1464113387516_3708" name=3D"console-image.bb-25"></a><span id=3D"yiv=
0831342702yui_3_16_0_ym19_1_1464113387516_3711">    ti-sgx-ddk-um \</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" id=3D"yiv0831342702yui_3_16_0_=
ym19_1_1464113387516_3714" name=3D"console-image.bb-26"></a><span id=3D"yiv=
0831342702yui_3_16_0_ym19_1_1464113387516_3717">    omapdrm-pvr \</span>
<a href=3D"" rel=3D"nofollow" shape=3D"rect" id=3D"yiv0831342702yui_3_16_0_=
ym19_1_1464113387516_3720" name=3D"console-image.bb-27"></a><span id=3D"yui=
_3_16_0_ym19_1_1464113387516_7430">"<br><br>and the config :<br></span><spa=
n id=3D"yui_3_16_0_ym19_1_1464113387516_7433">PREFERRED_PROVIDER_virtual</s=
pan><span id=3D"yui_3_16_0_ym19_1_1464113387516_7436">/</span><span id=3D"y=
ui_3_16_0_ym19_1_1464113387516_7439">libgl</span> <span id=3D"yui_3_16_0_ym=
19_1_1464113387516_7442">=3D</span> <span id=3D"yui_3_16_0_ym19_1_146411338=
7516_7445">"mesa-gl"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7448" name=3D"THE_arago-=
prefs.inc-8"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7451">PREFERRE=
D_PROVIDER_virtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7454">=
/</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7457">mesa</span> <span=
 id=3D"yui_3_16_0_ym19_1_1464113387516_7460">=3D</span> <span id=3D"yui_3_1=
6_0_ym19_1_1464113387516_7501">"mesa-gl"<br></span><span id=3D"yui_3_16_0_y=
m19_1_1464113387516_7504">PREFERRED_PROVIDER_virtual</span><span id=3D"yui_=
3_16_0_ym19_1_1464113387516_7507">/</span><span id=3D"yui_3_16_0_ym19_1_146=
4113387516_7510">egl_keystone</span> <span id=3D"yui_3_16_0_ym19_1_14641133=
87516_7513">=3D</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7516">"m=
esa"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7519" name=3D"THE_arago-=
prefs.inc-22"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7522">PREFERR=
ED_PROVIDER_virtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7525"=
>/</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7528">libgles1_keyston=
e</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7531">=3D</span> <span=
 id=3D"yui_3_16_0_ym19_1_1464113387516_7534">"mesa"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7537" name=3D"THE_arago-=
prefs.inc-23"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7540">PREFERR=
ED_PROVIDER_virtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7543"=
>/</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7546">libgles2_keyston=
e</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7549">=3D</span> <span=
 id=3D"yui_3_16_0_ym19_1_1464113387516_7552">"mesa"<br></span><a href=3D"" =
id=3D"yui_3_16_0_ym19_1_1464113387516_7555" name=3D"THE_arago-prefs.inc-24"=
></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7558">PREFERRED_PROVIDER_v=
irtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7561">/</span><spa=
n id=3D"yui_3_16_0_ym19_1_1464113387516_7564">libgl_keystone</span> <span i=
d=3D"yui_3_16_0_ym19_1_1464113387516_7567">=3D</span> <span id=3D"yui_3_16_=
0_ym19_1_1464113387516_7570">"mesa"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7573" name=3D"THE_arago-=
prefs.inc-25"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7576">PREFERR=
ED_PROVIDER_virtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7579"=
>/</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7582">mesa_keystone</s=
pan> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7585">=3D</span> <span id=
=3D"yui_3_16_0_ym19_1_1464113387516_7626">"mesa"<br></span><span id=3D"yui_=
3_16_0_ym19_1_1464113387516_7629">PREFERRED_PROVIDER_virtual</span><span id=
=3D"yui_3_16_0_ym19_1_1464113387516_7632">/</span><span id=3D"yui_3_16_0_ym=
19_1_1464113387516_7635">kernel</span> <span id=3D"yui_3_16_0_ym19_1_146411=
3387516_7638">=3D</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7641">=
"linux-ti-staging"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7644" name=3D"THE_arago-=
prefs.inc-13"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7647">PREFERR=
ED_VERSION_linux</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7650">-<=
/span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7653">ti</span><span id=
=3D"yui_3_16_0_ym19_1_1464113387516_7656">-</span><span id=3D"yui_3_16_0_ym=
19_1_1464113387516_7659">staging</span> <span id=3D"yui_3_16_0_ym19_1_14641=
13387516_7662">=3D</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7665"=
>"4.4%"</span> <br id=3D"yui_3_16_0_ym19_1_1464113387516_7930"><span id=3D"=
yui_3_16_0_ym19_1_1464113387516_7693">PREFERRED_PROVIDER_virtual</span><spa=
n id=3D"yui_3_16_0_ym19_1_1464113387516_7696">/</span><span id=3D"yui_3_16_=
0_ym19_1_1464113387516_7699">egl</span> <span id=3D"yui_3_16_0_ym19_1_14641=
13387516_7702">=3D</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7705"=
>"ti-sgx-ddk-um"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7708" name=3D"THE_arago-=
prefs.inc-2"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7711">PREFERRE=
D_PROVIDER_virtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7714">=
/</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7717">libgles1</span> <=
span id=3D"yui_3_16_0_ym19_1_1464113387516_7720">=3D</span> <span id=3D"yui=
_3_16_0_ym19_1_1464113387516_7723">"ti-sgx-ddk-um"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7726" name=3D"THE_arago-=
prefs.inc-3"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7729">PREFERRE=
D_PROVIDER_virtual</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7732">=
/</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7735">libgles2</span> <=
span id=3D"yui_3_16_0_ym19_1_1464113387516_7738">=3D</span> <span id=3D"yui=
_3_16_0_ym19_1_1464113387516_7741">"ti-sgx-ddk-um"</span>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7744" name=3D"THE_arago-=
prefs.inc-4"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7747">PREFERRE=
D_PROVIDER_libgbm</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7750">=
=3D</span> <span id=3D"yui_3_16_0_ym19_1_1464113387516_7753">"libgbm"</span=
>
<a href=3D"" id=3D"yui_3_16_0_ym19_1_1464113387516_7756" name=3D"THE_arago-=
prefs.inc-5"></a><span id=3D"yui_3_16_0_ym19_1_1464113387516_7759">PREFERRE=
D_PROVIDER_libgbm</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7762">-=
</span><span id=3D"yui_3_16_0_ym19_1_1464113387516_7765">dev</span> <span i=
d=3D"yui_3_16_0_ym19_1_1464113387516_7768">=3D</span> <span id=3D"yui_3_16_=
0_ym19_1_1464113387516_7771">"libgbm-dev"<br id=3D"yui_3_16_0_ym19_1_146411=
3387516_7928"><br id=3D"yui_3_16_0_ym19_1_1464113387516_7926"><br id=3D"yui=
_3_16_0_ym19_1_1464113387516_7924">This Image works Ok. Not great. If you b=
uild things like :<br id=3D"yui_3_16_0_ym19_1_1464113387516_7922"><a id=3D"=
yui_3_16_0_ym19_1_1464113387516_7916" href=3D"https://github.com/scottellis=
/tspress">https://github.com/scottellis/tspress</a></span><a href=3D"" id=
=3D"yui_3_16_0_ym19_1_1464113387516_7591" name=3D"THE_arago-prefs.inc-26"><=
/a><br id=3D"yui_3_16_0_ym19_1_1464113387516_8057">It works very well. If y=
ou try to build big things like:<br id=3D"yui_3_16_0_ym19_1_1464113387516_8=
055"><a id=3D"yui_3_16_0_ym19_1_1464113387516_8049" href=3D"https://github.=
com/rzr/qt5-cinematic-experience">https://github.com/rzr/qt5-cinematic-expe=
rience</a><br>The driver Starts but and the Programm try to start.<br>You s=
ee a mouse Courser and thats it. The Programm doesn't run ok.<br><br>If you=
 have a solution for that or if we find together for that a solution it wou=
ld be very nice.<br><br>Have a nice day.<br></pre><div id=3D"yiv0831342702y=
ui_3_16_0_ym19_1_1464113387516_3643"><br></div> <div id=3D"yui_3_16_0_ym19_=
1_1464113387516_7179" class=3D"yiv0831342702qtdSeparateBR"><br clear=3D"non=
e"><br clear=3D"none"></div></div></div></div><div class=3D".yiv0831342702y=
ahoo_quoted"> <div style=3D"font-family:times new roman, new york, times, s=
erif;font-size:16px;"> <div style=3D"font-family:HelveticaNeue, Helvetica N=
eue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:16px;"> <div dir=
=3D"ltr"><font face=3D"Arial" size=3D"2"> Keith Kyzivat &lt;kamaji@gmail.co=
m&gt; schrieb am 16:48 Dienstag, 24.Mai 2016:<br clear=3D"none"></font></di=
v>  <br clear=3D"none"><br clear=3D"none"> <div class=3D"yiv0831342702y_msg=
_container"><div class=3D"qtdSeparateBR"><br><br></div><div class=3D"yiv083=
1342702yqt5767798513" id=3D"yiv0831342702yqt65711"><div id=3D"yiv0831342702=
"><div><div dir=3D"ltr">Hi Denys,<div><br clear=3D"none"></div><div>I'm wor=
king with the Beaglebone Black Rev C board -- so AM335x-based.</div><div>Wh=
at incantation/recipe/package should I be specifying to get the userspace D=
RI drivers for use with libGLESv2 built into my image? That's been my bigge=
st stumbling block.&nbsp; Even moving back to Fido I was unable to build an=
 image that includes the userspace graphics support libraries.</div><div><b=
r clear=3D"none"></div><div>Ultimately I want to pull in Qt 5.6 and be able=
 to run QML-based apps with the 'eglfs' QPA platform plugin with hardware O=
penGLES2 acceleration running over HDMI.</div><div><br clear=3D"none"></div=
><div>Are there any good resources ((e)books, wikis, presentations, etc) &n=
bsp;you or anyone else can recommend to fully grasp Yocto/OpenEmbedded?&nbs=
p; I've come across a number of presentations, wikis and blog posts that ha=
ve explained some things, but no comprehensive walkthrough that performs a =
build and explains all the reasons for the changes.</div><div><br clear=3D"=
none"></div><div>~Keith</div><div class=3D"yiv0831342702yqt8676062336" id=
=3D"yiv0831342702yqt53055"><div><br clear=3D"none"><div class=3D"yiv0831342=
702gmail_quote"><div dir=3D"ltr">On Thu, May 19, 2016 at 7:41 PM Keith Kyzi=
vat &lt;<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:kamaji@gmail.c=
om" target=3D"_blank" href=3D"mailto:kamaji@gmail.com">kamaji@gmail.com</a>=
&gt; wrote:<br clear=3D"none"></div><blockquote class=3D"yiv0831342702gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex;"><div dir=3D"ltr">Hi folks,<div><br clear=3D"none"></div><div>I've bee=
n trying to get a beagleboard krogoth build working with working OpenGLES2 =
DRI drivers in place, and have been failing.</div><div><br clear=3D"none"><=
/div><div>I did find out that drivers changed name from libgles-omap3 to ti=
-sgx-ddk-um - but specifying&nbsp;ti-sgx-ddk-um as my PREFERRED_PROVIDER_vi=
rtual/libgles2 fails hard --</div><div>&nbsp;-- Nothing RPROVIDES 'ti-sgx-d=
dk-um'</div><div><br clear=3D"none"></div><div>Digging through commits, I f=
ound commit c70102c671 - renaming&nbsp;omap5-sgx-ddk-um-linux to&nbsp;ti-sg=
x-ddk-um.</div><div><br clear=3D"none"></div><div>The problem seems to be t=
hat these are renamed, but the package names have not changed --&nbsp;recip=
es-graphics/libgles/<a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" hr=
ef=3D"http://ti-sgx-ddk-um_1.14.3699939.bb/">ti-sgx-ddk-um_1.14.3699939.bb<=
/a> includes:</div><div><br clear=3D"none"></div><div>PROVIDES +=3D "virtua=
l/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"<br clear=3D=
"none"></div><div><br clear=3D"none"></div><div>Shouldn't this be the follo=
wing?</div><div>PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles=
2 ti-sgx-ddk-um"</div><div><br clear=3D"none"></div><div>And also&nbsp;RPRO=
VIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg packages?</div><div>=
<br clear=3D"none"></div><div>Apologies if I'm asking this wrong - I'm pret=
ty new to Yocto/OE and still figuring it all out.</div></div><div dir=3D"lt=
r"><div><br clear=3D"none"></div><div>~Keith Kyzivat</div></div></blockquot=
e></div></div></div></div></div></div></div><br clear=3D"none"><div class=
=3D"yiv0831342702yqt8676062336" id=3D"yiv0831342702yqt31021">-- <br clear=
=3D"none">_______________________________________________<br clear=3D"none"=
>meta-ti mailing list<br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" =
ymailto=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank" href=3D"mailt=
o:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br clear=3D"none">=
<a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"https://lists.=
yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/=
meta-ti</a><br clear=3D"none"></div><br clear=3D"none"><br clear=3D"none"><=
/div>  </div> </div>  </div></div></body></html>

------=_Part_3400901_1401510162.1464114072176--
