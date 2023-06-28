Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB15EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 11:58:27 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web10.14240.1687953502699651711
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 04:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZmL8P85f;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-78f554d4949so1814453241.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687953502; x=1690545502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cv1SLiuZe9yWV8v8/zRE0omPlaNzt0CcKSwX9FdxeOU=;
        b=ZmL8P85fJIy1qM0f+gzhRP/VArAeg7elZ7HonHIytPa9d9YoGMOvkVWczCYBKFO8IC
         ESiZPCbwZH+SQd6pX7HSuGalitQ5MaBTo4WVIhGK7UckJnhnMxowkQM3ocQNkk4Vek07
         fImi94fVt52cJrw7RTWeODFrbIlQUMghFGjW9crruXPwt0dkxdHuEYgtoJNq1FMBj13H
         1hze79c0/Za1jqO8ptK3Nvr536oyW2rE4zm2Wn1dPOPfGbO3tyKfZtqs7qP4nfT0JWJR
         HhHgrQd59omxBbKl52XLAxfL3olX3mzSDVx4Q2TK6jeVu5Y4ovrYRXjPjmABTTRzNTWD
         IWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687953502; x=1690545502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cv1SLiuZe9yWV8v8/zRE0omPlaNzt0CcKSwX9FdxeOU=;
        b=iL5XMrD0xhJM9ku22l/KLWG4NSPIiUQRbqLSZlZvx4eoW9ZxshxfYRbtgbfQ3x8Zuk
         TPt2pv8cMYRWk9rDK9jG854W//ej27PFOFiNnSBsIJihHUUlM7I2tRZqmdCX6JBNDePj
         Ji0MQYBrEVNwNcTpCL58zOWp1IfL8PNzirsDM7dSlBABSID6O2yi8yfNAFUlB2QvevQO
         9PiCieTSbSqaw5aMMaD+RkxiI0CyCN8bYjLifkK7AVU5fmORIM9xP93ShLx6N0HVm9UF
         kLWG+zIQe/vSOxbVeoeA3KgAQNdHmd1QJ4VY1J9ctZcMo95gDHFNpD0sSQb+JKah3gWo
         EQsA==
X-Gm-Message-State: AC+VfDzsGDx3ulhgFnfmVUzW2fq3+3Gvlk2Q7tvtHOQY7KIRA0ForuD5
	x6YjnlCpXX/7j6EvbzM61cBkEMQ86oLnxP8DeeY=
X-Google-Smtp-Source: ACHHUZ7/C8wF1mIQCv6p9aYi4nZEcFoOI5XOS4XHZ07L51ROiHBYgGX7Udv7PKiXjD9tZ02ndxGfb2ZBd5NmSjD+x9A=
X-Received: by 2002:a67:fe88:0:b0:440:b2ba:1548 with SMTP id
 b8-20020a67fe88000000b00440b2ba1548mr16170556vsr.5.1687953501663; Wed, 28 Jun
 2023 04:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuRk=RrL8k7qRr90We1hE+QvpXz2xxJMaxLC17OiL-EWSZQ@mail.gmail.com>
 <32086.1687950912804991254@lists.yoctoproject.org> <176CD085AFDEC5ED.9439@lists.yoctoproject.org>
In-Reply-To: <176CD085AFDEC5ED.9439@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Jun 2023 12:58:10 +0100
Message-ID: <CANPvuRnYs9OCU_-o8yTdOU8Z0-2v=pLR9W5OQdhcrinr-6Qdmw@mail.gmail.com>
Subject: Re: [meta-ti] am62xx-evm: bootloader config not specified
To: quaresma.jose@gmail.com
Cc: ari.parkkila@qt.io, meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dd344405ff2f4c70"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 11:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16797

--000000000000dd344405ff2f4c70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe the better is try the Richard patch [1] on kirksonte and if it solves
the issue ask for backporting

[1] https://lists.openembedded.org/g/bitbake-devel/message/14866

Jose

Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
gmail.com@lists.yoctoproject.org> escreveu no dia quarta, 28/06/2023 =C3=A0=
(s)
12:53:

> Hi Ari,
>
> The top of kirstone has only one multiconfig machine again so this issue
> does not happen.
> However when I was at that point i used the SSTATE_ALLOW_OVERLAP_FILES to
> solve the problem:
>
> SSTATE_ALLOW_OVERLAP_FILES:append:k3r5 =3D "
> ${DEPLOY_DIR_IPK}/armv7at2hf-vfp"
>
> If possible move to the top of kirkstone where this is not needed to
> unshare the TMP.
>
> Jose
>
> Ari Parkkila via lists.yoctoproject.org <ari.parkkila=3D
> qt.io@lists.yoctoproject.org> escreveu no dia quarta, 28/06/2023 =C3=A0(s=
)
> 12:15:
>
>> Thanks Jos=C3=A9,
>>
>> Multiconfig seems to cause conflict that only one recipe should copy to
>> DEPLOY_DIR, e.g.:
>>
>> ERROR: mc:k3r5-hs-se:linux-libc-headers-6.1-r0 do_package_write_ipk: The
>> recipe linux-libc-headers is trying to install files into a shared area
>> when those files already exist. Those files and their manifest location =
are:
>>
>> build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dbg_6.1-r0=
_armv7at2hf-vfp.ipk
>>     (not matched to any task)
>>
>> build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dev_6.1-r0=
_armv7at2hf-vfp.ipk
>>     (not matched to any task)
>>
>> build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-lic_6.1-r0=
_armv7at2hf-vfp.ipk
>>     (not matched to any task)
>> Please verify which recipe should provide the above files.
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16796):
> https://lists.yoctoproject.org/g/meta-ti/message/16796
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

--000000000000dd344405ff2f4c70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe the better is try the Richard patch [1] on kirksonte=
=C2=A0and if it solves the issue ask for backporting<br><br>[1] <a href=3D"=
https://lists.openembedded.org/g/bitbake-devel/message/14866">https://lists=
.openembedded.org/g/bitbake-devel/message/14866</a><br><br>Jose</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresm=
a via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> =
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gma=
il.com@lists.yoctoproject.org</a>&gt; escreveu no dia quarta, 28/06/2023 =
=C3=A0(s) 12:53:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div>Hi Ari,<br><br>The top of kirstone=C2=A0has only one=
 multiconfig machine again so this issue does not happen.<br>However when I=
 was at that point i used the=C2=A0SSTATE_ALLOW_OVERLAP_FILES to solve=C2=
=A0the problem:<br><br>SSTATE_ALLOW_OVERLAP_FILES:append:k3r5 =3D &quot; ${=
DEPLOY_DIR_IPK}/armv7at2hf-vfp&quot;<br></div><div><br>If possible move to =
the top of kirkstone where this is not needed to unshare=C2=A0the TMP.<br s=
tyle=3D"color:rgb(0,0,0)"></div><div><br></div>Jose<br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ari Parkkila via <a href=
=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org=
</a> &lt;ari.parkkila=3D<a href=3D"mailto:qt.io@lists.yoctoproject.org" tar=
get=3D"_blank">qt.io@lists.yoctoproject.org</a>&gt; escreveu no dia quarta,=
 28/06/2023 =C3=A0(s) 12:15:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Thanks Jos=C3=A9,<br>
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
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16796): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16796" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16796</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000dd344405ff2f4c70--

