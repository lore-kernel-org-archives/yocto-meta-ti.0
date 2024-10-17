Return-Path: <sergio.prado@e-labworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F595D21270
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:55:14 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.45503.1729158908550211910
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 02:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20230601.gappssmtp.com header.s=20230601 header.b=d18JeNXs;
 spf=none, err=permanent DNS error (domain: e-labworks.com, ip: 209.85.216.41, mailfrom: sergio.prado@e-labworks.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso583132a91.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20230601.gappssmtp.com; s=20230601; t=1729158908; x=1729763708; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l/ADvmv+ZvjUEDLBxCX/2D99Esb/F19acORjID4D570=;
        b=d18JeNXs5L6Uvr9KQyodNKRiwqguTAyU9JKL3oVAR0+pouRRd5UyqkxLZTBWyGVPOw
         HpfbtaJgq8SCxyqRQctkS1QGoYBBYx50eApRE5XOIQnanEKoblphzIXNVTmGYpbnrrRj
         H+HjxUVNedGAozkPi+afgVPBAlpRqyR/Sm9jpabqwpC61BI7Xx8TDgkFGm+JrB2MTEbg
         OQvwG+b8GqEvX2r1r0dTJRqoHgrpbg0Q6IpBtgVMAsncuBv7lbYmXNjJxhHTY/zItmXu
         Eg8w63UcxBh1cjXlPs1uauN6z8yVZwf5M+SVwpLLyXVcomPo3UMi8eeWGg+BwktTmUfO
         o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158908; x=1729763708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/ADvmv+ZvjUEDLBxCX/2D99Esb/F19acORjID4D570=;
        b=iqFZqQy7EHhxtja0mI4W12Xv4Ji77/ZeAw6y8iM3tHePpnRY26RQ+iUSYiKC/QZw4S
         MbTdKrRbvoVwNAAVtwl93Mz5Agw67Mm84lZ7CY/xtbPIeO6H5eJlmGdUNkhHc/QdDw91
         N9z3/dMxN/EVr+pZTukGuwKTdgVRALm4NAqPISkr5jWKQ8tUzZ+IPGDgz27XdWkaZwpy
         Krd7rPGa0Wm/pyoNUoiaGFCxkn0qSQWL7vnjnYYzh42nOVZ1Z7HmXQF4L9jlMVswXozz
         2U622cn4I547oAvfkQEIHqsariOQVx17Nqu7TTLgABsqRPJiVfVKb66sjvlIr4QPK/xD
         d0NQ==
X-Gm-Message-State: AOJu0YyVqcdfgQoebJDKKHekWGMQMN1WTwYtc6ngswcWnasXnd06krej
	DTs8v/egnElgYNdRqvzYmhfGTxyldsK6Pk2qTPr/URfB55lhH3WNU2P7xIcp3LaMDNlnEJaqyEH
	TqG/vIFxa+o8z1BnFJBAiMZvdODpETQ0r2CuqMA==
X-Google-Smtp-Source: AGHT+IGjVfbjWDfYED8RkxwhMpIKBCmhSC+g8giDdyDy2OUoRk3HUxwcXmxkUnSpe595CGYmRNSS4aMoXFz6p6fHu24=
X-Received: by 2002:a17:90a:e383:b0:2e2:7f8f:3ad7 with SMTP id
 98e67ed59e1d1-2e2f0a5fa87mr24607709a91.7.1729158908027; Thu, 17 Oct 2024
 02:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241014202746.1818435-1-sergio.prado@e-labworks.com>
 <17FF06D0FF79DF51.9153@lists.yoctoproject.org> <37ac5b62-3fcd-49b8-9320-bd50acc4df51@ti.com>
In-Reply-To: <37ac5b62-3fcd-49b8-9320-bd50acc4df51@ti.com>
From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 17 Oct 2024 06:54:50 -0300
Message-ID: <CANu7NGvKuRqPtfN_3B6oxukZ-iRL2NVJ7QAyV9+aP=V5UWV5fA@mail.gmail.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: k3: use weak
 assignment for FIT image variables
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>, 
	rogerio.borin@toradex.com
Content-Type: multipart/alternative; boundary="0000000000007945690624a92e47"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 09:55:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18009

--0000000000007945690624a92e47
Content-Type: text/plain; charset="UTF-8"

Hi Ryan

> I think the issue is that the weak assignment happens at the very end of
> parsing if there no other value for the variable.  But the various
> classes (kernel-fitimage.bbclass, uboot-sign.bbclass, etc...) set the
> variables using the ?= so that means the values we want for our stuff
> never gets set correctly.
>
> I can see how this works for you in your case, but doing this in
> meta-ti-bsp breaks everyone not using meta-tordex-security.

Yeah, you're right. I have done more tests here. Indeed it works with
meta-toradex-security, but it fails without it. The reason is that, because
of the weak assignment, the classes inherited by the kernel will take
precedence and will set the variables with a different value from the
machine, and later on, when the check is done in the U-Boot recipe, the
configuration from the machine is used, which differs from the
configuration used to sign the FIT image.

Possibly the best solution for our use case is to force a default in our
class with an override (e.g. FIT_SIGN_ALG:k3="rsa2048"), and instruct the
users to change it with the forcevariable override
(e.g. FIT_SIGN_ALG:forcevariable="rsa4096").

@Rogerio, do you see any other solution?

Best regards,

Sergio Prado

--0000000000007945690624a92e47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ryan<div><br></div><div>&gt; I think the issue is that =
the weak assignment happens at the very end of<br></div><div>&gt; parsing i=
f there no other value for the variable.=C2=A0 But the various<br>&gt; clas=
ses (kernel-fitimage.bbclass, uboot-sign.bbclass, etc...) set the<br>&gt; v=
ariables using the ?=3D so that means the values we want for our stuff<br>&=
gt; never gets set correctly.=C2=A0 =C2=A0</div><div>&gt;<br>&gt; I can see=
 how this works for you in your case, but doing this in<br>&gt; meta-ti-bsp=
 breaks everyone not using meta-tordex-security.</div><div><br></div><div>Y=
eah, you&#39;re right. I have done more tests here. Indeed it works with me=
ta-toradex-security, but it fails without it. The reason is that, because o=
f the weak assignment, the classes inherited by the kernel will take preced=
ence and will set the variables with a different value from the machine, an=
d later on, when the check is done in the U-Boot recipe, the configuration =
from the machine is used, which differs from the configuration used to sign=
 the FIT image.</div><div><br></div><div>Possibly the best solution for our=
 use case is to force a default in our class with an override (e.g.=C2=A0FI=
T_SIGN_ALG:k3=3D&quot;rsa2048&quot;), and instruct the users to change it w=
ith the forcevariable override (e.g.=C2=A0FIT_SIGN_ALG:forcevariable=3D&quo=
t;rsa4096&quot;).</div><div><br></div><div>@Rogerio, do you see any other s=
olution?<br></div><div><br></div><div>Best regards,</div><div><br></div><di=
v>Sergio Prado</div></div>

--0000000000007945690624a92e47--

