Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web09.2334.1634842415954131816
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 11:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l8rqheXD;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: r10kindsofpeople@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id n15-20020a4ad12f000000b002b6e3e5fd5dso420127oor.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 21 Oct 2021 11:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XGRvb5YrpxwUe4LcSjXtmkqum0SyKWewU1UrF3gJpL4=;
        b=l8rqheXDfUrfZxDm2RO0wytf4G/p4ynHkkWtN+eLCPqT5XTAAGbsJZ0T2G+C/3m8kM
         MKgoc71kuij43dDTrDl0GId5C9GXx62sm09cLIFtyBJajpo3eYWgEZpZmqFzyXAfStfL
         PH9kc3HdDIdnd3o27qJFYT6rjCdLxs/vIyQ0rAGlBAfMcfgxWlXdINrkVb2Z6wfOmxa2
         +RzXu4+mQ9EqT46kfOM7TylF0JjZ9Pdx3kds9xNpV/5KMGfh7Z64SckG0n3FuDXxRZt7
         tLwfoN4b+4pHzvPaiR0/bqPvYPsBoepWPYM5Q7bgiUDZLR/zHv0uQaj3kdPsHXtlIXAW
         MeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XGRvb5YrpxwUe4LcSjXtmkqum0SyKWewU1UrF3gJpL4=;
        b=HZiAt9VHwkMrojN57bQ1wUjee41LTz6NnW9AJYXLgNhk/qX8BXKi9D2p79lN9pKBY+
         hm24hosR7ktX2jWRhnJLjM5laERy7aRfyXOZVYg47ZpxwCh26X46uJB2w5yac56oTEvK
         +qf9/kC59rj5A7BQcG18/G21k7/KZXGKOgP/91DVID4DwU1vx7jnqOfa6xNTArL0sW4b
         WInzhu9meQaUJMm8YA28U5r3kcwSNsOKAO2JrUaW2ykS5ZnXEfPU1JkujuFj2Yp2scTP
         ApzESdSL5gKZRaioZiSn0oTHZeP9XAKDU2QueNM9YM8nC4IhxZ37YNQVXmpcPnaNxhhv
         SnjA==
X-Gm-Message-State: AOAM531WYSi2vYG1PqbiNciXl2DSmOondqwHFviT39uN8RPz8rEJlsKR
	uoWMZCw2NRrOEpQg+Xvkp1kZ+KQiQik/YE0a1nc=
X-Google-Smtp-Source: ABdhPJzJXCFbCqBrj8tDOWP3ZW2otU6ZDL+nS6yEWTTcyMFVgbzcWaUePjLp9EQyZqi1YgAPs8c4slgxNzOoHMKpzH0=
X-Received: by 2002:a4a:8c01:: with SMTP id u1mr5588839ooj.85.1634842415121;
 Thu, 21 Oct 2021 11:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <16B01C382574D249.30033@lists.yoctoproject.org>
In-Reply-To: <16B01C382574D249.30033@lists.yoctoproject.org>
From: "John" <r10kindsofpeople@gmail.com>
Date: Thu, 21 Oct 2021 14:53:23 -0400
Message-ID: <CAE8H0+Ux_X2eRKRqEbfTZwLLY+ePReEWAUT5=uBmFbk8-f935A@mail.gmail.com>
Subject: Re: [meta-ti] Dunfell, populate_sdk, how to build development image?
To: John Adamson <r10kindsofpeople@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006acab805cee1692d"

--0000000000006acab805cee1692d
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 1:34 PM John via lists.yoctoproject.org
<r10kindsofpeople=gmail.com@lists.yoctoproject.org> wrote:

> I've got a booting image for the AM335x under dunfell and so went on to
> what I thought would be the easy step of building the cross-development
> image using -c populate_sdk.  It completes, but when I try to install it,
> it locks up at the 'cannot access /opt/poky/environment-setup-*' stage, and
> it seems to be missing some other significant pieces, at least most of the
> x86_64-arago-linux folder.
>
> Any suggestions on how to move forward?
>
> Or was my first mistake 'dunfell', and if so, suggestions on how far back
> to step?  I got the impression that the TI SDK 07.03.00.005 was using
> dunfell.
>
> John
>

Sorry, I seem to have hit on the right search parameters shortly after
hitting 'send'.
See
https://www.openembedded.org/pipermail/openembedded-core/2015-July/106931.html

In arago-image.inc, I believe:
TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
should be
TOOLCHAIN_HOST_TASK_append +=  "nativesdk-buildtools-perl-dummy"

I haven't built anything with the resulting SDK yet, but the install
completed.

John

--0000000000006acab805cee1692d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 21, 2021 at 1:34 PM John via =
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;r1=
0kindsofpeople=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.=
com@lists.yoctoproject.org</a>&gt; wrote:<br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I&#39=
;ve got a booting image for the AM335x under dunfell and so went on to what=
 I thought would be the easy step of building the cross-development image u=
sing -c populate_sdk.=C2=A0 It completes, but when I try to install it, it =
locks up at the &#39;cannot access /opt/poky/environment-setup-*&#39; stage=
, and it seems to be missing some other significant pieces, at least most o=
f the x86_64-arago-linux folder.=C2=A0=C2=A0<div><br></div><div>Any suggest=
ions on how to move forward?=C2=A0=C2=A0</div><div><br></div><div>Or was my=
 first mistake &#39;dunfell&#39;, and if so, suggestions on how far back to=
 step?=C2=A0 I got the impression that the TI SDK=C2=A007.03.00.005 was usi=
ng dunfell.=C2=A0=C2=A0</div><div><br></div><div>John</div></div></blockquo=
te><div><br></div><div>Sorry, I seem to have hit on the right search parame=
ters shortly after hitting &#39;send&#39;.=C2=A0=C2=A0</div><div>See <a hre=
f=3D"https://www.openembedded.org/pipermail/openembedded-core/2015-July/106=
931.html">https://www.openembedded.org/pipermail/openembedded-core/2015-Jul=
y/106931.html</a></div><div><br></div><div>In arago-image.inc, I believe:</=
div><div>TOOLCHAIN_HOST_TASK=C2=A0+=3D &quot;nativesdk-buildtools-perl-dumm=
y&quot;</div><div>should be</div><div>TOOLCHAIN_HOST_TASK_append=C2=A0+=3D=
=C2=A0 &quot;nativesdk-buildtools-perl-dummy&quot;</div><div><br></div><div=
>I haven&#39;t built anything with the resulting SDK yet, but the install c=
ompleted.=C2=A0</div><div><br></div><div>John</div></div></div>

--0000000000006acab805cee1692d--
