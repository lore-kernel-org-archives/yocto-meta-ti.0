Return-Path: <kamaji@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C857E00D25; Wed, 25 May 2016 08:21:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (kamaji[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.67 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FE39E00D11
	for <meta-ti@yoctoproject.org>; Wed, 25 May 2016 08:21:08 -0700 (PDT)
Received: by mail-vk0-f67.google.com with SMTP id m81so1680579vka.0
	for <meta-ti@yoctoproject.org>; Wed, 25 May 2016 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=2JsPgl3J/Pan3cTpbv5HPamg+6ZYkb/B0a4Usv3Voxc=;
	b=sjoKV6Xi6D27RxwNplhvSAYgyrZpb1dGsxII29ysihmNtrW921jHYyeXOsGO6n63GV
	c1zZdjOLGJATua5XjJ8w6Wdl5097nsTpXEg9ah0wGA+6++9JPEzWQntkX91hqvhT790w
	ojgmLP8yx9HB9/kJlGCpMoVT8QcbHByZZBffCQhuSdqg0gm4H1LcJbmQIIXD8yAZ7bLa
	Cj2YCbMFGU1m9qE6w1rBXwM/Bj7/EGLnFOhXUPJvnqwcYGicz6ka3QXkUDEJPTvNNfr+
	NLAWZJzpr3b+hP48Nr9HWyZVdm5LAM9jKE5pW61ScquSJug4io0/pf+LqinvBEpsxgo+
	L7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2JsPgl3J/Pan3cTpbv5HPamg+6ZYkb/B0a4Usv3Voxc=;
	b=cpdJWQbVrm/TJH6nHHl8ulSUtQFcfvpvlKdCVaKp40BDeq9FYxTJ+2b/VyPnoZGJjA
	Q2qaU94thmvqTgl+v/u7JIHFI5CGLGoQRrpHp1nSnw+XLnV7KhBQoxci1oXKiNHo6hk1
	GVM93VxYNzMPVTtkEA5a6BtTXqtsnRZRL16yIAkkcyWl59u+5KDU9BUuBspBURYxsRYU
	yjAU+Iz6wpTNrqGU55IGJ2moGG2UUnwdBsNbq8Ty5AZV/ifTKNbdvn8y0WjNARZ2NHro
	MxAEMTDPm61/Jfe91nBatPbzXYA4pR/416I+lLAIoDWfxFJ14J0zss8OvuEdDprM5snL
	/bzw==
X-Gm-Message-State: ALyK8tJUUScecL4KCbGyeGU5Sy5ExT2liv6+qHyx76gU68xRaJyF4R7Ies9IU/5ScQr1HqEs+EWjI4P5CHSsIA==
X-Received: by 10.176.67.227 with SMTP id l90mr2761485ual.133.1464189667158;
	Wed, 25 May 2016 08:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
	<CAH5ySaex5z7G1rKpkXgpnOMnPkFYkL3xQrTp3ZWOcg0jqU_0wQ@mail.gmail.com>
	<371273705.3403881.1464113612415.JavaMail.yahoo@mail.yahoo.com>
	<2143110260.3400902.1464114072189.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <2143110260.3400902.1464114072189.JavaMail.yahoo@mail.yahoo.com>
From: Keith Kyzivat <kamaji@gmail.com>
Date: Wed, 25 May 2016 15:20:56 +0000
Message-ID: <CAH5ySacKTnMNFR+i3kfsSV0yuO5449o00q1dM0-QSjvn7TRYkA@mail.gmail.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Rename of omap5-sgx-ddk-um-linux to ti-sgx-ddk-um not complete?
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
X-List-Received-Date: Wed, 25 May 2016 15:21:10 -0000
Content-Type: multipart/alternative; boundary=001a114a5e66feafc70533ac38d9

--001a114a5e66feafc70533ac38d9
Content-Type: text/plain; charset=UTF-8

Hi Benjamin,

Thank you for your config details -- that's gotten me further -- with a
working driver, and Qt5_CinematicExperience actually running, bringing up
the initial display, cursor showing, and the opening "Curtains" display,
but sounds like a similar experience to what you're describing -- driver
starting, program starting, but dreadful performance to the point where it
doesn't really get beyond the first frame, and emits many FIFO underflow
messages.  DMA may be not enabled or is somehow failing?

In any case, I'm further, and will continue to research the issue and hack
away.  I'll report any progress.
Should I keep it off-list, or is it on-topic enough for this mailing list?

Anyone have any pointers to what the issue might be?

Qt5_CinematicExperience output log:
https://gist.github.com/keithel/e4eaf0a44aaa5d060f0578345d05b9b3#file-qt5_cinematicexperience-output

You can also find my config in that gist.

~Keith

On Tue, May 24, 2016 at 2:21 PM Benjamin Bimmermann <b.bimmermann@yahoo.de>
wrote:

> Hello,
>
> I build with Krogoth a QT5.6 Image.
> I have Include in my Image:
>
> IMAGE_INSTALL += " \    ti-sgx-ddk-um \    omapdrm-pvr \"
>
> and the config :
> PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
> PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"PREFERRED_PROVIDER_virtual/libgles1_keystone = "mesa"PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
> PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
> PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"PREFERRED_VERSION_linux-ti-staging = "4.4%"
> PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"PREFERRED_PROVIDER_libgbm = "libgbm"PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
>
>
> This Image works Ok. Not great. If you build things like :
> https://github.com/scottellis/tspress
> It works very well. If you try to build big things like:
> https://github.com/rzr/qt5-cinematic-experience
> The driver Starts but and the Programm try to start.
> You see a mouse Courser and thats it. The Programm doesn't run ok.
>
> If you have a solution for that or if we find together for that a solution it would be very nice.
>
> Have a nice day.
>
>
>
>
> Keith Kyzivat <kamaji@gmail.com> schrieb am 16:48 Dienstag, 24.Mai 2016:
>
>
>
>
> Hi Denys,
>
> I'm working with the Beaglebone Black Rev C board -- so AM335x-based.
> What incantation/recipe/package should I be specifying to get the
> userspace DRI drivers for use with libGLESv2 built into my image? That's
> been my biggest stumbling block.  Even moving back to Fido I was unable to
> build an image that includes the userspace graphics support libraries.
>
> Ultimately I want to pull in Qt 5.6 and be able to run QML-based apps with
> the 'eglfs' QPA platform plugin with hardware OpenGLES2 acceleration
> running over HDMI.
>
> Are there any good resources ((e)books, wikis, presentations, etc)  you or
> anyone else can recommend to fully grasp Yocto/OpenEmbedded?  I've come
> across a number of presentations, wikis and blog posts that have explained
> some things, but no comprehensive walkthrough that performs a build and
> explains all the reasons for the changes.
>
> ~Keith
>
> On Thu, May 19, 2016 at 7:41 PM Keith Kyzivat <kamaji@gmail.com> wrote:
>
> Hi folks,
>
> I've been trying to get a beagleboard krogoth build working with working
> OpenGLES2 DRI drivers in place, and have been failing.
>
> I did find out that drivers changed name from libgles-omap3 to
> ti-sgx-ddk-um - but specifying ti-sgx-ddk-um as my
> PREFERRED_PROVIDER_virtual/libgles2 fails hard --
>  -- Nothing RPROVIDES 'ti-sgx-ddk-um'
>
> Digging through commits, I found commit c70102c671 -
> renaming omap5-sgx-ddk-um-linux to ti-sgx-ddk-um.
>
> The problem seems to be that these are renamed, but the package names have
> not changed -- recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> includes:
>
> PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
> omap5-sgx-ddk-um-linux"
>
> Shouldn't this be the following?
> PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 ti-sgx-ddk-um"
>
> And also RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg
> packages?
>
> Apologies if I'm asking this wrong - I'm pretty new to Yocto/OE and still
> figuring it all out.
>
> ~Keith Kyzivat
>
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
>

--001a114a5e66feafc70533ac38d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Benjamin,<div><br></div><div>Thank you for your config =
details -- that&#39;s gotten me further -- with a working driver, and Qt5_C=
inematicExperience actually running, bringing up the initial display, curso=
r showing, and the opening &quot;Curtains&quot; display, but sounds like a =
similar experience to what you&#39;re describing -- driver starting, progra=
m starting, but dreadful performance to the point where it doesn&#39;t real=
ly get beyond the first frame, and emits many FIFO underflow messages.=C2=
=A0 DMA may be not enabled or is somehow failing?</div><div><br></div><div>=
In any case, I&#39;m further, and will continue to research the issue and h=
ack away.=C2=A0 I&#39;ll report any progress.</div><div>Should I keep it of=
f-list, or is it on-topic enough for this mailing list?</div><div><br></div=
><div>Anyone have any pointers to what the issue might be?</div><div><br></=
div><div>Qt5_CinematicExperience output log:=C2=A0<a href=3D"https://gist.g=
ithub.com/keithel/e4eaf0a44aaa5d060f0578345d05b9b3#file-qt5_cinematicexperi=
ence-output">https://gist.github.com/keithel/e4eaf0a44aaa5d060f0578345d05b9=
b3#file-qt5_cinematicexperience-output</a></div><div><br></div><div>You can=
 also find my config in that gist.</div><div><br></div><div>~Keith</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, May 24, 2016 at =
2:21 PM Benjamin Bimmermann &lt;<a href=3D"mailto:b.bimmermann@yahoo.de">b.=
bimmermann@yahoo.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div><div style=3D"color:#000;background-color:#fff;font-family:times new r=
oman,new york,times,serif;font-size:16px"><div><div><div dir=3D"ltr" style=
=3D"color:#000;background-color:#fff;font-family:times new roman,new york,t=
imes,serif;font-size:16px"><div><span>Hello,</span></div><div><br clear=3D"=
none"><span></span></div><div dir=3D"ltr"><div dir=3D"ltr"><span>I build wi=
th </span>Krogoth a QT5.6 Image.</div><div dir=3D"ltr">I have Include in my=
 Image:<br></div></div><div dir=3D"ltr"></div><pre><span>IMAGE_INSTALL</spa=
n> <span>+=3D</span> <span>&quot; </span><span>\</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_console-im=
age.bb-25"></a><span>    ti-sgx-ddk-um \</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_console-im=
age.bb-26"></a><span>    omapdrm-pvr \</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_1444571799623436890_console-im=
age.bb-27"></a><span>&quot;<br><br>and the config :<br></span><span>PREFERR=
ED_PROVIDER_virtual</span><span>/</span><span>libgl</span> <span>=3D</span>=
 <span>&quot;mesa-gl&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-8"></a><span>PREFERRED=
_PROVIDER_virtual</span><span>/</span><span>mesa</span> <span>=3D</span> <s=
pan>&quot;mesa-gl&quot;<br></span><span>PREFERRED_PROVIDER_virtual</span><s=
pan>/</span><span>egl_keystone</span> <span>=3D</span> <span>&quot;mesa&quo=
t;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-22"></a><span>PREFERRE=
D_PROVIDER_virtual</span><span>/</span><span>libgles1_keystone</span> <span=
>=3D</span> <span>&quot;mesa&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-23"></a><span>PREFERRE=
D_PROVIDER_virtual</span><span>/</span><span>libgles2_keystone</span> <span=
>=3D</span> <span>&quot;mesa&quot;<br></span><a name=3D"m_14445717996234368=
90_THE_arago-prefs.inc-24"></a><span>PREFERRED_PROVIDER_virtual</span><span=
>/</span><span>libgl_keystone</span> <span>=3D</span> <span>&quot;mesa&quot=
;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-25"></a><span>PREFERRE=
D_PROVIDER_virtual</span><span>/</span><span>mesa_keystone</span> <span>=3D=
</span> <span>&quot;mesa&quot;<br></span><span>PREFERRED_PROVIDER_virtual</=
span><span>/</span><span>kernel</span> <span>=3D</span> <span>&quot;linux-t=
i-staging&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-13"></a><span>PREFERRE=
D_VERSION_linux</span><span>-</span><span>ti</span><span>-</span><span>stag=
ing</span> <span>=3D</span> <span>&quot;4.4%&quot;</span> <br><span>PREFERR=
ED_PROVIDER_virtual</span><span>/</span><span>egl</span> <span>=3D</span> <=
span>&quot;ti-sgx-ddk-um&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-2"></a><span>PREFERRED=
_PROVIDER_virtual</span><span>/</span><span>libgles1</span> <span>=3D</span=
> <span>&quot;ti-sgx-ddk-um&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-3"></a><span>PREFERRED=
_PROVIDER_virtual</span><span>/</span><span>libgles2</span> <span>=3D</span=
> <span>&quot;ti-sgx-ddk-um&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-4"></a><span>PREFERRED=
_PROVIDER_libgbm</span> <span>=3D</span> <span>&quot;libgbm&quot;</span>
<a name=3D"m_1444571799623436890_THE_arago-prefs.inc-5"></a><span>PREFERRED=
_PROVIDER_libgbm</span><span>-</span><span>dev</span> <span>=3D</span> <spa=
n>&quot;libgbm-dev&quot;<br><br><br>This Image works Ok. Not great. If you =
build things like :<br><a href=3D"https://github.com/scottellis/tspress" ta=
rget=3D"_blank">https://github.com/scottellis/tspress</a></span><a name=3D"=
m_1444571799623436890_THE_arago-prefs.inc-26"></a><br>It works very well. I=
f you try to build big things like:<br><a href=3D"https://github.com/rzr/qt=
5-cinematic-experience" target=3D"_blank">https://github.com/rzr/qt5-cinema=
tic-experience</a><br>The driver Starts but and the Programm try to start.<=
br>You see a mouse Courser and thats it. The Programm doesn&#39;t run ok.<b=
r><br>If you have a solution for that or if we find together for that a sol=
ution it would be very nice.<br><br>Have a nice day.<br></pre><div><br></di=
v> <div><br clear=3D"none"><br clear=3D"none"></div></div></div></div><div>=
 <div style=3D"font-family:times new roman,new york,times,serif;font-size:1=
6px"> <div style=3D"font-family:HelveticaNeue,Helvetica Neue,Helvetica,Aria=
l,Lucida Grande,sans-serif;font-size:16px"></div></div></div></div></div><d=
iv><div style=3D"color:#000;background-color:#fff;font-family:times new rom=
an,new york,times,serif;font-size:16px"><div><div style=3D"font-family:time=
s new roman,new york,times,serif;font-size:16px"><div style=3D"font-family:=
HelveticaNeue,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif;font-=
size:16px"> <div dir=3D"ltr"><font face=3D"Arial" size=3D"2"> Keith Kyzivat=
 &lt;<a href=3D"mailto:kamaji@gmail.com" target=3D"_blank">kamaji@gmail.com=
</a>&gt; schrieb am 16:48 Dienstag, 24.Mai 2016:<br clear=3D"none"></font><=
/div>  <br clear=3D"none"><br clear=3D"none"> </div></div></div></div></div=
><div><div style=3D"color:#000;background-color:#fff;font-family:times new =
roman,new york,times,serif;font-size:16px"><div><div style=3D"font-family:t=
imes new roman,new york,times,serif;font-size:16px"><div style=3D"font-fami=
ly:HelveticaNeue,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif;fo=
nt-size:16px"><div><div><br><br></div><div><div><div><div dir=3D"ltr">Hi De=
nys,<div><br clear=3D"none"></div><div>I&#39;m working with the Beaglebone =
Black Rev C board -- so AM335x-based.</div><div>What incantation/recipe/pac=
kage should I be specifying to get the userspace DRI drivers for use with l=
ibGLESv2 built into my image? That&#39;s been my biggest stumbling block.=
=C2=A0 Even moving back to Fido I was unable to build an image that include=
s the userspace graphics support libraries.</div><div><br clear=3D"none"></=
div><div>Ultimately I want to pull in Qt 5.6 and be able to run QML-based a=
pps with the &#39;eglfs&#39; QPA platform plugin with hardware OpenGLES2 ac=
celeration running over HDMI.</div><div><br clear=3D"none"></div><div>Are t=
here any good resources ((e)books, wikis, presentations, etc) =C2=A0you or =
anyone else can recommend to fully grasp Yocto/OpenEmbedded?=C2=A0 I&#39;ve=
 come across a number of presentations, wikis and blog posts that have expl=
ained some things, but no comprehensive walkthrough that performs a build a=
nd explains all the reasons for the changes.</div><div><br clear=3D"none"><=
/div><div>~Keith</div><div><div><br clear=3D"none"><div><div dir=3D"ltr">On=
 Thu, May 19, 2016 at 7:41 PM Keith Kyzivat &lt;<a rel=3D"nofollow" shape=
=3D"rect" href=3D"mailto:kamaji@gmail.com" target=3D"_blank">kamaji@gmail.c=
om</a>&gt; wrote:<br clear=3D"none"></div><blockquote style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi folk=
s,<div><br clear=3D"none"></div><div>I&#39;ve been trying to get a beaglebo=
ard krogoth build working with working OpenGLES2 DRI drivers in place, and =
have been failing.</div><div><br clear=3D"none"></div><div>I did find out t=
hat drivers changed name from libgles-omap3 to ti-sgx-ddk-um - but specifyi=
ng=C2=A0ti-sgx-ddk-um as my PREFERRED_PROVIDER_virtual/libgles2 fails hard =
--</div><div>=C2=A0-- Nothing RPROVIDES &#39;ti-sgx-ddk-um&#39;</div><div><=
br clear=3D"none"></div><div>Digging through commits, I found commit c70102=
c671 - renaming=C2=A0omap5-sgx-ddk-um-linux to=C2=A0ti-sgx-ddk-um.</div><di=
v><br clear=3D"none"></div><div>The problem seems to be that these are rena=
med, but the package names have not changed --=C2=A0recipes-graphics/libgle=
s/<a rel=3D"nofollow" shape=3D"rect" href=3D"http://ti-sgx-ddk-um_1.14.3699=
939.bb/" target=3D"_blank">ti-sgx-ddk-um_1.14.3699939.bb</a> includes:</div=
><div><br clear=3D"none"></div><div>PROVIDES +=3D &quot;virtual/egl virtual=
/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux&quot;<br clear=3D"none"><=
/div><div><br clear=3D"none"></div><div>Shouldn&#39;t this be the following=
?</div><div>PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgle=
s2 ti-sgx-ddk-um&quot;</div><div><br clear=3D"none"></div><div>And also=C2=
=A0RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg packages?</di=
v><div><br clear=3D"none"></div><div>Apologies if I&#39;m asking this wrong=
 - I&#39;m pretty new to Yocto/OE and still figuring it all out.</div></div=
><div dir=3D"ltr"><div><br clear=3D"none"></div><div>~Keith Kyzivat</div></=
div></blockquote></div></div></div></div></div></div></div><br clear=3D"non=
e"></div></div></div></div></div></div><div><div style=3D"color:#000;backgr=
ound-color:#fff;font-family:times new roman,new york,times,serif;font-size:=
16px"><div><div style=3D"font-family:times new roman,new york,times,serif;f=
ont-size:16px"><div style=3D"font-family:HelveticaNeue,Helvetica Neue,Helve=
tica,Arial,Lucida Grande,sans-serif;font-size:16px"><div><div>-- <br clear=
=3D"none">_______________________________________________<br clear=3D"none"=
>meta-ti mailing list<br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" =
href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@yoctopro=
ject.org</a><br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" href=3D"h=
ttps://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blank">https://l=
ists.yoctoproject.org/listinfo/meta-ti</a><br clear=3D"none"></div><br clea=
r=3D"none"><br clear=3D"none"></div></div></div></div></div></div></blockqu=
ote></div>

--001a114a5e66feafc70533ac38d9--
