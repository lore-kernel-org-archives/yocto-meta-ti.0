Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DD0C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 20:31:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.6249.1738093430610204256
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 11:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7vUa4sV;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: willhowe235@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8121549a91.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 28 Jan 2025 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738093430; x=1738698230; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntYUhR5wDoqokZMSr5nBzMb5EaMj64fkqoWw1uCZT3s=;
        b=U7vUa4sVfuQdSrZ/8XUqQfenkpRXYsuu3a5PQU97fEcOTnquVfjhX2N7D4wonaFRIS
         M0IE+Cz5E9s7DV65y/SfldYv5ixK7M5OLMIZ4YtaJN0W2OA6QQN87Sl0pKACsir1a5+v
         VTOaPVa/mj0X/JvdabCa+FztdEL+6zRVLMBAfKJdMMQEhQaJ14hthd06AygpY2qXeBCu
         9ep4WatBionwEnTp2XCdErh8KzVIoFNwhV6aieTblWQcTEy2QO25w8r4pI0oVsqRZ/fw
         OxK35aifgQcbQECCVqv8/xXETE422mz+PWikANsW5EPTwW/h5qgnM+k4COOENuOJBCst
         Q07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738093430; x=1738698230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntYUhR5wDoqokZMSr5nBzMb5EaMj64fkqoWw1uCZT3s=;
        b=M/lt4ltgHpQTNTAq5l2LVVhaRP5Q7138kVGdkiR4vvzZkHca3q6n/P8Hmq1B9YuXOa
         7QBQYYvFOiXUKAxTpwBT3iNZepxPSOpiamFynpjUTt8tDk4MBpONKzocqD/pPNPTyPFU
         eo6/MjFrVKEBZBBXT9i+rpi4q+k8VumKqrmftKOSK+EVJ8PqlW82WTCx7R3fSt64y1wW
         lSzUnHpMhnfEQVzMx8Nxw8eqLR/3+bHl7mAkIzH+dbI4y00MHuPrC7L3VZ+wdYUB++dn
         xnAGWs5oO0aPmy/mdA4HAbY9D47CErGRi7YlcbyP5MKQ0ZrXX1P91hXSyecA10O6HmxY
         GThg==
X-Gm-Message-State: AOJu0YzCo1g/eVxjtKUxqHpNn2co4h3PTMOpkdJl5hO/dyOT+pW3/yBk
	I7qXavPJwpQBbpTo1SWXnqCw8cmYtPmCvWOLEVtWkA+CuXlkO+aujGzEfaxN+fCfhQKfdoroWOy
	vCn8+S+qMlAH6fK9iOVdjYlm5dn2WVA==
X-Gm-Gg: ASbGncs1mbm0Lpld7r0TWRDANuB1Kai+X6mBQvy/YeZrARxto1BWylXSVO/bI1PEJca
	q9pIuzffk+V2PvYoyO+PrZgRCRxETyVCGnPAngsdODDG5xb+5Mg083DhCbZXH6eHTvH3KznuI6h
	c=
X-Google-Smtp-Source: AGHT+IFiN4JBNYQcAEJ+VN3e5Rmo5u4mET+dSVkq/PU3Ud2ufnhT4oIgGruNiOagioNcdBXjkdyvmz1doXEARqztD8Y=
X-Received: by 2002:a17:90b:2742:b0:2f2:a796:26b with SMTP id
 98e67ed59e1d1-2f83abb3480mr350252a91.1.1738093429783; Tue, 28 Jan 2025
 11:43:49 -0800 (PST)
MIME-Version: 1.0
References: <lrnS.1737746847989365062.hDBY@lists.yoctoproject.org>
 <20250124215239.GB21836@denix.org> <CAMWH2H31xA76ciYOz6x_mqzW=ZSpmOBQAC_Q16khfECipqCszg@mail.gmail.com>
 <20250128194054.GG21836@denix.org>
In-Reply-To: <20250128194054.GG21836@denix.org>
From: willhowe235@gmail.com
Date: Tue, 28 Jan 2025 14:44:27 -0500
X-Gm-Features: AWEUYZn6dz5DGCmnW5uiEm0Xo9CTzfiZbC9VxnaLnOkTK5JUjBXIpcOcWnCdgMw
Message-ID: <CAMWH2H3GE2o32+Dx6=d2M0EFd7uQ+R74kqNCiJd34u1Zpzji1w@mail.gmail.com>
Subject: Re: [meta-arm] Failing to fetch beaglebone kernel from github
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000078048e062cc96924"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jan 2025 20:31:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18239

--00000000000078048e062cc96924
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Denys,

I'm on a better connection today and I was able to get it to build,
indicating it was a connectivity issue.

Thanks for the help and sorry for the churn.

On Tue, Jan 28, 2025 at 2:40=E2=80=AFPM Denys Dmytriyenko <denis@denix.org>=
 wrote:

> On Fri, Jan 24, 2025 at 05:05:27PM -0500, Will Howe wrote:
> > Thanks Denys,
>
> It is always recommended to copy the mailing list in order to get faster
> response from others, as one person can get busy or unavailable...
>
>
> > I attached the logs of the first error. It definitely seemed to me like
> it
> > was a connectivity issue.
>
> Relevant messages from the logs, indicating connectivity issues:
>
> error: RPC failed;
> +curl 92 HTTP/2 stream 5 was not closed cleanly: CANCEL (err 8)
> error: 22969 bytes of body are still expected
> fetch-pack: unexpected disconnect while reading sideband packet
> fatal: early EOF
> fatal: fetch-pack: invalid index-pack output
>
>
> > But I'm not so sure since I'm wondering if it is
> > a delta with the URI.
> >
> > It seems like the delta is caused between "https://..." vs "git://...".
> > Currently the recipe is using:
> >
> > KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
> >
> > Changing it to:
> >
> > KERNEL_GIT_URI =3D "https://github.com/beagleboard/linux.git"
> >
> > gives me the following new errors related to the license file:
>
> Please don't do that, your change is incorrect - it tells Bitbake to use
> the
> wrong fetcher and instead of cloning git repository, it tries to download
> a
> Web file, which obviously fails. The recipe already sets the protocol to
> "https" to be used when cloning the git repository.
>
> --
> Denys
>

--00000000000078048e062cc96924
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Denys,<div><br></div><div>I&#39;m on a better conne=
ction today and I was able to get it to build, indicating it was a connecti=
vity issue.</div><div><br></div><div>Thanks for the help and sorry for the =
churn.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 28, 2025 at 2:40=E2=80=AFPM D=
enys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
ri, Jan 24, 2025 at 05:05:27PM -0500, Will Howe wrote:<br>
&gt; Thanks Denys,<br>
<br>
It is always recommended to copy the mailing list in order to get faster <b=
r>
response from others, as one person can get busy or unavailable...<br>
<br>
<br>
&gt; I attached the logs of the first error. It definitely seemed to me lik=
e it<br>
&gt; was a connectivity issue.<br>
<br>
Relevant messages from the logs, indicating connectivity issues:<br>
<br>
error: RPC failed;<br>
+curl 92 HTTP/2 stream 5 was not closed cleanly: CANCEL (err 8)<br>
error: 22969 bytes of body are still expected<br>
fetch-pack: unexpected disconnect while reading sideband packet<br>
fatal: early EOF<br>
fatal: fetch-pack: invalid index-pack output<br>
<br>
<br>
&gt; But I&#39;m not so sure since I&#39;m wondering if it is<br>
&gt; a delta with the URI.<br>
&gt; <br>
&gt; It seems like the delta is caused between &quot;https://...&quot; vs &=
quot;git://...&quot;.<br>
&gt; Currently the recipe is using:<br>
&gt; <br>
&gt; KERNEL_GIT_URI =3D &quot;git://<a href=3D"http://github.com/beagleboar=
d/linux.git" rel=3D"noreferrer" target=3D"_blank">github.com/beagleboard/li=
nux.git</a>&quot;<br>
&gt; <br>
&gt; Changing it to:<br>
&gt; <br>
&gt; KERNEL_GIT_URI =3D &quot;<a href=3D"https://github.com/beagleboard/lin=
ux.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/beagleboard=
/linux.git</a>&quot;<br>
&gt; <br>
&gt; gives me the following new errors related to the license file:<br>
<br>
Please don&#39;t do that, your change is incorrect - it tells Bitbake to us=
e the <br>
wrong fetcher and instead of cloning git repository, it tries to download a=
 <br>
Web file, which obviously fails. The recipe already sets the protocol to <b=
r>
&quot;https&quot; to be used when cloning the git repository.<br>
<br>
-- <br>
Denys<br>
</blockquote></div>

--00000000000078048e062cc96924--

