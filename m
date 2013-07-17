Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 953B8E0152B
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2013 06:25:38 -0700 (PDT)
Received: by mail-oa0-f45.google.com with SMTP id j1so2480482oag.4
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2013 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VVSPFYHmatH/Yc2w5thAxA+yf/ZRkLP0+LBvtdtI7qM=;
	b=kOw18EY5HNScLitWK6paNmr1pod2q50HtSwniVx4wYLO8I8POeSXCGj4RJQD826wbe
	96G3qn27talVdQ9gt82+LvUwjm8yCUVsyTdkppd51u1zrCoAVbohoDxR0eSoCa3Lzkw9
	TR6s1os5v21SGiYrBfqyH+DjgEvXgo0Sj/z3SaebI3AghC5FjppZoR9q0eguY2dfZZrt
	vOi6sWXt0yG3/TFfMvmMiw0SQlHF1z6pp4H1ARm5eoqkLrwkCldRa3SLuWe8s7Dyqpd/
	pu8NocAi/OEZ2hbPolPqabzaftS7ieXCQE88IXvIonaaQj0Nx4PfEkW48EBtd73KtlAm
	h/qw==
MIME-Version: 1.0
X-Received: by 10.60.155.135 with SMTP id vw7mr8205506oeb.67.1374067537344;
	Wed, 17 Jul 2013 06:25:37 -0700 (PDT)
Received: by 10.60.26.225 with HTTP; Wed, 17 Jul 2013 06:25:37 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015965BBDC@DLEE11.ent.ti.com>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
	<CAFZh4h-W=557rBxsehQhzpgJuxk+Z5BmKeboNk2eAGnBt8vBUQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015965BBDC@DLEE11.ent.ti.com>
Date: Wed, 17 Jul 2013 09:25:37 -0400
Message-ID: <CAFZh4h-eQBem7qVQnE_=Hf_bccvONrFA174Xr3AdpGw7-5dawQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Which machine type to use for DaVinci DM6446 and TI816x?
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
X-List-Received-Date: Wed, 17 Jul 2013 13:25:38 -0000
Content-Type: multipart/alternative; boundary=047d7bd7672075ffab04e1b507e3

--047d7bd7672075ffab04e1b507e3
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 17, 2013 at 9:14 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

>  ** **
>
> *From:* meta-ti-bounces@yoctoproject.org [mailto:
> meta-ti-bounces@yoctoproject.org] *On Behalf Of *Brian Hutchinson
> *Sent:* Wednesday, July 17, 2013 8:08 AM
> *To:* Dmytriyenko, Denys
> *Cc:* meta-ti@yoctoproject.org
> *Subject:* Re: [meta-ti] Which machine type to use for DaVinci DM6446 and
> TI816x?****
>
> ** **
>
> On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:*
> ***
>
>  ** **
>
> DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are just
> derivatives of OMAP-L138.
>
> Anyway, DM6446 is no longer supported, as it's a very old platform.****
>
>
>
> > I've always used Arago or Angstrom for DM6446 support in the past and so
> > I'm not sure which .conf I should be using with meta-ti.  My gut says use
> > am1808-evm.conf but I thought I should ask to be sure.****
>
> --
> Denys****
>
>  ** **
>
> So how hard is it to get ti816x machine support moved up into Dylan (or
> master)?  I've always had machine support for the branches I used in the
> past ... now I find myself needing Dylan or even master and there is no
> ti816x support there.****
>
> ** **
>
> Is it not there just because nobody had hardware to test it?  If so, I'm
> game to add it with some guidance :)****
>
> ** **
>
> [CEM] Generally not too hard.  You can often start with the old arago
> machine and move that in with some cleanup.  Then you will need to
> move/create the bootloader and kernel recipes as well, again looking for
> cleanup.  That should give you a basic working system.  The main issue is
> that someone needs to be signed up to keep those recipes working and up to
> date.  That is what is missing in most cases is a maitainer.****
>
> ** **
>
> Even better, for you use I would recommend looking at commit c586bd9a66
> which is the one that removed these configs and then add back the pieces
> you need.****
>
> ** **
>
>
> Thanks Chase,  I kind of figured it was a (people) bandwidth problem.  At
the moment I'm using a custom board based on the ti816x so I don't need
kernel or u-boot (already have those working for the board and since the
kernel for this platform was never mainlined, it doesn't have much churn)
but simply need packages built using all the Cortex-A8 flags.  I guess I
could be lazy and just build for Beagleboard or something since the ABI's
would be the same but I thought I would ask how to go about it the right
way.  Also, there have been several revs of silicon for that part and I'm
about to acquire the most up-to-date EVM so I could add machine support for
that.

I'll check out that commit you mentioned and start coming up to speed on
what is involved.

Regards,

Brian

--047d7bd7672075ffab04e1b507e3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2013 at 9:14 AM, Maupin, Chase <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:chase.maupin@ti.com" target=3D"_blank">chase.maupin@ti.com</a>&=
gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">






<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> <a href=
=3D"mailto:meta-ti-bounces@yoctoproject.org" target=3D"_blank">meta-ti-boun=
ces@yoctoproject.org</a> [mailto:<a href=3D"mailto:meta-ti-bounces@yoctopro=
ject.org" target=3D"_blank">meta-ti-bounces@yoctoproject.org</a>]
<b>On Behalf Of </b>Brian Hutchinson<br>
<b>Sent:</b> Wednesday, July 17, 2013 8:08 AM<br>
<b>To:</b> Dmytriyenko, Denys<br>
<b>Cc:</b> <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">me=
ta-ti@yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-ti] Which machine type to use for DaVinci DM6446 =
and TI816x?<u></u><u></u></span></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko =
&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; =
wrote:<u></u><u></u></p>
</div></div><div><div><div class=3D"h5">
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><u></u>=A0<u></u></p>
</div>
<p class=3D"MsoNormal">DM6446 is quite different from OMAP-L138. Both AM180=
x and DA850 are just<br>
derivatives of OMAP-L138.<br>
<br>
Anyway, DM6446 is no longer supported, as it&#39;s a very old platform.<u><=
/u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
<br>
&gt; I&#39;ve always used Arago or Angstrom for DM6446 support in the past =
and so<br>
&gt; I&#39;m not sure which .conf I should be using with meta-ti. =A0My gut=
 says use<br>
&gt; am1808-evm.conf but I thought I should ask to be sure.<u></u><u></u></=
p>
</div>
</div>
<p class=3D"MsoNormal"><span><span style=3D"color:#888888">--</span></span>=
<span style=3D"color:#888888"><br>
<span>Denys</span></span><u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">So how hard is it to get ti816x machine support move=
d up into Dylan (or master)? =A0I&#39;ve always had machine support for the=
 branches I used in the past ... now I find myself needing Dylan or even ma=
ster and there is no ti816x support there.<u></u><u></u></p>

</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
</div></div><div><div><div class=3D"h5">
<p class=3D"MsoNormal">Is it not there just because nobody had hardware to =
test it? =A0If so, I&#39;m game to add it with some guidance :)<u></u><u></=
u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
</div></div><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">[CEM] General=
ly not too hard.=A0 You can often start with the old arago machine and move=
 that in with some cleanup.=A0 Then you will need to move/create the bootlo=
ader
 and kernel recipes as well, again looking for cleanup.=A0 That should give=
 you a basic working system.=A0 The main issue is that someone needs to be =
signed up to keep those recipes working and up to date.=A0 That is what is =
missing in most cases is a maitainer.<u></u><u></u></span></p>

<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Even better, for you use =
I would recommend looking at commit c586bd9a66 which is the one that remove=
d these configs and then add back the pieces you need.<u></u><u></u></span>=
</p>

<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><br></p></div></div></div></div></div></blockquote><=
div>Thanks Chase, =A0I kind of figured it was a (people) bandwidth problem.=
 =A0At the moment I&#39;m using a custom board based on the ti816x so I don=
&#39;t need kernel or u-boot (already have those working for the board and =
since the kernel for this platform was never mainlined, it doesn&#39;t have=
 much churn) but simply need packages built using all the Cortex-A8 flags. =
=A0I guess I could be lazy and just build for Beagleboard or something sinc=
e the ABI&#39;s would be the same but I thought I would ask how to go about=
 it the right way. =A0Also, there have been several revs of silicon for tha=
t part and I&#39;m about to acquire the most up-to-date EVM so I could add =
machine support for that.</div>
<div><br></div><div>I&#39;ll check out that commit you mentioned and start =
coming up to speed on what is involved.</div><div><br></div><div>Regards,</=
div><div><br></div><div>Brian</div><div><br></div></div>

--047d7bd7672075ffab04e1b507e3--
