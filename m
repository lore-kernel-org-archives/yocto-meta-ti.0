Return-Path: <eric.seuret@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04E86E00575
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 00:20:51 -0800 (PST)
Received: by mail-oa0-f47.google.com with SMTP id m1so1757947oag.20
	for <meta-ti@yoctoproject.org>; Thu, 20 Feb 2014 00:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hTSwD573smIXzghWf0mWlQ2ZklFk4l0qNVO62Xzznak=;
	b=INM/PUN6htHhYzh9p7C4ehx1Plkxalw3+4yy14gCVs2yVYQcQnkm1K+l2GzxpYRO8i
	9Hu1f/KkdYOiW0MQAFPQbObKlOCTR0XArAg389Tsl09mspq4HsRhriHckHRdYOr7dLgR
	9VM2y3+3goPSrEHHluNHdQE05ZvAzblkyCl2BelRCmqNDg7yyZLtcIKfKc9gq3nmo0Fb
	46Txgdc7vj+DMoJEwr8DiBPaGlGNzGkY4krNWFbI+X1Ahd1sbE4q0zZLv4/c5CAsOj4S
	RAiD4m9ArrYLcrohXoIwp3L1VSZam39fVCX+EmCv8fMEqm66FdBY7KxI7WzACNgcC5A9
	K07g==
MIME-Version: 1.0
X-Received: by 10.60.98.73 with SMTP id eg9mr269864oeb.81.1392884450687; Thu,
	20 Feb 2014 00:20:50 -0800 (PST)
Received: by 10.182.115.10 with HTTP; Thu, 20 Feb 2014 00:20:50 -0800 (PST)
In-Reply-To: <CAMKF1srGu+GU3kQtE6zmddpoak6+sk7nDLKKdRexTsec9nXfCg@mail.gmail.com>
References: <CA+ujt=q+j7sBLqCFaAwomZepAah2R-y7=bp_H38otNvBUNznyg@mail.gmail.com>
	<CAMKF1spN2gOjTav18Qi+FObE+QxVohQ89KObNoQe-MgwX8=Trg@mail.gmail.com>
	<530516AD.1050901@mlbassoc.com>
	<CAMKF1srGu+GU3kQtE6zmddpoak6+sk7nDLKKdRexTsec9nXfCg@mail.gmail.com>
Date: Thu, 20 Feb 2014 09:20:50 +0100
Message-ID: <CA+ujt=pT8oJesg0ZUs6Rb1hB6KYLx29mXin36qJxBnsgi48LXA@mail.gmail.com>
From: Eric Seuret <eric.seuret@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: Support for capemgr
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
X-List-Received-Date: Thu, 20 Feb 2014 08:20:53 -0000
Content-Type: multipart/alternative; boundary=089e0139fc60e580b604f2d22e8d

--089e0139fc60e580b604f2d22e8d
Content-Type: text/plain; charset=UTF-8

I'll look into those repos then.

Thanks for the answers.


On Wed, Feb 19, 2014 at 9:45 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 19, 2014 at 12:40 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> > On 2014-02-19 13:31, Khem Raj wrote:
> >> On Wed, Feb 19, 2014 at 1:30 AM, Eric Seuret <eric.seuret@gmail.com>
> wrote:
> >>> I have been toying around with yocto and the meta-ti layer for my
> beaglebone
> >>> black and I am able to build and boot an image (I made
> core-image-basic).
> >>> However i don't seem to see the capemgr in my /sys/devices.
> >>
> >> may be you will have better luck trying kernel from meta-beagleboard
> >
> > Really?  That layer hasn't been updated since 2013-09-05... seems pretty
> dead to me.
> >
>
> the upstream is here
>
> https://github.com/koenkooi/meta-beagleboard/commits/master
>
>
>
> > --
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--089e0139fc60e580b604f2d22e8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll look into those repos then.=C2=A0<div><br></div><=
div>Thanks for the answers.</div></div><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">On Wed, Feb 19, 2014 at 9:45 PM, Khem Raj <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Wed, Feb 19, 2014 at 12:4=
0 PM, Gary Thomas &lt;<a href=3D"mailto:gary@mlbassoc.com">gary@mlbassoc.co=
m</a>&gt; wrote:<br>

&gt; On 2014-02-19 13:31, Khem Raj wrote:<br>
&gt;&gt; On Wed, Feb 19, 2014 at 1:30 AM, Eric Seuret &lt;<a href=3D"mailto=
:eric.seuret@gmail.com">eric.seuret@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; I have been toying around with yocto and the meta-ti layer for=
 my beaglebone<br>
&gt;&gt;&gt; black and I am able to build and boot an image (I made core-im=
age-basic).<br>
&gt;&gt;&gt; However i don&#39;t seem to see the capemgr in my /sys/devices=
.<br>
&gt;&gt;<br>
&gt;&gt; may be you will have better luck trying kernel from meta-beagleboa=
rd<br>
&gt;<br>
&gt; Really? =C2=A0That layer hasn&#39;t been updated since 2013-09-05... s=
eems pretty dead to me.<br>
&gt;<br>
<br>
</div>the upstream is here<br>
<br>
<a href=3D"https://github.com/koenkooi/meta-beagleboard/commits/master" tar=
get=3D"_blank">https://github.com/koenkooi/meta-beagleboard/commits/master<=
/a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
&gt; --<br>
&gt; ------------------------------------------------------------<br>
&gt; Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0Consulting for the<br>
&gt; MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0Embedded world<br>
&gt; ------------------------------------------------------------<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br></div>

--089e0139fc60e580b604f2d22e8d--
