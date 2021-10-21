Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.1106.1634837691850214572
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 10:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AVwV413+;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: r10kindsofpeople@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id r6so1802273oiw.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Oct 2021 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=0BHl+tOIf5gzVwC5O4vqhhFp/705enBAblbbqO8ouVo=;
        b=AVwV413+Am959SMnuaoQYwTE8Qtu89wBdQmD56ZjUBjbFV45m3rcJfZyInl6a7Z6Fj
         a2mNh0jsFntey/79WyM1ob8YyNe4JtRuSHPNgdXQ395+Tn9dT3U04cFwA9tkjV7Dzr1K
         e+WOdrq7nR60fQgtK131vyPB7774L+gmuxtYyPnSZ5DugOQt+ZXkcl3VBBthUNPTAz8X
         hKb9/HHm0Sk/1SV/Z6HzrbNVHT4Wm7OmJAiLQdyauaGNQuC5RS5dYkZwOaUcTzpZL3Hk
         ZU18DiT2mIGH7rRPhI37fdDW2DL0h46CCPIdJAEcsRkTjAORNe7HllM3JRMhmguoHF9u
         DT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0BHl+tOIf5gzVwC5O4vqhhFp/705enBAblbbqO8ouVo=;
        b=vIJH1JveGt/JRMRRb94bKDHo0d05fUn24I+kku/qqHh1RqzAWxd5HoCGMhUfTYyrqm
         7wF9QjTN3Wz7kQ91F36ZZUrpi6aGvXFva2E4d9WzpwrU9H+ucNkP1I7IjrvpM1RFM5lj
         y8KzAYXrSdnfSBYmwEGU8zbMGNg3U7ghfke4VmyYI/dptb56x9TZlmQdpv6YtHmHzbF4
         zWJ5bEiNxBSwlizk/7x4XX3DaFC6swZVQcNO443kjSFyWZ5EHjwxds2UTdX/tAUnCxwW
         eN9QbTvDAGaal+t5lhbKPYsWCKB2GqvLShJv9So0beXiVvpZOS4kGkdlNp8UF1lVfBOP
         O4dQ==
X-Gm-Message-State: AOAM53093g8ZyrCuvQyFKo+8oLnpSHvRDmzoUL0LYiKaQtuNlqnyHdc7
	jyBEbWdAXhMH6TrIGxNk94ayvfsADFY5rEsh9aCztXr5DAM=
X-Google-Smtp-Source: ABdhPJzJ3GJECHK4+X0plH8gjGMlh3+f9M0QjyBMZXn3EaDQ6xxtqSNSJ3y4neDhFBBG9kPm7fkh7FxoiLM+Axs2IYg=
X-Received: by 2002:a05:6808:130d:: with SMTP id y13mr5795804oiv.85.1634837690832;
 Thu, 21 Oct 2021 10:34:50 -0700 (PDT)
MIME-Version: 1.0
From: "John" <r10kindsofpeople@gmail.com>
Date: Thu, 21 Oct 2021 13:34:39 -0400
Message-ID: <CAE8H0+WoGLZngUhKb60wYCBNa8ns_xq4kNatOpVXzaoEQMv1xg@mail.gmail.com>
Subject: Dunfell, populate_sdk, how to build development image?
To: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d3d92d05cee04f92"

--000000000000d3d92d05cee04f92
Content-Type: text/plain; charset="UTF-8"

I've got a booting image for the AM335x under dunfell and so went on to
what I thought would be the easy step of building the cross-development
image using -c populate_sdk.  It completes, but when I try to install it,
it locks up at the 'cannot access /opt/poky/environment-setup-*' stage, and
it seems to be missing some other significant pieces, at least most of the
x86_64-arago-linux folder.

Any suggestions on how to move forward?

Or was my first mistake 'dunfell', and if so, suggestions on how far back
to step?  I got the impression that the TI SDK 07.03.00.005 was using
dunfell.

John

--000000000000d3d92d05cee04f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve got a booting image for the AM335x under dunfell =
and so went on to what I thought would be the easy step of building the cro=
ss-development image using -c populate_sdk.=C2=A0 It completes, but when I =
try to install it, it locks up at the &#39;cannot access /opt/poky/environm=
ent-setup-*&#39; stage, and it seems to be missing some other significant p=
ieces, at least most of the x86_64-arago-linux folder.=C2=A0=C2=A0<div><br>=
</div><div>Any suggestions on how to move forward?=C2=A0=C2=A0</div><div><b=
r></div><div>Or was my first mistake &#39;dunfell&#39;, and if so, suggesti=
ons on how far back to step?=C2=A0 I got the impression that the TI SDK=C2=
=A007.03.00.005 was using dunfell.=C2=A0=C2=A0</div><div><br></div><div>Joh=
n</div></div>

--000000000000d3d92d05cee04f92--
