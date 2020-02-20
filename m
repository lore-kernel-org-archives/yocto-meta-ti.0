Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.473.1582167447098799962
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 18:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oeHJNOrY;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id o28so2238654qkj.9
        for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zbLqtbA6CoL275e0CTdWWx/lBVU7vex1uhfYa+6Plgo=;
        b=oeHJNOrYFewvRRynByh2brsXkgFv/ihX0SgNPGhDoZzWCa+ZVigONwfyB118zt/2Ie
         gcRiH25cwRXl106QECZcWznfB47s5pRaGLZHP7UZyuIl8qPQwyIZ4AXbHHAzsg3Wqa3x
         0ouSSqamw0P8pgG5gQR7GGY//58SYdyMx/MO5Es0KLVJdmwFXYRy5iuybwX+R9tT2PXD
         9gDkozzsVU4MfR+waZri0ZjL0rBuaN1rml2LTHRMHtBKlUUCWV+xHte3Ne7I+tTUFmaa
         dgYKWIAIcmQlwgpv4L0ee+pR8y3eOvvyGQhTsn8ZGXk+tlCXCHaxv1Kb5H7MOzYAdr4a
         6SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zbLqtbA6CoL275e0CTdWWx/lBVU7vex1uhfYa+6Plgo=;
        b=eymo/Iu7DQBWRaYbFIM0/M7xL1uEyNXnAZnSGmm2QnLoyGsuGCbr/jE5c3F08Rmhr5
         3zJ5QKQuDI4/fxZGa63AIuBSkYjqgCqI9g5bJa8JF7J2TWysKkybP7CMP6Ca2k/66Ixv
         Z9LpaplfDfNw/jRGg22DfVBwxTsqkYgsnC9dE2ZawtTYV7K2fcneRoNqwkJzBmDM2hos
         Jr/Cl49VC9hTNrWzUzswbUO1ViTRh49JdILfFV2Ec+5YhUHXct+m+9lIFbdSGss2JKB4
         9UqRR+5RDLzooTqK9z8RiXeJDtKWnLtvVbzCo8icE8qp7C3eSzt6gVVOahQ/h+hex2kM
         ReCg==
X-Gm-Message-State: APjAAAXzYImfFHoCei9+c5oomdMd5CBtqfI9JJMTwWGuGYe2p6ZjH2La
	QY0uyVYrEzSkImYpmwPgiMQzX+kS2YuxEDJJDOQ=
X-Google-Smtp-Source: APXvYqwqRP+d/PNeprwKxpNMk7rYFJeEKSy6gImEeSBlYibZVPZXMdUFpWzjY/nZ9Hd6PTN82hFj5WJuQbZPWMmGN7o=
X-Received: by 2002:a37:e47:: with SMTP id 68mr3611814qko.17.1582167445997;
 Wed, 19 Feb 2020 18:57:25 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sqBztnkEciT045JbkeYyacjCe91b3FNCkv8k77DLEY=-g@mail.gmail.com>
 <20200212200811.GE30768@beryl> <CAMKF1sqGMyrWEx1phE5XuP2=7_uxeu6q7itMvhvBOvxYJP0Jaw@mail.gmail.com>
 <20200220024331.GD720@beryl>
In-Reply-To: <20200220024331.GD720@beryl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 19 Feb 2020 18:57:15 -0800
Message-ID: <CAMKF1sozF6qaHeO3kdq_y=YV_HL_+ZtSuSid41WvKC3Njn-Qpg@mail.gmail.com>
Subject: Re: ti-cgt6x bundling libc.a with unreadable ELF file header
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000980d07059ef9104c"

--000000000000980d07059ef9104c
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 6:43 PM Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Feb 12, 2020 at 02:19:38PM -0800, Khem Raj wrote:
> > On Wed, Feb 12, 2020 at 12:08 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Sun, Feb 09, 2020 at 10:26:44AM -0800, Khem Raj wrote:
> > > > Hi
> > > >
> > > > Recently, I am seeing below packaging error for ti-cgt6x
> > > >
> > > > https://errors.yoctoproject.org/Errors/Details/390526/
> > >
> > > Is this on master? Any specific configuration I should use to get this
> error?
> > > I don't think I've ever seen this before or lately...
> >
> > yes this is on qemuarm though, I find that it will be better to
> > disable it for non-ti socs
>
> Hmm, I still wonder why it's not breaking on ti-soc machines. May need to
> add
> INHIBIT_PACKAGE_DEBUG_SPLIT = "1", but I would like to reproduce the issue
> first, if possible...


I do not build ti-socs often and this change just shoved it off from
qemuarm builds I think with yoe distro you might get it for bbb as well


>
>
> > > > eu-readelf also fails to read this file as well as binutils readelf
> > > > also complains
> > > >
> > > > readelf: Error:
> > > >
> /mnt/b/yoe/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a(__TI_$$LIBINFO):
> > > > Failed to read file header
> > > >
> > > > this libc.a is a binary blob so I cant find out how it is. built so
> > > > pinpoint where the problem
> > > > could be.
> > > >
> > > > since these are DSP blobs should this be ignored from processing and
> > > > just dumped into rootfs
> > > > this will help packager turn a blind eye towards its contents or
> > > > should this be fixed and turned into
> > > > a readable ELF file by normal binutils. I doubt it being a problem
> > > > with tools, since I see same issue
> > > > with elfutils tools as well as binutils ELF manipulation tools.
> > > >
> > > > Thanks
> > > > -Khem
>

--000000000000980d07059ef9104c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 19, 2020 at 6:43 PM Denys Dmytriyenko &lt;<a hr=
ef=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Wed, Feb 12, 2020 at 02:19:38PM -0800, Khem Raj wrot=
e:<br>
&gt; On Wed, Feb 12, 2020 at 12:08 PM Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Feb 09, 2020 at 10:26:44AM -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; Hi<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Recently, I am seeing below packaging error for ti-cgt6x<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/39=
0526/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org=
/Errors/Details/390526/</a><br>
&gt; &gt;<br>
&gt; &gt; Is this on master? Any specific configuration I should use to get=
 this error?<br>
&gt; &gt; I don&#39;t think I&#39;ve ever seen this before or lately...<br>
&gt; <br>
&gt; yes this is on qemuarm though, I find that it will be better to<br>
&gt; disable it for non-ti socs<br>
<br>
Hmm, I still wonder why it&#39;s not breaking on ti-soc machines. May need =
to add <br>
INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;, but I would like to reproduc=
e the issue <br>
first, if possible...</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I do not build ti-socs often and this change just shoved it off from q=
emuarm builds I think with yoe distro you might get it for bbb as well=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
<br>
&gt; &gt; &gt; eu-readelf also fails to read this file as well as binutils =
readelf<br>
&gt; &gt; &gt; also complains<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; readelf: Error:<br>
&gt; &gt; &gt; /mnt/b/yoe/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleab=
i/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a(__TI_$$LIBINF=
O):<br>
&gt; &gt; &gt; Failed to read file header<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; this libc.a is a binary blob so I cant find out how it is. b=
uilt so<br>
&gt; &gt; &gt; pinpoint where the problem<br>
&gt; &gt; &gt; could be.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; since these are DSP blobs should this be ignored from proces=
sing and<br>
&gt; &gt; &gt; just dumped into rootfs<br>
&gt; &gt; &gt; this will help packager turn a blind eye towards its content=
s or<br>
&gt; &gt; &gt; should this be fixed and turned into<br>
&gt; &gt; &gt; a readable ELF file by normal binutils. I doubt it being a p=
roblem<br>
&gt; &gt; &gt; with tools, since I see same issue<br>
&gt; &gt; &gt; with elfutils tools as well as binutils ELF manipulation too=
ls.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; -Khem<br>
</blockquote></div></div>

--000000000000980d07059ef9104c--
