Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84E1C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:24:38 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.23390.1679426669065694186
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SmGTGXbZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id n17so11049424uaj.10
        for <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 12:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679426668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzBHDpoE8Mo+YwSl4oFXVjhiSYLnZpZIyA+uJkh+zOM=;
        b=SmGTGXbZdhbq5bllghRppJqElRU8/HEE6qRs6/CkHtAHLnJNj1/9yMqI/FXzHahCdO
         gJYlnsrOWc1sH2RldEuyEX4zelQyhr3NZukz5nsvPEQcoeEv+Sqgfbwns0yla9eg6pS9
         AwOTAOabrOkL4FBkyrXhqaB3atxiayVyzGou8ooG0dvKmYKZJPqWtLr/Ekf9zVSrnXVf
         TBLo/OsNFoVA6iz9o0yCWpYIh9XM6EC3sqWieHyRkFT/hl0NRnMbt1HOF0hlu7VusLCm
         t4cOs7ZZ2/5SVxSmR+yaeZrxmcNqRYt6rcQJ5/tKdRPhm3syWcbaCGSUBv6MVypzRwnv
         uRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzBHDpoE8Mo+YwSl4oFXVjhiSYLnZpZIyA+uJkh+zOM=;
        b=HbjN6GmsW2mwvREOcZt5TZMDkII9IwGw5FTxsfW56YLZWU7BLSaRgQUWa/bLMdzIlE
         nBVpgw5cXW4QULRrlA4gUaj8RdaGx6BdvP90zqTm+M/XHKN6THRUMveTzn3OhKZD6zkk
         iydHbHVNYjly56hEbtqXN7b4GwejJgi4VJjCSi5SkcxlllXdFfQ4qHpia6vRzrzkZ6IS
         j3qe2ZV+yNLYcgxZscrmw5ZzwZju7qgddvNaj4ijQg+4lQzDZ4WpeBSG7EtBNFPWozl/
         Qta7gXxyFgiPOZ+Nwy6Sjq8eY2OszH5oCylDknJWI/9wU35sKsKTXnl7cJfY4pMmzhdu
         cfGg==
X-Gm-Message-State: AAQBX9evm3NvkUbvww8DtBP2yB0zv4oiwjsT1DbSmMStummT1tGsdddh
	guW4AxYpv3F2EKQmy+zA1ojuFpXxfQGTrWHFgGQ=
X-Google-Smtp-Source: AKy350YmU1I/0bqlqZJ0JE/hCSgtElTDyUzX2rL34RNz+9QUvtBbiIggLrrVS40cnQiO3zzuKFGkN6Zu1ft271OqzJo=
X-Received: by 2002:a05:6130:a6:b0:740:714f:aa5d with SMTP id
 x38-20020a05613000a600b00740714faa5dmr1019667uaf.0.1679426667970; Tue, 21 Mar
 2023 12:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230320033840.1193963-1-denis@denix.org> <20230320033840.1193963-12-denis@denix.org>
 <5f879b75-202e-5131-629d-6342f919f9ba@ti.com> <20230321191055.GH18050@denix.org>
In-Reply-To: <20230321191055.GH18050@denix.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Mar 2023 19:24:17 +0000
Message-ID: <CANPvuR=K0=PHzaxd+9HqyhC6uEh50q9aMB-Tw8CDCz=ZY8mTGg@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone][PATCH 11/54] machine: Add AM62Q HS-SE evm configuration
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f887f605f76dfdf9"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16223

--000000000000f887f605f76dfdf9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=C3=A7a, 21/03/2023 =
=C3=A0(s)
19:11:

> On Tue, Mar 21, 2023 at 11:11:26AM -0500, Ryan Eatmon wrote:
> >
> >
> > On 3/19/2023 22:37, Denys Dmytriyenko wrote:
> > >From: Chirag Shilwant <c-shilwant@ti.com>
> > >
> > >Lets add the basic AM62Q HS-SE configuration.
> > >- Add configurations.
> > >- Add ti-sci-firmware overrides.
> > >- Add u-boot overrides.
> > >- Add optee overrides.
> > >- Add ti-rtos-firmware overrides.
> > >
> > >Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> > >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > >---
> > >diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > >index 37d022e9..77709689 100644
> > >--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > >+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > >@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
> > >  SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
> > >  SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
> > >  SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
> > >+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
> >
> > Ooops.  We missed a dunfell to kirkstone syntax change.  No need to
> > send an updated patch, I will just do a git fixup and address it.
>
> Ah, nice catch! I guess I've had too many rebases... :)
> Thanks for very careful reviewing!
>
>
> > Thanks for your hard work on these patch sync ups, Denys.  It is
> > very much appreciated.
>
> The issue is that kirkstone and master have diverged from dunfell too muc=
h
> now
> and porting changes became heavily manual process and error-prone.
> Hopefull we
> can close dunfell for any new features very soon.
>

The dunfell branch supports the new bitbake syntax as well so another
solution to lower the divergence
can be mitigating the dunfelll branch to the new syntax, however doing that
won't be easy either.

Jose


>
> --
> Denys
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16222):
> https://lists.yoctoproject.org/g/meta-ti/message/16222
> Mute This Topic: https://lists.yoctoproject.org/mt/97724610/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700=
/xyzzy
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f887f605f76dfdf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Denys Dmytriyenko &lt;<a href=3D"mail=
to:denis@denix.org">denis@denix.org</a>&gt; escreveu no dia ter=C3=A7a, 21/=
03/2023 =C3=A0(s) 19:11:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, Mar 21, 2023 at 11:11:26AM -0500, Ryan Eatmon wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 3/19/2023 22:37, Denys Dmytriyenko wrote:<br>
&gt; &gt;From: Chirag Shilwant &lt;<a href=3D"mailto:c-shilwant@ti.com" tar=
get=3D"_blank">c-shilwant@ti.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;Lets add the basic AM62Q HS-SE configuration.<br>
&gt; &gt;- Add configurations.<br>
&gt; &gt;- Add ti-sci-firmware overrides.<br>
&gt; &gt;- Add u-boot overrides.<br>
&gt; &gt;- Add optee overrides.<br>
&gt; &gt;- Add ti-rtos-firmware overrides.<br>
&gt; &gt;<br>
&gt; &gt;Signed-off-by: Chirag Shilwant &lt;<a href=3D"mailto:c-shilwant@ti=
.com" target=3D"_blank">c-shilwant@ti.com</a>&gt;<br>
&gt; &gt;Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" t=
arget=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt; &gt;Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@konsu=
lko.com" target=3D"_blank">denys@konsulko.com</a>&gt;<br>
&gt; &gt;---<br>
&gt; &gt;diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://t=
i-sci-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a> =
b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; &gt;index 37d022e9..77709689 100644<br>
&gt; &gt;--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-f=
w_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; &gt;+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-f=
w_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a><br>
&gt; &gt;@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 =3D &quot;fs&quot;<=
br>
&gt; &gt;=C2=A0 SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D &quot;fs&quot;<br>
&gt; &gt;=C2=A0 SYSFW_PREFIX:am62xx-evm-k3r5 =3D &quot;fs&quot;<br>
&gt; &gt;=C2=A0 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D &quot;fs&quot;<br>
&gt; &gt;+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D &quot;fs&quot;<br>
&gt; <br>
&gt; Ooops.=C2=A0 We missed a dunfell to kirkstone syntax change.=C2=A0 No =
need to<br>
&gt; send an updated patch, I will just do a git fixup and address it.<br>
<br>
Ah, nice catch! I guess I&#39;ve had too many rebases... :)<br>
Thanks for very careful reviewing!<br>
<br>
<br>
&gt; Thanks for your hard work on these patch sync ups, Denys.=C2=A0 It is<=
br>
&gt; very much appreciated.<br>
<br>
The issue is that kirkstone and master have diverged from dunfell too much =
now <br>
and porting changes became heavily manual process and error-prone. Hopefull=
 we <br>
can close dunfell for any new features very soon.<br></blockquote><div><br>=
The dunfell branch supports the new bitbake syntax as well so another solut=
ion to lower the divergence</div><div>can be mitigating=C2=A0the dunfelll=
=C2=A0branch to the new syntax,=C2=A0however doing that won&#39;t be easy e=
ither.<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-- <br>
Denys<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16222): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16222" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16222</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97724610/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97724610/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/leave/1136=
9865/5052612/926574700/xyzzy" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-ti/leave/11369865/5052612/926574700/xyzzy</a>=
 [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jos=
e@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000f887f605f76dfdf9--

