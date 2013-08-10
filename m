Return-Path: <b.hutchman@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60281E00406
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:30:33 -0700 (PDT)
Received: by mail-ee0-f54.google.com with SMTP id e53so2559105eek.27
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ouH0zhkDBG0BrqPuOxPkrIKAedQb5R5PNZCpVukfWow=;
	b=VgVt11oqmn4Qviwc1A0ZXObP5neGIe3a/idzh35l0yoq09/XSDKO5S6PuvsX99ms9M
	Cel4V4FKLKRg7Iz62oWiFMlnSK860yCngySGa60RxDV2eTCoZoJwU0c46sUWtNgCrKLx
	qC+pHvvgs8OZaFeBK/772NC5CYiwrR9vTqkAXyXNQDzWJW/y+VNfEtVJyMZmBltMnbaK
	XUI6aUlKao9VB2ykvdlZNsierqg0zSwydbiKN3KQMT0tbdON77bPZ7cpYXxVIk0EczR/
	adEjCnEkYiZFlE3U3g5Brjt1RVbnWJCBbec077TPDPqvqJ90Uf7sFCbtxkGfojLLqVFb
	MAlA==
MIME-Version: 1.0
X-Received: by 10.14.176.199 with SMTP id b47mr17152006eem.117.1376130632741; 
	Sat, 10 Aug 2013 03:30:32 -0700 (PDT)
Received: by 10.223.90.1 with HTTP; Sat, 10 Aug 2013 03:30:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1308100611110.2277@oneiric>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
	<CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
	<alpine.DEB.2.02.1308100611110.2277@oneiric>
Date: Sat, 10 Aug 2013 06:30:32 -0400
Message-ID: <CAFZh4h-w1MnoXZ-u5592OLDMUADmACSYZb4edncWEprjQ8qHcg@mail.gmail.com>
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
X-List-Received-Date: Sat, 10 Aug 2013 10:30:34 -0000
Content-Type: multipart/alternative; boundary=047d7b603ce087a5b104e3956125

--047d7b603ce087a5b104e3956125
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 10, 2013 at 6:15 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Fri, 9 Aug 2013, Brian Hutchinson wrote:
>
> ... snip ...
>
> > As a stop gap measure, I did just rename the bbappend to 9.1.6 and
> > that solved my mesa problem but then I had toolchain build
> > problems.  When I did a fresh checkout, I did not get the mesa error
> > for the mesa 9.1.5.
>
>   for now, since i'm building a non-graphical "core-image-minimal"
> image, i just masked out the entire "meta-ti/recipes-graphics"
> directory, but i'm sure that's not the cleanest way to solve this. :-)
>
>   so what is the underlying layer with which meta-ti should stay in
> sync? it seems both poky and oe-core have moved on to mesa_9.1.6,
> while meta-ti is still at 9.1.5_bbappend, at least on "master". so
> i'm assuming synchronization requires using tags, or a particular
> branch, or something like that.
>
>
I don't know.  My image is based off core-image-minimal and I don't need
graphics so I didn't look into it anymore when the fresh checkout of poky
master and meta-ti master worked (I also use meta-openembedded).

Regards,

Brian

--047d7b603ce087a5b104e3956125
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2013 at 6:15 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<div class=3D"im">On Fri, 9 Aug 2013, Brian Hutchinson wrote:<br>
<br>
</div>... snip ...<br>
<div class=3D"im"><br>
&gt; As a stop gap measure, I did just rename the bbappend to 9.1.6 and<br>
&gt; that solved my mesa problem but then I had toolchain build<br>
&gt; problems.=A0 When I did a fresh checkout, I did not get the mesa error=
<br>
&gt; for the mesa 9.1.5.<br>
<br>
</div>=A0 for now, since i&#39;m building a non-graphical &quot;core-image-=
minimal&quot;<br>
image, i just masked out the entire &quot;meta-ti/recipes-graphics&quot;<br=
>
directory, but i&#39;m sure that&#39;s not the cleanest way to solve this. =
:-)<br>
<br>
=A0 so what is the underlying layer with which meta-ti should stay in<br>
sync? it seems both poky and oe-core have moved on to mesa_9.1.6,<br>
while meta-ti is still at 9.1.5_bbappend, at least on &quot;master&quot;. s=
o<br>
i&#39;m assuming synchronization requires using tags, or a particular<br>
branch, or something like that.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>I don&#39;t know. =A0My image is based off core-image-minimal=
 and I don&#39;t need graphics so I didn&#39;t look into it anymore when th=
e fresh checkout of poky master and meta-ti master worked (I also use meta-=
openembedded).</div>
<div><br></div><div>Regards,</div><div><br></div><div>Brian</div><div>=A0</=
div></div>

--047d7b603ce087a5b104e3956125--
