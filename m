Received: from hormel.elettra.eu (hormel.elettra.eu [140.105.206.207])
 by mx.groups.io with SMTP id smtpd.web10.6803.1595059127445427760
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 18 Jul 2020 00:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: elettra.eu, ip: 140.105.206.207, mailfrom: alessio.bogani@elettra.eu)
Received: from hormel.elettra.eu (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id 5F9891C4893_F12ABB3B
	for <meta-ti@lists.yoctoproject.org>; Sat, 18 Jul 2020 07:58:43 +0000 (GMT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
	by hormel.elettra.eu (Sophos Email Appliance) with ESMTPSA id CD4821C1FFC_F12ABB2F
	for <meta-ti@lists.yoctoproject.org>; Sat, 18 Jul 2020 07:58:42 +0000 (GMT)
Received: by mail-yb1-f177.google.com with SMTP id x9so5649781ybd.4
        for <meta-ti@lists.yoctoproject.org>; Sat, 18 Jul 2020 00:58:42 -0700 (PDT)
X-Gm-Message-State: AOAM531AiHzzHMNnkeQDjQkBUlnwZgc0FtYxO8a2qCmBeoEWsVmAuR/g
	T0uVhP5wlg2/0vbI7K3WIihMB+fLUzIQs4izwQw=
X-Google-Smtp-Source: ABdhPJwLUL2zgkUkhyoI1t9quebHicHGwFOnMUQH1q/w9bW/3vnvxtrEtoq0ybDkCoJW+kIS7EoU/6lvP+fYeHHTwGo=
X-Received: by 2002:a25:3b16:: with SMTP id i22mr19367784yba.66.1595059121584;
 Sat, 18 Jul 2020 00:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200713090835.7D7BF1C4A6A_F0C2493B@hormel.elettra.eu> <20200717203244.GG13182@beryl>
In-Reply-To: <20200717203244.GG13182@beryl>
From: "Alessio Igor Bogani" <alessio.bogani@elettra.eu>
Date: Sat, 18 Jul 2020 09:58:05 +0200
X-Gmail-Original-Message-ID: <CAPk1OjF4b44Tx=Wv+cGkKYDfyRDWjukd8=HhfVFrD4AumR=avw@mail.gmail.com>
Message-ID: <CAPk1OjF4b44Tx=Wv+cGkKYDfyRDWjukd8=HhfVFrD4AumR=avw@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] pru-icss: Replace hardcoded lib with libdir variable
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
X-SASI-RCODE: 200
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

Thank you for reply.

On Fri, 17 Jul 2020 at 22:32, Denys Dmytriyenko <denys@ti.com> wrote:
> NAK, libdir is usually /usr/lib

Sorry it was my mistake. Are you willing to accept a patch with
${base_libdir} instead?

Thanks!

Ciao,
Alessio
