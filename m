Return-Path: <flavio.alves@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BA8FE00348
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 13:25:33 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id k11so13017704iea.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 13:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RN7AUQLTx6HUTQgCtrO4pOvBukXK2L2cruM01piCRF4=;
	b=x8jvFfqNqIfJy2Qp//9qd/g4eAfohYLs+Pl8OnevQdOMCqKTH9pT01BIyey1IAwc3L
	a41GXbNKaKhyZx950hIpk0/IH45aKHsrBCQEn/rBBjuzfrxc/As/AwbbAaBy3z/bbJkn
	LxYaJXs5zsS/IV6Lb3gzbmNac0p9fM7z2pJk+u19x7ifHhOZhT5CeSN2PJXwiYy3Hnvy
	PnEzFD3WSKLm9AVxw7CXnqFYLsRCJNNW6kj8QSrCPgrQyM7eV3tskfTX9Il0w+B1h5Pa
	Xi1X5BChs9XsR7GQwDDNbEG1Rc/+2U8o7edrt6jjCyKkkFxb23KwMz4A9Yaox/QsSXj6
	vOuA==
MIME-Version: 1.0
Received: by 10.50.85.130 with SMTP id h2mr2154122igz.26.1352841932810; Tue,
	13 Nov 2012 13:25:32 -0800 (PST)
Received: by 10.42.24.212 with HTTP; Tue, 13 Nov 2012 13:25:32 -0800 (PST)
In-Reply-To: <20121113154444.GB12650@edge>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
	<20121113154444.GB12650@edge>
Date: Tue, 13 Nov 2012 19:25:32 -0200
Message-ID: <CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Tue, 13 Nov 2012 21:25:33 -0000
Content-Type: multipart/alternative; boundary=e89a8f3bafe3d7a8ed04ce670ef9

--e89a8f3bafe3d7a8ed04ce670ef9
Content-Type: text/plain; charset=ISO-8859-1

2012/11/13 Denys Dmytriyenko <denys@ti.com>

> On Tue, Nov 13, 2012 at 10:43:05AM -0500, Robert P. J. Day wrote:
> > On Tue, 13 Nov 2012, Tomas Frydrych wrote:
> >
> > > On 13/11/12 15:22, Denys Dmytriyenko wrote:
> > > >> For Denzil it is not possible to arrange meta-yocto and meta-ti
> layers
> > > >> in a way that would work; this has been fixed in Danny (in
> > > >> meta-yocto-bsp). If you want to stick with Denzil, there are
> different
> > > >> ways to work around it, easiest should be to delete the offending
> > > >> beagleboard.conf from meta-yocto.
> > > >
> > > > Why can't you put meta-ti in front of meta-yocto in Denzil? Works
> just fine.
>

I did that here and it doens't work.


> > >
> > > Because meta-yocto layer.conf does:
> > >
> > >   BBPATH := "${LAYERDIR}:${BBPATH}"
> > >
> > > While meta-ti layer.conf does:
> > >
> > >   BBPATH .= ":${LAYERDIR}"
> > >
> > > So regardless how you order it, you get BBPATH that looks like:
> > >
> > >   meta-yocto:meta:meta-ti
> > >
> > > Which guarantees you the beagleboard.conf from meta-yocto.
> >
> >   once upon a time, i pointed out on the yocto list the inconsistency
> > of how different layer.conf files set BBPATH:
>
> Yes, it was fixed already.
>
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>



-- 
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

--e89a8f3bafe3d7a8ed04ce670ef9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2012/11/1=
3 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" t=
arget=3D"_blank">denys@ti.com</a>&gt;</span><br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<div class=3D"im">On Tue, Nov 13, 2012 at 10:43:05AM -0500, Robert P. J. Da=
y wrote:<br>
&gt; On Tue, 13 Nov 2012, Tomas Frydrych wrote:<br>
&gt;<br>
&gt; &gt; On 13/11/12 15:22, Denys Dmytriyenko wrote:<br>
&gt; &gt; &gt;&gt; For Denzil it is not possible to arrange meta-yocto and =
meta-ti layers<br>
&gt; &gt; &gt;&gt; in a way that would work; this has been fixed in Danny (=
in<br>
&gt; &gt; &gt;&gt; meta-yocto-bsp). If you want to stick with Denzil, there=
 are different<br>
&gt; &gt; &gt;&gt; ways to work around it, easiest should be to delete the =
offending<br>
&gt; &gt; &gt;&gt; beagleboard.conf from meta-yocto.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Why can&#39;t you put meta-ti in front of meta-yocto in Denz=
il? Works just fine.<br></div></blockquote><div><br>I did that here and it =
doens&#39;t work.<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
&gt; &gt;<br>
&gt; &gt; Because meta-yocto layer.conf does:<br>
&gt; &gt;<br>
&gt; &gt; =A0 BBPATH :=3D &quot;${LAYERDIR}:${BBPATH}&quot;<br>
&gt; &gt;<br>
&gt; &gt; While meta-ti layer.conf does:<br>
&gt; &gt;<br>
&gt; &gt; =A0 BBPATH .=3D &quot;:${LAYERDIR}&quot;<br>
&gt; &gt;<br>
&gt; &gt; So regardless how you order it, you get BBPATH that looks like:<b=
r>
&gt; &gt;<br>
&gt; &gt; =A0 meta-yocto:meta:meta-ti<br>
&gt; &gt;<br>
&gt; &gt; Which guarantees you the beagleboard.conf from meta-yocto.<br>
&gt;<br>
&gt; =A0 once upon a time, i pointed out on the yocto list the inconsistenc=
y<br>
&gt; of how different layer.conf files set BBPATH:<br>
<br>
</div>Yes, it was fixed already.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Flavio de C=
astro Alves Filho<br><br><a href=3D"mailto:flavio.alves@gmail.com" target=
=3D"_blank">flavio.alves@gmail.com</a><div><a href=3D"http://www.linuxembar=
cado.com" target=3D"_blank">www.linuxembarcado.com</a><br>
Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank">http=
://twitter.com/#!/fraviofii</a><br></div><div>LinkedIn profile: <a href=3D"=
http://www.linkedin.com/in/flaviocastroalves" target=3D"_blank">www.linkedi=
n.com/in/flaviocastroalves</a></div>
<br>
</div>

--e89a8f3bafe3d7a8ed04ce670ef9--
