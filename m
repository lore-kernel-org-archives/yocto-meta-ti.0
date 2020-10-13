Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.6282.1602624162341430983
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 14:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZEppA3GD;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id x20so1132288qkn.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 14:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sZ+Vsa7QGCAFS8xp95oJaA7znY4ZtYtyvYaDT9AsijA=;
        b=ZEppA3GD9bvd1YbjaNAatEzbLbNFPemfcE8al0xn1pugQsRg+STT/Vyj8/HSeYvceY
         cLuyZXT+aNzfal8ytuSmEZ1+7Q1M2HB+SzxqopxBy5D5Zph5lIMzdxrDFDEjMMA8RgVz
         OgvCAc0dkEV7ICFnOAWgvmBviRXaeauDnCzJnMMbiPL2KW8hBuE2UidM8ewYvEXLcPed
         T1Ze8R9mvW+unh+nQsYzYQp6eXu/evYz0vNjOlKknOsZCN/JhiJ1ugaI7NVnkKv6G2QR
         89ATBkXjJIzhdx+asVMDihKZtG8JYcKEOqzUROtnCC3DUKPuKcJR0vIdDcvo/1meVitK
         tJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sZ+Vsa7QGCAFS8xp95oJaA7znY4ZtYtyvYaDT9AsijA=;
        b=Usxfv1A9JqG7OeWqw5iprzUxkQqzf9PQazRdjQttqPMsono+hM7nx3WuDZu7miquHJ
         +NUaEOorVoVAXbkyQfq32ZUpP8+26oRZTuQPEk9ww90IYzK0ggkpDQqdzxuCMwzwuLOD
         +Fe1TZPuX8Hlh7ZeaSmlshXdgm7jx2o8Wzx98k0/UV5SFqlGmJZr8Iy9KkryNAHJo4bY
         +A17hdKWnEFWd7S/RvxGpoAxPols179BSXCBFS7R5QSzWCyzq9QYnV/Gb0ETjvbJ6AsN
         NxhEAlTsC7/Dx0kJXG3tYoQgN1kiN2NjZukZn0UFcHaUPIg5p2WpltRe5mfCE4+ri18D
         klqg==
X-Gm-Message-State: AOAM531wTW8W4aIoOD+hG6xEwbotlQCJ/085l8GUfw6bp4Jkpe2cGySP
	aJICPkNhoAJT4sCyC7ExQkLzDLPstodQPlbKkBY=
X-Google-Smtp-Source: ABdhPJwccBKME04Bfs1NNCDCw9ri+VyivWF9Ph4/wGFTVaGhwgXesf3ub6fg0p8jKsBjQnAtQLaCz9BD5wu74r64Gkk=
X-Received: by 2002:a37:a751:: with SMTP id q78mr1992477qke.337.1602624161068;
 Tue, 13 Oct 2020 14:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201013183642.267548-1-raj.khem@gmail.com> <20201013205557.GB14852@beryl>
In-Reply-To: <20201013205557.GB14852@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 14:22:30 -0700
Message-ID: <CAMKF1srt+gXsc9-xrcXrzu3-Q7eHGNA1vZwDrC0+Gf1wVyvdeQ@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH 1/2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d439f705b19403f7"

--000000000000d439f705b19403f7
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 1:55 PM Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Oct 13, 2020 at 11:36:41AM -0700, Khem Raj wrote:
> > latest OE-core does not promote using trailing slash to make pseudo's
> > life easier
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  classes/ti-pdk-fetch.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> > index 0c9879be..4261e86d 100644
> > --- a/classes/ti-pdk-fetch.bbclass
> > +++ b/classes/ti-pdk-fetch.bbclass
> > @@ -9,13 +9,13 @@ PV = "${TI_PDK_VERSION}"
> >  PE = "2"
> >
> >  TI_PDK_COMP ?= ""
> > -TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
> > +TI_PDK_COMP_PATH = "/${@'${TI_PDK_COMP}'.replace('.','/')}"
>
> This one I don't understand - even when TI_PDK_COMP is empty,
> TI_PDK_COMP_PATH will have a trailing slash, hence S below will
> have it too...


Right I think I was thinking of ensuring that we can make conditional to
have the slash always and then remove it from S which is missing

I guess it needs to be solved differently


>
> Moreover, below in this class there's this line:
>
> src =
> os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))
>
> If TI_PDK_COMP_PATH starts with a leading slash, os.path.join treats
> it as absolute and the resulting "src" var will be completely wrong.


This is not going to be problem it will just use // in worst case


>
> So, I believe this change is incorrect.
>
>
> >  TI_PDK_SOURCE_PN = "ti-pdk-source"
> >  TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
> >  TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
> >
> > -S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
> > +S = "${WORKDIR}/git${TI_PDK_COMP_PATH}"
> >
> >  # Hard-link only required sources from PDK
> >  python do_unpack_append() {
> > --
> > 2.28.0
> >
>
> >
> > 
> >
>
>

--000000000000d439f705b19403f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 13, 2020 at 1:55 PM Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On Tue, Oct 13, 2020 at 11:36:41AM -0700, Khem Raj wro=
te:<br>
&gt; latest OE-core does not promote using trailing slash to make pseudo&#=
39;s<br>
&gt; life easier<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 classes/ti-pdk-fetch.bbclass | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbcl=
ass<br>
&gt; index 0c9879be..4261e86d 100644<br>
&gt; --- a/classes/ti-pdk-fetch.bbclass<br>
&gt; +++ b/classes/ti-pdk-fetch.bbclass<br>
&gt; @@ -9,13 +9,13 @@ PV =3D &quot;${TI_PDK_VERSION}&quot;<br>
&gt;=C2=A0 PE =3D &quot;2&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 TI_PDK_COMP ?=3D &quot;&quot;<br>
&gt; -TI_PDK_COMP_PATH =3D &quot;${@&#39;${TI_PDK_COMP}&#39;.replace(&#39;=
.&#39;,&#39;/&#39;)}&quot;<br>
&gt; +TI_PDK_COMP_PATH =3D &quot;/${@&#39;${TI_PDK_COMP}&#39;.replace(&#39=
;.&#39;,&#39;/&#39;)}&quot;<br>
<br>
This one I don&#39;t understand - even when TI_PDK_COMP is empty, <br>
TI_PDK_COMP_PATH will have a trailing slash, hence S below will <br>
have it too...</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">R=
ight I think I was thinking of ensuring that we can make conditional to hav=
e the slash always and then remove it from S which is missing=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I guess it needs to be solved d=
ifferently=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex" dir=3D"auto"><br>
<br>
Moreover, below in this class there&#39;s this line:<br>
<br>
src =3D os.path.join(d.getVar(&#39;TI_PDK_SOURCE&#39;),&#39;packages&#39;,=
d.getVar(&#39;TI_PDK_COMP_PATH&#39;))<br>
<br>
If TI_PDK_COMP_PATH starts with a leading slash, os.path.join treats <br>
it as absolute and the resulting &quot;src&quot; var will be completely wr=
ong.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is not =
going to be problem it will just use // in worst case=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
So, I believe this change is incorrect.<br>
<br>
<br>
&gt;=C2=A0 TI_PDK_SOURCE_PN =3D &quot;ti-pdk-source&quot;<br>
&gt;=C2=A0 TI_PDK_SOURCE_WORKDIR =3D &quot;${TMPDIR}/work-shared/ti-pdk-${=
PV}&quot;<br>
&gt;=C2=A0 TI_PDK_SOURCE =3D &quot;${TI_PDK_SOURCE_WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt; -S =3D &quot;${WORKDIR}/git/${TI_PDK_COMP_PATH}&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git${TI_PDK_COMP_PATH}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Hard-link only required sources from PDK<br>
&gt;=C2=A0 python do_unpack_append() {<br>
&gt; -- <br>
&gt; 2.28.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000d439f705b19403f7--
