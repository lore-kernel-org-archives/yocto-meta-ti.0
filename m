Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6405.1793912768727825145
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=JsCa3kjx;
 spf=pass (domain: criticallink.com, ip: 209.85.128.177, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso23196537b3.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 05 Nov 2026 13:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912767; cv=none;
        d=google.com; s=arc-20260327;
        b=gAcKVHXEhx5U1ofyLEGARsA1w8ASqSkl2H86zNCea0lQ43YRBEf4yV7Enrdk/Xd6Jp
         NcoVI0MhyGl77XlYeuWGgOA8vY4o0+fSQKDnKmduBlYE9BwPpR7iuqN9Y14JqXS1dLxY
         b8j1hM3htbkYaxZ0QuSfOEZhkcChPRXZ2Od/8BgyqyzQehmFsggaQZbJ67ukIo4yql+Z
         xO61xxmdQJbdPzqEPrql3EwLtgNdZ7oGKDhDuVBaOZ5Md01guOULBxy3Jok94hhhLfOX
         N91kIj4uN3GZFwcIP7ztVsd1CPKA+WaT4+iK6cxwIIC82VK6lmAT3uQEKrjWP3JLOEPH
         Ehog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dY2CyckIQwQlKZ6bfzHCVEzgiCJWSHPzn12g4MBSkh4=;
        fh=/KNaWlTwIEuuLQG18s53dzAH+rzjQdvGxOk/PyEb748=;
        b=X96Xmrj4QP1cv1fMlQIHgEItJUPAu6+gIDv7TQGUNK+psHdrL8N21MtuGrXWR11H1T
         OSgo3Pqe0ynSk4ZcNTNcDZipbjkm+OjzaABFawayGrCXKhs0Gl54x51UJ7k/F0dfTTiT
         gV9HkXNTR5vpYxi7hGqUyw7uv4fG2dsdgQBwxckUKmzwpB0nmwcizE6PozX3fPG3lmck
         ryPHzd5qO1LrUdVwTZ3AXkMqXWHJR0wnm0H7g/StjHG1aCjNrKkyFaZWFdBm4VrXXkjM
         JTeSpKKGwNX00kEWSRnYimDxrk+tp4teSLzagwdGtpj1+rB2Yi0npvc1+gqHqMur2+Qd
         BKYg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1793912767; x=1794517567; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY2CyckIQwQlKZ6bfzHCVEzgiCJWSHPzn12g4MBSkh4=;
        b=JsCa3kjx9zlvW27jFs20VDXL+EJaZiDwZ1YkM16w9fdSTnUePpe+8TdYJXI2OfsMJ7
         axufcD0m5Xne+OtX75Y1KZd4bvj6aHjHstD368cOckwOHHmWdX90YJOSjb/rxl9DYem3
         FM2SDF+4DNsejZov/kDcma79uGDA0T0JFipo4Klzs9gaPO9YE+MhQCq0tUzrrEeBlUpG
         CRwbDWspicayJi0xLAK6PofgbFdQemyhiAt1l6MWi3qLotwF5Md+9nvX5pakGnvFrN3N
         QKJsSYbzBMUH7K4lsdycJ7WjYNFmXDK+883j7gILvGsqEpYTuHrG8P+YK0Pfrzv6U3bg
         Dx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912767; x=1794517567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dY2CyckIQwQlKZ6bfzHCVEzgiCJWSHPzn12g4MBSkh4=;
        b=tJSV6YkCzfp03R52QyGunAxthY4bzc0Y0ZvKxLl6KP6tT/stQbOwueg0uW8+dW4QWv
         Tf+H73so//OJzCfa6L/yU4C/CeliE4nF6QdyjsBBkfnqJZRulC2fxvw9FqO/hiVWQNOU
         rf14mBEgWgquw9iOxMNX6TQYyclB9/k4AFSxgmHVnN2NPifgvQRzrwqYUfial+HABEdD
         47Ywz3KRU+6agzA+jjUkRx3wsXFPIat89FzBc9yFxfHusXhjtt+tjjYcaL0Pxs3CCfuM
         H/yxHMiY/RVNzrEEXQAninhHIxQs8tsGbujBA8gSYKOx0BRxaFfkn1+pbpEuqkzBjihN
         /08w==
X-Forwarded-Encrypted: i=1; AL+hErHOzwqA3Nlo97pMeO/3KkoC3E8WQ0qWdROuRjVUF020NgXq9vgWi0W4oBwJ+wa3Xjh3axMRJG+O@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z8L+9tlKj+9EYiy3lc3xWHO4Ep1y4M5TC/u2IJ6jtQt99g2inRk
	aLC2EuX9Dhlsn1v0rHXGpTaxPWHZU3uxrXqNqtwXtWyXgs2qIJRPKKPQDQ7JQwQ4VcVz3UPyppI
	tfEgGLoJ5KiqvhQhYI+B3SmeojbPsH+OItdX55y8ZUPeoUVoX9HvgTi9A
X-Gm-Gg: AYBFou0H8cjo+ZrY/cVb2SoLIaN9T2z9CEmk9l2qiwPgJBLPjA+bfNPhY+U8R3uel0b
	yE5OIJz5rzQHFQlwcHDGUMpnne2Tt2Sa/LNlpbe6IV8RfeKoTnBVsetVFlXX9jUYaLBRo76E0jI
	lGZJU2H0u+dY26j40L4hy281rDfZpqMwFt2gAbIrP0otBU04Zl1ClJNXMXkglJTdRZfKOACyDmg
	H+o7BirnY1AQYxLoZKkPeeznWxrv6JckFOh6lCxRuoPVVqrPYgcCP02dJb1fJ1c1Z+lRKE6QkGq
	QconSU9A7ydlJIar+mGRHUMqj5iIJ6oXwhomVunLBDarCdtxT6yEVMlB5nS/FG2b4Dw0JdiOm2H
	+wIYSOlsBXGAaOwHP3Y/VX9Om0OXiUrtKfBzugiXu3aj6tF5wiJnr9lHt
X-Received: by 2002:a05:690c:24c:b0:8b0:d9a6:dbcd with SMTP id
 00721157ae682-8b341ac9febmr1443087b3.48.1793912767125; Thu, 05 Nov 2026
 13:06:07 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
 <20261105162117.GA4190@denix.org>
In-Reply-To: <20261105162117.GA4190@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 5 Nov 2026 16:05:55 -0500
X-Gm-Features: AclHuK9CU617empIy8hztvyDeqR9KYvUyXAPS2zh9hOpb64bA8ncsfNGq7LVUwc
Message-ID: <CADL8D3ae7wvRTi-zFidu0t9fbgfksrv5UKrYiY2_fVDG3tP4nA@mail.gmail.com>
Subject: Re: [meta-ti] Unable to clone or fetch from git.ti.com
To: denis@denix.org
Cc: "Theodore A. Roth" <troth@openavr.org>, meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003e2f5d065f8ddd51"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:06:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20509

--0000000000003e2f5d065f8ddd51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ipcdev repo does not seem to have a github mirror, so my am57x builds
are failing.

$ git clone https://git.ti.com/git/ipc/ipcdev.git
Cloning into 'ipcdev'...
error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
fatal: expected 'packfile'


On Thu, Nov 5, 2026 at 11:21=E2=80=AFAM Denys Dmytriyenko via meta-ti <deni=
s=3D
denix.org@lists.yoctoproject.org> wrote:

> Yes, git.ti.com is periodically under heavy AI bot crawlers attack and
> sometimes goes down.
>
> But meta-ti-bsp already sets up MIRRORS to point to github, where TI core
> repos, like kernel and u-boot, are mirrored. This works for most users
> automatically and doesn't break.
>
> The error you are seeing is because you heve your own PREMIRRORS (e.g.
> using
> own-mirrors.bbclass), which contains an older clones of those repos and
> hence
> bitbake tries to use those, instead of falling back to MIRRORS, and can't
> find
> the required SRCREV:
>
> | Error: UnpackError('No up to date source found: clone directory not
> available or not up to date:
> |
> /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linux-=
kernel.git
>
>
> You can disable your PREMIRRORS temporarily and re-fetch affected
> components,
> then you can re-enable it back.
>
> Please note that there are a few other TI repos, mostly used in
> meta-ti-extras
> and meta-ti-tests, which are not mirrored on github, but they haven't bee=
n
> updated in a while, so your existing copies from your PREMIRRORS should b=
e
> fine.
>
>
> On Thu, Nov 05, 2026 at 07:47:28AM -0700, Theodore A. Roth wrote:
> > Hi All,
> >
> > We started seeing errors in our yocto builds using meta-ti when
> > building the latest linux-ti-staging-6.18.59+git-r0 from wrynose.
> >
> > It appears that we can't clone or fetch from git.ti.com:
> >
> >     $ git clone https://git.ti.com/git/ti-u-boot/ti-u-boot.git
> >     Cloning into 'ti-u-boot'...
> >     error: RPC failed; HTTP 501 curl 22 The requested URL returned
> error: 501
> >     fatal: expected 'packfile'
> >
> >     $ git clone
> https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git
> >     Cloning into 'ti-linux-kernel'...
> >     error: RPC failed; HTTP 501 curl 22 The requested URL returned
> error: 501
> >    fatal: expected 'packfile'
> >
> > I have tried this both at home and in our offices (to check that corp
> > firewall is not the issue).
> >
> > Here's the relevant output from bitbake:
> >
> >     $ bitbake virtual/kernel
> >     ...
> >     Build Configuration:
> >     BB_VERSION           =3D "2.18.0"
> >     BUILD_SYS            =3D "x86_64-linux"
> >     NATIVELSBSTRING      =3D "universal"
> >     TARGET_SYS           =3D "arm-trimble-linux-gnueabi"
> >     MACHINE              =3D "judo-hs-prod"
> >     SDKMACHINE           =3D "x86_64"
> >     DISTRO               =3D "trmb-judo"
> >     DISTRO_VERSION       =3D "1.1.1.dev20261104171417"
> >     TUNE_FEATURES        =3D "arm armv7a vfp thumb neon
> callconvention-hard"
> >     meta                 =3D
> "HEAD:ae5a301091f5b0574ea7444aab40b309b6d9f3f2"
> >     meta-poky            =3D
> "HEAD:79b6d87030178bed0088ad3b00aa6dfbabac37c4"
> >     meta-oe
> >     meta-initramfs
> >     meta-filesystems
> >     meta-python
> >     meta-networking
> >     meta-webserver       =3D
> "HEAD:c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e"
> >     meta-virtualization  =3D
> "HEAD:18d58082b2458cf85438ac6e0f2f1fd0153318cb"
> >     meta-arm-toolchain
> >     meta-arm             =3D
> "HEAD:673e8d7c5dcd14de58092eb73e6ecc5eee5c1735"
> >     meta-ti-bsp
> >     meta-ti-extras       =3D
> "HEAD:066a7c440c0b241bca045133ec8cb5e506d49d98"
> >     meta-clang           =3D
> "HEAD:ef0d22f21910a0c30c967eeb17d8f209806e2d81"
> >     meta-rauc            =3D
> "HEAD:38da0e5866a953e664001ba90b5edad68d68cd5d"
> >     meta-bedrock
> >     meta-bedrock-rauc
> >     meta-bedrock-yubi    =3D
> "HEAD:6c7b0bafe7b7d0871eb8c67ad467c845ccf6b1b9"
> >     meta-judo            =3D
> "HEAD:d32ad65582a763e9a682d19d0c6e6f93e9233c1a"
> >     meta-judo-bsp        =3D
> "HEAD:5dee33952a5fcb456045fb0598f3af59c66b65e6"
> >     meta-judo-proprietary =3D
> "HEAD:75867ed0ea3fdf9943ec4bc9346835c6d099e119"
> >
> >     Sstate summary: Wanted 110 Local 3 Mirrors 0 Missed 107 Current
> > 167 (2% match, 61% complete)
> >     ...
> >     NOTE: Executing Tasks
> >     WARNING: linux-ti-staging-6.18.59+git-r0 do_fetch: Failed to fetch
> > URL git://
> git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dhttps;branc=
h=3Dti-linux-6.18.y
> ,
> > attempting MIRRORS if available
> >     ERROR: linux-ti-staging-6.18.59+git-r0 do_unpack: Bitbake Fetcher
> > Error: UnpackError('No up to date source found: clone directory not
> > available or not up to date: \
> >
>  /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linux=
-kernel.git;
> > shallow clone not enabled',
> > 'git://
> git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dhttps;branc=
h=3Dti-linux-6.18.y
> ')
> >     ERROR: Logfile of failure stored in:
> >
> /home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_prod-=
trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.51741=
4
> >     ERROR: Task
> >
> (/home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta-ti=
-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:
> do_unpack)
> > failed with exit code '1'
> >
> >     Summary: 1 task failed:
> >
>  /home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta-ti=
-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:
> do_unpack
> >         log:
> /home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_prod-=
trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.51741=
4
> >     Summary: There was 1 WARNING message.
> >     Summary: There was 1 ERROR message, returning a non-zero exit code.
> >
> > Wondering if anyone else is seeing this.
> >
> > The only workaround I have at the moment is to use the github mirror:
> >
> >     https://github.com/TexasInstruments/ti-linux-kernel.git
> >
> > Thanks,
> >
> > Ted Roth
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20508):
> https://lists.yoctoproject.org/g/meta-ti/message/20508
> Mute This Topic: https://lists.yoctoproject.org/mt/122110829/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

--0000000000003e2f5d065f8ddd51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The ipcdev repo does not seem to have a github mirror=
, so my am57x builds are failing.</div><div><br></div><div>$ git clone <a h=
ref=3D"https://git.ti.com/git/ipc/ipcdev.git">https://git.ti.com/git/ipc/ip=
cdev.git</a><br>Cloning into &#39;ipcdev&#39;...<br>error: RPC failed; HTTP=
 501 curl 22 The requested URL returned error: 501<br>fatal: expected &#39;=
packfile&#39;<br><br></div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 5, 2026 at 11:=
21=E2=80=AFAM Denys Dmytriyenko via meta-ti &lt;denis=3D<a href=3D"mailto:d=
enix.org@lists.yoctoproject.org">denix.org@lists.yoctoproject.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Yes, <a hr=
ef=3D"http://git.ti.com" rel=3D"noreferrer" target=3D"_blank">git.ti.com</a=
> is periodically under heavy AI bot crawlers attack and <br>
sometimes goes down.<br>
<br>
But meta-ti-bsp already sets up MIRRORS to point to github, where TI core <=
br>
repos, like kernel and u-boot, are mirrored. This works for most users <br>
automatically and doesn&#39;t break.<br>
<br>
The error you are seeing is because you heve your own PREMIRRORS (e.g. usin=
g <br>
own-mirrors.bbclass), which contains an older clones of those repos and hen=
ce <br>
bitbake tries to use those, instead of falling back to MIRRORS, and can&#39=
;t find <br>
the required SRCREV:<br>
<br>
| Error: UnpackError(&#39;No up to date source found: clone directory not a=
vailable or not up to date:<br>
| /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-linux-=
kernel.git<br>
<br>
<br>
You can disable your PREMIRRORS temporarily and re-fetch affected component=
s, <br>
then you can re-enable it back.<br>
<br>
Please note that there are a few other TI repos, mostly used in meta-ti-ext=
ras <br>
and meta-ti-tests, which are not mirrored on github, but they haven&#39;t b=
een <br>
updated in a while, so your existing copies from your PREMIRRORS should be =
<br>
fine.<br>
<br>
<br>
On Thu, Nov 05, 2026 at 07:47:28AM -0700, Theodore A. Roth wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; We started seeing errors in our yocto builds using meta-ti when<br>
&gt; building the latest linux-ti-staging-6.18.59+git-r0 from wrynose.<br>
&gt; <br>
&gt; It appears that we can&#39;t clone or fetch from <a href=3D"http://git=
.ti.com" rel=3D"noreferrer" target=3D"_blank">git.ti.com</a>:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ git clone <a href=3D"https://git.ti.com/git/ti-u-=
boot/ti-u-boot.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com=
/git/ti-u-boot/ti-u-boot.git</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Cloning into &#39;ti-u-boot&#39;...<br>
&gt;=C2=A0 =C2=A0 =C2=A0error: RPC failed; HTTP 501 curl 22 The requested U=
RL returned error: 501<br>
&gt;=C2=A0 =C2=A0 =C2=A0fatal: expected &#39;packfile&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ git clone <a href=3D"https://git.ti.com/git/ti-li=
nux-kernel/ti-linux-kernel.git" rel=3D"noreferrer" target=3D"_blank">https:=
//git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Cloning into &#39;ti-linux-kernel&#39;...<br>
&gt;=C2=A0 =C2=A0 =C2=A0error: RPC failed; HTTP 501 curl 22 The requested U=
RL returned error: 501<br>
&gt;=C2=A0 =C2=A0 fatal: expected &#39;packfile&#39;<br>
&gt; <br>
&gt; I have tried this both at home and in our offices (to check that corp<=
br>
&gt; firewall is not the issue).<br>
&gt; <br>
&gt; Here&#39;s the relevant output from bitbake:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ bitbake virtual/kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Build Configuration:<br>
&gt;=C2=A0 =C2=A0 =C2=A0BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;2.18.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;x86_64-linux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;unive=
rsal&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;arm-trimble-linux-gnueabi&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;judo-hs-prod&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0SDKMACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;x86_64&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;trmb-judo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;=
1.1.1.dev20261104171417&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;=
arm armv7a vfp thumb neon callconvention-hard&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;HEAD:ae5a301091f5b0574ea7444aab40b309b6d9f3f2&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;HEAD:79b6d87030178bed0088ad3b00aa6dfbabac37c4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-oe<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-filesystems<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-python<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-networking<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-webserver=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;=
HEAD:c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-virtualization=C2=A0 =3D &quot;HEAD:18d58082b2=
458cf85438ac6e0f2f1fd0153318cb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-arm-toolchain<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-arm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;HEAD:673e8d7c5dcd14de58092eb73e6ecc5eee5c1735&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-ti-bsp<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-ti-extras=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;=
HEAD:066a7c440c0b241bca045133ec8cb5e506d49d98&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-clang=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;HEAD:ef0d22f21910a0c30c967eeb17d8f209806e2d81&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-rauc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;HEAD:38da0e5866a953e664001ba90b5edad68d68cd5d&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-bedrock<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-bedrock-rauc<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-bedrock-yubi=C2=A0 =C2=A0 =3D &quot;HEAD:6c7b0=
bafe7b7d0871eb8c67ad467c845ccf6b1b9&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-judo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;HEAD:d32ad65582a763e9a682d19d0c6e6f93e9233c1a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-judo-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;=
HEAD:5dee33952a5fcb456045fb0598f3af59c66b65e6&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-judo-proprietary =3D &quot;HEAD:75867ed0ea3fdf=
9943ec4bc9346835c6d099e119&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Sstate summary: Wanted 110 Local 3 Mirrors 0 Missed=
 107 Current<br>
&gt; 167 (2% match, 61% complete)<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Executing Tasks<br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: linux-ti-staging-6.18.59+git-r0 do_fetch: =
Failed to fetch<br>
&gt; URL git://<a href=3D"http://git.ti.com/git/ti-linux-kernel/ti-linux-ke=
rnel.git;protocol=3Dhttps;branch=3Dti-linux-6.18.y" rel=3D"noreferrer" targ=
et=3D"_blank">git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=
=3Dhttps;branch=3Dti-linux-6.18.y</a>,<br>
&gt; attempting MIRRORS if available<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: linux-ti-staging-6.18.59+git-r0 do_unpack: B=
itbake Fetcher<br>
&gt; Error: UnpackError(&#39;No up to date source found: clone directory no=
t<br>
&gt; available or not up to date: \<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-=
linux-kernel.ti-linux-kernel.git;<br>
&gt; shallow clone not enabled&#39;,<br>
&gt; &#39;git://<a href=3D"http://git.ti.com/git/ti-linux-kernel/ti-linux-k=
ernel.git;protocol=3Dhttps;branch=3Dti-linux-6.18.y" rel=3D"noreferrer" tar=
get=3D"_blank">git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=
=3Dhttps;branch=3Dti-linux-6.18.y</a>&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Logfile of failure stored in:<br>
&gt; /home/troth/work/judo/judo-main-next/build-hs-prod/tmp/work/judo_hs_pr=
od-trimble-linux-gnueabi/linux-ti-staging/6.18.59+git/temp/log.do_unpack.51=
7414<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Task<br>
&gt; (/home/troth/work/judo/judo-main-next/build-hs-prod/../oe/meta-ti/meta=
-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:do_unpack)<br>
&gt; failed with exit code &#39;1&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/home/troth/work/judo/judo-main-next/build-h=
s-prod/../oe/meta-ti/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18=
.bb:do_unpack<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log: /home/troth/work/judo/judo-main-=
next/build-hs-prod/tmp/work/judo_hs_prod-trimble-linux-gnueabi/linux-ti-sta=
ging/6.18.59+git/temp/log.do_unpack.517414<br>
&gt;=C2=A0 =C2=A0 =C2=A0Summary: There was 1 WARNING message.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Summary: There was 1 ERROR message, returning a non=
-zero exit code.<br>
&gt; <br>
&gt; Wondering if anyone else is seeing this.<br>
&gt; <br>
&gt; The only workaround I have at the moment is to use the github mirror:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/TexasInstruments/ti-l=
inux-kernel.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/Te=
xasInstruments/ti-linux-kernel.git</a><br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Ted Roth<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#20508): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/20508" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/20508</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/122110829/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/122110829/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div><div><div><div><div><div>Jonathan Cormier<br>Senio=
r Software Engineer<br><br>Office: =C2=A0315.425.4045 x222</div><div><img s=
rc=3D"https://www.criticallink.com/wp-content/uploads/critical-link-logo-em=
ail.png"><br></div><div><div><a href=3D"http://www.criticallink.com/" targe=
t=3D"_blank">http://www.CriticalLink.com</a></div></div></div>6712 Brooklaw=
n Parkway, Syracuse, NY 13211 </div></div></div></div></div><br></div></div=
>

--0000000000003e2f5d065f8ddd51--
