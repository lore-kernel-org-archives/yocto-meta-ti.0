Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F2DC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 09:17:05 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.5475.1654075023230393306
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 02:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GBWIIm3j;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j10so1668907lfe.12
        for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yodztj0F6QufUb6tQS4au1s8bZpJkOxv4/jelWXTicw=;
        b=GBWIIm3jbWxdEwZihI9d7AOQeGkmT8D2DL/I8Dem425bwEXMh0VHNFmfOXmkOZUa0w
         wgZFwmSI1y2weAx/0iwth3YDJsOrNKGnwNS04lhdhXQzOL7N7YDgitN3ZviF5xExkQFQ
         46W4iNgQc96b35k20mptGUZR672B47g18ngb83IPOJo2ywic7xPoeU89yhBAVuFuJ67H
         WXyzWVJqlRUY0K54EV/+1bO7CSLc8kADhrTs0b7q8r7Yck3H8zqJ5mxyJlLXTOQ0YjuF
         vIbZ2VjLyCX5ydhPwnZszivVhwyjDnRAdbZXuDkrxDtZLD8b2Xeq8+9aifW+/tneR1Ut
         L9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yodztj0F6QufUb6tQS4au1s8bZpJkOxv4/jelWXTicw=;
        b=H6qNmPQsd8Qh4HURlyYxblqtuDcMbj848jG/vGjSFWzEaJXxojuhvdbFQtKRQquzpK
         7q/NcDZXwBbJJBKYrcqCEWQxproCcNyvDzrRFvRMh5Uho52l6gJIgsso0HpQgMgKQiS5
         xl8XhE2O1ccvJA/39PEM76YcVSv79A73frlTD0lL+07c6/TVrQIIbGSGY+Gf1bgV8b7F
         /h8K/VgrAQT/hA6z+BaUD7l6ZGMdkzsgUjx2GHB7UzCErObzZtBrCiW6sY9xfMHW/DAP
         nD0kPgVnndZAu1c8sE8eE1+mM1OZCiRez/Mr2S+lBLfJ1LZuqXJrg7LK8XIsenFnfj/M
         mUsA==
X-Gm-Message-State: AOAM530Hh/2iWrrs0T971XOrIeaH0OcgnyFT8s2wkbdIfHoj7SMvt+3I
	8zhHzZBESMcPKxgncoxcpZLuWQApmPoDYdB3DEU=
X-Google-Smtp-Source: 
 ABdhPJyBe5O/V6Dc0Jkp7rKQjyzsGJEA8MVpZn5HRBKwtkDEoSMCSGWSWQR1bWnGW6s2e0pvlOkUX5K2jN3KGdIEyDw=
X-Received: by 2002:a05:6512:3989:b0:477:caeb:1a13 with SMTP id
 j9-20020a056512398900b00477caeb1a13mr46069473lfu.64.1654075020095; Wed, 01
 Jun 2022 02:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220530143810.4064720-1-jose.quaresma@foundries.io>
 <20220531193302.GC9834@denix.org>
In-Reply-To: <20220531193302.GC9834@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 1 Jun 2022 10:16:48 +0100
Message-ID: 
 <CANPvuRkX=xftYt2RWasxE-E2MJJuKBhdQdV+jQg15tH3TpSMwg@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] multiconfig: use diferent TMPDIR for each
 machine
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000001331305e05f5a91"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jun 2022 09:17:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14769

--00000000000001331305e05f5a91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 31/05/2022 =
=C3=A0(s)
20:33:

> On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:
> > Bitbake manual [1] recomends to use one TMPDIR for each machine:
> >
> >  "Minimally, each configuration file must define the machine and the
> >  temporary directory BitBake uses for the build.
> >  Suggested practice dictates that you do not overlap the temporary
> >  directories used during the builds."
>
> What specific issue are you trying to fix with this?
>

The issue that I have is in the OE-core archiver.bbclasse that doesn't
support multiconfig when
using the same TMPDIR, this because the shared recipes like gcc, kernel

It can be replicates in kirkstone using the am64xx-evm with the following:

# archive sources for target recipes in conf/local.conf
INHERIT +=3D "archiver"
COPYLEFT_RECIPE_TYPES =3D "target"
ARCHIVER_MODE[src] =3D "original"
ARCHIVER_MODE[diff] =3D "1"

# and run bitbake with:
bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_unpack_and_patch
-f

more info in following patch:
https://lists.openembedded.org/g/openembedded-core/message/166203


> I'm not aware of any immediate issues (because here multiconfig is used
> for
> completely separate machines and those are well isolated inside the temp
> dir),
> but I see few problems this will cause down the road, so I'm against this
> change.
>

What you are saying is that this change will introduce new  problems or
regressions?

Jose


>
>
> > [1]
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-intro.html#executing-a-multiple-configuration-build
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > index deb07210..0ba163ae 100644
> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > @@ -3,3 +3,5 @@ MAINMACHINE :=3D "${MACHINE}"
> >  DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
> >
> >  MACHINE:append =3D "-k3r5"
> > +
> > +TMPDIR =3D "${TOPDIR}/tmp-${MACHINE}"
> > --
> > 2.36.1
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000001331305e05f5a91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia ter=C3=A7a, 31/=
05/2022 =C3=A0(s) 20:33:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:<b=
r>
&gt; Bitbake manual [1] recomends to use one TMPDIR for each machine:<br>
&gt; <br>
&gt;=C2=A0 &quot;Minimally, each configuration file must define the machine=
 and the<br>
&gt;=C2=A0 temporary directory BitBake uses for the build.<br>
&gt;=C2=A0 Suggested practice dictates that you do not overlap the temporar=
y<br>
&gt;=C2=A0 directories used during the builds.&quot;<br>
<br>
What specific issue are you trying to fix with this?<br></blockquote><div><=
br></div><div>The issue that I have is in the OE-core archiver.bbclasse tha=
t doesn&#39;t support multiconfig when</div><div>using the same TMPDIR, thi=
s because the shared recipes like gcc, kernel</div><div><br></div><div>It c=
an be replicates in kirkstone using the am64xx-evm with the following:</div=
><div><span style=3D"font-family:monospace"><br></span></div><div># archive=
 sources for target recipes in conf/local.conf=C2=A0<br>INHERIT +=3D &quot;=
archiver&quot;<br>COPYLEFT_RECIPE_TYPES =3D &quot;target&quot;<br>ARCHIVER_=
MODE[src] =3D &quot;original&quot;<br>ARCHIVER_MODE[diff] =3D &quot;1&quot;=
</div><div><br># and run bitbake with:<br>bitbake mc:k3r5:gcc-source-11.2.0=
 gcc-source-11.2.0 -c do_unpack_and_patch -f<br></div><div><br></div><div>m=
ore info in following=C2=A0patch:</div><div><a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/166203">https://lists.openembedded.o=
rg/g/openembedded-core/message/166203</a><br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m not aware of any immediate issues (because here multiconfig is used=
 for <br>
completely separate machines and those are well isolated inside the temp di=
r), <br>
but I see few problems this will cause down the road, so I&#39;m against th=
is <br>
change.<br></blockquote><div><br></div><div>What you are saying is that thi=
s change will introduce new=C2=A0 problems or regressions?</div><div><br></=
div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt; [1] <a href=3D"https://docs.yoctoproject.org/bitbake/bitbake-user-manu=
al/bitbake-user-manual-intro.html#executing-a-multiple-configuration-build"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake=
/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multiple-co=
nfiguration-build</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf=
/multiconfig/k3r5.conf<br>
&gt; index deb07210..0ba163ae 100644<br>
&gt; --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf<br>
&gt; @@ -3,3 +3,5 @@ MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
&gt;=C2=A0 DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${MAINMACHINE}&q=
uot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; +<br>
&gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-${MACHINE}&quot;<br>
&gt; -- <br>
&gt; 2.36.1<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000001331305e05f5a91--

