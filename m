Return-Path: <rafal.tomczyk1992@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE43CA5FE4
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 20:19:59 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2817.1768681192529576662
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 17 Jan 2026 12:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZvAJ9qe;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: rafal.tomczyk1992@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc4425b6bso28599107b3.1
        for <meta-ti@lists.yoctoproject.org>; Sat, 17 Jan 2026 12:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768681192; cv=none;
        d=google.com; s=arc-20240605;
        b=eyYuCrLCSKp4uSwPM1E6HixV7ZWCHCnhz+VpYHwQJaRFj5DlOTQ1tZ7Q4iWN8Ruy/6
         nQOXlngspxsYibNvvgPejHyM04ucmESrmplHwd/eHGVm6hS9fqhDLWcJcrjRz0cC+3VD
         L8O8LZefDOeeUoraq0ONKnLcxTVJ0LpZU31m4cRpMOelBovCeeBgjoVQa8vxTITQq3m7
         YtXt3q1A5p/VgXBfR1wQ/a7mxVf9RkmTMHHuOtncDvyagrTvO6H/IoBq0LrKPG2IQUrv
         9k/nPIvXI4SoNx1vv8dvVPC3dWqz1BSVL6IPsMllTa48RP1uBNWXA/lK52WEnX6NsK3m
         K3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gRb5ZBQ0gg2izObScsOtz4FeCogdn+vh1FghjHKK42E=;
        fh=yKIJWm4Va3s59+T3WcFeU5WNP366oVYArWXI+sZ4ZK4=;
        b=YldzlJmzinGLW2zR5Vt5QbVzSQOmMDsyjuvdO4PRv4/OZ2WqDOHZQOT5hLt2BYSrrR
         8TNxRlVMyT2ou7awv8llqLXqvcHN8ebKTsiBQMx0LSFrwNEZnqakXyOm+YQ+J4O8RTm/
         iDxWzC0uILZ3lmc3AiQNM3pTOjm/xCEDf2bcTNiaNGCPNDJxgEbMK/MIRBKuucZX0qPQ
         UYwbja63kZV4f8FlxZVrUvAnK8Bq3CepycNrwhJTh+MjyP9+aww9LSJesVLhlgiXZVHc
         zxzS120gF9FPk8947KKKvcd+PNH1Jzxgo045XiBxcwmZacJ/+wgfie00tHHnCdbcL2aq
         ts2w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681192; x=1769285992; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gRb5ZBQ0gg2izObScsOtz4FeCogdn+vh1FghjHKK42E=;
        b=CZvAJ9qedUmF1dCedPDLLVERd4j+Pf6e6OHvBQu+TX0qAtvXp6AfpHHi6jNGitGABC
         HCV+73Wc9gUO0LqPC6fJDHpAoN35NKdFclI1p0FJ7bavgLtXUg/8IrOIa2JbQzwo+20n
         Bc8qCBTuG5yacJMH5NvKrqSDlr3S+hfJvr2MGTIxqd+maaoeC533aMs8aBEW3wOFaH8d
         V/sNL0SJ/QJN9Hr0fyB2dVNcyjk2vKdVYSz30ndtLaqgtV+jqGI0VIQx9az3S80nWJMw
         5vxw20GvFI26G5M7Qn32LPUz3qvRfniiZBICj1+gSqOFmEzSLMt1Fx5d6UO1bKnjFmGi
         T+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681192; x=1769285992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRb5ZBQ0gg2izObScsOtz4FeCogdn+vh1FghjHKK42E=;
        b=OJA460TAD9BxxihqsKk7Lzu0dGepsTVS69wtNpxIKxgDDuSVIPDkJkg2oXYlUlAL4t
         7zE7y98QqBVT5qgHxqkvVcIA2RXG9g9CYfkQO5OgbMK32RtfjfBtgnssDSyeJ+gtIF9E
         /TTvzAV4ma3y+B9Df7dSl5NTMvLShcpsJ+nHwCoI5qbjz6Vf8EDi5LNzwQQCCkPtN4hA
         DaNBsFnRreX3hsgIhaWGw+RiaDu0iM0BqYCE1FqdPtK9gawIHwj9fpkAjSkdtaO9i5+z
         tMC3btSWpec4+1wEw4+JCr9ZqzFXZ4wxcTxRkbruDyb1w3L8+xH4eWmmYz86jUCW4m7y
         tq2w==
X-Gm-Message-State: AOJu0YyKE8wF3d+/+tXI+6z+elDJQTe0gIlS5xcDUDPRO5cJToZzTqUZ
	8dwQ9MLidDLWQypW3t6G/nQxfvz0whfiEDwVUb167EVTNqAtUFAUZcrmbTGaefZLrZi0cEW0wjB
	Gd4s14AY57ickN5SdOPBUYqi+AVcnveI=
X-Gm-Gg: AY/fxX6L+aek5rKvjONe6nK/om9mFWIPYbLs8K5rMfouTo0haYjmIKvLRLZMO1ddj9L
	dW53GBmpk62GJAIRxnGNPl0KV59oaNqNAgA5S4FmxlXHExoYxkMrf+DlUR4nA/uuByNTsHpkMpU
	hciB1vv8HZ/vRjEdZniZeTNplkEPz+P+B0LbQ449jdcK+icAFyQ8Iw6bUbUtshkhEdTs51Yo8vK
	MvhRlw8aZWH7i8Ec1jnrn9aLnvm+cJWSLjkqCoBysIoufQMXEgZRBxeN8FdnvIU6Ar8E0g=
X-Received: by 2002:a05:690c:c508:b0:783:697a:5daa with SMTP id
 00721157ae682-793c536e39amr66552167b3.30.1768681191549; Sat, 17 Jan 2026
 12:19:51 -0800 (PST)
MIME-Version: 1.0
References: <TEdn.1768409651510788479.EPUD@lists.yoctoproject.org> <659490.1768495589111350226@lists.yoctoproject.org>
In-Reply-To: <659490.1768495589111350226@lists.yoctoproject.org>
From: =?UTF-8?Q?Rafa=C5=82_Tomczyk?= <rafal.tomczyk1992@gmail.com>
Date: Sat, 17 Jan 2026 21:19:40 +0100
X-Gm-Features: AZwV_Qjs8uXntmEAPJQafAuCmqLXy0oBCgnl3ASVNkdiveU6xCADf79L0ZxDOgE
Message-ID: <CAJVAd-YX6fxYXN-yhrx_ywanejBU_0P-qQ314weGDyk9C=1QcA@mail.gmail.com>
Subject: Re: [meta-ti] How to add support for CC3301 for Beagley-AI
To: sabeeh-khan@ti.com
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000024b0e606489b2ec6"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 Jan 2026 20:19:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19428

--00000000000024b0e606489b2ec6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

I'm using scarthgap branch.

czw., 15 sty 2026, 17:46 u=C5=BCytkownik Sabeeh Khan via lists.yoctoproject=
.org
<sabeeh-khan=3Dti.com@lists.yoctoproject.org> napisa=C5=82:

> Hello,
> Could you please mention which meta-ti branch you are using?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19419):
> https://lists.yoctoproject.org/g/meta-ti/message/19419
> Mute This Topic: https://lists.yoctoproject.org/mt/117264195/5163838
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> rafal.tomczyk1992@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000024b0e606489b2ec6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi!<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m =
using scarthgap branch.=C2=A0</div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">czw., 15 sty 2026,=
 17:46 u=C5=BCytkownik Sabeeh Khan via <a href=3D"http://lists.yoctoproject=
.org">lists.yoctoproject.org</a> &lt;sabeeh-khan=3D<a href=3D"mailto:ti.com=
@lists.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; napisa=C5=82=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hello,<br>
Could you please mention which meta-ti branch you are using?<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#19419): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/19419" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.yoctoproject.org/g/meta-ti/message/19419</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117264195/516=
3838" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/117264195/5163838</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank" rel=3D"noreferrer">meta-ti+owner@lists.yoctoproject.org</a><b=
r>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/meta-ti/unsub</a> [<a href=3D"mailto:rafal.tomczyk1992@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">rafal.tomczyk1992@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000024b0e606489b2ec6--

