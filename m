Return-Path: <munoz0raul@gmail.com>
Received: from mail-ia0-f171.google.com (mail-ia0-f171.google.com
	[209.85.210.171]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id CA905E01410;
	Thu, 14 Feb 2013 03:17:44 -0800 (PST)
Received: by mail-ia0-f171.google.com with SMTP id z13so2183306iaz.30
	for <multiple recipients>; Thu, 14 Feb 2013 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=/XNULcHen1hpcWPKzjWw3wQdBdF1tC52riyGRNCn7rk=;
	b=I7E4u+DbVtNrDt/4GCXpWcYo0FwaXSXBHqW8ZA7fLsVrBzzv6tN7k8uL/BLQGyACF7
	RzEOFpl49N91QclyZqibD3Tcoj1EyLrjJWTe+TWKHIl2VNXXQwdmUn9FI9jIa3/QGFE3
	/uYSJGKsS4XAvGLI2wy35dv5EY++X2mIr2Z60lq/Sk7KUX/7dZzmcHyVlnRWDIHMzB3S
	exYzVR3Cf8vKW6GuS4eVvhxTjMEgLPnV23iwad3lQPdUTcwCyRYHU22pfwHCOEqqbc5R
	TNZe0oXfMbrQ39qp0egI4x7lsxV90F3WZ0BUffm4kiXi/2qrW0vSXQdBZIi4bxIdkFIf
	/+yA==
MIME-Version: 1.0
X-Received: by 10.50.207.67 with SMTP id lu3mr17324244igc.12.1360840663917;
	Thu, 14 Feb 2013 03:17:43 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Thu, 14 Feb 2013 03:17:43 -0800 (PST)
In-Reply-To: <20130212191553.GA1858@denix.org>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
Date: Thu, 14 Feb 2013 09:17:43 -0200
Message-ID: <CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Feb 2013 11:17:45 -0000
Content-Type: multipart/alternative; boundary=14dae9340b655e64cb04d5ad6848

--14dae9340b655e64cb04d5ad6848
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Yes I install this package,
But I think that the problem is that the binary firmware at "/lib/udev"
doesn't come with the build.

Some one know how to build the binary firmware at "/lib/udev" responsible
to record the firmware in wifi dongle and enable the udev rules for this
action.

Thanks for all Help


2013/2/12 Denys Dmytriyenko <denys@ti.com>

> On Thu, Feb 07, 2013 at 06:26:46PM -0200, Raul Rosetto Munoz wrote:
> > Hello All,
> > I need to configure my yocto project to work with wifi dongle realteck
> > rtl8192cu.
> >
> > My first problem is that the module does not go up automatically
> rtl8192cu
> > different than Angstron distro that when I plug the dongle all modules
> rise.
> >
> > Another important difference is that on Angstron distro I have on
> /lib/udev
> > the "firmware" binary file.  I really was not able to install this
> > functionality in udev.
>
> Have you looked at linux-firmware package? rtl8192* should be well
> supported.
>
>
> > And How to make this firmware binary go to /lib/udev?
>
> By default, firmware files go into /lib/firmware
>
> --
> Denys
>



--=20
*Raul Rosetto Mu=F1oz*

--14dae9340b655e64cb04d5ad6848
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes I install this package,</div><div>But I think tha=
t the problem is that the binary firmware at &quot;/lib/udev&quot; doesn&#3=
9;t come with the build.</div><div><br></div><div>Some one know how to buil=
d the binary firmware at &quot;/lib/udev&quot; responsible to record the fi=
rmware in wifi dongle and enable the udev rules for this action.</div>
<div><br></div><div>Thanks for all Help</div></div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">2013/2/12 Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com=
</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, Feb 07, 2013 at 06=
:26:46PM -0200, Raul Rosetto Munoz wrote:<br>
&gt; Hello All,<br>
&gt; I need to configure my yocto project to work with wifi dongle realteck=
<br>
&gt; rtl8192cu.<br>
&gt;<br>
</div><div class=3D"im">&gt; My first problem is that the module does not g=
o up automatically rtl8192cu<br>
&gt; different than Angstron distro that when I plug the dongle all modules=
 rise.<br>
&gt;<br>
&gt; Another important difference is that on Angstron distro I have on /lib=
/udev<br>
&gt; the &quot;firmware&quot; binary file. =A0I really was not able to inst=
all this<br>
&gt; functionality in udev.<br>
<br>
</div>Have you looked at linux-firmware package? rtl8192* should be well su=
pported.<br>
<div class=3D"im"><br>
<br>
&gt; And How to make this firmware binary go to /lib/udev?<br>
<br>
</div>By default, firmware files go into /lib/firmware<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><b>Raul Rosetto Mu=F1oz</b>
</div>

--14dae9340b655e64cb04d5ad6848--
