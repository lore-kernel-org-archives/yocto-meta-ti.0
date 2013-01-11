Return-Path: <munoz0raul@gmail.com>
Received: from mail-ia0-f179.google.com (mail-ia0-f179.google.com
	[209.85.210.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD9E8E00720
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 16:58:49 -0800 (PST)
Received: by mail-ia0-f179.google.com with SMTP id i9so807642iad.24
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 16:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=mWdlI9aIPgDR6eVVr1F+jftlHe6PjO+YJxy/pvsr1wM=;
	b=naNQsqNm4XwpxL8Gh+2SEGFF1K7cSKVUfj9KGuQGUgjTbn6BbwfvDRLRAdFehRib1D
	ycqR3lFGCytBB8GFwAGMMKeZ10iOg6pT4w8X8pzrGis45z3giO2H/Idx9r7e0Ioa3qhF
	27Y4/dSJoAUY6UBx7PYPkjJeUcaKMY3xq3S7vIT3P5fDMyVA6jqv6WgsRhsfwfjOXicC
	pvnnUB++VtP5NNUI4yaWeemB/X8xuxca/pR9wh4eBxLzo6dVvqC+0KtHiaIgoDBAdFnl
	xM+mFJbzpggDQDuuQOQsVWi90T4hDkpNia08NuYMl6XTUdX/e2O3Mzb3JzWW+U5TbiEJ
	7T7Q==
MIME-Version: 1.0
X-Received: by 10.50.106.199 with SMTP id gw7mr7412268igb.26.1357865929400;
	Thu, 10 Jan 2013 16:58:49 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Thu, 10 Jan 2013 16:58:49 -0800 (PST)
In-Reply-To: <CAFNBftd=+st+VnYjP+Mg7CzHh5SHv7XYc3g0mi9pq5kpBKWEkQ@mail.gmail.com>
References: <CANmVirii6vJvYyAR-a6wOHjFwoSnpqk5vSipnkXQSU6rZPVmKA@mail.gmail.com>
	<CAOT3miLOCbazfMvaW8E2mV3o+uJwJYoU5GZ2PCRQXQ43qSwe6Q@mail.gmail.com>
	<alpine.DEB.2.02.1301090604340.4410@oneiric>
	<CAFNBftd=+st+VnYjP+Mg7CzHh5SHv7XYc3g0mi9pq5kpBKWEkQ@mail.gmail.com>
Date: Thu, 10 Jan 2013 22:58:49 -0200
Message-ID: <CANmVirgtDj6p65Aj5DQgYNrsEEX8hOcDzQjDUKWAbj-fSiyOtw@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: Flavio Castro Alves Filho <flavio.alves@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Creating simple linux for beaglebone
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
X-List-Received-Date: Fri, 11 Jan 2013 00:58:49 -0000
Content-Type: multipart/alternative; boundary=e89a8f234d6d5fe22f04d2f8cccf

--e89a8f234d6d5fe22f04d2f8cccf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks all for the help

I realy forgot the line that Nicolas told us.

BBMASK =3D "meta-ti/recipes-misc"

Thanks


2013/1/9 Flavio Castro Alves Filho <flavio.alves@gmail.com>

> I would suggest to exchange:
>
> /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
>
> to
>
> /home/prjs/video0001/linux/openembedded-core  \
>
> Where you get this layer by doing:
>
> git clone git://git.openembedded.org/openembedded-core -b danny
>
> Best regards,
>
> Flavio
>
> 2013/1/9 Robert P. J. Day <rpjday@crashcourse.ca>:
> > On Wed, 9 Jan 2013, Nicolas Dechesne wrote:
> >
> >> On Wed, Jan 9, 2013 at 2:38 AM, Raul Rosetto Munoz <
> munoz0raul@gmail.com> wrote:
> >> > Hello all,
> >> >
> >> > I want to create a simples linux for beaglebone using yocto danny.
> >> >
> >> > I did all the necessary clones:
> >> > poky
> >> > meta-ti
> >> > meta-openembedded
> >> >
> >> > I changed all to danny branch!
> >> >
> >> > After these sets I did the poky source:
> >> > source poky/oe-init-build-env beaglebone-linux
> >> >
> >> > Changed the machine to beaglebone
> >> >
> >> > MACHINE ?=3D "beaglebone"
> >> >
> >> > Changed the bblayer to:
> >> >
> >> > BBLAYERS ?=3D " \
> >> >   /home/prjs/video0001/linux/poky/meta \
> >> >   /home/prjs/video0001/linux/poky/meta-yocto \
> >> >   /home/prjs/video0001/linux/poky/meta-yocto-bsp \
> >> >   /home/prjs/video0001/linux/meta-ti \
> >> >   /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
> >> >   "
> >
> >   did you really need to check out all those layers?  as i read it,
> > the meta-ti layer has no dependencies on anything but basic OE --
> > that's all i used for creating images for my pandaboard.
> >
> >   am i misreading something?
> >
> > rday
> >
> > --
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Robert P. J. Day                                 Ottawa, Ontario, CANAD=
A
> >                         http://crashcourse.ca
> >
> > Twitter:                                       http://twitter.com/rpjda=
y
> > LinkedIn:                               http://ca.linkedin.com/in/rpjda=
y
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>
>
> --
> Flavio de Castro Alves Filho
>
> flavio.alves@gmail.com
> www.linuxembarcado.com
> Twitter: http://twitter.com/#!/fraviofii
> LinkedIn profile: www.linkedin.com/in/flaviocastroalves
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>



--=20
*Raul Rosetto Mu=F1oz*

--e89a8f234d6d5fe22f04d2f8cccf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks all for the help</div><div><br></div><div>I re=
aly forgot the line that Nicolas told us.</div><div><br></div><div>BBMASK =
=3D &quot;meta-ti/recipes-misc&quot;</div><div><br></div><div>Thanks</div><=
/div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/1/9 Flav=
io Castro Alves Filho <span dir=3D"ltr">&lt;<a href=3D"mailto:flavio.alves@=
gmail.com" target=3D"_blank">flavio.alves@gmail.com</a>&gt;</span><br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
I would suggest to exchange:<br>
<br>
/home/prjs/video0001/linux/meta-openembedded/meta-oe =A0\<br>
<br>
to<br>
<br>
/home/prjs/video0001/linux/openembedded-core =A0\<br>
<br>
Where you get this layer by doing:<br>
<br>
git clone git://<a href=3D"http://git.openembedded.org/openembedded-core" t=
arget=3D"_blank">git.openembedded.org/openembedded-core</a> -b danny<br>
<br>
Best regards,<br>
<br>
Flavio<br>
<br>
2013/1/9 Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjd=
ay@crashcourse.ca</a>&gt;:<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt; On Wed, 9 Jan 2013, Nicolas De=
chesne wrote:<br>
&gt;<br>
&gt;&gt; On Wed, Jan 9, 2013 at 2:38 AM, Raul Rosetto Munoz &lt;<a href=3D"=
mailto:munoz0raul@gmail.com">munoz0raul@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hello all,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I want to create a simples linux for beaglebone using yocto d=
anny.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I did all the necessary clones:<br>
&gt;&gt; &gt; poky<br>
&gt;&gt; &gt; meta-ti<br>
&gt;&gt; &gt; meta-openembedded<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I changed all to danny branch!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; After these sets I did the poky source:<br>
&gt;&gt; &gt; source poky/oe-init-build-env beaglebone-linux<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Changed the machine to beaglebone<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; MACHINE ?=3D &quot;beaglebone&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Changed the bblayer to:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; BBLAYERS ?=3D &quot; \<br>
&gt;&gt; &gt; =A0 /home/prjs/video0001/linux/poky/meta \<br>
&gt;&gt; &gt; =A0 /home/prjs/video0001/linux/poky/meta-yocto \<br>
&gt;&gt; &gt; =A0 /home/prjs/video0001/linux/poky/meta-yocto-bsp \<br>
&gt;&gt; &gt; =A0 /home/prjs/video0001/linux/meta-ti \<br>
&gt;&gt; &gt; =A0 /home/prjs/video0001/linux/meta-openembedded/meta-oe =A0\=
<br>
&gt;&gt; &gt; =A0 &quot;<br>
&gt;<br>
&gt; =A0 did you really need to check out all those layers? =A0as i read it=
,<br>
&gt; the meta-ti layer has no dependencies on anything but basic OE --<br>
&gt; that&#39;s all i used for creating images for my pandaboard.<br>
&gt;<br>
&gt; =A0 am i misreading something?<br>
&gt;<br>
&gt; rday<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 Ottawa, Ontario, CANADA<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a href=3D"http://cras=
hcourse.ca" target=3D"_blank">http://crashcourse.ca</a><br>
&gt;<br>
&gt; Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday" target=3D"_blank">htt=
p://twitter.com/rpjday</a><br>
&gt; LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
<a href=3D"http://ca.linkedin.com/in/rpjday" target=3D"_blank">http://ca.li=
nkedin.com/in/rpjday</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
</div></div><div class=3D"im HOEnZb">&gt; _________________________________=
______________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br>
<br>
<br>
</div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Flavio de Castro Alves Filho<br>
<br>
<a href=3D"mailto:flavio.alves@gmail.com">flavio.alves@gmail.com</a><br>
<a href=3D"http://www.linuxembarcado.com" target=3D"_blank">www.linuxembarc=
ado.com</a><br>
Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank">http=
://twitter.com/#!/fraviofii</a><br>
LinkedIn profile: <a href=3D"http://www.linkedin.com/in/flaviocastroalves" =
target=3D"_blank">www.linkedin.com/in/flaviocastroalves</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<b>Raul Rosetto Mu=F1oz</b>
</div>

--e89a8f234d6d5fe22f04d2f8cccf--
