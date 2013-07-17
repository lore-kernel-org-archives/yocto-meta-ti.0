Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70A64E01525
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2013 06:07:49 -0700 (PDT)
Received: by mail-ob0-f177.google.com with SMTP id ta17so2215152obb.8
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2013 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n6TBIGo8a9BIkjadW8rSDwrk0B3xLJIEkJroK1iRsSo=;
	b=hHg3bmJj587++Mt5V5lyhytOEB9qRHRd7b3tSlwRjVP3oQrifddgM9GNSLD188Iq3q
	hhWMKh/Uhobfk5W1XqQrWkYovdBLj6pe2reBIRrfmKcDgn6zgjSicnQmIsShCMzSfF7R
	z/gNdHhg3W+2rhtnjLLvudJBq7IJMPEcnKjdggZhYmPWsNlQSbNCyOBdjwSWbFNCy0zf
	95Oj1clEVUP3B2umBznwRug8IY6/pKluNx/gnFsh7w+c3eRSL+YR9bT6k7uY1hd4xK69
	Y/sjBmdaqH8UtOGoPE2rQvvxHpiH+fJgcA+CYpBEE9HtmppObFVBraEagzg8iPjbEqGn
	ykQQ==
MIME-Version: 1.0
X-Received: by 10.60.131.171 with SMTP id on11mr8019213oeb.71.1374066469396;
	Wed, 17 Jul 2013 06:07:49 -0700 (PDT)
Received: by 10.60.26.225 with HTTP; Wed, 17 Jul 2013 06:07:49 -0700 (PDT)
In-Reply-To: <20130710164618.GD16407@edge>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
Date: Wed, 17 Jul 2013 09:07:49 -0400
Message-ID: <CAFZh4h-W=557rBxsehQhzpgJuxk+Z5BmKeboNk2eAGnBt8vBUQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Wed, 17 Jul 2013 13:07:52 -0000
Content-Type: multipart/alternative; boundary=047d7b471da4ce673404e1b4c700

--047d7b471da4ce673404e1b4c700
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
>
> DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are just
> derivatives of OMAP-L138.
>
> Anyway, DM6446 is no longer supported, as it's a very old platform.
>
>
> > I've always used Arago or Angstrom for DM6446 support in the past and so
> > I'm not sure which .conf I should be using with meta-ti.  My gut says use
> > am1808-evm.conf but I thought I should ask to be sure.
>
> --
> Denys
>

So how hard is it to get ti816x machine support moved up into Dylan (or
master)?  I've always had machine support for the branches I used in the
past ... now I find myself needing Dylan or even master and there is no
ti816x support there.

Is it not there just because nobody had hardware to test it?  If so, I'm
game to add it with some guidance :)

Regards,

Brian

--047d7b471da4ce673404e1b4c700
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span=
> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
<br>
</div>DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are j=
ust<br>
derivatives of OMAP-L138.<br>
<br>
Anyway, DM6446 is no longer supported, as it&#39;s a very old platform.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; I&#39;ve always used Arago or Angstrom for DM6446 support in the past =
and so<br>
&gt; I&#39;m not sure which .conf I should be using with meta-ti. =A0My gut=
 says use<br>
&gt; am1808-evm.conf but I thought I should ask to be sure.<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Denys<br></font></span></blockquote><div><br></div><div>So how hard is it t=
o get ti816x machine support moved up into Dylan (or master)? =A0I&#39;ve a=
lways had machine support for the branches I used in the past ... now I fin=
d myself needing Dylan or even master and there is no ti816x support there.=
</div>
<div><br></div><div>Is it not there just because nobody had hardware to tes=
t it? =A0If so, I&#39;m game to add it with some guidance :)</div><div><br>=
</div><div>Regards,</div><div><br></div><div>Brian</div><div>=A0</div></div=
>
<br>

--047d7b471da4ce673404e1b4c700--
