Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1121DEB4911
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 11:42:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43199.1770896563018819491
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 03:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEi+GeQ5;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: ivitro@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4379546f8f.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 03:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770896561; x=1771501361; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w7l5NHd6+59alQ1XwLCaxyxiNVzro/Y0ZtvVE+iKvhc=;
        b=kEi+GeQ5rmDeLOLsDJ/WjkVRAXHdxemsJLHK5fhDYoHeZ5yV9UcNHUUeYgAq2B39M6
         EiE7UseB+/SUJTYsxI0rNMAIRmbU+v0CFkB9fltP24szMi/2ratBkKQgyk90gzmNKRm0
         jpmqiVhoDPyH1LO0hYY9wn4ZLEFQc8hkINzDd0j3MqrwzJIvDCrL5KiVtjdc0sr2OlIn
         7tUXXBt1LGIPSW1ob4ZcnoectRFe7KVtiDKhgBtt3O+l+M6g44ZV9AWEIvFpp/Ovyvml
         bceVfEzj1vaEA2hXdnVk+cJYWWeyaqCamXCnNjkPl4NzlkNtymQxDnHJHp2E41ljGr7q
         dqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896561; x=1771501361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7l5NHd6+59alQ1XwLCaxyxiNVzro/Y0ZtvVE+iKvhc=;
        b=rU8UZxGZ9HXKMk1Qhfrtz+0pbfpilU61j3YqDfnYWNHSjr4J+YHd8T0E30UHFboRZw
         V+2tkBHtMZ7iYV0rrIHYqUj3DksfnBPnh3RK5KqFd84t+WjJN2xMUpu+bDw3r48cRMa9
         aFQFt8bjG2ZndHF9sKhBgZFjYJugPpJdJKygYEV8V8Eb9ptqLtLXN1AvSgBohQrs0s0S
         Fo/PmGgwOGYoPrz31HW/dp5errb/nJgmiTJJp5EaSS1cl4d6QLM6YFQxIpPbdJnSkWOl
         W7Ogj+Uvaad1Jo0v++ooAOut9VqzCYNY5u/YI9BwsPPQ/EFC7gkdAuBIN4z7VX9ECABA
         VSqg==
X-Forwarded-Encrypted: i=1; AJvYcCWtkXBhmR2WrHePm2Xk5rzm3brejSb2//INWsBJR61RLPHtzSlrNwKAQT3vBrWsGvkhYf/ONm/b@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxpLFl4tPxXiiaz7MM0NpZQdi3cS3MxdiogPcwxTam+WlSMwyHm
	fmPhJ3NcQdUUUzPn3lFWzHmPW29ZpS9aNObbV5uKo/h0xCvwwyrWbLBH
X-Gm-Gg: AZuq6aK3JStawC2gh0NsaHf+0slC/Lev/16IciVdUx8qz5NDGO46hfJsWiqKwmFomKa
	b0EZk4mVsWIZD9sNENKn+V7sbtR1pL8Aiy77UwEnxXp8F7B0GT5zOoVObWlSiM52N+ee/Cxbu9T
	V46dNylAseX5HG5XcQVfv1GCdxpfb7HbisucJx4MlKdp0lKrM/YiD2TwyQc2i6Xcn7+LjPWIOAh
	hY35V9NDjn8YVKyWvthFDaARiQ+M9rVIIAW50/nnsnJfNfsi2RQkXOEkSLkoB+298pqOsavfOO4
	bohjUleHdjWjyjQsafiWU/FxM8lPK1p1YRtuxYhn27AjadCZhE2QwYnk92kDbcWivAhVTxhF+YG
	y37Bu/6EBL2BHFmIoVhCduCBogj5SDWyGAxiPDY5TgG1LkylCafIe/RfGJldCmZleS6im2s1n++
	4xnDCekuowMRHPkHk3wBxFh18iyzQR41SxAUjzrol/eDXGAA==
X-Received: by 2002:a05:6000:60f:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-4378acb1979mr4914954f8f.23.1770896561025;
        Thu, 12 Feb 2026 03:42:41 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d50f3asm12042685f8f.13.2026.02.12.03.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:42:40 -0800 (PST)
Message-ID: <bb0eb4c0bf8543175b3aa50f0d954aafce56d576.camel@gmail.com>
Subject: Re: [meta-ti] [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
From: Vitor Soares <ivitro@gmail.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org
Cc: reatmon@ti.com, denys@konsulko.com, vitor.soares@toradex.com, 
	francesco.dolcini@toradex.com
Date: Thu, 12 Feb 2026 11:42:39 +0000
In-Reply-To: <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
	 <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 11:42:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19500

On Wed, 2026-02-11 at 18:52 -0600, Andrew Davis wrote:
> On 2/11/26 11:15 AM, Vitor Soares via lists.yoctoproject.org wrote:
> > Hi,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=20
> > While working on our Toradex Aquila AM69 SoM support, we noticed that k=
3.inc
> > defines:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=20
> > SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
> >=20
> > This caused systemd to enable serial-getty@ttyS0.service=C2=A0on our bo=
ard, where
> > ttyS0 maps to main_uart4 - a user-facing UART, not a debug/console UART=
. The
> > getty continuously outputs a login prompt, interfering with the interfa=
ce.
> >=20
> > This made us question whether SERIAL_CONSOLES belongs in SoC-level incl=
ude
> > files
> > at all. Our understanding is that the console getty is already handled
> > automatically by systemd-getty-generator from the console=3D kernel com=
mand
> > line argument, which makes SERIAL_CONSOLES potentially redundant for th=
e
> > console
> > UART. Any additional UARTs beyond the console are board-specific and
> > arguably
> > belong in each machine config rather than a shared SoC include.
> >=20
> > We are not 100% certain about this reasoning and would love to hear the
> > rationale behind the current approach. Are we missing something? Would =
it
> > make
> > sense to either remove SERIAL_CONSOLES from the SoC includes or at mini=
mum
> > use
> > =C2=A0 a weak assignment (?=3D) to allow boards to override cleanly?
>=20
> We simply noticed almost all our EVM boards used the same console UARTs a=
nd so
> refactored the definition into a more common place. But yes you are corre=
ct
> that a file like k3.inc seems like it should contain only items common to=
 all
> users of the K3 SoC family, and not simply common to TI EVM boards. Chang=
ing
> the assignment in k3.inc to a weak one seem reasonable (although I think =
you
> can still just override regular assignments after you include k3.conf in
> your board conf)
>=20


You're right we can override it in our board configs, but I wanted to share=
 why
we think this is worth reconsidering.

The issue is that SERIAL_CONSOLES in k3.inc mixes SoC capabilities with boa=
rd-
specific UART usage.

The K3 SoC provides the UART peripherals, but doesn't determine which ones =
are
used for console, user interfaces, or other purposes - that's decided at th=
e
board level.

Different boards use UARTs differently. On TI EVMs, ttyS2 or ttyS0 might be=
 the
debug console. On our Aquila AM69, ttyS2 is the console but ttyS0 is a user=
-
facing UART. Same SoC, different UART assignments.

SERIAL_CONSOLES creates getty login prompts on listed UARTs, which is a
board/system integration concern.

If TI's EVM boards share the same UART configuration, would it make sense t=
o
have a ti-evm-common.inc instead of putting it in the SoC include?

Happy to help with refactoring if you think this direction makes sense.

Thanks,
Vitor



> Andrew
>=20
> >=20
> > Thanks,
> > Vitor Soares
> > Toradex
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#19482):
> > https://lists.yoctoproject.org/g/meta-ti/message/19482
> > Mute This Topic: https://lists.yoctoproject.org/mt/117760181/3619733
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=C2=A0[afd@t=
i.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20


