Return-Path: <johnsonthomas@nanometrics.ca>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D851AE007FC
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 10:59:44 -0800 (PST)
Received: by mail-ve0-f182.google.com with SMTP id jy13so38874veb.13
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H7eh2RDS0lR1oXr7konRdYr9mlY2y6NcKY65r9QjQq8=;
	b=hQ0E2kxxCdSDWGSfcwXGMM0orcyC9TiVlC9QFdlDzXkkhQJ0LSlYwpmwKI0lJfu8uo
	2usHPHOlbfvFaHZHZfZ2OKb6EV8mSEGkr5Qa7a+SuiKeGsEpKIRIwll4BPm0dYjg20G4
	Qan51zmTNtxeKDVo2yZ0a3h8gypz4ftA1wz5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=H7eh2RDS0lR1oXr7konRdYr9mlY2y6NcKY65r9QjQq8=;
	b=O42GCDWMPGY+V+hoGoIIk4wJvaukjSCPHQK5Sv2tP1z3im8fM9ZMOBmdbmrZ9Rv6+y
	YCW6PwPfC7CLR2jggkHPyefWR1WMJCma1SxSyDXKEi3HOtp/7eQqRM/jORd9uY50QgCf
	iTEM/DL/C4cPeYtQjYxeX0eGdJ8w5MboNX9nZcFX7T7/sZnQuZC2huRWcOlQne6CY7Js
	5pgZgBEi6RRnPIMzXrhxps6T0g0QsPatHta3z49Bhxq2WU6uBUMDa3xnizQ/MQOjpclR
	K5XhUSl3vbu4XtzHvTOqC/SR0GynWBY0wU3mBsvdVvx7WqsymrOpF+9IkfLD0k1plhXJ
	BzOw==
X-Gm-Message-State: ALoCoQmSIekpLMxgvIfcCb1oCLzUqvL6iUzaIkK3CfELauDGhzcdlJRBFpmiKRNLADpEsi7honl2
MIME-Version: 1.0
X-Received: by 10.52.135.201 with SMTP id pu9mr3310324vdb.13.1387393183549;
	Wed, 18 Dec 2013 10:59:43 -0800 (PST)
Received: by 10.52.34.197 with HTTP; Wed, 18 Dec 2013 10:59:43 -0800 (PST)
In-Reply-To: <20131218185628.GU24180@edge>
References: <CAL58Aehin5=s1tCLoonZScAQvq2Hp7nwb8zzc4TBpXTSVWfp+Q@mail.gmail.com>
	<20131218174223.GT24180@edge>
	<CAL58Aeg6f29LsVE66AXhtQb0iFU2B6Za_9NPSJW5A-kSajAbSQ@mail.gmail.com>
	<20131218185628.GU24180@edge>
Date: Wed, 18 Dec 2013 13:59:43 -0500
Message-ID: <CAL58AejJTbO5bANs8aQYuZnKU-oKXtX00XjP_AN7rP794=KezQ@mail.gmail.com>
From: Johnson Thomas <johnsonthomas@nanometrics.ca>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Latest version of Poky compatible with meta-ti
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
X-List-Received-Date: Wed, 18 Dec 2013 18:59:45 -0000
Content-Type: multipart/alternative; boundary=bcaec51b9d17dfe5c004edd3a5d1

--bcaec51b9d17dfe5c004edd3a5d1
Content-Type: text/plain; charset=ISO-8859-1

Thanks for the clarification Denys.

Thanks,
Johnson


On Wed, Dec 18, 2013 at 1:56 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Dec 18, 2013 at 01:53:34PM -0500, Johnson Thomas wrote:
> > Hi Denys,
> >
> > Thanks for the quick response. I will upgrade meta-ti to use dylan and
> poky
> > to either 9.0 or 10.0.
>
> Johnson,
>
> Poky 9 = Dylan
> Poky 10 = Dora (I don't have separate branch in meta-ti for Dora yet, but
> master should work)
>
> --
> Denys
>
>
> > On Wed, Dec 18, 2013 at 12:42 PM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> >
> > > On Wed, Dec 18, 2013 at 12:36:29PM -0500, Johnson Thomas wrote:
> > > > Hi all.
> > > >
> > > > I have a Yocto project consisting of Poky (Danny-8.0.2), meta-ti
> (tag:
> > > > ti2013.04.00) and a custom BSP layer. I was looking at upgrading the
> Poky
> > > > version to maybe 9.0 or even 10.0. I was wondering, what is the
> latest
> > > > version of Poky that is compatible with meta-ti layer?. Also, is it
> > > > recommended to use the "Danny" branch as a stable version for meta-ti
> > > layer?
> > >
> > > Hi,
> > >
> > > Danny branch is quite old and hasn't been updated in long time
> (although
> > > you
> > > are using an older tag from meta-ti/danny). Currently active branches
> in
> > > meta-ti are dylan and master (dora and later). That would correspond to
> > > Poky
> > > releases version 9 and version 10. We are still using Dylan for our
> stable
> > > releases, but should be switching to Dora soon. So, you can use either
> > > Dylan
> > > or master from meta-ti, but I won't recommentd staying with Danny.
> > >
> > > --
> > > Denys
> > >
>

--bcaec51b9d17dfe5c004edd3a5d1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the clarification Denys.<div><br></div><div>Tha=
nks,</div><div>Johnson</div></div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">On Wed, Dec 18, 2013 at 1:56 PM, Denys Dmytriyenko <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@=
ti.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Dec 18, 2013 at 01=
:53:34PM -0500, Johnson Thomas wrote:<br>
&gt; Hi Denys,<br>
&gt;<br>
&gt; Thanks for the quick response. I will upgrade meta-ti to use dylan and=
 poky<br>
&gt; to either 9.0 or 10.0.<br>
<br>
</div>Johnson,<br>
<br>
Poky 9 =3D Dylan<br>
Poky 10 =3D Dora (I don&#39;t have separate branch in meta-ti for Dora yet,=
 but<br>
master should work)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; On Wed, Dec 18, 2013 at 12:42 PM, Denys Dmytriyenko &lt;<a href=3D"mai=
lto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Wed, Dec 18, 2013 at 12:36:29PM -0500, Johnson Thomas wrote:<b=
r>
&gt; &gt; &gt; Hi all.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have a Yocto project consisting of Poky (Danny-8.0.2), met=
a-ti (tag:<br>
&gt; &gt; &gt; ti2013.04.00) and a custom BSP layer. I was looking at upgra=
ding the Poky<br>
&gt; &gt; &gt; version to maybe 9.0 or even 10.0. I was wondering, what is =
the latest<br>
&gt; &gt; &gt; version of Poky that is compatible with meta-ti layer?. Also=
, is it<br>
&gt; &gt; &gt; recommended to use the &quot;Danny&quot; branch as a stable =
version for meta-ti<br>
&gt; &gt; layer?<br>
&gt; &gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; Danny branch is quite old and hasn&#39;t been updated in long tim=
e (although<br>
&gt; &gt; you<br>
&gt; &gt; are using an older tag from meta-ti/danny). Currently active bran=
ches in<br>
&gt; &gt; meta-ti are dylan and master (dora and later). That would corresp=
ond to<br>
&gt; &gt; Poky<br>
&gt; &gt; releases version 9 and version 10. We are still using Dylan for o=
ur stable<br>
&gt; &gt; releases, but should be switching to Dora soon. So, you can use e=
ither<br>
&gt; &gt; Dylan<br>
&gt; &gt; or master from meta-ti, but I won&#39;t recommentd staying with D=
anny.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div>

--bcaec51b9d17dfe5c004edd3a5d1--
