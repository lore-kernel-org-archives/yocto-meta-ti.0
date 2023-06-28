Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6AAEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 09:47:46 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web10.12253.1687945657858823036
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 02:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=geiAl03N;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7943be26e84so967145241.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687945657; x=1690537657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJBd5faU+Ep0j8i1qLY++4W7SsM/CfRuACVWFdpn/qI=;
        b=geiAl03NJVW7k6Us1FQv1NGBXA1/itOZV6CJyVynz98vY4ZgF4f/5YnRoE5Pbw9OZy
         5/6wTOCkUT0Lip8V/uM+A7NSLPIxuoRBCTrKRTDjsi4JzejtVu/8ypUSjWrSnbWE1k1G
         AJ2fNMWwBAmVgHXg3Wr8INw73wtYJ77LXCmWyDvbdrnIZhwx3c5ZQb8oEyGgsLNOvh6S
         3mi9NHgyIhCMtrPh1q4oVv+6bWbDvFpNE5EZcKW8JJLWPzAom+sckHWXzqbOKz/upokI
         GsAG7jD7WsIRrxcYF1uKGFTOuydMKsacYuZwLNzw0rlgDOoJemtzFtoUhTmcwSjfkjmZ
         OX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687945657; x=1690537657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJBd5faU+Ep0j8i1qLY++4W7SsM/CfRuACVWFdpn/qI=;
        b=DX59frhiVI71p436DyPAYX6Xg91LvhZFRDDa/fs0b5nniGVAayNp03kmdMQfvUv5UU
         zpZHRxIQIPRO/IL8bbVFlm88Pcf0g4ic7GeY3gmZ8rF+O0olawaM0Gw6oIKCooK9NrRi
         8tmz1+dw3QhXY24GHkHjSPkEdyUzRtB3K/cuRjPa2lVlTbWTPeQbc6EbcNKMX6rrE8nN
         HTXhkKC10Iu4WZ+rm8vkvKDbY7Cf9pzYFRxzmLxU/Y9ypej5SbadLptVdeDwiJQerNlh
         UqvZzlige+imgOoFrcfkOukGHP2kTQXmkP9ghJL68FAd50nEx0bsmh48cZ70861z23TD
         bqeQ==
X-Gm-Message-State: AC+VfDynNPuQxK6ZKnHNlS9gCSVZJyKZH8Pm0U/YFt5hCuEyldspopOr
	OZuMF2zZzJSzlIlpGUCr/IdBYGzMO4MkvU6DsV0=
X-Google-Smtp-Source: ACHHUZ7uX7PB6AT5J7mKgss6oaTFUk41+SXYK+575FalQVr6iOzcKU+ER9kt6EAtcGOBv5KMoL6YZeb76+lkHZwlIbE=
X-Received: by 2002:a67:e9c5:0:b0:440:b21c:dbc8 with SMTP id
 q5-20020a67e9c5000000b00440b21cdbc8mr12531293vso.1.1687945656596; Wed, 28 Jun
 2023 02:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <JTuj.1687942604017219187.Ez1v@lists.yoctoproject.org>
In-Reply-To: <JTuj.1687942604017219187.Ez1v@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Jun 2023 10:47:25 +0100
Message-ID: <CANPvuRk=RrL8k7qRr90We1hE+QvpXz2xxJMaxLC17OiL-EWSZQ@mail.gmail.com>
Subject: Re: [meta-ti] am62xx-evm: bootloader config not specified
To: ari.parkkila@qt.io
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000042fde605ff2d7942"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 09:47:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16794

--00000000000042fde605ff2d7942
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ari,

The issue is because with different TMP folders you will have
different deploy folders for each machine.
I think using the same deploy folder in all machines will solve
your problem, can you please try that in conf/local.conf ?

DEPLOY_DIR =3D  "${TOPDIR}/deploy"

Jose

Ari Parkkila via lists.yoctoproject.org <ari.parkkila=3D
qt.io@lists.yoctoproject.org> escreveu no dia quarta, 28/06/2023 =C3=A0(s) =
09:56:

> I'm trying to fix am62xx-evm/multiconfig build problem with a patch
> "multiconfig: use diferent TMPDIR for each machine" (
> https://lists.yoctoproject.org/g/meta-ti/topic/91431962) but my build is
> failing:
>
> WARNING: bootloader config not specified, using defaults
> ERROR: _exec_cmd: install -m 0644 -D
> build-am62xx-evm/tmp/deploy/images/am62xx-evm/tiboot3.bin
> build-am62xx-evm/tmp/work/am62xx_evm-poky-linux/b2qt-embedded-qt6-image/1=
.0-r0/tmp-wic/boot.1/tiboot3.bin
> returned '1' instead of 0
> | output: install: cannot stat
> 'build-am62xx-evm/tmp/deploy/images/am62xx-evm/tiboot3.bin': No such file
> or directory
>
> The patch will use a separate folder for each multiconfig (tmp
> tmp-am62xx-evm-k3r5-gp tmp-am62xx-evm-k3r5-hs-se tmp-am62xx-evm-k3r5-hs-f=
s)
> so it seems that some more bootloaders configs are needed?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16793):
> https://lists.yoctoproject.org/g/meta-ti/message/16793
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

--00000000000042fde605ff2d7942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Ari,</div><br>The issue is because wit=
h different=C2=A0TMP folders you will have different=C2=A0deploy folders fo=
r each machine.<br>I think using the same deploy folder in all machines wil=
l solve your=C2=A0problem, can you please try that in conf/local.conf ?<div=
><br>DEPLOY_DIR =3D=C2=A0 &quot;${TOPDIR}/deploy&quot;<br><br>Jose</div><di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ari =
Parkkila via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.o=
rg</a> &lt;ari.parkkila=3D<a href=3D"mailto:qt.io@lists.yoctoproject.org">q=
t.io@lists.yoctoproject.org</a>&gt; escreveu no dia quarta, 28/06/2023 =C3=
=A0(s) 09:56:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&=
#39;m trying to fix am62xx-evm/multiconfig build problem with a patch &quot=
;multiconfig: use diferent TMPDIR for each machine&quot; (<a href=3D"https:=
//lists.yoctoproject.org/g/meta-ti/topic/91431962" rel=3D"noreferrer" targe=
t=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/topic/91431962</a>) b=
ut my build is failing:<br>
<br>
WARNING: bootloader config not specified, using defaults<br>
ERROR: _exec_cmd: install -m 0644 -D build-am62xx-evm/tmp/deploy/images/am6=
2xx-evm/tiboot3.bin build-am62xx-evm/tmp/work/am62xx_evm-poky-linux/b2qt-em=
bedded-qt6-image/1.0-r0/tmp-wic/boot.1/tiboot3.bin returned &#39;1&#39; ins=
tead of 0<br>
| output: install: cannot stat &#39;build-am62xx-evm/tmp/deploy/images/am62=
xx-evm/tiboot3.bin&#39;: No such file or directory<br>
<br>
The patch will use a separate folder for each multiconfig (tmp tmp-am62xx-e=
vm-k3r5-gp tmp-am62xx-evm-k3r5-hs-se tmp-am62xx-evm-k3r5-hs-fs) so it seems=
 that some more bootloaders configs are needed?<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16793): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16793" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16793</a><br>
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
div></div>

--00000000000042fde605ff2d7942--

