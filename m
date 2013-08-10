Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E811CE0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 10:38:22 -0700 (PDT)
Received: by mail-oa0-f52.google.com with SMTP id n12so8049035oag.25
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0WrpHotea1+dTT7hHaT+CCYNYTZbBBQq4MRcEA2Tiac=;
	b=zRpiekWU2IZM4ZfLiaKjQEk3b1A3jzbPojoaSTieEDvYLSsQmx7j206MJJmP1MJjVu
	ndmA/SDPzgMtYDO6xl8aHOmyTOXUEtuWwmhSJxISvKRyXxUU8QPrd8M4POmCqL8zmKnC
	qp4Uh+pcmQ5ONG2HmjLhihBXhWLJmcQ9/RpHjXnHxbxjAD12SgY+lKIIyPWHVp+L5lgf
	2QpjWdstfLrsKBDrRFfEbVk/xhlqgJt1t1ZeiCn0QWAhyncLKoBCeV9YP+LRBdi9er/w
	EMFcp5P5E3IGvbs2vgstDqmnd5s9E2xTB+v0YD1iw5NpTw4pruThBB8z3ooZwfKf71Ua
	cLZQ==
MIME-Version: 1.0
X-Received: by 10.182.128.42 with SMTP id nl10mr4795034obb.41.1376156301761;
	Sat, 10 Aug 2013 10:38:21 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Sat, 10 Aug 2013 10:38:21 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Sat, 10 Aug 2013 10:38:21 -0700 (PDT)
In-Reply-To: <20130810173039.GA27433@edge>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
	<CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
	<alpine.DEB.2.02.1308100611110.2277@oneiric>
	<CAFZh4h-w1MnoXZ-u5592OLDMUADmACSYZb4edncWEprjQ8qHcg@mail.gmail.com>
	<alpine.DEB.2.02.1308100651500.3147@oneiric>
	<CAFZh4h88M0R9dC6-t4F5dgZPFEOJx2dEk_pQxQhpWC-B3R1ubg@mail.gmail.com>
	<20130810173039.GA27433@edge>
Date: Sat, 10 Aug 2013 13:38:21 -0400
Message-ID: <CAFZh4h8KTwAOfaKdCMC8pDAERiG3wF75tWWvqSm9MfPEwvz7KA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Sat, 10 Aug 2013 17:38:25 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1cc9e85a13004e39b5b1d

--e89a8ff1cc9e85a13004e39b5b1d
Content-Type: text/plain; charset=ISO-8859-1

On Aug 10, 2013 1:30 PM, "Denys Dmytriyenko" <denys@ti.com> wrote:
>
> On Sat, Aug 10, 2013 at 07:21:12AM -0400, Brian Hutchinson wrote:
> > >
> > > .
> > >
> > >   anyway, as i said, masking out recipes-graphics was a stopgap
> > > measure, but i'd rather do this the "right" way, if someone wants to
> > > explain what the "right" way is.
> > >
> > > rday
> > >
> >
> > I don't know.  I first renamed mesa_9.1.5.bbappend to
messa_9.1.6.bbappend
> > and that worked to continue my build but like I said I ran into other
> > issues ... if you look back a few days you can see where I posted about
> > that.  What worked for me was a clean checkout of the branches.  YMMV I
> > guess :)
>
> So, both of you went back and forth for couple days, generating dozens of
> emails, but nobody offered a trivial rename patch to fix it... :)
>
> Anyway, it's fixed now - I just wasn't paying attention to the master for
the
> past few days and didn't have time to take care of it right away.
>
> The problem with mesa is that it now gets bumped to every minor version on
> almost a weekly basis and sometimes I just miss the fact that it broke
> meta-ti/master due to the bbappend we have. I need to try to push that
change
> we carry to oe-core so we wouldn't need a bbappend...
>
> --
> Denys

Sorry.  I wasn't 100% sure what I did was the right fix.

B

--e89a8ff1cc9e85a13004e39b5b1d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 10, 2013 1:30 PM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailt=
o:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, Aug 10, 2013 at 07:21:12AM -0400, Brian Hutchinson wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; .<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 anyway, as i said, masking out recipes-graphics was a st=
opgap<br>
&gt; &gt; &gt; measure, but i&#39;d rather do this the &quot;right&quot; wa=
y, if someone wants to<br>
&gt; &gt; &gt; explain what the &quot;right&quot; way is.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; rday<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t know. =A0I first renamed mesa_9.1.5.bbappend to messa=
_9.1.6.bbappend<br>
&gt; &gt; and that worked to continue my build but like I said I ran into o=
ther<br>
&gt; &gt; issues ... if you look back a few days you can see where I posted=
 about<br>
&gt; &gt; that. =A0What worked for me was a clean checkout of the branches.=
 =A0YMMV I<br>
&gt; &gt; guess :)<br>
&gt;<br>
&gt; So, both of you went back and forth for couple days, generating dozens=
 of<br>
&gt; emails, but nobody offered a trivial rename patch to fix it... :)<br>
&gt;<br>
&gt; Anyway, it&#39;s fixed now - I just wasn&#39;t paying attention to the=
 master for the<br>
&gt; past few days and didn&#39;t have time to take care of it right away.<=
br>
&gt;<br>
&gt; The problem with mesa is that it now gets bumped to every minor versio=
n on<br>
&gt; almost a weekly basis and sometimes I just miss the fact that it broke=
<br>
&gt; meta-ti/master due to the bbappend we have. I need to try to push that=
 change<br>
&gt; we carry to oe-core so we wouldn&#39;t need a bbappend...<br>
&gt;<br>
&gt; --<br>
&gt; Denys</p>
<p dir=3D"ltr">Sorry.=A0 I wasn&#39;t 100% sure what I did was the right fi=
x.</p>
<p dir=3D"ltr">B</p>

--e89a8ff1cc9e85a13004e39b5b1d--
