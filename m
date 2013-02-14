Return-Path: <munoz0raul@gmail.com>
Received: from mail-ia0-f174.google.com (mail-ia0-f174.google.com
	[209.85.210.174]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 523B3E00515;
	Thu, 14 Feb 2013 08:32:47 -0800 (PST)
Received: by mail-ia0-f174.google.com with SMTP id o25so2398329iad.5
	for <multiple recipients>; Thu, 14 Feb 2013 08:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=GwIEgx0zvkdjkxYYC1M22tZCQDjCL3TWKwwHlTJgB5A=;
	b=QERGzhTA9taDs+yIbFqwKMY7TKgHYW02PowIaMhhm68PEf8EIXPihPsGfW8M9cqOCw
	k6XJ899R7GpsaGQTwF4VfhN7kOW16SAELbFG5oraZM9X7xeGurYnM31EF3pyGsnnZ6t0
	6xMWtg/6J1IBqCaceXPgO4fxHPF4FkxGXXL1KMEWGNIyVwOZctmt1oldBlMEHnj+yGzT
	PZeWjeKOa7zO1FFb73d/55hngKdFse+LFx+GgG3mjxMzKzDFvKVlJteDfFIQSKH+bdWz
	vP+ZSNKmCExT9Wp4/9Njz21iSf/UEJR77f/Jebu1MkcsCphN9pJyHzc35ChYoAvJV4ZK
	R46g==
MIME-Version: 1.0
X-Received: by 10.50.207.67 with SMTP id lu3mr209854igc.12.1360859566753; Thu,
	14 Feb 2013 08:32:46 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Thu, 14 Feb 2013 08:32:46 -0800 (PST)
In-Reply-To: <20130214162854.GF2539@edge>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
	<20130214160030.GD2539@edge>
	<CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
	<20130214162854.GF2539@edge>
Date: Thu, 14 Feb 2013 14:32:46 -0200
Message-ID: <CANmVirhviFJ8c8RKTLwgmvuwHp4KWkWt3+2dZozE+iemUSztQw@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Thu, 14 Feb 2013 16:32:47 -0000
Content-Type: multipart/alternative; boundary=14dae9340b6510c63c04d5b1cf15

--14dae9340b6510c63c04d5b1cf15
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Now Im with 173 from meta-fsl bbapend, but I tryed with many others from
meta-oe and poky.






2013/2/14 Denys Dmytriyenko <denys@ti.com>

> On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz wrote:
> > Denys,
> > There are something strange,
> >
> > First there are no  linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}
> > installed at rfs.
>
> I was talking about packages, looks like you have them already installed.
>
>
> > raul@phi04:.../tmp/deploy/images$ find
> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name "*8192*=
"
> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E
> >
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192s=
efw.bin
> >
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192d=
efw.bin
> >
> > Another problem is that "/lib/udev/firmware" are not installed to.
> >
> > raul@phi04:.../tmp/deploy/images$ find
> > /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name "*firmware*=
"
> > raul@phi04:.../tmp/deploy/images$
>
> What is your udev version?
>
>
> > But I can see theses files at my "tmp/sysroots/beaglebone"
> >
> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name
> "*8192*"
> > lib/firmware/RTL8192E
> > lib/firmware/rtlwifi/rtl8192sefw.bin
> > lib/firmware/rtlwifi/rtl8192defw.bin
> > lib/firmware/rtlwifi/rtl8192cfw.bin
> > lib/firmware/rtlwifi/rtl8192cufw.bin
> >
> > raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name
> "*firmware*"
> > lib/udev/firmware
> > lib/udev/rules.d/50-firmware.rules
> >
> > I tryed copy this files for the sdcard but doesnt work.
> >
> > Do you have any suggest?
> >
> > Thanks for all help.
>



--=20
*Raul Rosetto Mu=F1oz*

--14dae9340b6510c63c04d5b1cf15
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now Im with 173 from meta-fsl bbapend, but I tryed with ma=
ny others from meta-oe and poky.<div><br></div><div><br><div><br></div><div=
><br></div></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gma=
il_quote">
2013/2/14 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@t=
i.com" target=3D"_blank">denys@ti.com</a>&gt;</span><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Mu=
noz wrote:<br>
&gt; Denys,<br>
&gt; There are something strange,<br>
&gt;<br>
&gt; First there are no =A0linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}<b=
r>
&gt; installed at rfs.<br>
<br>
</div>I was talking about packages, looks like you have them already instal=
led.<br>
<div class=3D"im"><br>
<br>
&gt; raul@phi04:.../tmp/deploy/images$ find<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name &quot;=
*8192*&quot;<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl81=
92sefw.bin<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl81=
92defw.bin<br>
&gt;<br>
&gt; Another problem is that &quot;/lib/udev/firmware&quot; are not install=
ed to.<br>
&gt;<br>
&gt; raul@phi04:.../tmp/deploy/images$ find<br>
&gt; /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name &quot;*fir=
mware*&quot;<br>
&gt; raul@phi04:.../tmp/deploy/images$<br>
<br>
</div>What is your udev version?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; But I can see theses files at my &quot;tmp/sysroots/beaglebone&quot;<b=
r>
&gt;<br>
&gt; raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name &quot=
;*8192*&quot;<br>
&gt; lib/firmware/RTL8192E<br>
&gt; lib/firmware/rtlwifi/rtl8192sefw.bin<br>
&gt; lib/firmware/rtlwifi/rtl8192defw.bin<br>
&gt; lib/firmware/rtlwifi/rtl8192cfw.bin<br>
&gt; lib/firmware/rtlwifi/rtl8192cufw.bin<br>
&gt;<br>
&gt; raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name &quot;*fi=
rmware*&quot;<br>
&gt; lib/udev/firmware<br>
&gt; lib/udev/rules.d/50-firmware.rules<br>
&gt;<br>
&gt; I tryed copy this files for the sdcard but doesnt work.<br>
&gt;<br>
&gt; Do you have any suggest?<br>
&gt;<br>
&gt; Thanks for all help.<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<b>Raul Rosetto Mu=F1oz</b>
</div>

--14dae9340b6510c63c04d5b1cf15--
