Return-Path: <munoz0raul@gmail.com>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 6D80DE0070F;
	Wed, 27 Feb 2013 06:30:40 -0800 (PST)
Received: by mail-bk0-f49.google.com with SMTP id w11so297759bku.8
	for <multiple recipients>; Wed, 27 Feb 2013 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=6jqTVv+frjCdu9U5s28odPAI3IeVmOa1oYAL2nrWZ5k=;
	b=nNTSuPVfvwV05THrf6d2mROukM9yUi2YC4LTNppzwQsdJGtusaz3ibYwGn3uBbcHoS
	ouwYGnj1KKUuIq3EJ6rTzIv9AIrgTpazOnHVKtlV/hDiEZiPbLwr8g/6Gfz8qlhfACSc
	xEbjb2bYuorX3z5fxE+TWhJqj57QFcZXLZ92WfQM5Dp0ALzCv2c7VwRIFyFJ+VP8CnUh
	lTs0M+If/OP9SnuQgZY7KAxyb+a/JYwx11JnIUXVLo3eu8avdUmAPhlBkGQZmJulP0lb
	TUCGUcGAaIqpJo5H/KWkMOqsvORDLLfcMdtH0w5BjJ2kra9i7QlbrFukLPY4S2TBja1I
	Alhw==
MIME-Version: 1.0
X-Received: by 10.204.147.82 with SMTP id k18mr916718bkv.38.1361975438439;
	Wed, 27 Feb 2013 06:30:38 -0800 (PST)
Received: by 10.204.128.205 with HTTP; Wed, 27 Feb 2013 06:30:38 -0800 (PST)
In-Reply-To: <20130225202439.GD6725@denix.org>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
	<20130214160030.GD2539@edge>
	<CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
	<20130214162854.GF2539@edge>
	<CANmVirhviFJ8c8RKTLwgmvuwHp4KWkWt3+2dZozE+iemUSztQw@mail.gmail.com>
	<CANmViri6ZGaY1+_a06Zu+CXgJVNhfc8-5UQ23RFgC2fn-MNCiw@mail.gmail.com>
	<20130225202439.GD6725@denix.org>
Date: Wed, 27 Feb 2013 11:30:38 -0300
Message-ID: <CANmViri2OVZQEeQSE5XpWTGBavJgqK7XUh_1Ca023NPiOk5saA@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Wifi Module + udev configs
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
X-List-Received-Date: Wed, 27 Feb 2013 14:30:41 -0000
Content-Type: multipart/alternative; boundary=0015174c169433b9ca04d6b59e0f

--0015174c169433b9ca04d6b59e0f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Denys, Thanks for all Reply,

I understand that if I use udev at version 178 or more, I probable will get
a udev with solved firmware problems, however if I use this udev version I
will need to use a systemd packages.

Is possible you give some intructions how to put systemd and udev 178+ at
my build system?

There are another brach that this configuration work?

Thanks For all Help.



2013/2/25 Denys Dmytriyenko <denis@denix.org>

> On Mon, Feb 18, 2013 at 08:56:06AM -0300, Raul Rosetto Munoz wrote:
> > Any suggestions?
> >
> > I really do not know what to do, the file "/lib/udev/firmware" never
> appear.
>
> FYI, starting with 176, udev handles loading firmware images internally,
> hence
> dropping the /lib/udev/firmware binary. But there were some bugs related =
to
> that functionality, which got fixed in version 178...
>
> http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dblob;f=3DChangeLog;=
hb=3DHEAD
> http://upstream-tracker.org/changelogs/libudev/181/changelog.html
>
> As I said before, if you are using Danny branch, then you should stick to
> the
> proven udev-164 that is in oe-core, unless you really want to have
> systemd, in
> which case you look into meta-openembedded...
>
> --
> Denys
>
>
> > 2013/2/14 Raul Rosetto Munoz <munoz0raul@gmail.com>
> >
> > > Now Im with 173 from meta-fsl bbapend, but I tryed with many others
> from
> > > meta-oe and poky.
> > >
> > >
> > >
> > >
> > >
> > >
> > > 2013/2/14 Denys Dmytriyenko <denys@ti.com>
> > >
> > >> On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz wrote:
> > >> > Denys,
> > >> > There are something strange,
> > >> >
> > >> > First there are no  linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}
> > >> > installed at rfs.
> > >>
> > >> I was talking about packages, looks like you have them already
> installed.
> > >>
> > >>
> > >> > raul@phi04:.../tmp/deploy/images$ find
> > >> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name
> "*8192*"
> > >> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E
> > >> >
> > >>
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192s=
efw.bin
> > >> >
> > >>
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192d=
efw.bin
> > >> >
> > >> > Another problem is that "/lib/udev/firmware" are not installed to.
> > >> >
> > >> > raul@phi04:.../tmp/deploy/images$ find
> > >> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name
> "*firmware*"
> > >> > raul@phi04:.../tmp/deploy/images$
> > >>
> > >> What is your udev version?
> > >>
> > >>
> > >> > But I can see theses files at my "tmp/sysroots/beaglebone"
> > >> >
> > >> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name
> > >> "*8192*"
> > >> > lib/firmware/RTL8192E
> > >> > lib/firmware/rtlwifi/rtl8192sefw.bin
> > >> > lib/firmware/rtlwifi/rtl8192defw.bin
> > >> > lib/firmware/rtlwifi/rtl8192cfw.bin
> > >> > lib/firmware/rtlwifi/rtl8192cufw.bin
> > >> >
> > >> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name
> > >> "*firmware*"
> > >> > lib/udev/firmware
> > >> > lib/udev/rules.d/50-firmware.rules
> > >> >
> > >> > I tryed copy this files for the sdcard but doesnt work.
> > >> >
> > >> > Do you have any suggest?
> > >> >
> > >> > Thanks for all help.
> > >>
> > >
> > >
> > >
> > > --
> > > *Raul Rosetto Mu=F1oz*
> > >
> >
> >
> >
> > --
> > *Raul Rosetto Mu=F1oz*
>
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>


--=20
*Raul Rosetto Mu=F1oz*

--0015174c169433b9ca04d6b59e0f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Denys, Thanks for all Reply,</div><div><br></div=
><div>I understand that if I use udev at version 178 or more, I probable wi=
ll get a udev with solved firmware problems, however if I use this udev ver=
sion I will need to use a systemd packages.</div>
<div><br></div><div>Is possible you give some intructions how to put system=
d and udev 178+ at my build system?</div><div><br></div><div>There are anot=
her brach that this configuration work?</div><div><br></div><div>Thanks For=
 all Help.</div>
</div><div><br></div></div><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">2013/2/25 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"=
mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span><br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div class=3D"im">On Mon, Feb 18, 2013 at 08:56:06AM -0300, Raul Rosetto Mu=
noz wrote:<br>
&gt; Any suggestions?<br>
&gt;<br>
&gt; I really do not know what to do, the file &quot;/lib/udev/firmware&quo=
t; never appear.<br>
<br>
</div>FYI, starting with 176, udev handles loading firmware images internal=
ly, hence<br>
dropping the /lib/udev/firmware binary. But there were some bugs related to=
<br>
that functionality, which got fixed in version 178...<br>
<br>
<a href=3D"http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dblob;f=3DC=
hangeLog;hb=3DHEAD" target=3D"_blank">http://git.kernel.org/?p=3Dlinux/hotp=
lug/udev.git;a=3Dblob;f=3DChangeLog;hb=3DHEAD</a><br>
<a href=3D"http://upstream-tracker.org/changelogs/libudev/181/changelog.htm=
l" target=3D"_blank">http://upstream-tracker.org/changelogs/libudev/181/cha=
ngelog.html</a><br>
<br>
As I said before, if you are using Danny branch, then you should stick to t=
he<br>
proven udev-164 that is in oe-core, unless you really want to have systemd,=
 in<br>
which case you look into meta-openembedded...<br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
&gt; 2013/2/14 Raul Rosetto Munoz &lt;<a href=3D"mailto:munoz0raul@gmail.co=
m">munoz0raul@gmail.com</a>&gt;<br>
&gt;<br>
&gt; &gt; Now Im with 173 from meta-fsl bbapend, but I tryed with many othe=
rs from<br>
&gt; &gt; meta-oe and poky.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; 2013/2/14 Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz =
wrote:<br>
&gt; &gt;&gt; &gt; Denys,<br>
&gt; &gt;&gt; &gt; There are something strange,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; First there are no =A0linux-firmware-{rtl8192cu,rtl8192c=
e,rtl8192su}<br>
&gt; &gt;&gt; &gt; installed at rfs.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I was talking about packages, looks like you have them alread=
y installed.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; raul@phi04:.../tmp/deploy/images$ find<br>
&gt; &gt;&gt; &gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware=
/ -name &quot;*8192*&quot;<br>
&gt; &gt;&gt; &gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware=
/RTL8192E<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlw=
ifi/rtl8192sefw.bin<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlw=
ifi/rtl8192defw.bin<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Another problem is that &quot;/lib/udev/firmware&quot; a=
re not installed to.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; raul@phi04:.../tmp/deploy/images$ find<br>
&gt; &gt;&gt; &gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -n=
ame &quot;*firmware*&quot;<br>
&gt; &gt;&gt; &gt; raul@phi04:.../tmp/deploy/images$<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What is your udev version?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; But I can see theses files at my &quot;tmp/sysroots/beag=
lebone&quot;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmwar=
e/ -name<br>
&gt; &gt;&gt; &quot;*8192*&quot;<br>
&gt; &gt;&gt; &gt; lib/firmware/RTL8192E<br>
&gt; &gt;&gt; &gt; lib/firmware/rtlwifi/rtl8192sefw.bin<br>
&gt; &gt;&gt; &gt; lib/firmware/rtlwifi/rtl8192defw.bin<br>
&gt; &gt;&gt; &gt; lib/firmware/rtlwifi/rtl8192cfw.bin<br>
&gt; &gt;&gt; &gt; lib/firmware/rtlwifi/rtl8192cufw.bin<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -=
name<br>
&gt; &gt;&gt; &quot;*firmware*&quot;<br>
&gt; &gt;&gt; &gt; lib/udev/firmware<br>
&gt; &gt;&gt; &gt; lib/udev/rules.d/50-firmware.rules<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I tryed copy this files for the sdcard but doesnt work.<=
br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Do you have any suggest?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Thanks for all help.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
</div></div>&gt; &gt; *Raul Rosetto Mu=F1oz*<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; *Raul Rosetto Mu=F1oz*<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><b>Raul Rosetto Mu=F1oz</b>
</div>

--0015174c169433b9ca04d6b59e0f--
