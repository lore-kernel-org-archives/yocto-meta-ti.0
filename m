Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498D0EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 11:53:57 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.14251.1687953232680546799
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 04:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MbClZYx5;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4436dc265d6so1192881137.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 04:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687953231; x=1690545231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YKjeQENuizcIFaG+nuUiSyFwirPjw7wpVAYvfDCRjSU=;
        b=MbClZYx51A5SfZvBI8LiosRaqIElc57elP9usHGI4j7DigMEOzs7fSqkwMSsPupSUl
         bQ0u2sW//QjnhN/UW7Y7Nxb/IwMRS7+3jhOhqGX0pGG/wPjwCboiEAFeQtgAPXXntd21
         92loLH1SXG4zotVXQK3zN/PmoMeVRyYWhh4Yz2DYM/+9ALjNLdw8Yj7o4IoZebmSaFCI
         UmLCKrPZMyhzurVbBBEBaACVE8HOYEEbYVnD67lQH0Kno8jkIEJlK0hXMKWsgC5ArcLX
         qvsiAZiEZ1bezwnM3llM5m9NYx27YFkM5yDxR6ZTKo34N5cSVSA08RU44ZbMeT+TDaxE
         mhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687953231; x=1690545231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKjeQENuizcIFaG+nuUiSyFwirPjw7wpVAYvfDCRjSU=;
        b=FL7duHuVJH18ordAsahjs/MAnu5Q/lxW3m54MYNgIGEBROTevZtA0kphgIl66qsKmk
         DMD6QjLxQuM9eWBbrY3XyvzNLf3JarlvIzdCcB8UPQXdnmCLw5bO3kwAxxi4s1NUXpxa
         DPvHn4up8cK0SIeraKToaAjgDgmJidtDksNhBcEYC9NCN2p9gl+cUBIqeeRscAMce11P
         cF0H0vq7pXRE7AvSJAQ3jW73gSTbbHzB4RNVPV3Ly6b+NBoQdS4aYWib/LN/npRQeb0l
         nBDT4dW4adghtiQnvc0cnuQT0P6gmfibR+mfY3xJrq05XmE6EsNFe8MDy/ixB58oRn82
         JJRQ==
X-Gm-Message-State: AC+VfDy3vLEASyM8HH5aa/DtIdsiu9lc4ifUXveATRiKpYd2bgvkHXdg
	GKDvGv0qL59g71nXtRzCUBo4Ke5ivSHhgsMap0E=
X-Google-Smtp-Source: ACHHUZ6xSXZHOggxUbkDzED+DzQJLAgcAxEzg/xSrYA664AeFCQ9R0kgBB+yoVLRarkM7aHWd+L9tqRg+S/wr6oQjvY=
X-Received: by 2002:a67:fb94:0:b0:443:7935:6eb5 with SMTP id
 n20-20020a67fb94000000b0044379356eb5mr3581187vsr.15.1687953231453; Wed, 28
 Jun 2023 04:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuRk=RrL8k7qRr90We1hE+QvpXz2xxJMaxLC17OiL-EWSZQ@mail.gmail.com>
 <32086.1687950912804991254@lists.yoctoproject.org>
In-Reply-To: <32086.1687950912804991254@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Jun 2023 12:53:40 +0100
Message-ID: <CANPvuR=6H0_Ki-z9Vz30HFUmgNz+ii9Kq5CV0RWSC_T4rAzwiA@mail.gmail.com>
Subject: Re: [meta-ti] am62xx-evm: bootloader config not specified
To: ari.parkkila@qt.io
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c2215705ff2f3cf0"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 11:53:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16796

--000000000000c2215705ff2f3cf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ari,

The top of kirstone has only one multiconfig machine again so this issue
does not happen.
However when I was at that point i used the SSTATE_ALLOW_OVERLAP_FILES to
solve the problem:

SSTATE_ALLOW_OVERLAP_FILES:append:k3r5 =3D " ${DEPLOY_DIR_IPK}/armv7at2hf-v=
fp"

If possible move to the top of kirkstone where this is not needed to
unshare the TMP.

Jose

Ari Parkkila via lists.yoctoproject.org <ari.parkkila=3D
qt.io@lists.yoctoproject.org> escreveu no dia quarta, 28/06/2023 =C3=A0(s) =
12:15:

> Thanks Jos=C3=A9,
>
> Multiconfig seems to cause conflict that only one recipe should copy to
> DEPLOY_DIR, e.g.:
>
> ERROR: mc:k3r5-hs-se:linux-libc-headers-6.1-r0 do_package_write_ipk: The
> recipe linux-libc-headers is trying to install files into a shared area
> when those files already exist. Those files and their manifest location a=
re:
>
> build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dbg_6.1-r0_=
armv7at2hf-vfp.ipk
>     (not matched to any task)
>
> build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dev_6.1-r0_=
armv7at2hf-vfp.ipk
>     (not matched to any task)
>
> build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-lic_6.1-r0_=
armv7at2hf-vfp.ipk
>     (not matched to any task)
> Please verify which recipe should provide the above files.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16795):
> https://lists.yoctoproject.org/g/meta-ti/message/16795
> Mute This Topic: https://lists.yoctoproject.org/mt/99826600/5052612
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c2215705ff2f3cf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ari,<br><br>The top of kirstone=C2=A0has only one =
multiconfig machine again so this issue does not happen.<br>However when I =
was at that point i used the=C2=A0SSTATE_ALLOW_OVERLAP_FILES to solve=C2=A0=
the problem:<br><br>SSTATE_ALLOW_OVERLAP_FILES:append:k3r5 =3D &quot; ${DEP=
LOY_DIR_IPK}/armv7at2hf-vfp&quot;<br></div><div><br>If possible move to the=
 top of kirkstone where this is not needed to unshare=C2=A0the TMP.<br styl=
e=3D"color:rgb(0,0,0)"></div><div><br></div>Jose<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ari Parkkila via <a href=3D"h=
ttp://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;ari.parkkila=
=3D<a href=3D"mailto:qt.io@lists.yoctoproject.org">qt.io@lists.yoctoproject=
.org</a>&gt; escreveu no dia quarta, 28/06/2023 =C3=A0(s) 12:15:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Thanks Jos=C3=A9,<br>
<br>
Multiconfig seems to cause conflict that only one recipe should copy to DEP=
LOY_DIR, e.g.:<br>
<br>
ERROR: mc:k3r5-hs-se:linux-libc-headers-6.1-r0 do_package_write_ipk: The re=
cipe linux-libc-headers is trying to install files into a shared area when =
those files already exist. Those files and their manifest location are:<br>
=C2=A0 build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dbg_6.=
1-r0_armv7at2hf-vfp.ipk<br>
=C2=A0 =C2=A0 (not matched to any task)<br>
=C2=A0 build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dev_6.=
1-r0_armv7at2hf-vfp.ipk<br>
=C2=A0 =C2=A0 (not matched to any task)<br>
=C2=A0 build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-lic_6.=
1-r0_armv7at2hf-vfp.ipk<br>
=C2=A0 =C2=A0 (not matched to any task)<br>
Please verify which recipe should provide the above files.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16795): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16795" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16795</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99826600/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99826600/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">qua=
resma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000c2215705ff2f3cf0--

