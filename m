Return-Path: <b.hutchman@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58D69E00406
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:15:02 -0700 (PDT)
Received: by mail-ee0-f42.google.com with SMTP id b45so2610658eek.1
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2Msayl8DSu0AAU/YN9pxWoL9iU8yWwYFHo9SemSmijU=;
	b=bW2PxP1Co0FLcJJXG7GmsXNTQ1bNxusqFJVFcK2jZq0b5wx495wWkvzd3KBXqrwahv
	Q5d/XkdPUpVpmcYc4GmmHNlwAes8tSuZaIQzqGtvMT0U88hYhAyNOVwgEW81bd+Z8ov+
	VTBWZDSKx6Fnpd73nxSrbnGWcBRHzPe9T0SuiqsfztMtAXojpOr4cw575iYO3yv46Ik0
	oBviWYFfVlaZhdyyMqBUkcG3CzZYZmdZdL1w3/tWvE4gokAtzRLHwrLJQHUW7H1Acrd0
	Q7dNuz6camIjv/Zn5Oxn6yP4XidxJ9WifUZ+X3vn7k+Ht/kl9kO6d9+BJvVSeSiU6+4Y
	IAbA==
MIME-Version: 1.0
X-Received: by 10.15.31.9 with SMTP id x9mr16985384eeu.103.1376129701332; Sat,
	10 Aug 2013 03:15:01 -0700 (PDT)
Received: by 10.223.90.1 with HTTP; Sat, 10 Aug 2013 03:15:01 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1308100608560.2277@oneiric>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
	<alpine.DEB.2.02.1308100608560.2277@oneiric>
Date: Sat, 10 Aug 2013 06:15:01 -0400
Message-ID: <CAFZh4h-yLxj3OLUqHLHrMJzU77a9mSkvNVDH6DoUM28ooBoM1g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Sat, 10 Aug 2013 10:15:06 -0000
Content-Type: multipart/alternative; boundary=089e0168127c03730204e3952a95

--089e0168127c03730204e3952a95
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 10, 2013 at 6:10 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Fri, 9 Aug 2013, Brian Hutchinson wrote:
>
> >
> >
> > On Aug 9, 2013 7:23 PM, "Robert P. J. Day" <rpjday@crashcourse.ca>
> wrote:
> > >
> > >
> > >   trying to build for beaglebone, getting:
> > >
> > > ERROR: No recipes available for:
> > >
> /home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.1.5.bbappend
> > > ERROR: Command execution failed: Exited with 1
> > >
> > > should meta-ti master stay in sync with oe-core master (which has a
> > > recipe for 9.1.6), or is there a different combo of layers to use?
> > > thanks.
> > >
> > > rday
> > >
> >
> > Hi Robert,
> >
> > I ran into the same thing the other day.  Yes, yocto master should
> > be used with meta-ti master as far as I know.  I've ran into trouble
> > mixing branch layers before.
>
>   i'm not sure what you mean by "yocto master". i'm aware of the
> meta-yocto layer, but that doesn't supply the underlying recipes. did
> you mean "poky master"? or am i missing something here?
>
>
Sorry, just meant the master branch of the layers.

Regards,

Brian

--089e0168127c03730204e3952a95
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2013 at 6:10 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<div class=3D"im">On Fri, 9 Aug 2013, Brian Hutchinson wrote:<br>
<br>
&gt;<br>
&gt;<br>
&gt; On Aug 9, 2013 7:23 PM, &quot;Robert P. J. Day&quot; &lt;<a href=3D"ma=
ilto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =A0 trying to build for beaglebone, getting:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: No recipes available for:<br>
&gt; &gt; /home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.=
1.5.bbappend<br>
&gt; &gt; ERROR: Command execution failed: Exited with 1<br>
&gt; &gt;<br>
&gt; &gt; should meta-ti master stay in sync with oe-core master (which has=
 a<br>
&gt; &gt; recipe for 9.1.6), or is there a different combo of layers to use=
?<br>
&gt; &gt; thanks.<br>
&gt; &gt;<br>
&gt; &gt; rday<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi Robert,<br>
&gt;<br>
&gt; I ran into the same thing the other day.=A0 Yes, yocto master should<b=
r>
&gt; be used with meta-ti master as far as I know.=A0 I&#39;ve ran into tro=
uble<br>
&gt; mixing branch layers before.<br>
<br>
</div>=A0 i&#39;m not sure what you mean by &quot;yocto master&quot;. i&#39=
;m aware of the<br>
meta-yocto layer, but that doesn&#39;t supply the underlying recipes. did<b=
r>
you mean &quot;poky master&quot;? or am i missing something here?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>Sorry, just meant the master branch of the layers.</div><div>=
<br></div><div>Regards,</div><div><br></div><div>Brian</div></div>

--089e0168127c03730204e3952a95--
