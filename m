Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.10461.1616080403693898220
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 08:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P/yHNZIJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id t4so2338769qkp.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 18 Mar 2021 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WLO5Zre8dcOsL6ltQsZTz5f8ZBLgLSwdNvadaA1FI+E=;
        b=P/yHNZIJUsr//eQuWDho1BATFPMLPt82eYo7sp2QTNkzHAo+Zl0tLAcPvxP4s5+2/g
         LxMXO3keXAyBQYkxqJoazS+lq9QQbstuBVcCvUVzToAG7fPDhxEIaTWs/icO3nNUQs+J
         DMZgK8TtgS6WcOuC+oG/lyanau1eUquZCNtaNO/0PaTLr7vOId4aqAqcuqKeQxFPsTz+
         fpK1MlEVk7MnJF61DAvrcXEcDCYakpnaP/f/99Iz4MlxAi+8vQgSYE6p7XrzcRmlQGb5
         VpuS3Hpe2PQe1tpQYZczay04aHYAgqCzGbEhukKB7prVtkxXnwxwpTaM+wyPhjRFK72/
         PfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WLO5Zre8dcOsL6ltQsZTz5f8ZBLgLSwdNvadaA1FI+E=;
        b=tERpjtpOX58mleVBmsh0GkgEURiYVNg/srjf5uML7zQGbwi2SZ1/RjemdMOH0uDayF
         2nrxSASfxNGP6CYZfsdUnLAphCJSGzUv9dpFM47OBUI7s3K79Dj47WEZz+hy/xbkjFFV
         V/rFO68eYjMBLlYxsv+3AILkENXhziL6vjKR8iM2jo65E0kUfRpAs6JzJVG4JXFczZ9y
         erQhVjXr0rt5B3xCKjsCcX1/JWx/rE8c9uEkTihunFNStE/d08Oa9sfzwmkecl7b9bCN
         9+LANfEieKBxUWIf2N6lGc1oqRVWbLV2+UZxnSh7rx7b1bQl+ryFNOrjNkAfLO7Oqugi
         LK0w==
X-Gm-Message-State: AOAM533iy9LZCGTnGVDQw20C6Y+geUoFWpVRLnOIxmp03m0CuYS2C0+d
	d/0ROj/5HD7ljfzrks65uY8xzXCGFMGSl6XiDi4=
X-Google-Smtp-Source: ABdhPJwDYy2NF6ICUpT2J19+x3fIxNrEpW+Kz9LtgCBuhq53nipiXi/e9Y70HtuTufQHye5y+im+mta2c/GXj9MSOZo=
X-Received: by 2002:a37:a350:: with SMTP id m77mr4716541qke.146.1616080402500;
 Thu, 18 Mar 2021 08:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soh-om+Qwh8J4YNpCa4Hv+SUgwUcRzHGvxcrBYyPB0Row@mail.gmail.com>
 <CAGNsrLCSOpGgFi5dip3KwM6=hWw6yhnUdVMCMxBiZMGZVDYoEQ@mail.gmail.com>
In-Reply-To: <CAGNsrLCSOpGgFi5dip3KwM6=hWw6yhnUdVMCMxBiZMGZVDYoEQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Mar 2021 08:13:11 -0700
Message-ID: <CAMKF1sry-SkFdZA9A+jTsBzHAkBnSh0O=3U6T4pRoyncWcDZDA@mail.gmail.com>
Subject: Re: uim-sysfs duplicate recipes
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000051ce1705bdd10a76"

--00000000000051ce1705bdd10a76
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 18, 2021 at 12:51 AM Fathi Boudra <fathi.boudra@linaro.org>
wrote:

> Hi,
>
> On Thu, 18 Mar 2021 at 06:43, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi
> >
> > uim-sysfs seems to be copied into several layers as seen here
> >
> >
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=uim-sysfs
> >
> > I wonder if this should be consolidated into one common place ?
> > perhaps meta-oe or somesuch
> > layer.
> >
> > If not, which one should be used when both meta-ti and meta-96boards
> > layers are used in
> > a distro ?
>
> meta-96boards uim was modified for the hikey board and should be
> considered as a fork.
> I'll need to check the specifics and if it can use the upstream recipe
> nowadays.
>
> Wrt if you use meta-96boards/meta-ti, then you should prefer
> meta-96boards for the hikey machine. Otherwise, prefer meta-ti.
>

Ok in that case perhaps it should be marked with proper compatible_machine
to avoid collision


> > Thanks
> > -Khem
>
> Cheers,
> --
> Fathi Boudra
> Linaro.org | Open source software for ARM SoCs
>

--00000000000051ce1705bdd10a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 18, 2021 at 12:51 AM Fathi Boudra &lt;<a href=
=3D"mailto:fathi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On Thu, 18 Mar 2021 at 06:43, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; uim-sysfs seems to be copied into several layers as seen here<br>
&gt;<br>
&gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/master/rec=
ipes/?q=3Duim-sysfs" rel=3D"noreferrer" target=3D"_blank">http://layers.ope=
nembedded.org/layerindex/branch/master/recipes/?q=3Duim-sysfs</a><br>
&gt;<br>
&gt; I wonder if this should be consolidated into one common place ?<br>
&gt; perhaps meta-oe or somesuch<br>
&gt; layer.<br>
&gt;<br>
&gt; If not, which one should be used when both meta-ti and meta-96boards<b=
r>
&gt; layers are used in<br>
&gt; a distro ?<br>
<br>
meta-96boards uim was modified for the hikey board and should be<br>
considered as a fork.<br>
I&#39;ll need to check the specifics and if it can use the upstream recipe =
nowadays.<br>
<br>
Wrt if you use meta-96boards/meta-ti, then you should prefer<br>
meta-96boards for the hikey machine. Otherwise, prefer meta-ti.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok in that case =
perhaps it should be marked with proper compatible_machine to avoid collisi=
on=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
&gt; Thanks<br>
&gt; -Khem<br>
<br>
Cheers,<br>
-- <br>
Fathi Boudra<br>
Linaro.org | Open source software for ARM SoCs<br>
</blockquote></div></div>

--00000000000051ce1705bdd10a76--
