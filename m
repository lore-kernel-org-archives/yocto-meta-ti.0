Return-Path: <kamaji@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51B2FE008BC; Mon,  6 Jun 2016 15:38:48 -0700 (PDT)
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
	*      [209.85.213.48 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0643AE0088C
	for <meta-ti@yoctoproject.org>; Mon,  6 Jun 2016 15:38:44 -0700 (PDT)
Received: by mail-vk0-f48.google.com with SMTP id d64so95629719vkb.0
	for <meta-ti@yoctoproject.org>; Mon, 06 Jun 2016 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=9wCs7foBrTW4gOGWMSJnp2EnxZQBPdwjBOGJ3ov7z0U=;
	b=UXK/T//4pkmAHCDsv+srm+TWznzi+z9gg3m9JPbVavtmfMHyvKZFFLKCo7x1CktvYr
	M+g8stUvi8lEywZ9fISHHAEOyFds/GiKqdSIg4reKGsWLtQzrk1zQYRMfuESc8uBk0XI
	/Yv7xf5YE9EMmwfIMMW0R8C4yRJehFp+5lv01y0PiXZAIMbng7oZs8yyfAjg+iDshQJI
	xGjsdoLQ02nTeTXttIsIibcTLU+DP9GZNeTDANu47Jt4zVCFW9WOgjqlWW/1+8Ekpx91
	UEZGWhLaD5XtAkmMvsyvUpqyTCjDTkG+ZeZ2wVgrvQCohDf2o7x4o6IxYG6DtppbXYHT
	mStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=9wCs7foBrTW4gOGWMSJnp2EnxZQBPdwjBOGJ3ov7z0U=;
	b=d8MkPRaBaAgk5ukF1lXNX/Wp1EJvSIXSTqvWG16kDAYiakDXUTP5gz5JdV/k6sgNYW
	yLoVDJWBqgp4cbcqYFK0IN6Em4TWiBcwaqOSBTNZeYFWWo78s2kLQlCGFbgMeNwTKRIH
	V19aOu5xMgSY4NoZdtvgJpwUT63AUE9VLaDg8GjMutMnFcrsp8YQ35DYvecQ285JcsF5
	2EdhTWdqT6Tl7HPZF7RzUhPAwwzoRr0cVX2T90cvLAA/eapwtSck2KvouoZP8BsaoVyr
	XLpdbLaQgT8G00VBVjAFS9HJ9vajxnK0/p2hstVs5lkFQ4CQ+2WVMe7kF8FTmm+bXP44
	c+Jw==
X-Gm-Message-State: ALyK8tJLwF4EY409lHAMqaTmzm9dAaHJq3g7IFnsIaiQNvqeV4ro3TIqRnIcCkene69x0W1R2/fONmxYGaRgnw==
X-Received: by 10.176.4.49 with SMTP id 46mr1809434uav.32.1465252723603; Mon,
	06 Jun 2016 15:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
	<CAH5ySaex5z7G1rKpkXgpnOMnPkFYkL3xQrTp3ZWOcg0jqU_0wQ@mail.gmail.com>
	<371273705.3403881.1464113612415.JavaMail.yahoo@mail.yahoo.com>
	<2143110260.3400902.1464114072189.JavaMail.yahoo@mail.yahoo.com>
	<CAH5ySacKTnMNFR+i3kfsSV0yuO5449o00q1dM0-QSjvn7TRYkA@mail.gmail.com>
	<2022998705.1230242.1464211451910.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <2022998705.1230242.1464211451910.JavaMail.yahoo@mail.yahoo.com>
From: Keith Kyzivat <kamaji@gmail.com>
Date: Mon, 06 Jun 2016 22:38:33 +0000
Message-ID: <CAH5ySacFPHP7Q+z+Djb7RdS-T+Ez+YTrHv9oaO7xdajJGCPajg@mail.gmail.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>,
	Yocto Texas <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Mon, 06 Jun 2016 22:38:48 -0000
Content-Type: multipart/alternative; boundary=94eb2c09336218bf600534a3bca4

--94eb2c09336218bf600534a3bca4
Content-Type: text/plain; charset=UTF-8

Hi Benjamin,

SGX: -- isn't this already enabled from
meta-ti/conf/machine/include/ti33x.inc, included by
meta-ti/conf/machine/beaglebone.conf ?:  MACHINE_FEATURES = "kernel26 apm
usbgadget usbhost vfat ext2 screen alsa ethernet sgx"

You must be referring to going the approach of using the jumpnowtek
meta-bbb layer that doesn't use meta-ti.  I've been sticking with
meta-embarcados for the time being - pulling what I can from their master
branch, and adapting it to work with the krogoth branch...  I might jump
entirely free of it though and just depend on meta-ti and meta-qt.. for the
moment it works ok for me.

I see the cleanup you referenced -- haven't tried yet to remove it, but
makes sense - it's referring to the old outdated/incorrect omap driver.

As for improving performance- just today I pulled latest changes from
meta-ti and Qt5_CinematicExperience is working well for me now, when before
it wasn't operating at all.  I think the commit that fixes the issue is
: 2a57c4c ti-sgx-ddk-um: update srcrev and bump PR
This commit pulls a newer rev of the kernel graphics module.

Fonts are also fixed now -- previously I found that, while fontconfig was
built, and fonts were placed on the system, none were loaded when my Qt app
ran, and thus text fields, buttons, etc were devoid of text.  I'm not
entirely sure what fixed the font issue -- as I have made a few changes to
my local.conf that are fontconfig related, but none seemed to correct the
issue until I did a full rebuild (wiping the tmp dir but keeping same
sstate dir) - which I did when I pulled the latest meta-ti changes.

Something I can't figure out - that I had working at one point, but no
longer have working is setting the default platform plugin to 'eglfs'
instead of 'xcb' (which isn't even built!).
My guess is I'm using a var that isn't used in krogoth, that was used in
fido:
EXTRA_OECONF_append = " -qpa eglfs" in one of  my qtbase_%.bbappend files.

Anyway! Try a rebuild with latest meta-ti, and I think you'll find better
graphics performance in QML-based applications.

~Keith

On Wed, May 25, 2016 at 5:24 PM Benjamin Bimmermann <b.bimmermann@yahoo.de>
wrote:

> Hello,
>
> first it is good to share informations so maybe the meta-ti devs can fix
> this.
>
> Now to you:
> I think you are at a ponit where I was about 2 mounth ago. So I will help
> you if you share later a fix for the Qt5_CinematicExperience.
>
> First:
> I think you try to use:
> http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/
> I think this is to old. You should more fokus and use:
> http://www.jumpnowtek.com/
> https://github.com/jumpnow/meta-bbb
>
> The Problem with the jumpnow layer is that they don't use the meta-ti
> layer. So they can not build very good and fast qt5 aps.
>
> Second:
>
> What you don't need I think :
> /home/vagrant/yocto/poky/meta-embarcados \
> RDEPENDS_packagegroup-qt5-machine-related = "\ -
> ${@base_contains('MACHINE', 'beaglebone', 'libgles-omap3
> omap3-sgx-modules', '', d)} \ + ${@base_contains('MACHINE', 'beaglebone',
> 'omap5-sgx-ddk-um-linux', '', d)} \ "
>
>
> ----------------------------------------------------------------------------
>
> Third:
>
> You must enable SGX in your system and overlay !!!
>
> Four :
>
> I have better experience with:
> beaglebone.conf:
>     require conf/machine/include/ti33x.inc
>     require conf/machine/include/THE_arago-prefs.inc
>     UBOOT_MACHINE = "am335x_boneblack_config"
>     MACHINE_FEATURES += " serial usbhost sgx "
>     PREFERRED_PROVIDER* (like the last e-mail)
>
> Image:
>
> IMAGE_INSTALL += " \
>     ti-sgx-ddk-um \    omapdrm-pvr \
>    packagegroup-qt5-toolchain-target \   qtmultimedia \   qtmultimedia-dev \   qtmultimedia-mkspecs \ "
>
>   local.conf:
>
> PACKAGECONFIG_GL_pn-qtbase = "gles2"PACKAGECONFIG_GL_append += " accessibility examples gles2 libs tools"PACKAGECONFIG_append_pn-qtmultimedia = " gstreamer"DISTRO_FEATURES_append = " opengl usbhost sgx"DISTRO_FEATURES_remove = " x11  "
> RM_OLD_IMAGE = "1"
> EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug ssh-server-openssh"
>
>
> I hope I could help and maybe we find a solution for the problem and add
> this to meta-ti.
>
> Have a nice day.
>
>
>
> Keith Kyzivat <kamaji@gmail.com> schrieb am 17:20 Mittwoch, 25.Mai 2016:
>
>
>
>
> Hi Benjamin,
>
> Thank you for your config details -- that's gotten me further -- with a
> working driver, and Qt5_CinematicExperience actually running, bringing up
> the initial display, cursor showing, and the opening "Curtains" display,
> but sounds like a similar experience to what you're describing -- driver
> starting, program starting, but dreadful performance to the point where it
> doesn't really get beyond the first frame, and emits many FIFO underflow
> messages.  DMA may be not enabled or is somehow failing?
>
> In any case, I'm further, and will continue to research the issue and hack
> away.  I'll report any progress.
> Should I keep it off-list, or is it on-topic enough for this mailing list?
>
> Anyone have any pointers to what the issue might be?
>
> Qt5_CinematicExperience output log:
> https://gist.github.com/keithel/e4eaf0a44aaa5d060f0578345d05b9b3#file-qt5_cinematicexperience-output
>
> You can also find my config in that gist.
>
> ~Keith
>
> On Tue, May 24, 2016 at 2:21 PM Benjamin Bimmermann <b.bimmermann@yahoo.de>
> wrote:
>
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
>
>

--94eb2c09336218bf600534a3bca4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Benjamin,<div><br></div><div>SGX: -- isn&#39;t this alr=
eady enabled from meta-ti/conf/machine/include/ti33x.inc, included by meta-=
ti/conf/machine/beaglebone.conf ?: =C2=A0MACHINE_FEATURES =3D &quot;kernel2=
6 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx&quot;</div><div>=
<br></div><div>You must be referring to going the approach of using the jum=
pnowtek meta-bbb layer that doesn&#39;t use meta-ti.=C2=A0 I&#39;ve been st=
icking with meta-embarcados for the time being - pulling what I can from th=
eir master branch, and adapting it to work with the krogoth branch...=C2=A0=
 I might jump entirely free of it though and just depend on meta-ti and met=
a-qt.. for the moment it works ok for me.</div><div><br></div><div>I see th=
e cleanup you referenced -- haven&#39;t tried yet to remove it, but makes s=
ense - it&#39;s referring to the old outdated/incorrect omap driver.</div><=
div><br></div><div>As for improving performance- just today I pulled latest=
 changes from meta-ti and Qt5_CinematicExperience is working well for me no=
w, when before it wasn&#39;t operating at all.=C2=A0 I think the commit tha=
t fixes the issue is :=C2=A02a57c4c ti-sgx-ddk-um: update srcrev and bump P=
R</div><div>This commit pulls a newer rev of the kernel graphics module.</d=
iv><div><br></div><div>Fonts are also fixed now -- previously I found that,=
 while fontconfig was built, and fonts were placed on the system, none were=
 loaded when my Qt app ran, and thus text fields, buttons, etc were devoid =
of text.=C2=A0 I&#39;m not entirely sure what fixed the font issue -- as I =
have made a few changes to my local.conf that are fontconfig related, but n=
one seemed to correct the issue until I did a full rebuild (wiping the tmp =
dir but keeping same sstate dir) - which I did when I pulled the latest met=
a-ti changes.</div><div><br></div><div>Something I can&#39;t figure out - t=
hat I had working at one point, but no longer have working is setting the d=
efault platform plugin to &#39;eglfs&#39; instead of &#39;xcb&#39; (which i=
sn&#39;t even built!).</div><div>My guess is I&#39;m using a var that isn&#=
39;t used in krogoth, that was used in fido:</div><div>EXTRA_OECONF_append =
=3D &quot; -qpa eglfs&quot; in one of =C2=A0my=C2=A0qtbase_%.bbappend files=
.<br></div><div><br></div><div>Anyway! Try a rebuild with latest meta-ti, a=
nd I think you&#39;ll find better graphics performance in QML-based applica=
tions.</div><div><br></div><div>~Keith</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Wed, May 25, 2016 at 5:24 PM Benjamin Bimmermann &=
lt;<a href=3D"mailto:b.bimmermann@yahoo.de">b.bimmermann@yahoo.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div><div style=3D"color:#000=
;background-color:#fff;font-family:times new roman,new york,times,serif;fon=
t-size:16px"><div><div><div style=3D"color:#000;background-color:#fff;font-=
family:times new roman,new york,times,serif;font-size:16px">Hello,<div><br =
clear=3D"none"><span></span></div><div dir=3D"ltr"><span>first it is good t=
o share informations so maybe the meta-ti devs can fix this.</span></div><d=
iv dir=3D"ltr"><br clear=3D"none"><span></span></div><div dir=3D"ltr"><span=
>Now to you:<br clear=3D"none">I think you are at a ponit where I was about=
 2 mounth ago. So I will help you if you share later a fix for the </span>Q=
t5_CinematicExperience.</div><div dir=3D"ltr"><br clear=3D"none"></div><div=
 dir=3D"ltr">First: <br clear=3D"none"></div><div dir=3D"ltr">I think you t=
ry to use: <br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" href=3D"ht=
tp://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/" target=3D"_=
blank">http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/</a>=
</div><div dir=3D"ltr">I think this is to old. You should more fokus and us=
e:</div><div dir=3D"ltr"><a rel=3D"nofollow" shape=3D"rect" href=3D"http://=
www.jumpnowtek.com/" target=3D"_blank">http://www.jumpnowtek.com/</a></div>=
<div dir=3D"ltr"><a rel=3D"nofollow" shape=3D"rect" href=3D"https://github.=
com/jumpnow/meta-bbb" target=3D"_blank">https://github.com/jumpnow/meta-bbb=
</a><br clear=3D"none"></div><div><br clear=3D"none"></div><div><div dir=3D=
"ltr">The Problem with the jumpnow layer is that they don&#39;t use the met=
a-ti layer. So they can not build very good and fast qt5 aps.</div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">Second:</div><div dir=3D"ltr"><br></div=
><div dir=3D"ltr">What you don&#39;t need I think :</div><div dir=3D"ltr"> =
 /home/vagrant/yocto/poky/meta-embarcados \</div><div dir=3D"ltr"> RDEPENDS=
_packagegroup-qt5-machine-related =3D &quot;\
     =20
     =20
       =20
        <span>-            ${@base_contains(&#39;MACHINE&#39;, &#39;beagleb=
one&#39;, &#39;libgles-omap3 omap3-sgx-modules&#39;, &#39;&#39;, d)} \</spa=
n>
     =20
     =20
       =20
        <span>+            ${@base_contains(&#39;MACHINE&#39;, &#39;beagleb=
one&#39;, &#39;omap5-sgx-ddk-um-linux&#39;, &#39;&#39;, d)} \</span>
     =20
     =20
       =20
                     &quot;</div></div><div dir=3D"ltr"><div><br></div><div=
>--------------------------------------------------------------------------=
--<br></div><div><br></div><div>Third:<br></div><div><br></div><div>You mus=
t enable SGX in your system and overlay !!!<br></div><div><br></div><div>Fo=
ur :<br></div><div><br clear=3D"none"></div><div>I have better experience w=
ith:</div><div dir=3D"ltr">beaglebone.conf:</div><div dir=3D"ltr">=C2=A0=C2=
=A0=C2=A0=C2=A0require conf/machine/include/ti33x.inc<br></div><div dir=3D"=
ltr">=C2=A0=C2=A0=C2=A0=C2=A0require conf/machine/include/THE_arago-prefs.i=
nc<a name=3D"m_-5854793508555257093_beaglebone.conf-15"></a></div><div dir=
=3D"ltr"><a name=3D"m_-5854793508555257093_beaglebone.conf-15">=C2=A0=C2=A0=
=C2=A0=C2=A0</a>UBOOT_MACHINE =3D &quot;am335x_boneblack_config&quot;<br></=
div><div dir=3D"ltr">=C2=A0=C2=A0=C2=A0=C2=A0MACHINE_FEATURES +=3D &quot; s=
erial usbhost sgx &quot;</div><div dir=3D"ltr">=C2=A0=C2=A0=C2=A0 <span>PRE=
FERRED_PROVIDER* (like the last e-mail)</span></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">Image:</div><pre><span>IMAGE_INSTALL</span> <span>+=3D=
</span> <span>&quot; \</span><span>   <br>=C2=A0=C2=A0=C2=A0 ti-sgx-ddk-um =
\</span>
<a name=3D"m_-5854793508555257093_console-image.bb-26"></a><span>    omapdr=
m-pvr \</span><br><span>   packagegroup-qt5-toolchain-target \</span>
<a name=3D"m_-5854793508555257093_qt5-image.bb-47"></a><span>   qtmultimedi=
a \</span>
<a name=3D"m_-5854793508555257093_qt5-image.bb-48"></a><span>   qtmultimedi=
a-dev \</span>
<a name=3D"m_-5854793508555257093_qt5-image.bb-49"></a><span>   qtmultimedi=
a-mkspecs \</span> <a name=3D"m_-5854793508555257093_console-image.bb-27"><=
/a><span>&quot;</span></pre></div><div dir=3D"ltr"><div dir=3D"ltr">=C2=A0 =
local.conf:
</div><pre><a name=3D"m_-5854793508555257093_local.conf-32"></a>PACKAGECONF=
IG_GL_pn-qtbase =3D &quot;gles2&quot;
<a name=3D"m_-5854793508555257093_local.conf-36"></a>PACKAGECONFIG_GL_appen=
d +=3D &quot; accessibility examples gles2 libs tools&quot;
<a name=3D"m_-5854793508555257093_local.conf-37"></a>PACKAGECONFIG_append_p=
n-qtmultimedia =3D &quot; gstreamer&quot;
<a name=3D"m_-5854793508555257093_local.conf-38"></a>
<a name=3D"m_-5854793508555257093_local.conf-42"></a>DISTRO_FEATURES_append=
 =3D &quot; opengl usbhost sgx&quot;
<a name=3D"m_-5854793508555257093_local.conf-43"></a>DISTRO_FEATURES_remove=
 =3D &quot; x11  &quot;

<a name=3D"m_-5854793508555257093_local.conf-49"></a>RM_OLD_IMAGE =3D &quot=
;1&quot;

<a name=3D"m_-5854793508555257093_local.conf-55"></a>EXTRA_IMAGE_FEATURES =
=3D &quot;debug-tweaks tools-debug ssh-server-openssh&quot;</pre><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">I hope I could help and maybe we find a=
 solution for the problem and add this to meta-ti.</div><div dir=3D"ltr"><b=
r></div><div dir=3D"ltr">Have a nice day.<br></div></div><div dir=3D"ltr"><=
br clear=3D"none"></div> <div><br clear=3D"none"><br clear=3D"none"></div><=
/div></div></div></div></div><div><div style=3D"color:#000;background-color=
:#fff;font-family:times new roman,new york,times,serif;font-size:16px"><div=
> <div style=3D"font-family:times new roman,new york,times,serif;font-size:=
16px"> <div style=3D"font-family:HelveticaNeue,Helvetica Neue,Helvetica,Ari=
al,Lucida Grande,sans-serif;font-size:16px"> <div dir=3D"ltr"><font face=3D=
"Arial" size=3D"2"> Keith Kyzivat &lt;<a href=3D"mailto:kamaji@gmail.com" t=
arget=3D"_blank">kamaji@gmail.com</a>&gt; schrieb am 17:20 Mittwoch, 25.Mai=
 2016:<br clear=3D"none"></font></div>  <br clear=3D"none"><br clear=3D"non=
e"> <div><br><br></div><div><div><div><div><div dir=3D"ltr">Hi Benjamin,<di=
v><br clear=3D"none"></div><div>Thank you for your config details -- that&#=
39;s gotten me further -- with a working driver, and Qt5_CinematicExperienc=
e actually running, bringing up the initial display, cursor showing, and th=
e opening &quot;Curtains&quot; display, but sounds like a similar experienc=
e to what you&#39;re describing -- driver starting, program starting, but d=
readful performance to the point where it doesn&#39;t really get beyond the=
 first frame, and emits many FIFO underflow messages.=C2=A0 DMA may be not =
enabled or is somehow failing?</div><div><br clear=3D"none"></div><div>In a=
ny case, I&#39;m further, and will continue to research the issue and hack =
away.=C2=A0 I&#39;ll report any progress.</div><div>Should I keep it off-li=
st, or is it on-topic enough for this mailing list?</div><div><br clear=3D"=
none"></div><div>Anyone have any pointers to what the issue might be?</div>=
<div><br clear=3D"none"></div><div>Qt5_CinematicExperience output log:=C2=
=A0<a rel=3D"nofollow" shape=3D"rect" href=3D"https://gist.github.com/keith=
el/e4eaf0a44aaa5d060f0578345d05b9b3#file-qt5_cinematicexperience-output" ta=
rget=3D"_blank">https://gist.github.com/keithel/e4eaf0a44aaa5d060f0578345d0=
5b9b3#file-qt5_cinematicexperience-output</a></div><div><br clear=3D"none">=
</div><div>You can also find my config in that gist.</div><div><br clear=3D=
"none"></div><div>~Keith</div></div><br clear=3D"none"><div><div><div dir=
=3D"ltr">On Tue, May 24, 2016 at 2:21 PM Benjamin Bimmermann &lt;<a rel=3D"=
nofollow" shape=3D"rect" href=3D"mailto:b.bimmermann@yahoo.de" target=3D"_b=
lank">b.bimmermann@yahoo.de</a>&gt; wrote:<br clear=3D"none"></div><blockqu=
ote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div><div style=3D"color:#000;background-color:#fff;font-family:times new =
roman,new york,times,serif;font-size:16px"><div><div><div dir=3D"ltr" style=
=3D"color:#000;background-color:#fff;font-family:times new roman,new york,t=
imes,serif;font-size:16px"><div><span>Hello,</span></div><div><br clear=3D"=
none"><span></span></div><div dir=3D"ltr"><div dir=3D"ltr"><span>I build wi=
th </span>Krogoth a QT5.6 Image.</div><div dir=3D"ltr">I have Include in my=
 Image:<br clear=3D"none"></div></div><div dir=3D"ltr"></div><pre><span>IMA=
GE_INSTALL</span> <span>+=3D</span> <span>&quot; </span><span>\</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_console-image.bb-25"></a><span>    ti-sgx-ddk-um \</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_console-image.bb-26"></a><span>    omapdrm-pvr \</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_console-image.bb-27"></a><span>&quot;<br clear=3D"none"><br cl=
ear=3D"none">and the config :<br clear=3D"none"></span><span>PREFERRED_PROV=
IDER_virtual</span><span>/</span><span>libgl</span> <span>=3D</span> <span>=
&quot;mesa-gl&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-8"></a><span>PREFERRED_PROVIDER_virtual</s=
pan><span>/</span><span>mesa</span> <span>=3D</span> <span>&quot;mesa-gl&qu=
ot;<br clear=3D"none"></span><span>PREFERRED_PROVIDER_virtual</span><span>/=
</span><span>egl_keystone</span> <span>=3D</span> <span>&quot;mesa&quot;</s=
pan>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-22"></a><span>PREFERRED_PROVIDER_virtual</=
span><span>/</span><span>libgles1_keystone</span> <span>=3D</span> <span>&q=
uot;mesa&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-23"></a><span>PREFERRED_PROVIDER_virtual</=
span><span>/</span><span>libgles2_keystone</span> <span>=3D</span> <span>&q=
uot;mesa&quot;<br clear=3D"none"></span><a rel=3D"nofollow" shape=3D"rect" =
name=3D"m_-5854793508555257093_m_1444571799623436890_THE_arago-prefs.inc-24=
"></a><span>PREFERRED_PROVIDER_virtual</span><span>/</span><span>libgl_keys=
tone</span> <span>=3D</span> <span>&quot;mesa&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-25"></a><span>PREFERRED_PROVIDER_virtual</=
span><span>/</span><span>mesa_keystone</span> <span>=3D</span> <span>&quot;=
mesa&quot;<br clear=3D"none"></span><span>PREFERRED_PROVIDER_virtual</span>=
<span>/</span><span>kernel</span> <span>=3D</span> <span>&quot;linux-ti-sta=
ging&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-13"></a><span>PREFERRED_VERSION_linux</spa=
n><span>-</span><span>ti</span><span>-</span><span>staging</span> <span>=3D=
</span> <span>&quot;4.4%&quot;</span> <br clear=3D"none"><span>PREFERRED_PR=
OVIDER_virtual</span><span>/</span><span>egl</span> <span>=3D</span> <span>=
&quot;ti-sgx-ddk-um&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-2"></a><span>PREFERRED_PROVIDER_virtual</s=
pan><span>/</span><span>libgles1</span> <span>=3D</span> <span>&quot;ti-sgx=
-ddk-um&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-3"></a><span>PREFERRED_PROVIDER_virtual</s=
pan><span>/</span><span>libgles2</span> <span>=3D</span> <span>&quot;ti-sgx=
-ddk-um&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-4"></a><span>PREFERRED_PROVIDER_libgbm</sp=
an> <span>=3D</span> <span>&quot;libgbm&quot;</span>
<a rel=3D"nofollow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571=
799623436890_THE_arago-prefs.inc-5"></a><span>PREFERRED_PROVIDER_libgbm</sp=
an><span>-</span><span>dev</span> <span>=3D</span> <span>&quot;libgbm-dev&q=
uot;<br clear=3D"none"><br clear=3D"none"><br clear=3D"none">This Image wor=
ks Ok. Not great. If you build things like :<br clear=3D"none"><a rel=3D"no=
follow" shape=3D"rect" href=3D"https://github.com/scottellis/tspress" targe=
t=3D"_blank">https://github.com/scottellis/tspress</a></span><a rel=3D"nofo=
llow" shape=3D"rect" name=3D"m_-5854793508555257093_m_1444571799623436890_T=
HE_arago-prefs.inc-26"></a><br clear=3D"none">It works very well. If you tr=
y to build big things like:<br clear=3D"none"><a rel=3D"nofollow" shape=3D"=
rect" href=3D"https://github.com/rzr/qt5-cinematic-experience" target=3D"_b=
lank">https://github.com/rzr/qt5-cinematic-experience</a><br clear=3D"none"=
>The driver Starts but and the Programm try to start.<br clear=3D"none">You=
 see a mouse Courser and thats it. The Programm doesn&#39;t run ok.<br clea=
r=3D"none"><br clear=3D"none">If you have a solution for that or if we find=
 together for that a solution it would be very nice.<br clear=3D"none"><br =
clear=3D"none">Have a nice day.<br clear=3D"none"></pre><div><br clear=3D"n=
one"></div> <div><br clear=3D"none"><br clear=3D"none"></div></div></div></=
div><div> <div style=3D"font-family:times new roman,new york,times,serif;fo=
nt-size:16px"> <div style=3D"font-family:HelveticaNeue,Helvetica Neue,Helve=
tica,Arial,Lucida Grande,sans-serif;font-size:16px"></div></div></div></div=
></div><div><div style=3D"color:#000;background-color:#fff;font-family:time=
s new roman,new york,times,serif;font-size:16px"><div><div style=3D"font-fa=
mily:times new roman,new york,times,serif;font-size:16px"><div style=3D"fon=
t-family:HelveticaNeue,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-se=
rif;font-size:16px"> <div dir=3D"ltr"><font face=3D"Arial" size=3D"2"> Keit=
h Kyzivat &lt;<a rel=3D"nofollow" shape=3D"rect" href=3D"mailto:kamaji@gmai=
l.com" target=3D"_blank">kamaji@gmail.com</a>&gt; schrieb am 16:48 Dienstag=
, 24.Mai 2016:<br clear=3D"none"></font></div>  <br clear=3D"none"><br clea=
r=3D"none"> </div></div></div></div></div><div><div style=3D"color:#000;bac=
kground-color:#fff;font-family:times new roman,new york,times,serif;font-si=
ze:16px"><div><div style=3D"font-family:times new roman,new york,times,seri=
f;font-size:16px"><div style=3D"font-family:HelveticaNeue,Helvetica Neue,He=
lvetica,Arial,Lucida Grande,sans-serif;font-size:16px"><div><div><br clear=
=3D"none"><br clear=3D"none"></div><div><div><div><div dir=3D"ltr">Hi Denys=
,<div><br clear=3D"none"></div><div>I&#39;m working with the Beaglebone Bla=
ck Rev C board -- so AM335x-based.</div><div>What incantation/recipe/packag=
e should I be specifying to get the userspace DRI drivers for use with libG=
LESv2 built into my image? That&#39;s been my biggest stumbling block.=C2=
=A0 Even moving back to Fido I was unable to build an image that includes t=
he userspace graphics support libraries.</div><div><br clear=3D"none"></div=
><div>Ultimately I want to pull in Qt 5.6 and be able to run QML-based apps=
 with the &#39;eglfs&#39; QPA platform plugin with hardware OpenGLES2 accel=
eration running over HDMI.</div><div><br clear=3D"none"></div><div>Are ther=
e any good resources ((e)books, wikis, presentations, etc) =C2=A0you or any=
one else can recommend to fully grasp Yocto/OpenEmbedded?=C2=A0 I&#39;ve co=
me across a number of presentations, wikis and blog posts that have explain=
ed some things, but no comprehensive walkthrough that performs a build and =
explains all the reasons for the changes.</div><div><br clear=3D"none"></di=
v><div>~Keith</div><div><div><br clear=3D"none"><div><div dir=3D"ltr">On Th=
u, May 19, 2016 at 7:41 PM Keith Kyzivat &lt;<a rel=3D"nofollow" shape=3D"r=
ect" href=3D"mailto:kamaji@gmail.com" target=3D"_blank">kamaji@gmail.com</a=
>&gt; wrote:<br clear=3D"none"></div><blockquote style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi folks,<di=
v><br clear=3D"none"></div><div>I&#39;ve been trying to get a beagleboard k=
rogoth build working with working OpenGLES2 DRI drivers in place, and have =
been failing.</div><div><br clear=3D"none"></div><div>I did find out that d=
rivers changed name from libgles-omap3 to ti-sgx-ddk-um - but specifying=C2=
=A0ti-sgx-ddk-um as my PREFERRED_PROVIDER_virtual/libgles2 fails hard --</d=
iv><div>=C2=A0-- Nothing RPROVIDES &#39;ti-sgx-ddk-um&#39;</div><div><br cl=
ear=3D"none"></div><div>Digging through commits, I found commit c70102c671 =
- renaming=C2=A0omap5-sgx-ddk-um-linux to=C2=A0ti-sgx-ddk-um.</div><div><br=
 clear=3D"none"></div><div>The problem seems to be that these are renamed, =
but the package names have not changed --=C2=A0recipes-graphics/libgles/<a =
rel=3D"nofollow" shape=3D"rect" href=3D"http://ti-sgx-ddk-um_1.14.3699939.b=
b/" target=3D"_blank">ti-sgx-ddk-um_1.14.3699939.bb</a> includes:</div><div=
><br clear=3D"none"></div><div>PROVIDES +=3D &quot;virtual/egl virtual/libg=
les1 virtual/libgles2 omap5-sgx-ddk-um-linux&quot;<br clear=3D"none"></div>=
<div><br clear=3D"none"></div><div>Shouldn&#39;t this be the following?</di=
v><div>PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgles2 ti=
-sgx-ddk-um&quot;</div><div><br clear=3D"none"></div><div>And also=C2=A0RPR=
OVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg packages?</div><div=
><br clear=3D"none"></div><div>Apologies if I&#39;m asking this wrong - I&#=
39;m pretty new to Yocto/OE and still figuring it all out.</div></div><div =
dir=3D"ltr"><div><br clear=3D"none"></div><div>~Keith Kyzivat</div></div></=
blockquote></div></div></div></div></div></div></div><br clear=3D"none"></d=
iv></div></div></div></div></div><div><div style=3D"color:#000;background-c=
olor:#fff;font-family:times new roman,new york,times,serif;font-size:16px">=
<div><div style=3D"font-family:times new roman,new york,times,serif;font-si=
ze:16px"><div style=3D"font-family:HelveticaNeue,Helvetica Neue,Helvetica,A=
rial,Lucida Grande,sans-serif;font-size:16px"><div><div>-- <br clear=3D"non=
e">_______________________________________________<br clear=3D"none">meta-t=
i mailing list<br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" href=3D=
"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@yoctoproject.or=
g</a><br clear=3D"none"><a rel=3D"nofollow" shape=3D"rect" href=3D"https://=
lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blank">https://lists.yo=
ctoproject.org/listinfo/meta-ti</a><br clear=3D"none"></div><br clear=3D"no=
ne"><br clear=3D"none"></div></div></div></div></div></div></blockquote></d=
iv></div></div></div><br clear=3D"none"><br clear=3D"none"></div></div>  </=
div> </div>  </div></div></div></blockquote></div></div></div>

--94eb2c09336218bf600534a3bca4--
