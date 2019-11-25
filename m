Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.1240.1574710805825662398
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 11:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHh026HH;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id q70so13876213qke.12
        for <meta-ti@lists.yoctoproject.org>; Mon, 25 Nov 2019 11:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZvjyfBXXsbvBnwOk7s6p6slzNg0Qjb4qtblTwKTDNHE=;
        b=LHh026HHuRAdfjEU33l3hRZ2wDVcIrfk9Y7IZuhJssK6+AGiUI3uYZvyoSa/hlJQvT
         MusN/ps55G+CDmkGd3aURB/kicuA8hSSXB0sdSZ/li+pvW6bHWJ+PIIJd14Ax8Pd4Wab
         KrcqjYQdeMH+9Zw2taZwFmBT6MHPvM5nmWutXCsoODY9n/O2L59xew72LKMRvgA2C2u1
         PMyuGcXSkKJqqAaBYmA1ba13Bl4QbMjOdWkP+aXdsAnrcHcOuEyiXJi/d7Oqiz2MUec6
         EttoXh4K6lVkENDxBwIP8gZqVY5b2OuSx8Z+5Kp3o4lF9efaXui4Xwqdgc78BBqYpnJq
         bdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZvjyfBXXsbvBnwOk7s6p6slzNg0Qjb4qtblTwKTDNHE=;
        b=ufQlBl+I0Aw1OzmC/DgPmS2FT8nnvjlea29+DqLPQpvJhZ+rSnw+8Dlrx333oHblNg
         KNlFKQs3aX3sZg/2J4fnFIWAMHfoeyNxlFB9xemEmApMUXJdqI5YkKlws+eb8h1+s1uB
         zmCC1ac0wbFSiKz34Tw5vsDufa6XgeVGrHMIWG44b4tCUjRiBf92ewIamB55jZvVWaQi
         e/e3xtAlkE359Jgc3xXUWU3WXk4PUihuzCkxW16w110ZUu7/tv56eYNFDVUtvLkcQWw3
         B+Z+odpTc/dIinXgKkJe7tw3K4ZykiLuUCEmtoBe+h2Bm9xgd+K0MlzlFNhjYY/ffDBj
         NQig==
X-Gm-Message-State: APjAAAXzR7HYHSJeS7dUYjQy17D42Hluf81XfA7OO6L6vNf57UVFT9vX
	RIMzdzysUU8u4jy2ns8RbC0CtPwpR58VHq4JEKo=
X-Google-Smtp-Source: APXvYqw4VncbuOhYno1Ow0DIjZaa0/wTZeMabk65+656xOaLxKcBOKOJHJbWER+z3GFwDLxzCWUlffD4q5CgfeheZb0=
X-Received: by 2002:a37:4bc2:: with SMTP id y185mr28734697qka.474.1574710804355;
 Mon, 25 Nov 2019 11:40:04 -0800 (PST)
MIME-Version: 1.0
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com> <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
 <20191125174203.GC4706@beryl> <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
 <CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com>
 <c7b182ec-858d-43b2-7caf-9f12a7fe67d6@ti.com> <CAMKF1spOAJ5fA2DZqra_VCB9HwGTijVuFuhifCTh1yRtZXEJ2g@mail.gmail.com>
 <20191125193247.GE4706@beryl>
In-Reply-To: <20191125193247.GE4706@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 25 Nov 2019 11:39:53 -0800
Message-ID: <CAMKF1sptBNViv0--MYRwVapx7cseMD0-wmG-_DLXC0O4sSsFJA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
To: denys@ti.com
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001e233b059830ee3d"

--0000000000001e233b059830ee3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Certainly seems interesting

On Mon, Nov 25, 2019 at 11:32 AM Denys Dmytriyenko via
Lists.Yoctoproject.Org <denys=3Dti.com@lists.yoctoproject.org> wrote:

> Would hard-linking be any better? Will need to recursively hard-link all
> the
> files in a specific directory, but may be faster and less IO-intensive
> than
> copying or tarring/untarring all the files?
>
> --
> Denys
>
>
> On Mon, Nov 25, 2019 at 11:24:12AM -0800, Khem Raj wrote:
> > Ideally I agree it=E2=80=99s best to have per component git repos
> > But traditional SDKs have been monolithic
> >
> > On Mon, Nov 25, 2019 at 10:50 AM Jacob Stiffler <j-stiffler@ti.com>
> wrote:
> >
> > >
> > > On 11/25/2019 1:16 PM, Khem Raj wrote:
> > >
> > > On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <j-stiffler@ti.com> <
> j-stiffler@ti.com> wrote:
> > >
> > > On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
> > >
> > > On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
> > >
> > > On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
> > >
> > > Recently individual components and LLD sources have been combined
> > > into a single PDK repo. Use this class to specify the common source.
> > > Also use this class to keep the sources separate from each other when
> > > building. This keeps the build identical to previous recipes while
> > > keeping control on interdependencies.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com> <j-stiffler@ti.com>
> > > ---
> > >
> > > ...
> > >
> > > +# Extract only required sources from PDK
> > > +python do_unpack_append() {
> > > +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> > > +        import subprocess
> > > +
> > > +        src =3D
> > > os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
> > > PATH'))
> > > +
> > > +        # Package up only the required sources
> > > +        cmd =3D 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
> > > d.getVar('S'))
> > > +        subprocess.check_output(cmd, shell=3DTrue,
> > > stderr=3Dsubprocess.STDOUT)
> > > +
> > > +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=3DTrue)
> > > +}
> > >
> > > perhaps looking in work-shared idea from kernel or gcc or clang
> > > packages could make it better where, you only untar sources once
> > >
> > > Jake,
> > >
> > > Any updates on this - will you be looking into the above suggestion?
> > >
> > > I had originally considered this approach, but decided against it so
> > > that there would be no way a recipe could access other sources in the
> > > pdk.git.
> > >
> > > It may be a bit paranoid, but the work-shared approach would make the
> > > entire pdk sources available through a ti-pdk-fetch variable. I wante=
d
> > > it so that the entire pdk.git will never be unpacked in its entirety.
> > >
> > > disk operations are not cheap, so you could save a lot by
> > > having a monorepo. Is it due to access perms ? then its a single
> > > tarballs you cant have ACLs. I am still not convinced if monorepo
> > > approach has downsides, plus its a known approach elsewhere so
> > > will be easy on users.
> > >
> > > We wanted to have this safety net to make sure that this pdk.git does
> not
> > > end up as spaghetti code. So this method was devised to ensure that
> only a
> > > single component's sources and its DEPENDS are available during
> > > compilation.
> > >
> > > It may be acceptable to clone to the work-shared path, and then symli=
nk
> > > the specific directory into the WORKDIR. But we will need to remain
> > > vigilant so that work-shared path is never referenced in the recipe.
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > >
> > > View/Reply Online (#12528):
> https://lists.yoctoproject.org/g/meta-ti/message/12528
> > > Mute This Topic: https://lists.yoctoproject.org/mt/61321552/3619770
> > > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [
> j-stiffler@ti.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#12531):
> https://lists.yoctoproject.org/g/meta-ti/message/12531
> Mute This Topic: https://lists.yoctoproject.org/mt/61945973/1997914
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--0000000000001e233b059830ee3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><div dir=3D"auto">Certainly seems interesting=C2=A0</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Nov 25, 2019 at 11:32 AM Denys Dmytriyenko via <a href=3D"http://Lists.=
Yoctoproject.Org">Lists.Yoctoproject.Org</a> &lt;denys=3D<a href=3D"mailto:=
ti.com@lists.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Would hard-linking be any better? =
Will need to recursively hard-link all the <br>
files in a specific directory, but may be faster and less IO-intensive than=
 <br>
copying or tarring/untarring all the files?<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Mon, Nov 25, 2019 at 11:24:12AM -0800, Khem Raj wrote:<br>
&gt; Ideally I agree it=E2=80=99s best to have per component git repos<br>
&gt; But traditional SDKs have been monolithic<br>
&gt; <br>
&gt; On Mon, Nov 25, 2019 at 10:50 AM Jacob Stiffler &lt;<a href=3D"mailto:=
j-stiffler@ti.com" target=3D"_blank">j-stiffler@ti.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; On 11/25/2019 1:16 PM, Khem Raj wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler &lt;<a href=3D"ma=
ilto:j-stiffler@ti.com" target=3D"_blank">j-stiffler@ti.com</a>&gt; &lt;<a =
href=3D"mailto:j-stiffler@ti.com" target=3D"_blank">j-stiffler@ti.com</a>&g=
t; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:<br>
&gt; &gt;<br>
&gt; &gt; Recently individual components and LLD sources have been combined=
<br>
&gt; &gt; into a single PDK repo. Use this class to specify the common sour=
ce.<br>
&gt; &gt; Also use this class to keep the sources separate from each other =
when<br>
&gt; &gt; building. This keeps the build identical to previous recipes whil=
e<br>
&gt; &gt; keeping control on interdependencies.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jacob Stiffler &lt;<a href=3D"mailto:j-stiffler@ti=
.com" target=3D"_blank">j-stiffler@ti.com</a>&gt; &lt;<a href=3D"mailto:j-s=
tiffler@ti.com" target=3D"_blank">j-stiffler@ti.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; ...<br>
&gt; &gt;<br>
&gt; &gt; +# Extract only required sources from PDK<br>
&gt; &gt; +python do_unpack_append() {<br>
&gt; &gt; +=C2=A0 =C2=A0 if len(d.getVar(&#39;TI_PDK_COMP&#39;) or &#39;&#3=
9;) &gt; 0:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D<br>
&gt; &gt; os.path.join(d.getVar(&#39;TI_PDK_SRC&#39;),&#39;packages&#39;,d.=
getVar(&#39;TI_PDK_COMP_<br>
&gt; &gt; PATH&#39;))<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Package up only the required sourc=
es<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;tar -cf - -C %s -p -S .=
 | tar -xf - -C %s&#39; % (src,<br>
&gt; &gt; d.getVar(&#39;S&#39;))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(cmd, shell=
=3DTrue,<br>
&gt; &gt; stderr=3Dsubprocess.STDOUT)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(d.getVar(&#39;TI_PDK=
_SRC&#39;), recurse=3DTrue)<br>
&gt; &gt; +}<br>
&gt; &gt;<br>
&gt; &gt; perhaps looking in work-shared idea from kernel or gcc or clang<b=
r>
&gt; &gt; packages could make it better where, you only untar sources once<=
br>
&gt; &gt;<br>
&gt; &gt; Jake,<br>
&gt; &gt;<br>
&gt; &gt; Any updates on this - will you be looking into the above suggesti=
on?<br>
&gt; &gt;<br>
&gt; &gt; I had originally considered this approach, but decided against it=
 so<br>
&gt; &gt; that there would be no way a recipe could access other sources in=
 the<br>
&gt; &gt; pdk.git.<br>
&gt; &gt;<br>
&gt; &gt; It may be a bit paranoid, but the work-shared approach would make=
 the<br>
&gt; &gt; entire pdk sources available through a ti-pdk-fetch variable. I w=
anted<br>
&gt; &gt; it so that the entire pdk.git will never be unpacked in its entir=
ety.<br>
&gt; &gt;<br>
&gt; &gt; disk operations are not cheap, so you could save a lot by<br>
&gt; &gt; having a monorepo. Is it due to access perms ? then its a single<=
br>
&gt; &gt; tarballs you cant have ACLs. I am still not convinced if monorepo=
<br>
&gt; &gt; approach has downsides, plus its a known approach elsewhere so<br=
>
&gt; &gt; will be easy on users.<br>
&gt; &gt;<br>
&gt; &gt; We wanted to have this safety net to make sure that this pdk.git =
does not<br>
&gt; &gt; end up as spaghetti code. So this method was devised to ensure th=
at only a<br>
&gt; &gt; single component&#39;s sources and its DEPENDS are available duri=
ng<br>
&gt; &gt; compilation.<br>
&gt; &gt;<br>
&gt; &gt; It may be acceptable to clone to the work-shared path, and then s=
ymlink<br>
&gt; &gt; the specific directory into the WORKDIR. But we will need to rema=
in<br>
&gt; &gt; vigilant so that work-shared path is never referenced in the reci=
pe.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;<br>
&gt; &gt; View/Reply Online (#12528): <a href=3D"https://lists.yoctoproject=
.org/g/meta-ti/message/12528" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-ti/message/12528</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/613=
21552/3619770" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/61321552/3619770</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject=
.org" target=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/=
g/meta-ti/unsub</a>=C2=A0 [<a href=3D"mailto:j-stiffler@ti.com" target=3D"_=
blank">j-stiffler@ti.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
<br>
View/Reply Online (#12531): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/12531" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/12531</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/61945973/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/61945973/1997914</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a>=C2=A0 [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--0000000000001e233b059830ee3d--
