Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.5467.1580375700590936707
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 01:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HoLlNGCk;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: peter.griffin@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id y19so1764734lfl.9
        for <meta-ti@lists.yoctoproject.org>; Thu, 30 Jan 2020 01:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AU4rWe0ecofO234BxIABgRgDuvHBjyNApUi/05VUeIs=;
        b=HoLlNGCko3Olt3kckVnHS/m3cefr/a8tFRUH/2L5LA477/Ea4ZwG3Y0Uw9eZnZuMga
         KKOHz9HUCziRNprgLBVZmuAHR/Atsf2ye2vujcIrP2/UWho/vogiS8/JIW/iMIYnkLfK
         8d0jS1Fj8KthQzG7XT+yFQCHtoaFD71X43LcOMOT3D13hfooRPjrQHeAprDx+25tmsBp
         Wd9gDRp8C4zksT4JBncgMgl7dYu7b+gMh4lgJ15p+k8d15GQwaCQZ4aaGRx+0aOHxqnP
         qo5NYyw3mYqK40cI0Hl/gK1F7InXxpl2qD8tKgEcDaayBxCFr04BFfAghz2c9xFF/NB9
         lzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AU4rWe0ecofO234BxIABgRgDuvHBjyNApUi/05VUeIs=;
        b=Ec082DThDBivz93GePAB8uEPPrU+fSHQ3uT/bNj/F1tU29YnzZtUhDKeOErAFQoiLO
         0Oc/PksHH36g5QM9wGNoFIkRBol4m72VZnDhLS2v/YdvbdgH4A9qeAm8d4d/flLy62LU
         9gMTTMQ9vpWPjMKEnz2JoqC86Bcgd93p/gOvSjdDOsXFzZTjndokEdoqax2Zy9v+wmwc
         y5leAAo8CuoR9Cf/qhIZtG6IIVr3CHS5bjsqQncDaC2sUQhmWRkk4CNJrnBisT5ZsdUV
         ojOn99ePRQHW9jA61Zl7bKx7F+fq2tJN5YHfYekF6VTnUWBG94Nzf3q2PhJ4bm6f6s+K
         Ln0w==
X-Gm-Message-State: APjAAAUsX5HvET+YGWV1HvVi4uAbRj5g1ZwYrP8pLPaDUAnEULZbuuCh
	0Wn+JZ9rZVrFVfS6wi/EyH47TTOGyhc9XWRlEkdjFQ==
X-Google-Smtp-Source: APXvYqx9r+Oxp1qqUCJVaJxPUQFjbMAFhOSzbT+/0etT+e/6ZhPD3SsbnLH1dqUBBiepoRKu8nwTVRousCst9TC8e/Q=
X-Received: by 2002:a05:6512:64:: with SMTP id i4mr2053972lfo.55.1580375698726;
 Thu, 30 Jan 2020 01:14:58 -0800 (PST)
MIME-Version: 1.0
References: <1580339755-23335-1-git-send-email-peter.griffin@linaro.org>
 <15EE7ED3E5F24894.17230@lists.yoctoproject.org> <20200130033410.GV3658@beryl>
In-Reply-To: <20200130033410.GV3658@beryl>
From: "Peter Griffin" <peter.griffin@linaro.org>
Date: Thu, 30 Jan 2020 09:14:47 +0000
Message-ID: <CADrjBPopF503QR2_d6T7-SWCNqG_hbAobN866jBSMWVTfdmJ1w@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] jailhouse_git: update to inherit python3 classes
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000227d1c059d57e4b8"

--000000000000227d1c059d57e4b8
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

On Thu, 30 Jan 2020 at 03:34, Denys Dmytriyenko <denys@ti.com> wrote:

> Let me elaborate:
>
> 1. Your patch is incomplete - it fixes parsing issues, but not build issues
>

Thanks for the extra info, yes that is correct I didn't build any TI
platform,
but I needed to fix the parse issues to build the non meta-ti based platform
I was working on (or disable your layer). I should have made that clearer
in the commit message.

2. There was a more complete patch submitted earlier in the day to address
> that:
> https://lists.yoctoproject.org/g/meta-ti/message/12625


Ok great. I was trying to check your mailing list but seems I was using a
old link from the README here
https://www.yoctoproject.org/pipermail/meta-ti/.

Peter.

>
>
> --
> Denys
>
>
> On Wed, Jan 29, 2020 at 06:19:23PM -0500, Denys Dmytriyenko via
> Lists.Yoctoproject.Org wrote:
> > NAK
> >
> > On Wed, Jan 29, 2020 at 11:15:55PM +0000, Peter Griffin wrote:
> > > This avoids the parsing errors, now that python2
> > > has been removed.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb
> b/recipes-kernel/jailhouse/jailhouse_git.bb
> > > index 4186dc3..89833e6 100644
> > > --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> > > +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> > > @@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
> > >  S = "${WORKDIR}/git"
> > >
> > >  require jailhouse-arch.inc
> > > -inherit module pythonnative bash-completion deploy setuptools
> > > +inherit module python3native bash-completion deploy setuptools3
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  COMPATIBLE_MACHINE = "(ti-soc)"
> > > --
> > > 2.7.4
> > >
>
> > 
>
>

--000000000000227d1c059d57e4b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Denys,<div><br></div></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Jan 2020=
 at 03:34, Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Let me elaborate:<br>
<br>
1. Your patch is incomplete - it fixes parsing issues, but not build issue=
s<br></blockquote><div><br></div><div>Thanks for the extra info, yes that i=
s correct I didn&#39;t build any TI platform,</div><div>but I needed to fix=
 the parse issues to build the non meta-ti based platform</div><div>I was w=
orking on (or disable your layer). I should have made that clearer</div><di=
v>in the commit message.</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
2. There was a more complete patch submitted earlier in the day to address=
 that:<br>
<a href=3D"https://lists.yoctoproject.org/g/meta-ti/message/12625" rel=3D"=
noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/mess=
age/12625</a></blockquote><div><br></div><div>Ok great. I was trying to che=
ck your mailing list but seems I was using a</div><div>old link from the RE=
ADME here=C2=A0<a href=3D"https://www.yoctoproject.org/pipermail/meta-ti/">=
https://www.yoctoproject.org/pipermail/meta-ti/</a>.</div><div><br></div><d=
iv>Peter.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Wed, Jan 29, 2020 at 06:19:23PM -0500, Denys Dmytriyenko via <a href=3D=
"http://Lists.Yoctoproject.Org" rel=3D"noreferrer" target=3D"_blank">Lists.=
Yoctoproject.Org</a> wrote:<br>
&gt; NAK<br>
&gt; <br>
&gt; On Wed, Jan 29, 2020 at 11:15:55PM +0000, Peter Griffin wrote:<br>
&gt; &gt; This avoids the parsing errors, now that python2<br>
&gt; &gt; has been removed.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Peter Griffin &lt;<a href=3D"mailto:peter.griffin=
@linaro.org" target=3D"_blank">peter.griffin@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 recipes-kernel/jailhouse/<a href=3D"http://jailhouse_git.b=
b" rel=3D"noreferrer" target=3D"_blank">jailhouse_git.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/recipes-kernel/jailhouse/<a href=3D"http://jailhous=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">jailhouse_git.bb</a> b/recip=
es-kernel/jailhouse/<a href=3D"http://jailhouse_git.bb" rel=3D"noreferrer" =
target=3D"_blank">jailhouse_git.bb</a><br>
&gt; &gt; index 4186dc3..89833e6 100644<br>
&gt; &gt; --- a/recipes-kernel/jailhouse/<a href=3D"http://jailhouse_git.b=
b" rel=3D"noreferrer" target=3D"_blank">jailhouse_git.bb</a><br>
&gt; &gt; +++ b/recipes-kernel/jailhouse/<a href=3D"http://jailhouse_git.b=
b" rel=3D"noreferrer" target=3D"_blank">jailhouse_git.bb</a><br>
&gt; &gt; @@ -29,7 +29,7 @@ RDEPENDS_${PN} +=3D &quot;\<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 require jailhouse-arch.inc<br>
&gt; &gt; -inherit module pythonnative bash-completion deploy setuptools<b=
r>
&gt; &gt; +inherit module python3native bash-completion deploy setuptools3=
<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; &gt;=C2=A0 COMPATIBLE_MACHINE =3D &quot;(ti-soc)&quot;<br>
&gt; &gt; -- <br>
&gt; &gt; 2.7.4<br>
&gt; &gt; <br>
<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000227d1c059d57e4b8--
